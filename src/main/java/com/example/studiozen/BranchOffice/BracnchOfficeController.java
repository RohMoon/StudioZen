package com.example.studiozen.BranchOffice;


import com.example.studiozen.DTO.BranchOfficeDTO;
import com.example.studiozen.DTO.SpaceDTO;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;

@RestController
@RequestMapping("BracnchOffice")
public class BracnchOfficeController {

    private static Logger logger = LogManager.getLogger(BracnchOfficeController.class);

    private final BracnchOfficeLogic bracnchOfficeLogic;

    private final String imgPath = "images/branchoffice";

    //생성자 주입
    public BracnchOfficeController(BracnchOfficeLogic bracnchOfficeLogic) {
        this.bracnchOfficeLogic = bracnchOfficeLogic;
    }

    // 현재 시간을 기준으로 파일 이름 생성
    private String genSaveFileName(String extName) {
        String fileName = "";

        Calendar calendar = Calendar.getInstance();
        fileName += calendar.get(Calendar.YEAR);
        fileName += calendar.get(Calendar.MONTH);
        fileName += calendar.get(Calendar.DATE);
        fileName += calendar.get(Calendar.HOUR);
        fileName += calendar.get(Calendar.MINUTE);
        fileName += calendar.get(Calendar.SECOND);
        fileName += calendar.get(Calendar.MILLISECOND);
        fileName += extName;

        return fileName;
    }


    /******************************************지점 정보 검색 기능*****************************************************/
    /*********전체 지점 목록 조회********
     http://localhost:8080/BracnchOffice/select
     {
     "session_no" : "mem282108"
     }
     **********************/
    @PostMapping(value = "/select")
    public ModelAndView BracnchOfficeSelect(HttpServletRequest httpServletRequest, BranchOfficeDTO branchOfficeDTO) {

        //@ResponseBody을 설정하시면
        //반환되는 view객체에서 랜더링메소드을 타서 아웃풋을 내보내는게 아니라
        //메세지컨버터에서 response.out에 직접 처리됩니다
        //현재 상황은 jsonView객체을 메시지컨버터에 던진상태라서
        //jsonView객체 자체가 미디어타입에 의해서 설정된 json메시지컨버터의해
        //json으로 아웃풋이 나가는 상태입니다
        logger.info("< ==== BracnchOfficeSelect ==== > ");

        logger.info(" 주소로 들어온 session_no ==== > " + branchOfficeDTO.getSession_no());

        List<BranchOfficeDTO> branchOfficeSelectList = bracnchOfficeLogic.BracnchOfficeSelect(branchOfficeDTO);

        logger.info("branchOfficeSelectList =====>" + branchOfficeSelectList);
        logger.info("branchOfficeSelectList.get(0)) ====== >" + branchOfficeSelectList.toString());
//        logger.info("branchOfficeDTO =====> "+branchOfficeDTO);

        ModelAndView modelAndView = new ModelAndView();
        httpServletRequest.setAttribute("branchOfficeSelectList",branchOfficeSelectList);
//        modelAndView.addObject("branchOfficeSelectList",branchOfficeSelectList);

        //게시판 CUD 중 작성 성공 / 실패에 대한 결과값을 int result로 반환
        if (branchOfficeDTO.getResult() == 1) {
            logger.info("성공페이지 연결");
            modelAndView.setViewName("BranchOffice/BranchOfficeListBoard");
            return modelAndView;

        } else {
            modelAndView.setViewName("BranchOffice/BranchOfficeListBoard");
            return modelAndView;

        }

    }// End of SelectAll Method   // End of SelectAll Method  // End of SelectAll Method


/*
    */
/********* 지점 상세 조회********
     http://localhost:8080/BracnchOffice/select
     {
     "session_no" : "mem282108"
     }
     **********************//*

    @PostMapping(value = "/detail")
    public ModelAndView BracnchOfficeDetailSelect(HttpServletRequest httpServletRequest, BranchOfficeDTO branchOfficeDTO) {

        logger.info("< ==== BracnchOffice 'Detatil' Select ==== > ");

        List<SpaceDTO> spaceSelectList = bracnchOfficeLogic.BracnchOfficeDetailSelect(branchOfficeDTO);

        logger.info("spaceSelectList =====>" + spaceSelectList);
        logger.info("\n branchOfficeDetailSelectList.toString  ====== >" + spaceSelectList.toString());

        ModelAndView bracnchOfficeDetailSelectModelAndView = new ModelAndView();
        httpServletRequest.setAttribute("spaceSelectList",spaceSelectList);

        //게시판 CUD 중 작성 성공 / 실패에 대한 결과값을 int result로 반환
        if (space.getResult() == 1) {
            logger.info("성공페이지 연결");
            bracnchOfficeDetailSelectModelAndView.setViewName("BranchOffice/BranchOfficeListBoard");
            return bracnchOfficeDetailSelectModelAndView;

        } else {
            modelAndView.setViewName("BranchOffice/BranchOfficeListBoard");
            return modelAndView;

        }

    }// End of SelectDetail Method   // End of SelectDetail Method  // End of SelectDetail Method
*/


