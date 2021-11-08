package com.example.studiozen.BranchOffice;


import com.example.studiozen.DTO.BranchOfficeDTO;
import com.example.studiozen.DTO.SpaceDTO;
import com.google.gson.Gson;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.Base64;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("BracnchOffice")
public class BracnchOfficeController {

    private static Logger logger = LogManager.getLogger(BracnchOfficeController.class);

    private final BracnchOfficeLogic bracnchOfficeLogic;

    private final String branchOfficeImgPath = "C:\\dev\\file\\images\\branchoffice\\";

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

    //여기서 받아서 파람으로 받아서 !
    public byte[] fileDown(String storedName) throws IOException {

        File file = new File(branchOfficeImgPath + storedName);
        logger.info("\nroot ==>" + branchOfficeImgPath + storedName);
        FileInputStream fis = null;
        byte[] fileArray = null;
        ByteArrayOutputStream byteArrayOutputStream = new  ByteArrayOutputStream();
        int len=0;
        try {

            if (file.exists() && file.isFile()) {//여기서 if문을 안타니까 바로 터진거

                byte[] buf = new byte[1024];
                fis = new FileInputStream(file); // 아 얘네
                while ((len=fis.read(buf))!=-1){
                    byteArrayOutputStream.write(buf,0,len);
                }
                logger.info("FileDownLoad Loading");
                fileArray = byteArrayOutputStream.toByteArray();

            } else {
                logger.info("Has not File");
            }
        } catch (Exception e) {
            logger.info(e.getMessage());
        } finally {
            if (fis != null) {
                fis.close();
            }
        }
        return fileArray;
    }
    public static byte[] encodingBase64(byte[] targetBytes){
        Base64.Encoder encoder = Base64.getEncoder();
        return encoder.encode(targetBytes);
    }

    /******************************************지점 정보 검색 기능*****************************************************/
    /*********전체 지점 목록 조회********
     http://localhost:8080/BracnchOffice/select
     {
     "session_no" : "mem282108"
     }
     **********************/


    @RequestMapping(value =  "/selectPage")
    public ModelAndView BracnchOfficeSelectPage(HttpServletRequest httpServletRequest,
                                        BranchOfficeDTO branchOfficeDTO) {
        //게시판 CUD 중 작성 성공 / 실패에 대한 결과값을 int result로 반환
        ModelAndView mav = new ModelAndView();
        if (branchOfficeDTO.getResult() == 1) {
            logger.info("성공페이지 연결");

            mav.setViewName("BranchOffice/BranchOfficeListBoard");
//            logger.info("modelAndView====>" + gson.toJson(modelAndView));
            return mav;

        } else {
            mav.setViewName("BranchOffice/BranchOfficeListBoard");
//            logger.info("modelAndView====>" + gson.toJson(modelAndView));
            return mav;
        }
    }


    @RequestMapping(value = "/select")
    public String BracnchOfficeSelect(BranchOfficeDTO branchOfficeDTO) {
        //@ResponseBody을 설정하시면
        //반환되는 view객체에서 랜더링메소드을 타서 아웃풋을 내보내는게 아니라
        //메세지컨버터에서 response.out에 직접 처리됩니다
        //현재 상황은 jsonView객체을 메시지컨버터에 던진상태라서
        //jsonView객체 자체가 미디어타입에 의해서 설정된 json메시지컨버터의해
        //json으로 아웃풋이 나가는 상태입니다.

        logger.info("< ==== BracnchOfficeSelect ==== > ");

        logger.info(" 주소로 들어온 session_no ==== > " + branchOfficeDTO.getSession_no());

        Gson gson = new Gson();

        Map<String, List<BranchOfficeDTO>> bracnchOfficeSelectMap  =
                bracnchOfficeLogic.BracnchOfficeSelect(branchOfficeDTO);

        logger.info("branchOfficeSelectList =====>\n" + bracnchOfficeSelectMap.get("branchOfficeSelectList"));

//        ModelAndView modelAndView = new ModelAndView();
//        httpServletRequest.setAttribute("branchOfficeSelectList", bracnchOfficeSelectMap.get("branchOfficeSelectList"));
//        httpServletRequest.setAttribute("branchOfficeImgSelectList", bracnchOfficeSelectMap.get("branchOfficeImgSelectList"));
//        modelAndView.addObject("branchOfficeSelectList",branchOfficeSelectList);

        logger.info("branchOfficeSelectList JSON =====>\n" + gson.toJson(bracnchOfficeSelectMap));

        //게시판 CUD 중 작성 성공 / 실패에 대한 결과값을 int result로 반환
        if (branchOfficeDTO.getResult() == 1) {
            logger.info("성공페이지 연결");

//            modelAndView.setViewName("BranchOffice/BranchOfficeListBoard");
//            logger.info("modelAndView====>" + gson.toJson(modelAndView));
            return gson.toJson(bracnchOfficeSelectMap);

        } else {
//            modelAndView.setViewName("BranchOffice/BranchOfficeListBoard");
//            logger.info("modelAndView====>" + gson.toJson(modelAndView));
            return gson.toJson(bracnchOfficeSelectMap);

        }

    }// End of SelectAll Method   // End of SelectAll Method  // End of SelectAll Method




/********* 지점 상세 조회********
 http://localhost:8080/BracnchOffice/select
 {
 "session_no" : "mem282108"
 }
 **********************/

