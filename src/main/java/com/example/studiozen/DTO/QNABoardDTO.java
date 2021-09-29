package com.example.studiozen.DTO;


import java.util.Date;

public class QNABoardDTO extends CommonDTO {

    private String qna_no;
    private String qna_writer;
    private String qna_title;
    private String qna_content;
    private Date qna_regidate;

    private int qna_recomment_no;
    private String qna_recomment_writer;
    private String qna_recomment_content;
    private Date qna_recomment_regdate;
    private int qna_confirmflag;

    private String qna_img_no;

    public String getQna_no() {
        return qna_no;
    }

    public void setQna_no(String qna_no) {
        this.qna_no = qna_no;
    }

    public String getQna_writer() {
        return qna_writer;
    }

    public void setQna_writer(String qna_writer) {
        this.qna_writer = qna_writer;
    }

    public String getQna_title() {
        return qna_title;
    }

    public void setQna_title(String qna_title) {
        this.qna_title = qna_title;
    }

    public String getQna_content() {
        return qna_content;
    }

    public void setQna_content(String qna_content) {
        this.qna_content = qna_content;
    }

    public Date getQna_regidate() {
        return qna_regidate;
    }

    public void setQna_regidate(Date qna_regidate) {
        this.qna_regidate = qna_regidate;
    }

    public int getQna_recomment_no() {
        return qna_recomment_no;
    }

    public void setQna_recomment_no(int qna_recomment_no) {
        this.qna_recomment_no = qna_recomment_no;
    }

    public String getQna_recomment_writer() {
        return qna_recomment_writer;
    }

    public void setQna_recomment_writer(String qna_recomment_writer) {
        this.qna_recomment_writer = qna_recomment_writer;
    }

    public String getQna_recomment_content() {
        return qna_recomment_content;
    }

    public void setQna_recomment_content(String qna_recomment_content) {
        this.qna_recomment_content = qna_recomment_content;
    }

    public Date getQna_recomment_regdate() {
        return qna_recomment_regdate;
    }

    public void setQna_recomment_regdate(Date qna_recomment_regdate) {
        this.qna_recomment_regdate = qna_recomment_regdate;
    }

    public int getQna_confirmflag() {
        return qna_confirmflag;
    }

    public void setQna_confirmflag(int qna_confirmflag) {
        this.qna_confirmflag = qna_confirmflag;
    }

    public String getQna_img_no() {
        return qna_img_no;
    }

    public void setQna_img_no(String qna_img_no) {
        this.qna_img_no = qna_img_no;
    }

    @Override
    public String getOriginal_file_name() {
        return super.getOriginal_file_name();
    }

    @Override
    public void setOriginal_file_name(String original_file_name) {
        super.setOriginal_file_name(original_file_name);
    }

    @Override
    public String getStored_file_name() {
        return super.getStored_file_name();
    }

    @Override
    public void setStored_file_name(String stored_file_name) {
        super.setStored_file_name(stored_file_name);
    }

    @Override
    public long getFile_size() {
        return super.getFile_size();
    }

    @Override
    public void setFile_size(long file_size) {
        super.setFile_size(file_size);
    }

    @Override
    public String getCrea_dtm() {
        return super.getCrea_dtm();
    }

    @Override
    public void setCrea_dtm(String crea_dtm) {
        super.setCrea_dtm(crea_dtm);
    }

    @Override
    public String getCrea_id() {
        return super.getCrea_id();
    }

    @Override
    public void setCrea_id(String crea_id) {
        super.setCrea_id(crea_id);
    }

    @Override
    public String getDel_gb() {
        return super.getDel_gb();
    }

    @Override
    public void setDel_gb(String del_gb) {
        super.setDel_gb(del_gb);
    }

    @Override
    public int getResult() {
        return super.getResult();
    }

    @Override
    public void setResult(int result) {
        super.setResult(result);
    }

    @Override
    public String toString() {
        return "\nqna_Title === > " + qna_title + "\n" +
                "qna_Content === > " + qna_content + "\n" +
                "qna_NO === > " + qna_no + "\n" +
                "qna_Writer === > " + qna_writer + "\n" +
                "qna_regidate === > " + qna_regidate + "\n" +
                "qna_recomment_no      === >" + qna_recomment_no + "\n" +
                "qna_recomment_writer  === >" + qna_recomment_writer + "\n" +
                "qna_recomment_content === >" + qna_recomment_content + "\n" +
                "qna_recomment_regdate === >" + qna_recomment_regdate + "\n" +
                "qna_confirmflag       === >" + qna_confirmflag + "\n" +
                "qna_img_no          " + qna_img_no         + "\n"+
                "getOriginal_file_name"+getOriginal_file_name()+"\n"+
                "getStored_file_name->"+getStored_file_name()+  "\n"+
                "getFile_size         "+getFile_size()+         "\n"+
                "getCrea_dtm          "+getCrea_dtm()+          "\n"+
                "getCrea_id           "+getCrea_id()+           "\n"+
                "getDel_gb            "+getDel_gb()+           "\n"+
                "getResult            "   +getResult()+           "\n"
                ;
    }

}