package com.example.studiozen.Member;


import com.example.studiozen.DTO.MemberDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("member")
public class MemberController {

    private static Logger logger = LoggerFactory.getLogger(MemberController.class);

    private final MemberLogic memberLogic;
    private final MemberDTO memberDTO;
    private HttpSession httpSession;
    //생성자 주입
    public MemberController(MemberLogic memberLogic, MemberDTO memberDTO, HttpSession httpSession) {
        this.memberLogic = memberLogic;
        this.memberDTO = memberDTO;
        this.httpSession = httpSession;
    }

/*************** COMMON 패키지로 이동된 컨트롤러 ***********
   @RequestMapping(value="/index.do")
    public ModelAndView index(HttpServletRequest req){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("common/IndexPage");

        return mv;
    }
 ***********************************************/

/******************Common 패키지로 이동한 컨트롤러********************
    @RequestMapping(value="/loginProc.do")
    public ModelAndView LoginProc(HttpServletRequest req){
        ModelAndView mv = new ModelAndView();
        //login Proc Success move to main Page
        //login Controller > LoginService > LoginDao > Login.xml > Login procedure > LoginDao > LoginService > LoginProc Controller > user View
        //Spring 모달창modal
//        mv.setViewName("redirect:/common/login");
        mv.setViewName("common/login");

        return mv;
    }
 ***************************************/

    /*********회원가입********
     http://localhost:8080/member/register
     {
     "tr_code" :"INSERT",
     "member_NO" : "8",
     "member_Password" :"ABC",
     "member_Name" : "킹콩",
     "member_Mail" : "rs.moony@gmail.com",
     "member_Phone" : "0100001100",
     "member_Money" : "100000"
     }
     **********************/
    @PostMapping(value = "/register")
    public ModelAndView Member_Register(@RequestBody MemberDTO memberDTO) {

        String result = memberLogic.Member_Register(memberDTO);

        ModelAndView modelAndView = new ModelAndView();



        logger.error(result);
        logger.info(result);


        //CUD 담당 프로시저에서 로그인성공과 실패에 대한 결과값을 int result로 반환
        if (memberDTO.getResult() == 1) {
            modelAndView.setViewName("common/login");
            return modelAndView;
            //return "index";

        } else {

            return modelAndView;

        }

    }// End of Register Method   // End of Login Method  // End of Login Method



    /*********로그인********
        http://localhost:8080/member/login
        {
        "member_NO" : "1",
        "member_Password" : "ABC"
        }
     **********************/
    @PostMapping(value = "/login" )
    public String Login(HttpServletRequest req, @RequestBody MemberDTO memberDTO) {

        logger.info(memberDTO.toString());
        String result = memberLogic.Login(memberDTO);

        logger.debug(result);
        logger.info("[========> 결과"+memberDTO.getLoginresult());

        //로그인 담당 프로시저에서 로그인성공과 실패에 대한 결과값을 int result로 반환
        if (result.equals("Nice")) {
        //제너릭 httpservlet 이 http를 다 먹는거니 까Httpservlet 해서 request 가 생성

//            logger.info("입력한 멤버 번호 ==> "+memberDTO.getMember_no());
            memberDTO.setSession_no(memberDTO.getMember_no());
//            logger.info("세션DTO에 집어넣은 번호 ==>"+ memberDTO.getSession_no());

            httpSession = req.getSession(true);
            httpSession.setMaxInactiveInterval(3600);
            httpSession.setAttribute("sessionNO",memberDTO.getSession_no());
            logger.info("\n==========> 세션값"+httpSession.getAttribute("sessionNO")+"\n"+"httpSession get ID ===>"+httpSession.getId()+"\n");
            String sessionParam = (memberDTO.getSession_no()).split("=")[1];

            if(memberDTO.getMember_no().equals("member_no=MEM282108")){
                 logger.info("\n관리자 세션 ===> http Session ====>" +sessionParam);
                return "forward:/Management/dash.do/"+sessionParam;
            }else {
                logger.info("일반회원");
            }
            logger.info("리턴직전");
             return "forward:/Client/dash.do/"+sessionParam;
        } else {

            return "redirect:/index.do";

        }

    }// End of Login Method   // End of Login Method  // End of Login Method


