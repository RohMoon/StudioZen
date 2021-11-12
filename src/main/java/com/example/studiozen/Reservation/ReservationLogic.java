package com.example.studiozen.Reservation;


import com.example.studiozen.DTO.ReservationDTO;
import com.example.studiozen.Mail.MailSend;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReservationLogic {
    private static Logger logger = LogManager.getLogger(ReservationLogic.class);

    private final ReservationDAO reservationDAO;

    public ReservationLogic(ReservationDAO reservationDAO) {
        this.reservationDAO = reservationDAO;
    }

    /* 대여 예약 전체 조회*/
    public List<ReservationDTO> ReservationSelect(ReservationDTO reservationDTO) {
        List<ReservationDTO> reservationSelectList = null;
        try {
            reservationSelectList = reservationDAO.ReservationSelect(reservationDTO);
        } catch (Exception e) {
            e.printStackTrace(System.err);
        }
        return reservationSelectList;

    }

    /* 대상 공간의 대여된 시간 조회*/
    public List<ReservationDTO> Reservation_BookedTimeSelect(ReservationDTO reservationDTO) {
        List<ReservationDTO> reservation_BookedTimeSelectList = null;
        try {
            reservation_BookedTimeSelectList = reservationDAO.Reservation_BookedTimeSelect(reservationDTO);
        } catch (Exception e) {
            e.printStackTrace(System.err);
            logger.info(e.getMessage());
        }
        return reservation_BookedTimeSelectList;

    }

    /* 대여 예약 상세 조회 */
    public List<ReservationDTO> ReservationDetail(ReservationDTO reservationDTO) {
        List<ReservationDTO> reservationDetailList = null;
        try {
            reservationDetailList = reservationDAO.ReservationDetail(reservationDTO);
        } catch (Exception e) {
            e.printStackTrace(System.err);
        }
        return reservationDetailList;

    }


    /*예약 하기*/
    public String ReservationBook(ReservationDTO reservationDTO) {

        String result = null;


        logger.info(       "\n"+
                       "getTr_code()            ====  >> "+reservationDTO.getTr_code()           +"\n"+
                       "getReserv_no()          ====  >> "+reservationDTO.getReserv_no()         +"\n"+
                       "getSpace_no()           ====  >> "+reservationDTO.getSpace_no()          +"\n"+
                       "getReserv_hostcode()    ====  >> "+reservationDTO.getReserv_hostcode()   +"\n"+
                       "getReserv_date()        ====  >> "+reservationDTO.getReserv_date()       +"\n"+
                       "getReserv_start_tme()   ====  >> "+reservationDTO.getReserv_start_time()  +"\n"+
                       "getReserv_end_time()    ====  >> "+reservationDTO.getReserv_end_time()   +"\n"+
                       "getReserv_host_mobile() ====  >> "+reservationDTO.getReserv_host_mobile()+"\n"+
                       "getReserv_host_email()  ====  >> "+reservationDTO.getReserv_host_email() +"\n"+
                       "getReserv_del_reason()  ====  >> "+reservationDTO.getReserv_del_reason()
        );
        try {
            reservationDAO.Reservation_CUD(reservationDTO);

            String reserv_hostName = reservationDTO.getReserv_hostname();

            String reserv_space    = reservationDTO.getReserv_space();

            String nonTuning_reserv_date = reservationDTO.getReserv_date();

            String reserv_date = nonTuning_reserv_date.substring(0,4)+ "년  "
                               + nonTuning_reserv_date.substring(4,6)+"월  "
                               + nonTuning_reserv_date.substring(6,8)+"일";

            String reserv_start_time = reservationDTO.getReserv_start_time();

            String reserv_end_time = reservationDTO.getReserv_start_time();

            String limitedTime_to_pay = reservationDTO.getReserv_pay_limited();

            MailSend mailSend = new MailSend(reserv_hostName, reserv_space,
                                            reserv_date, reserv_start_time, reserv_end_time, limitedTime_to_pay);

        } catch (Exception e) {
            result = "bad";
            logger.info("Exception ==== >> "+e.getMessage());
        }
        logger.info("서비스 클래스에서의 동작 성공 결과 구분 ==== > " + reservationDTO.getResult());

        try {
            logger.info("start");
            Thread.sleep(7000);
            logger.info("end");
        } catch (InterruptedException e) {
            logger.error(e.getMessage());
        }



        return result;

    }

    public String BookUpdater(ReservationDTO reservationDTO) {
        String result = null;
        try {
            reservationDAO.Reservation_CUD(reservationDTO);
            result = "Nice";
        } catch (Exception e) {
            result = "bad";
            logger.info(e.getStackTrace());
        }
        logger.info(reservationDTO.getResult());
        return result;

    }

    public String BookDelete(ReservationDTO reservationDTO) {
        String result = null;
        try {
            reservationDAO.Reservation_CUD(reservationDTO);
            result = "Nice";

            // 해당 부분 메소드 빼서 줄일 것
            String reserv_hostName = reservationDTO.getReserv_hostname();

            String reserv_space    = reservationDTO.getReserv_space();

            String nonTuning_reserv_date = reservationDTO.getReserv_date();

            String reserv_date = nonTuning_reserv_date.substring(0,4)+ "년  "
                    + nonTuning_reserv_date.substring(4,6)+"월  "
                    + nonTuning_reserv_date.substring(6,8)+"일";

            String reserv_start_time = reservationDTO.getReserv_start_time();

            String reserv_end_time = reservationDTO.getReserv_start_time();

            String limitedTime_to_pay = reservationDTO.getReserv_pay_limited();

            MailSend mailSend = new MailSend(reserv_hostName, reserv_space,
                    reserv_date, reserv_start_time, reserv_end_time);




        } catch (Exception e) {
            result = "bad";
            logger.info(e.getStackTrace());
        }
        logger.info(reservationDTO.getResult());
        return result;

    }
}
