package com.example.studiozen.Manager;


import com.example.studiozen.DTO.ManagerDTO;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

@Service
public class ManagerLogic {
    private static Logger logger = LogManager.getLogger(ManagerLogic.class);

    private final ManagerDAO managerDAO;

    public ManagerLogic(ManagerDAO managerDAO) {
        this.managerDAO = managerDAO;
    }


    public String ManagerRegister(ManagerDTO managerDTO) {

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
            managerDAO.Manager_CUD(managerDTO);

        } catch (Exception e) {
            result = "bad";
            logger.info("Exception ==== >> "+e.getMessage());
        }
        logger.info("서비스 클래스에서의 동작 성공 결과 구분 ==== > " + managerDTO.getResult());

        return result;

    }

    public String ManagerUpdater(ManagerDTO managerDTO) {
        String result = null;
        try {
            managerDAO.Manager_CUD(managerDTO);
            result = "Nice";
        } catch (Exception e) {
            result = "bad";
            logger.info(e.getStackTrace());
        }
        logger.info(managerDTO.getResult());
        return result;

    }

    public String ManagerDelete(ManagerDTO managerDTO) {
        String result = null;
        try {
            managerDAO.Manager_CUD(managerDTO);
            result = "Nice";
        } catch (Exception e) {
            result = "bad";
            logger.info(e.getStackTrace());
        }
        logger.info(managerDTO.getResult());
        return result;

    }

}
