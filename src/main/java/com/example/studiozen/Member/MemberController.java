package com.example.studiozen.Member;


import com.example.studiozen.DTO.MemberDTO;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("member")
public class MemberController {

    private static Logger logger = LogManager.getLogger(MemberController.class);

    private final MemberLogic memberLogic;
    private final MemberDTO memberDTO;
    //생성자 주입
    public MemberController(MemberLogic memberLogic, MemberDTO memberDTO) {
        this.memberLogic = memberLogic;
        this.memberDTO = memberDTO;
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



        logger.info(memberDTO.getResult());
        logger.info(result);


        //로그인 담당 프로시저에서 로그인성공과 실패에 대한 결과값을 int result로 반환
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

        String result = memberLogic.Login(memberDTO);

        logger.info(memberDTO.getResult());
        logger.info(result);

        //로그인 담당 프로시저에서 로그인성공과 실패에 대한 결과값을 int result로 반환
        if (memberDTO.getResult() == 1) {
            logger.info("입력한 멤버 번호 ==> "+memberDTO.getMember_no());
            memberDTO.setSession_no(memberDTO.getMember_no());
            logger.info("세션DTO에 집어넣은 번호 ==>"+ memberDTO.getSession_no());
            HttpSession httpSession = req.getSession(true);
            httpSession.setAttribute("sessionNO",memberDTO.getSession_no());

            String sessionParam = (memberDTO.getSession_no()).split("=")[1];
            if(memberDTO.getMember_no().equals("member_no=MEM282108")){
                 logger.info("관리자 세션 ===> http Session ====>" +sessionParam);
                return "forward:/Management/dash.do/"+sessionParam;
            }else {
                logger.info("일반회원");
            }
            logger.info("리턴직전");
             return "forward:/Client/dash.do/"+sessionParam;
        } else {

            return "forward:/common/Index";

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

        logger.info(memberDTO.getResult());
        logger.info(result);


        if (result == "Nice") {
            modelAndView.setViewName("common/Index");
            return modelAndView;

        } else {
               modelAndView.setViewName("common/failed");
            return modelAndView;

        }

    }// End of Register Method   // End of Login Method  // End of Login Method


}
