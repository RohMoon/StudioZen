package com.example.studiozen.Reservation;


import com.example.studiozen.DTO.ReservationDTO;
import com.google.gson.Gson;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
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
    @PostMapping(value = "/selectAll")
    public ModelAndView ReservationSelect(HttpServletRequest request, @RequestBody(required = true) ReservationDTO reservationDTO) {

        logger.info("\n============>@"+reservationDTO);
//        ReservationDTO reservationDTO = new ReservationDTO();

        List<ReservationDTO> reservationSelectList =

                reservationLogic.ReservationSelect(reservationDTO);

        request.setAttribute("reservationSelectList",reservationSelectList);

//        logger.info("\n" +
//                reservationDTO + "\n"
//                +reservationSelectList+
//                reservationSelectList.get(0)
//        );

        for (int i = 0; i < reservationSelectList.size(); i++) {
            logger.info(reservationSelectList.get(i).getSpace_basicprice());
        }

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

    /*********대상공간의 예약된 시간 조회********/
    @PostMapping(value = "/bookedTimeCheck")
    public String Reservation_BookedTimeSelect(HttpServletRequest request,@RequestBody ReservationDTO reservationDTO ) {

        logger.info(" ========== > bookedTimeCheck <=========");
        logger.info(reservationDTO);
        List<ReservationDTO> reservation_BookedTimeSelectList =

                reservationLogic.Reservation_BookedTimeSelect(reservationDTO);

        request.setAttribute("reservation_BookedTimeSelectList",reservation_BookedTimeSelectList);

        Gson gson = new Gson();
        logger.info(gson.toJson(reservation_BookedTimeSelectList));

        if (reservation_BookedTimeSelectList.size() == 0){
            logger.info("nonono");
            return gson.toJson(reservation_BookedTimeSelectList);
        }
        else {
            return gson.toJson(reservation_BookedTimeSelectList);
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

    @GetMapping("/test")
    @ResponseBody
    public ResponseEntity<Void> goSmash() {
        RestTemplate restTemplate = new RestTemplate();
        for (int i = 0; i < 100; i++) {
            Thread thread = new Thread(() -> {
                logger.info("발사!");
                String result = restTemplate
                        .getForObject("http://172.30.1.43:8080/reservation/hello", String.class);
                logger.info(result);
            });
            thread.start();
        }

        return ResponseEntity.ok().build();
    }

    @RequestMapping("/hello")
    public ResponseEntity<Void> hello() throws InterruptedException {
        logger.warn("start");
        Thread.sleep(3000);
        logger.warn("end");
        return ResponseEntity.ok().build();
    }
    /* 자동 완성기능 로직*/
    @PostMapping(value = "/autofilled")
    public ModelAndView AutoFilled(HttpServletRequest request, @RequestBody(required = true) ReservationDTO reservationDTO) {

        List<ReservationDTO> reservationSelectList =

                reservationLogic.ReservationSelect(reservationDTO);

        request.setAttribute("reservationSelectList", reservationSelectList);

        ModelAndView mv = new ModelAndView();
        mv.setViewName("/Management/ManagementDash");

        if (reservationSelectList.size() == 0) {
            logger.info("nonono");
            return mv;
        } else {
            return mv;
        }
    }
}
