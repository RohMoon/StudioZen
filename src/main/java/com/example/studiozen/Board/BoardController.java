package com.example.studiozen.Board;


import com.example.studiozen.DTO.QNABoardDTO;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.core.io.Resource;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.List;

@RestController
@RequestMapping("qna")
public class BoardController extends HttpServlet {

    private static Logger logger = LogManager.getLogger(BoardController.class);
    private final String path = "C:\\dev\\file\\";
    private final BoardLogic boardLogic;

    //생성자 주입
    public BoardController(BoardLogic boardLogic) {
        this.boardLogic = boardLogic;
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


    /********************************************게시글 본문 기능*****************************************************/

    /*********게시글 검색********
     http://localhost:8080/qna/select/123
     **********************/
    @GetMapping(value = "/select/{session_no}")
    //@RequestMapping(value = "/write", method = RequestMethod.PUT)
    public ModelAndView QNABoardSelect(HttpServletRequest request, @PathVariable String session_no) {

        QNABoardDTO qnaBoardDTO = new QNABoardDTO();

        logger.info("sessionNO === > " + session_no);

        qnaBoardDTO.setQna_writer(session_no);

        List<QNABoardDTO> qnaBoardDTOList = boardLogic.QNABoardSelect(qnaBoardDTO);

        request.setAttribute("qnaBoardList", qnaBoardDTOList);
        ModelAndView mav = new ModelAndView();

        logger.info("\n" +
                qnaBoardDTOList + "\n"
        );

        if (qnaBoardDTOList.size() == 0) {
            mav.setViewName("Client/QnaListBoard");
            return mav;
        } else {
            if (session_no.equals("MEM282108")) {
                mav.setViewName("Management/QnaListBoard");
                return mav;
            }
            mav.setViewName("Client/QnaListBoard");
            return mav;

        }
    }// End of Select Method   // End of Select Method  // End of Select Method


    /*********게시글 자세히 보가********
     http://localhost:8080/qna/select/123
     **********************/
    @GetMapping(value = "/select/{session_no}/{qna_no}")
    //@RequestMapping(value = "/write", method = RequestMethod.PUT)
    public ModelAndView QNABoardDetail(HttpServletRequest request, @PathVariable String qna_no, @PathVariable String session_no) {

        List<QNABoardDTO> qnaBoardDTOList = null;

        QNABoardDTO qnaBoardDTO = new QNABoardDTO();

        ModelAndView mav = new ModelAndView();

        logger.info("Detail 실행");
        logger.info("qna_no === > " + qna_no);

        qnaBoardDTO.setQna_no(qna_no);

        qnaBoardDTOList = boardLogic.QNABoardDetail(qnaBoardDTO);
        request.setAttribute("detailList", qnaBoardDTOList);

        mav.setViewName("Management/QnaDetailModal");

        logger.info("\n" +
                qnaBoardDTOList + "\n"
        );

        if (qnaBoardDTOList.size() == 0) {
            return mav;
        } else {
            return mav;
        }

    }// End of Select Method   // End of Select Method  // End of Select Method


    /*********게시글 입력********
     http://localhost:8080/qna/write
     {
     "tr_code" :"INSERT",
     "qna_NO" : "8",
     "qna_Writer" :"123",
     "qna_Title" : "Test",
     "qna_Content" :  "Method Post TEST Content"
     }
     **********************/
    @PostMapping(value = "/write")
    //@RequestMapping(value = "/write", method = RequestMethod.PUT)
    public String QNABoardWriter(@RequestParam(name = "file", required = false) MultipartFile multi, QNABoardDTO qnaBoardDTO) throws SQLException {
        String url = null;

        if (multi != null) {
            try {
                String uploadpath = path;
                String originFilename = multi.getOriginalFilename();
                String extName = originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
                long size = multi.getSize();
                String saveFileName = genSaveFileName(extName);

                logger.info("uploadpath : " + uploadpath);

                logger.info("originFilename : " + originFilename);
                logger.info("extensionName : " + extName);
                logger.info("size : " + size);
                logger.info("saveFileName : " + saveFileName);

                qnaBoardDTO.setOriginal_file_name(originFilename);
                qnaBoardDTO.setFile_size(size);
                qnaBoardDTO.setStored_file_name(saveFileName);

                if (!multi.isEmpty()) {
//                    File file = new File(uploadpath, multi.getOriginalFilename());
                    File file = new File(uploadpath, saveFileName);
                    multi.transferTo(file);
//                    return "filelist";
                }
            } catch (IOException e) {
                logger.info(e.getMessage());
                e.printStackTrace();
            }
        }

        logger.info("qnaBoardDTO.getTr_code()===>" + qnaBoardDTO.getTr_code());
        logger.info("qnaBoardDTO.getQna_content()===>" + qnaBoardDTO.getQna_content());
        logger.info("qnaBoardDTO.getQna_no()===>" + qnaBoardDTO.getQna_no());
        logger.info("qnaBoardDTO.getQna_writer()===>" + qnaBoardDTO.getQna_writer());
        logger.info("qnaBoardDTO.getQna_title()===>" + qnaBoardDTO.getQna_title());
        logger.info("qnaBoardDTO.getResult()===>" + qnaBoardDTO.getResult());
        String result = boardLogic.QNABoardWriter(qnaBoardDTO);
        logger.info("result===>" + result);
        logger.info("qnaBoardDTO.getResult() ====>" + qnaBoardDTO.getResult());
        logger.info("getResultmessage === >" + qnaBoardDTO.getResultmessage());
        //게시판 CUD 중 작성 성공 / 실패에 대한 결과값을 int result로 반환
        if (qnaBoardDTO.getResult() == 1) {
            logger.info("성공페이지 연결");
            return "index";

        } else {
            logger.info("실패페이지 연결");
            return "fail";

        }

    }// End of WRITER Method   // End of WRITER Method  // End of WRITER Method


    /*********게시글에 업로드된 파일 다운로드********
     http://localhost:8080/qna/download
     *********************
     * @return*/
    @PostMapping (value = "/download")
    public void QNABoardDownload(HttpServletResponse response,
                                                     HttpServletRequest request,
                                                     QNABoardDTO qnaBoardDTO) throws IOException {

        logger.info("======>>  ======>>> QNABoardDownload");
        logger.info(qnaBoardDTO);
        //DTO에 DB에 있는 오리지날이름과 파일이름 등 체크를 하고 가져옴
        QNABoardDTO res_qnaBoardDTO = boardLogic.QNABoardDownloadFileChecking(qnaBoardDTO);
        //파일다운 시작함.
        try {
            //요기서 DB에서 받아온 경로 파일이름 다잡아줘서 파람으로 넣어주고
            fileDown(request, response, res_qnaBoardDTO.getStored_file_name(), res_qnaBoardDTO.getOriginal_file_name(), res_qnaBoardDTO.getFile_size());
        } catch (Exception e) {
            logger.info("e.getMessage() ==========================>" + e.getMessage());
            logger.error("e.toString() ==========================>" + e.toString());
        }

        logger.info("qnaBoardDTO.getResult() ====> " + qnaBoardDTO.getResult());
        logger.info("qnaBoardDTO.getResultmessage() === >" + qnaBoardDTO.getResultmessage());

    }

    //여기서 받아서 파람으로 받아서 !
    public void fileDown(HttpServletRequest request, HttpServletResponse response,
                             String storedName, String realFilNm, Long fileSize) throws IOException {

         File file = new File(path + storedName);
        logger.info("\nroot ==>" + path + storedName);
        FileInputStream fis = null;
        OutputStream out = null;
        try {

            if (file.exists() && file.isFile()) {//여기서 if문을 안타니까 바로 터진거
                // 요부분 리스폰스에 컨텐트타입 application stream
//                response.setContentType("application/octet-stream; charset=utf-8");
                response.setContentType("application/octet-stream");
//                response.setContentType("image/png");
//            response.setContentLength(fileSize.intValue());
                response.setContentLength((int) file.length());

                String browser = getBrowser(request);
                String disposition = getDisposition(realFilNm, browser);

                response.setHeader("Content-Disposition", disposition);
                response.setHeader("Content-Transfer-Encoding", "binary");


                fis = new FileInputStream(file); // 아 얘네
                out = response.getOutputStream();

                FileCopyUtils.copy(fis, out);
                // 얘가 이제 보내줘야하는데 여기서 뭐 다운이나 그런게 일어나질않음..
                // 일단 파일자체는 리드 라이트임. 읽고 쓰는거임 그 내부과정에선 데이터 변환일어나는거구
                //바이너리로 들어오는게 아니라 String으로 들어옴 js 자체에서 타입 검사 했을때 타입이 스트링으로 확인됨.
                logger.info("FileDownLoad Loading");
                if (fis != null) {
                    fis.close();
                    out.flush();
                    out.close();
                }

            } else {
                logger.info("Has not File");
            }
        } catch (Exception e) {
            logger.info(e.getMessage());
        }finally {
            if (fis != null) {
                fis.close();
                out.flush();
                out.close();
            }
        }

    }


    private String getBrowser(HttpServletRequest request) {
        String header = request.getHeader("User-Agent");
        if (header.indexOf("MSIE") > -1 || header.indexOf("Trident") > -1)
            return "MSIE";
        else if (header.indexOf("Chrome") > -1)
            return "Chrome";
        else if (header.indexOf("Opera") > -1)
            return "Opera";
        return "Firefox";
    }

    private String getDisposition(String filename, String browser) throws UnsupportedEncodingException {
        String dispositionPrefix = "attachment;filename=";
        String encodedFilename = null;
        if (browser.equals("MSIE")) {
            encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll(
                    "\\+", "%20"
            );
        } else if (browser.equals("Firefox")) {
            encodedFilename = "\""
                    + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
        } else if (browser.equals("Opera")) {
            encodedFilename = "\""
                    + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
        } else if (browser.equals("Chrome")) {
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < filename.length(); i++) {
                char c = filename.charAt(i);
                if (c > '~') {
                    sb.append(URLEncoder.encode("" + c, "UTF-8"));
                } else {
                    sb.append(c);
                }
            }
            encodedFilename = sb.toString();

        }
        return dispositionPrefix + encodedFilename;
    }