    /*********인증메일 클릭시 인증받은 회원으로 업데이트 진행********
     http://localhost:8080/member/certify/{member_no}
     {
     member/certify/{member_no}
     }
     **********************/
    @GetMapping(value = "/certify/{member_no}")
    public ModelAndView Member_EmailCertify(@PathVariable String member_no) {
        memberDTO.setMember_no(member_no);
        logger.info(memberDTO.getMember_no());
        String result = memberLogic.Member_EmailCertify(memberDTO);


        ModelAndView modelAndView = new ModelAndView();

        logger.debug("--"+memberDTO.getResult());
        logger.info(result);


        if (result == "Nice") {
            modelAndView.setViewName("common/Index");
            return modelAndView;

        } else {
               modelAndView.setViewName("common/failed");
            return modelAndView;

        }

    }// End of Register Method   // End of Login Method  // End of Login Method

    /*********  로그아웃  *********/
    @PostMapping(value = "/logout" )
    public String Logout(HttpServletRequest req, @RequestBody MemberDTO memberDTO) {

        logger.info("======> "+memberDTO.toString());
        httpSession = req.getSession();


            String result = memberLogic.Logout(memberDTO);

            logger.debug(result);
            logger.info(result);

            httpSession.setMaxInactiveInterval(3000);
            httpSession.invalidate();
            return "redirect:/index.do";

    }// End of Login Method   // End of Login Method  // End of Login Method


    /*********  회원 검색  *********/
    @GetMapping(value = "/memberSelect" )
    public List<MemberDTO> Select(HttpServletRequest req, @RequestBody(required = false) MemberDTO memberDTO) {

        List<MemberDTO> memberList = memberLogic.Select(memberDTO);
        logger.info(String.valueOf(memberList));
        return memberList;

    }// End of Login Method   // End of Login Method  // End of Login Method

}



