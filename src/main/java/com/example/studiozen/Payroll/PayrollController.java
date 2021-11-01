package com.example.studiozen.Payroll;



import com.example.studiozen.DTO.Payroll_HistoryDTO;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("payroll")
public class PayrollController {

    private static Logger logger = LogManager.getLogger(PayrollController.class);

    private final PayrollLogic payrollLogic;

    //생성자 주입
    public PayrollController(PayrollLogic payrollLogic) {
        this.payrollLogic = payrollLogic;
    }

    /********************************************결제 정보 관리 기능*****************************************************/
    

    /*********새 결제 정보 입력********
     http://localhost:8080/qna/write
     {
     "tr_code" :"INSERT",
     "qna_NO" : "8",
     "qna_Writer" :"123",
     "qna_Title" : "Test",
     "qna_Content" :  "Method Post TEST Content"
     }
     **********************/
    @PostMapping(value = "/register")
    public String PayrollRegister(@RequestBody Payroll_HistoryDTO payroll_historyDTO) {

        logger.info(payroll_historyDTO);
        String result = payrollLogic.PayrollRegister(payroll_historyDTO);

        logger.info("  CUD 동작 결과 구분   ====  > " + payroll_historyDTO.getResult());
        logger.info("  CUD 동작 결과 최종 구분 === > " + result);

        //게시판 CUD 중 작성 성공 / 실패에 대한 결과값을 int result로 반환
        if (payroll_historyDTO.getResult() == 1) {
            logger.info("성공페이지 연결");
            return "index";

        } else {

            return "fail";

        }

    }// End of WRITER Method   // End of WRITER Method  // End of WRITER Method



    /*********등록된 결제 정보 삭제*******
     http://localhost:8080/qna/delete
     {
     "tr_code" :"update",
     "qna_NO" : "3",
     "qna_Writer" :"123",
     "qna_Title" : "Test",
     "qna_Content" :  "Method PUT TEST Content"
     }
     **********************/
    @PostMapping(value = "/delete")
    public String PayrollDelete(@RequestBody Payroll_HistoryDTO payroll_historyDTO) {

        String result = payrollLogic.PayrollDelete(payroll_historyDTO);

        logger.info(payroll_historyDTO.getResult());
        logger.info(result);

        //게시판 CUD 중 수정 성공 / 실패에 대한 결과값을 int result로 반환
        if (payroll_historyDTO.getResult() == 1) {
            logger.info("성공페이지 연결");
            return "index";

        } else {

            return "fail";

        }

    }// End of DELETE Method   // End of DELETE Method  // End of DELETE Method

}
