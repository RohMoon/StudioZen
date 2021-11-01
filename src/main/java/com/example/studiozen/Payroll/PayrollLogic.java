package com.example.studiozen.Payroll;


import com.example.studiozen.DTO.Payroll_HistoryDTO;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

@Service
public class PayrollLogic {
    private static Logger logger = LogManager.getLogger(PayrollLogic.class);

    private final PayrollDAO payrollDAO;

    public PayrollLogic(PayrollDAO payrollDAO) {
        this.payrollDAO = payrollDAO;
    }


    public String PayrollRegister(Payroll_HistoryDTO payroll_historyDTO) {

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
            payrollDAO.Payroll_CUD(payroll_historyDTO);
            result = "Nice";

        } catch (Exception e) {
            result = "bad";
            logger.info("Exception ==== >> "+e.getMessage());
            e.printStackTrace();
        }
        logger.info("서비스 클래스에서의 동작 성공 결과 구분 ==== > " + payroll_historyDTO.getResult());

        return result;

    }


    public String PayrollDelete(Payroll_HistoryDTO payroll_historyDTO) {
        String result = null;
        try {
            payrollDAO.Payroll_CUD(payroll_historyDTO);
            result = "Nice";
        } catch (Exception e) {
            result = "bad";
            logger.info(e.getStackTrace());
        }
        logger.info(payroll_historyDTO.getResult());
        return result;

    }

}
