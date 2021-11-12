package com.example.studiozen.DTO;


import org.springframework.stereotype.Component;

import java.util.Date;

@Component
public class MemberDTO extends CommonDTO {

    private String member_no;
    private String member_password;
    private String member_name;
    private String member_mail;
    private int    member_phone;
    private int    member_money;
    private String member_remark;
    private Date member_date;
    private String member_signDate;
    private String member_outSign;
    private String loginresult;


    @Override
    public int getResult() {
        return super.getResult();
    }

    @Override
    public void setResult(int result) {
        super.setResult(result);
    }

    @Override
    public String getTr_code() {
        return super.getTr_code();
    }

    @Override
    public void setTr_code(String tr_code) {
        super.setTr_code(tr_code);
    }

    public String getMember_no() {
        return member_no;
    }

    public void setMember_no(String member_no) {
        this.member_no = member_no;
    }

    public String getMember_password() {
        return member_password;
    }

    public void setMember_password(String member_password) {
        this.member_password = member_password;
    }

    public String getMember_name() {
        return member_name;
    }

    public void setMember_name(String member_name) {
        this.member_name = member_name;
    }

    public String getMember_mail() {
        return member_mail;
    }

    public void setMember_mail(String member_mail) {
        this.member_mail = member_mail;
    }

    public int getMember_phone() {
        return member_phone;
    }

    public void setMember_phone(int member_phone) {
        this.member_phone = member_phone;
    }

    public int getMember_money() {
        return member_money;
    }

    public void setMember_money(int member_money) {
        this.member_money = member_money;
    }

    public String getMember_remark() {
        return member_remark;
    }

    public void setMember_remark(String member_remark) {
        this.member_remark = member_remark;
    }

    public Date getMember_date() {
        return member_date;
    }

    public void setMember_date(Date member_date) {
        this.member_date = member_date;
    }

    public String getMember_signDate() {
        return member_signDate;
    }

    public void setMember_signDate(String member_signDate) {
        this.member_signDate = member_signDate;
    }

    public String getMember_outSign() {
        return member_outSign;
    }

    public void setMember_outSign(String member_outSign) {
        this.member_outSign = member_outSign;
    }

    public String getLoginresult() {
        return loginresult;
    }

    public void setLoginresult(String loginresult) {
        this.loginresult = loginresult;
    }


    @Override
    public String toString() {
        return "MemberDTO{" +
                "member_no='" + member_no + '\'' +
                ", member_password='" + member_password + '\'' +
                ", member_name='" + member_name + '\'' +
                ", member_mail='" + member_mail + '\'' +
                ", member_phone=" + member_phone +
                ", member_money=" + member_money +
                ", member_remark='" + member_remark + '\'' +
                ", member_date=" + member_date +
                ", member_signDate='" + member_signDate + '\'' +
                ", member_outSign='" + member_outSign + '\'' +
                ", loginresult='" + loginresult + '\'' +
                '}';
    }
}
