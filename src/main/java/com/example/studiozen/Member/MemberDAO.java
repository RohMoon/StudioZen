package com.example.studiozen.Member;

import com.example.studiozen.DTO.MemberDTO;
import org.apache.ibatis.session.SqlSessionException;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
    private static Logger logger = LogManager.getLogger(MemberController.class);
    private final SqlSessionTemplate sqlSessionTemplate;

    public MemberDAO(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    // 로그인 메소드
    public void Login(MemberDTO memberDTO) throws SqlSessionException {
        logger.info(memberDTO.getMember_no() +"    +    "+memberDTO.getMember_password());
        sqlSessionTemplate.selectList("getLogin",memberDTO);

    } // end of Login -- 로그인 메소드

    
    // 회원가입 DAO 메소드
    public void Member_Register(MemberDTO memberDTO) throws SqlSessionException{
        logger.info("\n"+
                 memberDTO.getTr_code          () + "=== >TR_CODE         \n" +
                 memberDTO.getMember_no        () + "=== >Member_NO       \n" +
                 memberDTO.getMember_password  () + "=== >Member_Password \n" +
                 memberDTO.getMember_name      () + "=== >Member_Name     \n" +
                 memberDTO.getMember_mail      () + "=== >Member_Mail     \n" +
                 memberDTO.getMember_phone     () + "=== >Member_Phone    \n" +
                 memberDTO.getMember_money     () + "=== >Member_Money    \n" +
                 memberDTO.getMember_remark    () + "=== >Member_Remark   \n" +
                 memberDTO.getMember_date      () + "=== >Member_Date     \n" +
                 memberDTO.getMember_signDate  () + "=== >Member_SignDate \n" +
                 memberDTO.getMember_outSign   () + "=== >Member_OutSign"
                );
        sqlSessionTemplate.selectList("member_CUD",memberDTO);

    } // end of Member_Register -- 회원가입 메소드

    // 이메일 인증 메소드
    public void Member_EmailCertify(MemberDTO memberDTO) throws SqlSessionException{
        logger.info(
                "\n"+
                "\n"+
                "Member_EmailCertify====> "+
                        "\n"+
                memberDTO.getTr_code          () + "=== >TR_CODE         \n" +
                memberDTO.getMember_no        () + "=== >Member_NO       \n" +
                memberDTO.getMember_password  () + "=== >Member_Password \n" +
                memberDTO.getMember_name      () + "=== >Member_Name     \n" +
                memberDTO.getMember_mail      () + "=== >Member_Mail     \n" +
                memberDTO.getMember_phone     () + "=== >Member_Phone    \n" +
                memberDTO.getMember_money     () + "=== >Member_Money    \n" +
                memberDTO.getMember_remark    () + "=== >Member_Remark   \n" +
                memberDTO.getMember_date      () + "=== >Member_Date     \n" +
                memberDTO.getMember_signDate  () + "=== >Member_SignDate \n" +
                memberDTO.getMember_outSign   () + "=== >Member_OutSign"
        );
        sqlSessionTemplate.update("emailCertify",memberDTO);

    } // end of Member_EmailCertify --  이메일 인증 메소드


    // 이메일 인증 메소드
    public void duplicateMailCheck(MemberDTO memberDTO) throws SqlSessionException{
        logger.info(
                "\n"+
                        "\n"+
                        "Member_EmailCertify====> "+
                        "\n"+
                        memberDTO.getTr_code          () + "=== >TR_CODE         \n" +
                        memberDTO.getMember_no        () + "=== >Member_NO       \n" +
                        memberDTO.getMember_password  () + "=== >Member_Password \n" +
                        memberDTO.getMember_name      () + "=== >Member_Name     \n" +
                        memberDTO.getMember_mail      () + "=== >Member_Mail     \n" +
                        memberDTO.getMember_phone     () + "=== >Member_Phone    \n" +
                        memberDTO.getMember_money     () + "=== >Member_Money    \n" +
                        memberDTO.getMember_remark    () + "=== >Member_Remark   \n" +
                        memberDTO.getMember_date      () + "=== >Member_Date     \n" +
                        memberDTO.getMember_signDate  () + "=== >Member_SignDate \n" +
                        memberDTO.getMember_outSign   () + "=== >Member_OutSign"
        );
        sqlSessionTemplate.selectList("duplicateMailCheck",memberDTO);

    } // end of Member_EmailCertify --  이메일 인증 메소드

}