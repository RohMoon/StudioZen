package com.example.studiozen.DTO;

public class CommonDTO {

    private int result;

    private String tr_code;

    private String session_no;

    private int row_num;

    private int memberornot;

    private String userkey;

    private String after_key;

    private String resultmessage;

    private String original_file_name;
    private String stored_file_name;
    private long   file_size;
    private String crea_dtm;
    private String crea_id;
    private String del_gb;

    public int getResult() {
        return result;
    }

    public void setResult(int result) {
        this.result = result;
    }

    public String getTr_code() {
        return tr_code;
    }

    public void setTr_code(String tr_code) {
        this.tr_code = tr_code;
    }

    public String getSession_no() {
        return session_no;
    }

    public void setSession_no(String session_no) {
        this.session_no = session_no;
    }

    public int getRow_num() {
        return row_num;
    }

    public void setRow_num(int row_num) {
        this.row_num = row_num;
    }

    public int getMemberornot() {
        return memberornot;
    }

    public void setMemberornot(int memberornot) {
        this.memberornot = memberornot;
    }

    public String getUserkey() {
        return userkey;
    }

    public void setUserkey(String userkey) {
        this.userkey = userkey;
    }

    public String getAfter_key() {
        return after_key;
    }

    public void setAfter_key(String after_key) {
        this.after_key = after_key;
    }

    public String getResultmessage() {
        return resultmessage;
    }

    public void setResultmessage(String resultmessage) {
        this.resultmessage = resultmessage;
    }

    public String getOriginal_file_name() {
        return original_file_name;
    }

    public void setOriginal_file_name(String original_file_name) {
        this.original_file_name = original_file_name;
    }

    public String getStored_file_name() {
        return stored_file_name;
    }

    public void setStored_file_name(String stored_file_name) {
        this.stored_file_name = stored_file_name;
    }

    public long getFile_size() {
        return file_size;
    }

    public void setFile_size(long file_size) {
        this.file_size = file_size;
    }

    public String getCrea_dtm() {
        return crea_dtm;
    }

    public void setCrea_dtm(String crea_dtm) {
        this.crea_dtm = crea_dtm;
    }

    public String getCrea_id() {
        return crea_id;
    }

    public void setCrea_id(String crea_id) {
        this.crea_id = crea_id;
    }

    public String getDel_gb() {
        return del_gb;
    }

    public void setDel_gb(String del_gb) {
        this.del_gb = del_gb;
    }

    @Override
    public String toString() {
        return "CommonDTO{" +
                "result=" + result +
                ", tr_code='" + tr_code + '\'' +
                ", session_no='" + session_no + '\'' +
                ", row_num=" + row_num +
                ", memberornot=" + memberornot +
                ", userkey='" + userkey + '\'' +
                ", after_key='" + after_key + '\'' +
                ", resultmessage='" + resultmessage + '\'' +
                '}';
    }
}
