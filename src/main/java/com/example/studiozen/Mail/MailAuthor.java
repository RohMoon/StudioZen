package com.example.studiozen.Mail;


import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MailAuthor extends Authenticator {

    PasswordAuthentication passwordAuthentication;

    public MailAuthor() {
        String mail_id = "rs.moony@gmail.com";
        String mail_pw = "sjvsqfzzvpxiraqi";

        passwordAuthentication = new PasswordAuthentication(mail_id, mail_pw);

    }

    @Override
    public PasswordAuthentication getPasswordAuthentication() {
        return passwordAuthentication;
    }
}