/*

    Http 프로토콜 자체가 한번 응답이 끝나 버리면 데이터를 아무것도 유지하지 않습니다.


        ConnectionlessProtocol
        http라는 프로토콜이 응답을 끝내면 데이터를 유지하지 않고 다 날려버리는 프로토콜이기 때문에
        지속적인 요청 응답에서 리소스 낭비가 나지 않는 것이다.

        # 웹서비스는 HTTP프로토콜을 기반으로 하는데, 요청에 대한 응답 후 관계를 끊는다.
        -데이터 유지를 하지 않는다는 것, 로그인을 했는데 로그인에 대한 정보가 남아있지 않다는것.

        # 즉, 인증되지 않은 사용자는 모든 페이지에서 인증 과정을 거쳐야 한다.
        - 세션이나 쿠키처리를 하지 않는다면 매 페이지마다 재 로그인을 해줘야한다는 불편함이 있으므로
        처음 로그인 했을당시에 인증에 대한 증표를 서버안에 남겨놓거나 (세션)
        서버에서 증표를 로컬에 보낸다던가 (쿠키)

        # 이런 불편함 때문에 지속적인 인증 수단으로 세션과 쿠키를 사용한다.

                 ======= > 요청 (Request) : 서버 연결
        클라이언트                                            서버
                 ======= > 응답 (Response) : 서버 연결 해제

        Connectless protocol 이라고 해서 연결이 끝나면, 즉 요청 응답이 1회가 끝나면
        연결을 끊어버리는 특징이 있기 때문에 연결이 끊어져도 서버 내부에서 어떠한 데이터를 관리한다고 하면

        유지를 시키기 위한 데이터를 서버에 남겨 놓는다면 그 데이터를 계속 불러오면서 데이터를 확인하면서
        데이터를 유지 시킬 수 있다는 것 이다.

        해당 방법으로 크게 2가지가 있는데,

        "쿠키"와 "세션"이다.

       # 쿠키
       서버에서 생성해 주되 로컬저장소(컴퓨터- 하드디스크/ 모바일- 내부저장소 )에 저장해두고 지속적으로 확인하면서
       쿠키에 어떠한 데이터가 있으면 이 사람이 로그인을 했다 라는것을 알아내 줍니다.

       # 세션
       브라우저가 실행될 때 함께 서버 내부에 세션객체가 생성이되면서, 특정 Session Id를 부여 받게 되고
       브라우저가 종료되기 전까지나, 회선의 유효시간이 만료되기 전까지 세션데이터를 프로토콜 연결이 끊겨도
       계속 유지하면서 페이지간 사용할 수 있는 것이 세션이다.

       스프링 세션

       회원정보 수정 요청                                       updatePage()
             |                                                    |
           회원인증     -NO - 로그인 페이지로 유도 ->               회원인증? - NO - redirect/ 로그인
             |                                                    |
            YES                                                  YES
             |                                                    |
   회원정보 수정 페이지로 유도                                      return "session/updatePage";

    요청 : updatePage ()
    회원인증 False - redirect:/ 로그인;
    회원인증 True  - return "session/updatePage";

    회원정보 수정 요청이 왔다면 로그인이 안된 사람에게 회원정보를 수정하게 만들면 안되곘죠 ?
    회원인지 인증을 해보고 인증이 되었다면 회원정보 수정 페이지로 이동시켜 주고, 만약 로그인이 안되어있다면
    로그인을 하도록 로그인 페이지로 유도합니다.

    이러한 확인을 위해 Session이나 쿠키를 사용하는데, 로그인 데이터는 세션으로 처리하나
    쿠키는 로컬저장소에 저장되므로 보안에 취약하므로 보통 세션으로 처리합니다.

    하지만 자동로그인 오토로그인을 구현할 때는 쿠키를 사용해야 합니다.
    세션의 단점은 서버당 하나만 유지할 수 있고, 브라우저가 종료되면 세션데이터가 날아가기 때문에
    다시 브라우저를 실행 시켰을때, 로그인을 유지시키기 위해서는 쿠키를 사용해야 합니다.

    스프링에서 세션을 사용하는 방법

    1. HttpServletRequest를 사용
     request.getSession()
    2. HttpSession을 사용
    session.setAttribute / getAttribute

    세션 객체는 요청이 실행될 때 브라우저 내부에 있는 세션객체를 요청에 담아서,
    Request객체에 담아서 들어오기 때문에
    매개 변수를 request객체만 사용할 수 있으면 request.getSession()으로 세션을 꺼내오는 것이고,
    세션매게변수를 활용할 수 있다면 바로 세션객체인 session. 으로 사용할 수 있습니다.
    request 객체에서 세션을 꺼낸 후 사용하거나, 세션을 바로 받아서 사용하거나 합니다.

    세션의 주요 기능

    세션 메소드                        기능
    getid()                     세션 ID를 반환한다.
    setAttribute()              세션 객체에 속성을 저장한다.
    getAttribute()              세션 객체에 저장된 속성을 반환한다.
    removeAttribute()           세션 객체에 저장된 속성을 제거한다.
    setMaxInactiveInterval()    세션 객체의 유지시간을 설정한다.
    getMaxInactiveInterval()    세션 객체의 유지시간을 반환한다.
    invalidate()                세션 객체의 모든 정보를 삭제한다.

    # getId()  => 세션의 고유 아이디 값을 반환 - 고유 아이디는 자동로그인에서 고유 아이디를 활용함.

    # setAttribute/getAttribute() => session 객체에 데이터를 저장하고 확인 할 수 있음.

    # removeAttribute() => 특정 세션의 데이터를 삭제, 특정 키이름을 가진 객체를 삭제

    # setMaxInactiveInterval() => 세션의 유효시간을 재설정 - 기본유효시간은 톰캣에서 30분으로
    지정되어있음, 톰캣의 xml 코드로 변환 시킬 수 있으며 자바코드로 변환할때 이 메소드를 사용합니다.
    *(단위는 초단위)

    # getMaxInactiveInterval() => 세션의 유효시간을 확인

    # invaildate => 세션객체를 통째로 무효화하여 전체적으로 삭제 시킴 - 로그아웃 처리에 활용.



 세션을 통한 로그인 인증 진행 방식

   로그인 페이지 = > 세션에 ID속성이 있는가? => 마이페이지 => 세션에 Id 속성이 있는가? => 정보수정 페이지
                            |                                  |
                        redirect:/                          redirect:/
                            |                                  |
                        로그인 페이지                        로그인 페이지

   서버에 연결해서 로그인 요청이 들어갔을 때 로그인을 성공하는 시점에서 세션에 회원데이터를 저장해놓고
   세션에 데이터가 있다면 로그인 한 사람이다 라는 것을 판별.
   세션에 데이터가 저장되어 있지 않다면 로그인을 하지 않았다는 것을 판별.



*/