    @PostMapping(value = "/detail")
    public ModelAndView BracnchOfficeDetailSelect(HttpServletRequest httpServletRequest, @RequestBody SpaceDTO spaceDTO) {

        logger.info("< ==== BracnchOffice 'Detatil' Select ==== > ");
        logger.info("Space DTO=============>"+spaceDTO.getBranchoffice_no());
        logger.info("Space DTO=============>\n"+spaceDTO);

        List<SpaceDTO> spaceSelectList = bracnchOfficeLogic.BracnchOfficeDetailSelect(spaceDTO);

        logger.info("spaceSelectList =====>" + spaceSelectList);
        logger.info("\n branchOfficeDetailSelectList.toString  ====== >" + spaceSelectList.toString());

        ModelAndView bracnchOfficeDetailSelectModelAndView = new ModelAndView();
        httpServletRequest.setAttribute("spaceSelectList",spaceSelectList);


        //게시판 CUD 중 작성 성공 / 실패에 대한 결과값을 int result로 반환
        if (spaceSelectList.size()!=0) {
            logger.info("성공페이지 연결");
            bracnchOfficeDetailSelectModelAndView.setViewName("BranchOffice/BranchOfficeBoardDetailModal");
            return bracnchOfficeDetailSelectModelAndView;

        } else {
            bracnchOfficeDetailSelectModelAndView.setViewName("BranchOffice/BranchOfficeBoardDetailModal");
            return bracnchOfficeDetailSelectModelAndView;

        }

    }// End of SelectDetail Method   // End of SelectDetail Method  // End of SelectDetail Method


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
        logger.info("branchOfficeDTO ====== > \n" + branchOfficeDTO);


        String result = bracnchOfficeLogic.BracnchOfficeRegister(multi,branchOfficeDTO);

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
    @PostMapping(value = "/update")
    //@RequestMapping(value = "/write", method = RequestMethod.PUT)
    public String BracnchOfficeUpdater(@RequestBody BranchOfficeDTO branchOfficeDTO) {

        logger.info("============> "+branchOfficeDTO);
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
    public ModelAndView BracnchOfficeDelete(@RequestBody BranchOfficeDTO branchOfficeDTO) {

        String result = bracnchOfficeLogic.BracnchOfficeDelete(branchOfficeDTO);

        logger.info(branchOfficeDTO.getResult());
        logger.info(result);

        ModelAndView mav = new ModelAndView();

        //게시판 CUD 중 수정 성공 / 실패에 대한 결과값을 int result로 반환
        if (branchOfficeDTO.getResult() == 1) {
            logger.info("성공페이지 연결");
            mav.setViewName("BranchOffice/BranchOfficeListBoard");
            return mav;

        } else {
            mav.setViewName("BranchOffice/BranchOfficeListBoard");
            return mav;

        }

    }// End of DELETE Method   // End of DELETE Method  // End of DELETE Method

}
