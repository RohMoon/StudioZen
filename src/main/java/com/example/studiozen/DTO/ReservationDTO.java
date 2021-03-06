package com.example.studiozen.DTO;

public class ReservationDTO extends SpaceDTO {

    private String reserv_no;
    private String reserv_hostcode;
    private String reserv_date;
    private String reserv_regdate;
    private String reserv_start_time;
    private String reserv_end_time;
    private String reserv_host_mobile;
    private String reserv_paystatement;
    private String reserv_host_email;
    private String reserv_updatedate;
    private String reserv_del_reason;
    private String reserv_hostname;
    private String reserv_space;
    private String reserv_pay_limited;

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

    public String getReserv_no() {
        return reserv_no;
    }

    public void setReserv_no(String reserv_no) {
        this.reserv_no = reserv_no;
    }


    @Override
    public String getSpace_no() {
        return super.getSpace_no();
    }

    @Override
    public void setSpace_no(String space_no) {
        super.setSpace_no(space_no);
    }

    public String getReserv_hostcode() {
        return reserv_hostcode;
    }

    public void setReserv_hostcode(String reserv_hostcode) {
        this.reserv_hostcode = reserv_hostcode;
    }

    public String getReserv_date() {
        return reserv_date;
    }

    public void setReserv_date(String reserv_date) {
        this.reserv_date = reserv_date;
    }

    public String getReserv_start_time() {
        return reserv_start_time;
    }

    public void setReserv_start_time(String reserv_start_time) {
        this.reserv_start_time = reserv_start_time;
    }

    public String getReserv_end_time() {
        return reserv_end_time;
    }

    public void setReserv_end_time(String reserv_end_time) {
        this.reserv_end_time = reserv_end_time;
    }

    public String getReserv_host_mobile() {
        return reserv_host_mobile;
    }

    public void setReserv_host_mobile(String reserv_host_mobile) {
        this.reserv_host_mobile = reserv_host_mobile;
    }

    public String getReserv_paystatement() {
        return reserv_paystatement;
    }

    public void setReserv_paystatement(String reserv_paystatement) {
        this.reserv_paystatement = reserv_paystatement;
    }

    public String getReserv_host_email() {
        return reserv_host_email;
    }

    public void setReserv_host_email(String reserv_host_email) {
        this.reserv_host_email = reserv_host_email;
    }

    public String getReserv_updatedate() {
        return reserv_updatedate;
    }

    public void setReserv_updatedate(String reserv_updatedate) {
        this.reserv_updatedate = reserv_updatedate;
    }

    public String getReserv_del_reason() {
        return reserv_del_reason;
    }

    public void setReserv_del_reason(String reserv_del_reason) {
        this.reserv_del_reason = reserv_del_reason;
    }

    public String getReserv_hostname() {
        return reserv_hostname;
    }

    public void setReserv_hostname(String reserv_hostname) {
        this.reserv_hostname = reserv_hostname;
    }

    public String getReserv_space() {
        return reserv_space;
    }

    public void setReserv_space(String reserv_space) {
        this.reserv_space = reserv_space;
    }

    public String getReserv_pay_limited() {
        return reserv_pay_limited;
    }

    public void setReserv_pay_limited(String reserv_pay_limited) {
        this.reserv_pay_limited = reserv_pay_limited;
    }

    public String getReserv_regdate() {
        return reserv_regdate;
    }

    public void setReserv_regdate(String reserv_regdate) {
        this.reserv_regdate = reserv_regdate;
    }

    @Override
    public String toString() {
        return "\n tr_code ====>" + getTr_code() + "\n" +
                "\n Space_no() ====>" + getSpace_no() + "\n" +
                "reserv_no       === > " + reserv_no + "\n" +
                "reserv_hostcode       === > " + reserv_hostcode + "\n" +
                "reserv_date       === > " + reserv_date + "\n" +
                "reserv_start_time       === > " + reserv_start_time + "\n" +
                "reserv_end_time       === > " + reserv_end_time + "\n" +
                "reserv_host_mobile       === > " + reserv_host_mobile + "\n" +
                "reserv_paystatement       === > " + reserv_paystatement + "\n" +
                "reserv_host_email       === > " + reserv_host_email + "\n" +
                "reserv_updatedate       === > " + reserv_updatedate + "\n" +
                "reserv_del_reason       === > " + reserv_del_reason + "\n" +
                "reserv_hostname       === > " + reserv_hostname + "\n" +
                "reserv_space       === > " + reserv_space + "\n" +
                "paylimitedtime       === > " + reserv_pay_limited
                ;
    }
}
