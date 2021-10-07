package com.example.studiozen.DTO;

public class BranchOfficeDTO extends CommonDTO {

    private String branchoffice_no     ;
    private String branchoffice_name   ;
    private String branchoffice_local  ;
    private long    branchoffice_mobile ;
    private String branchoffice_address;
    private String branchoffice_regdate;
    private String branchoffice_img_no;
    private String branchoffice_img_code;

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

    public String getBranchoffice_no() {
        return branchoffice_no;
    }

    public void setBranchoffice_no(String branchoffice_no) {
        this.branchoffice_no = branchoffice_no;
    }

    public String getBranchoffice_name() {
        return branchoffice_name;
    }

    public void setBranchoffice_name(String branchoffice_name) {
        this.branchoffice_name = branchoffice_name;
    }

    public String getBranchoffice_local() {
        return branchoffice_local;
    }

    public void setBranchoffice_local(String branchoffice_local) {
        this.branchoffice_local = branchoffice_local;
    }

    public long getBranchoffice_mobile() {
        return branchoffice_mobile;
    }

    public void setBranchoffice_mobile(long branchoffice_mobile) {
        this.branchoffice_mobile = branchoffice_mobile;
    }

    public String getBranchoffice_address() {
        return branchoffice_address;
    }

    public void setBranchoffice_address(String branchoffice_address) {
        this.branchoffice_address = branchoffice_address;
    }

    public String getBranchoffice_regdate() {
        return branchoffice_regdate;
    }

    public void setBranchoffice_regdate(String branchoffice_regdate) {
        this.branchoffice_regdate = branchoffice_regdate;
    }

    public String branchoffice_img_no() {
        return branchoffice_img_no;
    }

    public void setBranchoffice_img__no(String branchoffice_img_no) {
        this.branchoffice_img_no = branchoffice_img_no;
    }

    public String getBranchoffice_img_no() {
        return branchoffice_img_no;
    }

    public void setBranchoffice_img_no(String branchoffice_img_no) {
        this.branchoffice_img_no = branchoffice_img_no;
    }

    public String getBranchoffice_img_code() {
        return branchoffice_img_code;
    }

    public void setBranchoffice_img_code(String branchoffice_img_code) {
        this.branchoffice_img_code = branchoffice_img_code;
    }

    @Override
    public String getSession_no() {
        return super.getSession_no();
    }

    @Override
    public int getRow_num() {
        return super.getRow_num();
    }

    @Override
    public int getMemberornot() {
        return super.getMemberornot();
    }

    @Override
    public String getUserkey() {
        return super.getUserkey();
    }

    @Override
    public String getAfter_key() {
        return super.getAfter_key();
    }

    @Override
    public String getResultmessage() {
        return super.getResultmessage();
    }

    @Override
    public String getOriginal_file_name() {
        return super.getOriginal_file_name();
    }

    @Override
    public String getStored_file_name() {
        return super.getStored_file_name();
    }

    @Override
    public long getFile_size() {
        return super.getFile_size();
    }

    @Override
    public String getCrea_dtm() {
        return super.getCrea_dtm();
    }

    @Override
    public String getCrea_id() {
        return super.getCrea_id();
    }

    @Override
    public String getDel_gb() {
        return super.getDel_gb();
    }

    @Override
    public String toString() {
        return "BranchOfficeDTO{" +
                "branchoffice_no='" + branchoffice_no + '\'' +
                ", branchoffice_name='" + branchoffice_name + '\'' +
                ", branchoffice_local='" + branchoffice_local + '\'' +
                ", branchoffice_mobile=" + branchoffice_mobile +'\''+
                ", branchoffice_address='" + branchoffice_address + '\'' +
                ", branchoffice_regdate='" + branchoffice_regdate + '\'' +
                ", branchoffice_img_no='" + branchoffice_img_no + '\'' +
                '}';
    }
}
