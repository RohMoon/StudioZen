package com.example.studiozen.Space;


import com.example.studiozen.DTO.SpaceDTO;
import com.example.studiozen.Mail.MailSend;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

@Service
public class SpaceLogic {
    private static Logger logger = LogManager.getLogger(SpaceLogic.class);

    private final SpaceDAO spaceDAO;

    public SpaceLogic(SpaceDAO spaceDAO) {
        this.spaceDAO = spaceDAO;
    }


    public String SpaceRegister(SpaceDTO spaceDTO) {

        String result = null;

/*        logger.info(       "\n"+
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
        );*/

        try {
            spaceDAO.Space_CUD(spaceDTO);

        } catch (Exception e) {
            result = "bad";
            logger.info("Exception ==== >> "+e.getMessage());
        }
        logger.info("서비스 클래스에서의 동작 성공 결과 구분 ==== > " + spaceDTO.getResult());

        return result;

    }

    public String SpaceUpdater(SpaceDTO spaceDTO) {
        String result = null;
        try {
            spaceDAO.Space_CUD(spaceDTO);
            result = "Nice";
        } catch (Exception e) {
            result = "bad";
            logger.info(e.getStackTrace());
        }
        logger.info(spaceDTO.getResult());
        return result;

    }

    public String SpaceDelete(SpaceDTO spaceDTO) {
        String result = null;
        try {
            spaceDAO.Space_CUD(spaceDTO);
            result = "Nice";
        } catch (Exception e) {
            result = "bad";
            logger.info(e.getStackTrace());
        }
        logger.info(spaceDTO.getResult());
        return result;

    }

}
