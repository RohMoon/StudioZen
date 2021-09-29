package com.example.studiozen.Client;

import com.example.studiozen.DTO.ReservationDTO;
import com.example.studiozen.Member.MemberController;
import com.example.studiozen.Reservation.ReservationLogic;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping(value = "Client")
public class ClientController {

    private final ReservationLogic reservationLogic;
    private static Logger logger = LogManager.getLogger(ClientController.class);

    public ClientController(ReservationLogic reservationLogic) {
        this.reservationLogic = reservationLogic;
    }


    @RequestMapping(value = "/ClientMenu.do")
    public ModelAndView SetManagementView(HttpServletRequest req) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("Client/ClientMenu");

        return mv;
    }

    /* 클라이언트 페이지 대쉬보드 */
    @RequestMapping(value = "/dash.do/{sessionNo}")
    public ModelAndView ClientDashBoard(HttpServletRequest request, @PathVariable String sessionNo) {
        ModelAndView mv = new ModelAndView();
        ReservationDTO reservationDTO = new ReservationDTO();
        reservationDTO.setReserv_hostcode(sessionNo);
        List<ReservationDTO> reservationSelectList =
                reservationLogic.ReservationSelect(reservationDTO);
        logger.info(reservationSelectList);
        request.setAttribute("reservationSelectList", reservationSelectList);
        mv.setViewName("Client/ClientDash");
        return mv;
    }

    /* 클라이언트 페이지 문의하기 */
    @RequestMapping(value = "/qnaWrite.do")
    public ModelAndView ManagementQnaBoard(HttpServletRequest request, ReservationDTO reservationDTO) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("Client/qnaBoardWriteModal");

        return mv;
    }


}
