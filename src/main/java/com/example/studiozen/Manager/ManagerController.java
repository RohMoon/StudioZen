package com.example.studiozen.Manager;



import com.example.studiozen.DTO.ManagerDTO;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("manager")
public class ManagerController {

    private static Logger logger = LogManager.getLogger(ManagerController.class);

    private final ManagerLogic managerLogic;

    //생성자 주입
    public ManagerController(ManagerLogic managerLogic) {
        this.managerLogic = managerLogic;
    }

    /********************************************매니저 정보 관리 기능*****************************************************/
    

    /*********새 매니저 정보 입력********
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
    public String BracnchOfficeRegister(@RequestBody ManagerDTO managerDTO) {

        logger.info(managerDTO.getBranchoffice_no());
        String result = managerLogic.ManagerRegister(managerDTO);

        logger.info("  CUD 동작 결과 구분   ====  > " + managerDTO.getResult());
        logger.info("  CUD 동작 결과 최종 구분 === > " + result);

        //게시판 CUD 중 작성 성공 / 실패에 대한 결과값을 int result로 반환
        if (managerDTO.getResult() == 1) {
            logger.info("성공페이지 연결");
            return "index";

        } else {

            return "fail";

        }

    }// End of WRITER Method   // End of WRITER Method  // End of WRITER Method


    /*********등록된 매니저 정보 수정********
     http://localhost:8080/qna/update
     {
     "tr_code" :"update",
     "qna_NO" : "8",
     "qna_Writer" :"123",
     "qna_Title" : "Test",
     "qna_Content" :  "Method PUT TEST Content"
     }
     **********************/
    @PutMapping(value = "/update")
    //@RequestMapping(value = "/write", method = RequestMethod.PUT)
    public String ManagerUpdater(@RequestBody ManagerDTO managerDTO) {

        String result = managerLogic.ManagerUpdater(managerDTO);

        logger.info(managerDTO.getResult());
        logger.info(result);

        //게시판 CUD 중 수정 성공 / 실패에 대한 결과값을 int result로 반환
        if (managerDTO.getResult() == 1) {
            logger.info("성공페이지 연결");
            return "index";

        } else {

            return "fail";

        }

    }// End of UPDATER Method
    // End of UPDATER Method  // End of UPDATER Method


    /*********등록된 매니저 정보 삭제*******
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
    public String ManagerDTODelete(@RequestBody ManagerDTO managerDTO) {

        String result = managerLogic.ManagerDelete(managerDTO);

        logger.info(managerDTO.getResult());
        logger.info(result);

        //게시판 CUD 중 수정 성공 / 실패에 대한 결과값을 int result로 반환
        if (managerDTO.getResult() == 1) {
            logger.info("성공페이지 연결");
            return "index";

        } else {

            return "fail";

        }

    }// End of DELETE Method   // End of DELETE Method  // End of DELETE Method

}