    /*********게시글 수정********
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
    public String QNABoardUpdater(@RequestBody QNABoardDTO qnaBoardDTO) {

        logger.info(qnaBoardDTO.getQna_content());
        String result = boardLogic.QNABoardUpdater(qnaBoardDTO);

        logger.info(qnaBoardDTO.getResult());
        logger.info(result);
        logger.info(qnaBoardDTO.getResultmessage());

        //게시판 CUD 중 수정 성공 / 실패에 대한 결과값을 int result로 반환
        if (qnaBoardDTO.getResult() == 1) {
            logger.info("성공페이지 연결");
            return "index";

        } else {

            return "fail";

        }

    }// End of UPDATER Method
    // End of UPDATER Method  // End of UPDATER Method


    /*********게시글 삭제*******
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
    //@RequestMapping(value = "/write", method = RequestMethod.PUT)
    public String QNABoardDelete(@RequestBody QNABoardDTO qnaBoardDTO) {

        String result = boardLogic.QNABoardDelete(qnaBoardDTO);

        logger.info(qnaBoardDTO.getResult());
        logger.info(result);

        //게시판 CUD 중 수정 성공 / 실패에 대한 결과값을 int result로 반환
        if (qnaBoardDTO.getResult() == 1) {
            logger.info("성공페이지 연결");
            return "index";

        } else {

            return "fail";

        }

    }// End of DELETE Method   // End of DELETE Method  // End of DELETE Method

    /********************************************댓글 기능*****************************************************/

