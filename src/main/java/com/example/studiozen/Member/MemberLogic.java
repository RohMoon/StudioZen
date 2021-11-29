package com.example.studiozen.Member;


import com.example.studiozen.DTO.MemberDTO;
import com.example.studiozen.Mail.MailSend;
import org.apache.ibatis.session.SqlSessionException;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@ComponentScan
public class MemberLogic {
    private static Logger logger = LogManager.getLogger(MemberLogic.class);

    private final MemberDAO memberDAO;
    private final MailSend mailSend;
    public MemberLogic(MemberDAO memberDAO, MailSend mailSend) {
        this.memberDAO = memberDAO;
        this.mailSend = mailSend;
    }

    /* 로그인 로직*/
    public String Login(MemberDTO memberDTO){
        String result = null;

        try {
            memberDAO.Login(memberDTO);
            result = "Nice";

        }
        catch (SqlSessionException e){
            result = "bad";
            logger.info(e.getStackTrace());
        }
        return result;
    }


    public String Member_Register(MemberDTO memberDTO) {
        String result = null;


        try {
            memberDAO.Member_Register(memberDTO);
            String member_mail = memberDTO.getMember_mail();
            String member_no = memberDTO.getUserkey();
            mailSend.RegisterMailConfirm_MailSend(member_mail, member_no);
            result = "Nice";
        }
        catch (Exception e){
            result = "bad";
            logger.info(e.getStackTrace());
        }
        logger.info(memberDTO.getResult());
        return result;

    }

    public String Member_EmailCertify(MemberDTO memberDTO) {
        String result = null;


        try {
            memberDAO.Member_EmailCertify(memberDTO);

            result = "Nice";

        }
        catch (Exception e){
            result = "bad";
            logger.info(e.getStackTrace());
        }
        logger.info(memberDTO.getResult());
        return result;

    }

    public String duplicateMailCheck(MemberDTO memberDTO) {

        String result = null;


        try {
            memberDAO.duplicateMailCheck(memberDTO);

            result = "Nice";

        }
        catch (Exception e){
            result = "bad";
            logger.info(e.getStackTrace());
        }
        logger.info(memberDTO.getResult());
        return result;

    }

    /* 로그아웃 로직*/
    public String Logout(MemberDTO memberDTO){
        String result = null;

        try {
            logger.info("=======> Logic =======>"+memberDTO.toString());
            memberDAO.Logout(memberDTO);
            result = "Nice";

        }
        catch (SqlSessionException e){
            result = "bad";
            logger.info(e.getStackTrace());
        }
        logger.info(memberDTO.getResult());
        return result;
    }

    /*********  회원 검색  *********/
    public List<MemberDTO> Select(MemberDTO memberDTO){
        String result = null;
        List<MemberDTO> memberList = null;
        try {
            memberList = memberDAO.Select(memberDTO);
            result = "Nice";

        }
        catch (SqlSessionException e){
            result = "bad";
            logger.info(e.getStackTrace());
        }
//        logger.info(memberDTO.getResult());
        return memberList;
    }


}
