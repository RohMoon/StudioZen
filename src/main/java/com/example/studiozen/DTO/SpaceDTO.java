package com.example.studiozen.DTO;

public class SpaceDTO extends BranchOfficeDTO {

   private String space_no            ;
   private int space_basicprice       ;
   private int space_maxpeople        ;
   private int space_capacity         ;
   private String space_name          ;
   private String space_description   ;
   private String space_regdate       ;

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

    public String getSpace_no() {
        return space_no;
    }

    public void setSpace_no(String space_no) {
        this.space_no = space_no;
    }

    @Override
    public String getBranchoffice_no() {
        return super.getBranchoffice_no();
    }

    @Override
    public void setBranchoffice_no(String branchoffice_no) {
        super.setBranchoffice_no(branchoffice_no);
    }

    public int getSpace_basicprice() {
        return space_basicprice;
    }

    public void setSpace_basicprice(int space_basicprice) {
        this.space_basicprice = space_basicprice;
    }

    public int getSpace_maxpeople() {
        return space_maxpeople;
    }

    public void setSpace_maxpeople(int space_maxpeople) {
        this.space_maxpeople = space_maxpeople;
    }

    public int getSpace_capacity() {
        return space_capacity;
    }

    public void setSpace_capacity(int space_capacity) {
        this.space_capacity = space_capacity;
    }

    public String getSpace_name() {
        return space_name;
    }

    public void setSpace_name(String space_name) {
        this.space_name = space_name;
    }

    public String getSpace_description() {
        return space_description;
    }

    public void setSpace_description(String space_description) {
        this.space_description = space_description;
    }

    public String getSpace_regdate() {
        return space_regdate;
    }

    public void setSpace_regdate(String space_regdate) {
        this.space_regdate = space_regdate;
    }

    @Override
    public String toString() {
        return "\n SpaceDTO{" +
                "space_no='" + space_no + '\'' +
                ", space_basicprice=" + space_basicprice +
                ", space_maxpeople=" + space_maxpeople +
                ", space_capacity=" + space_capacity +
                ", space_name='" + space_name + '\'' +
                ", space_description='" + space_description + '\'' +
                ", space_regdate='" + space_regdate + '\'' +
                '}';
    }
}