    /*********댓글 입력********
     http://localhost:8080/qna/select/123/3/rewrite
     {
     "tr_code" :"INSERT",
     "qna_no" : "3",
     "qna_recomment_no" : "3",
     "qna_recomment_writer" :"123",
     "qna_recomment_content" :  "Method POST TEST Content"
     }
     **********************/
    @PostMapping(value = "/select/{sessionNO}/{qna_no}/rewrite")
    //@RequestMapping(value = "/write", method = RequestMethod.PUT)
    public String QNARecoWriter(@RequestBody QNABoardDTO qnaBoardDTO) {

        logger.info(qnaBoardDTO.getQna_content());
        String result = boardLogic.QNARecoWriter(qnaBoardDTO);

        logger.info(qnaBoardDTO.getResult());
        logger.info(result);

        //게시판 CUD 중 작성 성공 / 실패에 대한 결과값을 int result로 반환
        if (qnaBoardDTO.getResult() == 1) {
            logger.info("성공페이지 연결");
            return "index";

        } else {

            return "fail";

        }

    }// End of WRITER Method   // End of WRITER Method  // End of WRITER Method

    /*********댓글 수정********
     http://localhost:8080/qna/select/123/3/update
     {
     "tr_code" :"INSERT",
     "qna_no" : "3",
     "qna_recomment_no" : "3",
     "qna_recomment_writer" :"123",
     "qna_recomment_content" :  "Method POST TEST Content"
     }
     **********************/
    @PostMapping(value = "/select/{sessionNO}/{qna_no}/reupdate")
    //@RequestMapping(value = "/write", method = RequestMethod.PUT)
    public String QNARecoUpdater(@RequestBody QNABoardDTO qnaBoardDTO) {

        logger.info(qnaBoardDTO.getQna_content());
        String result = boardLogic.QNARecoUpdater(qnaBoardDTO);

        logger.info(qnaBoardDTO.getResult());
        logger.info(result);

        //게시판 CUD 중 수정 성공 / 실패에 대한 결과값을 int result로 반환
        if (qnaBoardDTO.getResult() == 1) {
            logger.info("성공페이지 연결");
            return "index";

        } else {

            return "fail";

        }

    }// End of UPDATER Method
    // End of UPDATER Method  // End of UPDATER Method


    /*********댓글 삭제*******
     http://localhost:8080/qna/delete
     {
     "tr_code" :"delete",
     "qna_NO" : "3",
     "qna_Writer" :"123",
     "qna_Title" : "Test",
     "qna_Content" :  "Method POST TEST Content"
     }
     **********************/
    @PostMapping(value = "/select/{sessionNO}/{qna_no}/redelete")
    //@RequestMapping(value = "/write", method = RequestMethod.PUT)
    public String QNARecoDelete(@RequestBody QNABoardDTO qnaBoardDTO) {

        String result = boardLogic.QNARecoDelete(qnaBoardDTO);

        logger.info(qnaBoardDTO.getResult());
        logger.info(result);

        //게시판 CUD 중 수정 성공 / 실패에 대한 결과값을 int result로 반환
        if (qnaBoardDTO.getResult() == 1) {
            logger.info("성공페이지 연결");
            return "index";

        } else {

            return "fail";

        }

    }// End of DELETE Method   // End of DELETE Method  // End of DELETE Method



}
