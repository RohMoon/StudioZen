package com.example.studiozen.Reservation;


import com.example.studiozen.DTO.ReservationDTO;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RestController
@RequestMapping("reservation")
public class ReservationController {

    private static Logger logger = LogManager.getLogger(ReservationController.class);

    private final ReservationLogic reservationLogic;

    //생성자 주입
    public ReservationController(ReservationLogic reservationLogic) {
        this.reservationLogic = reservationLogic;
    }

    /************대여 예약 조회 기능**************/

    /*********대여 예약현황 전체 조회********
     http://localhost:8080/qna/write
     {
     "tr_code" :"INSERT",
     "qna_NO" : "8",
     "qna_Writer" :"123",
     "qna_Title" : "Test",
     "qna_Content" :  "Method Post TEST Content"
     }
     **********************/
    @RequestMapping(value = "/selectAll")
    public ModelAndView ReservationSelect(HttpServletRequest request) {

        ReservationDTO reservationDTO = new ReservationDTO();

        List<ReservationDTO> reservationSelectList =

                reservationLogic.ReservationSelect(reservationDTO);

        request.setAttribute("reservationSelectList",reservationSelectList);

        logger.info("\n" +
                reservationDTO + "\n"
                +reservationSelectList
        );

        ModelAndView mv = new ModelAndView();
        mv.setViewName("/Management/ManagementDash");

        if (reservationSelectList.size() == 0){
            logger.info("nonono");
            return mv;
        }
        else {
            return mv;
        }

    }// End of Select Method   // End of Select Method  // End of Select Method

    /*********대여 예약현황 상세 조회********
     http://localhost:8080/qna/write
     {
     "tr_code" :"INSERT",
     "qna_NO" : "8",
     "qna_Writer" :"123",
     "qna_Title" : "Test",
     "qna_Content" :  "Method Post TEST Content"
     }
     **********************/
    @RequestMapping(value = "/selectDetatil/{reserv_no}")
    public ModelAndView ReservationDetail(HttpServletRequest request,  @PathVariable String reserv_no) {



        ReservationDTO reservationDTO = new ReservationDTO();
        reservationDTO.setReserv_no(reserv_no);
        List<ReservationDTO> reservationDetailList =

                reservationLogic.ReservationDetail(reservationDTO);

        request.setAttribute("reservationDetailList",reservationDetailList);

        logger.info("\n" +
                reservationDetailList
        );

        ModelAndView mv = new ModelAndView();
        mv.setViewName("/Management/ReservationDetailModal");

        if (reservationDetailList.size() == 0){
            logger.info("nonono");
            return mv;
        }
        else {
            return mv;
        }

    }// End of Select Method   // End of Select Method  // End of Select Method



    /********************************************공간 대여 기능*****************************************************/
    

    /*********공간 대여 신청********
     http://localhost:8080/qna/write
     {
     "tr_code" :"INSERT",
     "qna_NO" : "8",
     "qna_Writer" :"123",
     "qna_Title" : "Test",
     "qna_Content" :  "Method Post TEST Content"
     }
     **********************/
    @PostMapping(value = "/book")
    public String ReservationBook(@RequestBody ReservationDTO reservationDTO) {

        logger.info(reservationDTO);
        String result = reservationLogic.ReservationBook(reservationDTO);

        logger.info("  CUD 동작 결과 구분   ====  > " + reservationDTO.getResult());
        logger.info("  CUD 동작 결과 최종 구분 === > " + result);

        //게시판 CUD 중 작성 성공 / 실패에 대한 결과값을 int result로 반환
        if (reservationDTO.getResult() == 1) {
            logger.info("성공페이지 연결");
            return "index";

        } else {

            return "fail";

        }

    }// End of WRITER Method   // End of WRITER Method  // End of WRITER Method


    /*********공간 대여 신청 수정********
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
    public String QNABoardUpdater(@RequestBody ReservationDTO reservationDTO) {

        String result = reservationLogic.BookUpdater(reservationDTO);

        logger.info(reservationDTO.getResult());
        logger.info(result);

        //게시판 CUD 중 수정 성공 / 실패에 대한 결과값을 int result로 반환
        if (reservationDTO.getResult() == 1) {
            logger.info("성공페이지 연결");
            return "index";

        } else {

            return "fail";

        }

    }// End of UPDATER Method
    // End of UPDATER Method  // End of UPDATER Method


    /*********공간 대여 신청 삭제*******
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
    //@RequestMapping(value = "/delete", method = RequestMethod.PUT)
    public String BookDelete(@RequestBody ReservationDTO reservationDTO) {

        logger.info("\n"+reservationDTO);

        String result = reservationLogic.BookDelete(reservationDTO);

        logger.info(reservationDTO.getResult());
        logger.info(result);

        //게시판 CUD 중 수정 성공 / 실패에 대한 결과값을 int result로 반환
        if (reservationDTO.getResult() == 1) {
            logger.info("성공페이지 연결");
            return "forward:/Management/dash.do";

        } else {

            return "fail";

        }

    }// End of DELETE Method   // End of DELETE Method  // End of DELETE Method

}
