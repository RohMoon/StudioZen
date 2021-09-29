package com.example.studiozen.Member;


import com.example.studiozen.DTO.MemberDTO;
import com.google.gson.Gson;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@RestController
@RequestMapping("member")
public class MemberRestController {

    private static Logger logger = LogManager.getLogger(MemberRestController.class);

    private final MemberLogic memberLogic;
    private final MemberDTO memberDTO;
    //생성자 주입
    public MemberRestController(MemberLogic memberLogic, MemberDTO memberDTO) {
        this.memberLogic = memberLogic;
        this.memberDTO = memberDTO;
    }

    /*********인증메일 클릭시 인증받은 회원으로 업데이트 진행********
     http://localhost:8080/member/certify/{member_no}
     {
     member/certify/{member_no}
     }
     **********************/
    @PostMapping(value = "/duplicateMailCheck")
    public String duplicateMailCheck(HttpServletResponse response, @RequestBody String member_email) throws IOException {
        memberDTO.setMember_mail(member_email);
        logger.info(memberDTO.getMember_mail());
        String result = memberLogic.duplicateMailCheck(memberDTO);

        Gson gson = new Gson();
        String DuplicateOrNot = gson.toJson(memberDTO);


        logger.info(memberDTO.getResult());
        logger.info(result);
        logger.info(gson.toJson(memberDTO));

        // -1 은 해당 이메일 존재 X
        if (memberDTO.getResult() == -1) {
            return DuplicateOrNot;
            // 1 은 해당 이메일 존재 O
        } else return DuplicateOrNot;

    }// End of Register Method   // End of Login Method  // End of Login Method

}
