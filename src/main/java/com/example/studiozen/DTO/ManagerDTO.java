package com.example.studiozen.DTO;

public class ManagerDTO extends BranchOfficeDTO {

    private String manager_no     ;
    private String manager_name   ;
    private String manager_mobile  ;
    private int    manager_remark ;

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

    @Override
    public String getBranchoffice_no() {
        return super.getBranchoffice_no();
    }

    @Override
    public void setBranchoffice_no(String branchoffice_no) {
        super.setBranchoffice_no(branchoffice_no);
    }

    public String getManager_no() {
        return manager_no;
    }

    public void setManager_no(String manager_no) {
        this.manager_no = manager_no;
    }

    public String getManager_name() {
        return manager_name;
    }

    public void setManager_name(String manager_name) {
        this.manager_name = manager_name;
    }

    public String getManager_mobile() {
        return manager_mobile;
    }

    public void setManager_mobile(String manager_mobile) {
        this.manager_mobile = manager_mobile;
    }

    public int getManager_remark() {
        return manager_remark;
    }

    public void setManager_remark(int manager_remark) {
        this.manager_remark = manager_remark;
    }
}
