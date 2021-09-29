package com.example.studiozen.Mail;


import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;


@Configuration
public class MailSend {

    Logger logger = LogManager.getLogger(MailSend.class);

    //Default 생성자
    public MailSend() {}

    //신규 예약시 이메일 발송
    public MailSend(String reserv_hostName, String reserv_space, String reserv_date,
                    String reserv_start_time, String reserv_end_time, String limitedTime_to_pay ) {
            CheckReservation_MailSend(reserv_hostName, reserv_space, reserv_date,
                                      reserv_start_time, reserv_end_time, limitedTime_to_pay );
    }
    //예약 취소시 이메일 발송
    public MailSend(String reserv_hostName, String reserv_space, String reserv_date,
                    String reserv_start_time, String reserv_end_time) {
        DeleteReservation_MailSend(reserv_hostName, reserv_space, reserv_date,
                reserv_start_time, reserv_end_time );
    }

    //회원가입시 이메일 발송
    public MailSend(String member_mail, String member_no) {
        RegisterMailConfirm_MailSend(member_mail, member_no);
    }

    public MimeMessage MailProperty(){
        Properties properties = System.getProperties();
        properties.setProperty("mail.transport.protocol","smtp");
        properties.setProperty("mail.host","smtp.gmail.com");
        properties.put("mail.smtp.auth","true");
        properties.put("mail.smtp.port","465");
        properties.put("mail.debug","ture");
        properties.put("mail.smtp.socketFactory.port","465");
        properties.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
        properties.put("mail.smtp.socketFactory.fallback","flase");
        properties.put("mail.smtp.starttls.required","true");
        properties.put("mail.smtp.starttls.enalbe","true");
        properties.put("mail.smtp.host","smtp.gmail.com");

        Authenticator authenticator = new MailAuthor();

        Session session = Session.getDefaultInstance(properties, authenticator);

        MimeMessage msg = new MimeMessage(session);

        return msg;
    }


    public void CheckReservation_MailSend(String reserv_hostName, String reserv_space, String reserv_date,
                                          String reserv_start_time, String reserv_end_time, String limitedTime_to_pay ) {

        MimeMessage msgs = MailProperty();

        try {
            msgs.setSentDate(new Date());

            msgs.setFrom(new InternetAddress("rs.moony@gmail.com", "ROH Moon"));
            InternetAddress to = new InternetAddress("shtkdans@gmail.com");

            String subject = "#[StudoZen] "+ reserv_hostName + "님의 예약 확인 메일 입니다.#" ;
            String content = " \n\n\n\n   안녕하세요, "+ reserv_hostName+ "님 StudioZen 입니다. \n\n\n" +
                    "예약 하신 장소는 " + reserv_space + " 이며, " +"\n\n"+
                    "예약 하신 날짜는 " + reserv_date + " 이고, \n\n"+
                    "     사용 시간은 "+  reserv_start_time +"시 부터   "+reserv_end_time +"시 까지 입니다.\n\n"  +
                    "결제 완료시에 발송되는 예약 확정 메일이 발송되고 예약이 확정 됩니다.\n\n "+
                    "결제 기한은 " + limitedTime_to_pay + "까지이며, 이후엔 예약이 취소되는 점 안내드립니다.\n\n\n"+
                    "감사합니다 - StudioZen";

            msgs.setRecipient(Message.RecipientType.TO,to);
            msgs.setSubject(subject,"UTF-8");
            msgs.setText(content,"UTF-8");

            Transport.send(msgs);
            logger.info("예약 결제 안내 메일 발송");



        } catch (AddressException e) {
            logger.info("AddressException === > "+e.getMessage());
        } catch (MessagingException e) {
            logger.info("MessagingException === > " + e.getMessage());
        } catch (UnsupportedEncodingException e) {
            logger.info("UnsupportedEncodingException === > "+e.getMessage());
        }

    }
    public void DeleteReservation_MailSend(String reserv_hostName, String reserv_space, String reserv_date,
                                           String reserv_start_time, String reserv_end_time) {

        MimeMessage msgs = MailProperty();

        try {
            msgs.setSentDate(new Date());

            msgs.setFrom(new InternetAddress("rs.moony@gmail.com", "ROH Moon"));
            InternetAddress to = new InternetAddress("shtkdans@gmail.com");

            String subject = "#[StudoZen] "+ reserv_hostName + "님의 예약 취소 확인 메일 입니다.#" ;
            String content = " \n\n\n\n   안녕하세요, "+ reserv_hostName+ "님 StudioZen 입니다. \n\n\n" +
                    "예약 하신 장소는 " + reserv_space + " 이며, " +"\n\n"+
                    "예약 하신 날짜는 " + reserv_date + " 이고, \n\n"+
                    "     사용 시간은 "+  reserv_start_time +"시 부터   "+reserv_end_time +"시까지 사용으로,\n\n"+
                    "예약해주셨던 건이 정상적으로 취소되었음을 안내해드립니다. \n\n\n"+
                    "감사합니다 - StudioZen";

            msgs.setRecipient(Message.RecipientType.TO,to);
            msgs.setSubject(subject,"UTF-8");
            msgs.setText(content,"UTF-8");

            Transport.send(msgs);
            logger.info("예약 결제 안내 메일 발송");



        } catch (AddressException e) {
            logger.info("AddressException === > "+e.getMessage());
        } catch (MessagingException e) {
            logger.info("MessagingException === > " + e.getMessage());
        } catch (UnsupportedEncodingException e) {
            logger.info("UnsupportedEncodingException === > "+e.getMessage());
        }

    }
    public void RegisterMailConfirm_MailSend(String member_mail, String member_no) {

        MimeMessage msgs = MailProperty();

        try {
            msgs.setSentDate(new Date());

            msgs.setFrom(new InternetAddress("rs.moony@gmail.com", "ROH Moon"));
//            InternetAddress to = new InternetAddress("shtkdans@gmail.com");
            InternetAddress to = new InternetAddress(member_mail);

            String subject = "#[StudoZen] "+"님의 회원가입 인증 메일 .#"+"" ;
            String content = "[이메일 인증]"+"\n\n"+"아래 링크를 클릭하시면 이메일 인증이 완료됩니다."
                    + "http://172.30.1.43:8080/member/certify/"+member_no;


            msgs.setRecipient(Message.RecipientType.TO,to);
            msgs.setSubject(subject,"UTF-8");
            msgs.setText(content,"UTF-8");

            Transport.send(msgs);
            logger.info("회원가입한 회원에게 메일 인증링크  발사.");



        } catch (AddressException e) {
            logger.info("AddressException === > "+e.getMessage());
        } catch (MessagingException e) {
            logger.info("MessagingException === > " + e.getMessage());
        } catch (UnsupportedEncodingException e) {
            logger.info("UnsupportedEncodingException === > "+e.getMessage());
        }

    }

}