    /********************************************지점 정보 관리 기능*****************************************************/


    /*********새 지점 정보 입력********
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
    public String BracnchOfficeRegister(@RequestParam(name = "imgFile", required = false) MultipartFile[] multi, BranchOfficeDTO branchOfficeDTO) {
        logger.info(branchOfficeDTO.getTr_code());
        logger.info("branchOfficeDTO ====== > \n"+branchOfficeDTO);


        String result = bracnchOfficeLogic.BracnchOfficeRegister(branchOfficeDTO);

        if (multi != null) {
            for (int i=0; i< multi.length; i++) {
                try {
                    logger.info("=>=>=>=>=>=>=>=>=>Request has files ");
                    String uploadpath = imgPath;
                    String originFilename = multi[i].getOriginalFilename();
                    String extName = originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
                    long size = multi[i].getSize();
                    String saveFileName = genSaveFileName(extName);

                    logger.info("uploadpath : " + uploadpath);

                    logger.info("originFilename : " + originFilename);
                    logger.info("extensionName : " + extName);
                    logger.info("size : " + size);
                    logger.info("saveFileName : " + saveFileName);

                    branchOfficeDTO.setOriginal_file_name(originFilename);
                    branchOfficeDTO.setFile_size(size);
                    branchOfficeDTO.setStored_file_name(saveFileName);

                    String fileInsertResult = bracnchOfficeLogic.BracnchOfficeFileInsert(branchOfficeDTO);
                    logger.info(fileInsertResult);
                    if (!multi[i].isEmpty()) {
                        File file = new File(uploadpath, saveFileName);
                        multi[i].transferTo(file);
                    }
                } catch (IOException e) {
                    logger.info(e.getMessage());
                    e.printStackTrace();
                }
            }
        }






        logger.info("  CUD 동작 결과 구분   ====  > " + branchOfficeDTO.getResult());
        logger.info("  CUD 동작 결과 최종 구분 === > " + result);

        //게시판 CUD 중 작성 성공 / 실패에 대한 결과값을 int result로 반환
        if (branchOfficeDTO.getResult() == 1) {
            logger.info("성공페이지 연결");
            return "BracnchOffice/select";

        } else {

            return "fail";

        }

    }// End of WRITER Method   // End of WRITER Method  // End of WRITER Method


    /*********등록된 지점 정보 수정********
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
    public String BracnchOfficeUpdater(@RequestBody BranchOfficeDTO branchOfficeDTO) {

        String result = bracnchOfficeLogic.BracnchOfficeUpdater(branchOfficeDTO);

        logger.info(branchOfficeDTO.getResult());
        logger.info(result);

        //게시판 CUD 중 수정 성공 / 실패에 대한 결과값을 int result로 반환
        if (branchOfficeDTO.getResult() == 1) {
            logger.info("성공페이지 연결");
            return "index";

        } else {

            return "fail";

        }

    }// End of UPDATER Method
    // End of UPDATER Method  // End of UPDATER Method


    /*********등록된 지점 정보 삭제*******
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
    public String BracnchOfficeDelete(@RequestBody BranchOfficeDTO branchOfficeDTO) {

        String result = bracnchOfficeLogic.BracnchOfficeDelete(branchOfficeDTO);

        logger.info(branchOfficeDTO.getResult());
        logger.info(result);

        //게시판 CUD 중 수정 성공 / 실패에 대한 결과값을 int result로 반환
        if (branchOfficeDTO.getResult() == 1) {
            logger.info("성공페이지 연결");
            return "index";

        } else {

            return "fail";

        }

    }// End of DELETE Method   // End of DELETE Method  // End of DELETE Method

}
