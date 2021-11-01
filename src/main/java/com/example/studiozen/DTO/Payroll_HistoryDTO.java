package com.example.studiozen.DTO;

public class Payroll_HistoryDTO extends ReservationDTO {

   private String payroll_hist_no       ;
   private String payroll_hist_date     ;
   private int    payroll_hist_price    ;
   private String payroll_hist_method   ;



    public String getPayroll_hist_no() {
        return payroll_hist_no;
    }

    public void setPayroll_hist_no(String payroll_hist_no) {
        this.payroll_hist_no = payroll_hist_no;
    }

    @Override
    public String getReserv_no() {
        return super.getReserv_no();
    }

    @Override
    public void setReserv_no(String reserv_no) {
        super.setReserv_no(reserv_no);
    }

    public String getPayroll_hist_date() {
        return payroll_hist_date;
    }

    public void setPayroll_hist_date(String payroll_hist_date) {
        this.payroll_hist_date = payroll_hist_date;
    }

    public int getPayroll_hist_price() {
        return payroll_hist_price;
    }

    public void setPayroll_hist_price(int payroll_hist_price) {
        this.payroll_hist_price = payroll_hist_price;
    }

    public String getPayroll_hist_method() {
        return payroll_hist_method;
    }

    public void setPayroll_hist_method(String payroll_hist_method) {
        this.payroll_hist_method = payroll_hist_method;
    }


}
