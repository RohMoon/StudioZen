package com.example.studiozen.Management;

import com.example.studiozen.BranchOffice.BracnchOfficeDAO;
import com.example.studiozen.Client.ClientController;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import com.example.studiozen.Reservation.ReservationLogic;
import com.example.studiozen.DTO.ReservationDTO;

import java.util.List;

@Controller
@RequestMapping(value = "Management")
public class ManagementController {

    private final ReservationLogic reservationLogic;
    private static Logger logger = LogManager.getLogger(ManagementController.class);
    public ManagementController(ReservationLogic reservationLogic) {
        this.reservationLogic = reservationLogic;
    }

    @RequestMapping(value="/managerMenu.do")
    public ModelAndView SetManagementView(HttpServletRequest req){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("Management/ManagerMenu");

        return mv;
    }
    /* 관리자 페이지 대쉬보드 */
    @RequestMapping(value="/dash.do/{sessionNo}")
    public ModelAndView ManagementDashBoard(HttpServletRequest request, @PathVariable String sessionNo){
        ReservationDTO reservationDTO = new ReservationDTO();
        reservationDTO.setReserv_hostcode(sessionNo);
        ModelAndView mv = new ModelAndView();
        List<ReservationDTO> reservationSelectList =
                reservationLogic.ReservationSelect(reservationDTO);
        logger.info("\nreservationSelectList  ===>" +reservationSelectList);
        request.setAttribute("reservationSelectList",reservationSelectList);
        mv.setViewName("Management/ManagementDash");

        return mv;
    }


    /* 지점 관리 - > 신규지점 관리 버튼 -> 모달창 띄워주는 브릿지 */
    @RequestMapping(value="/newbranchoffice.do")
    public ModelAndView NewBranchOffice(HttpServletRequest httpServletRequest){
        ModelAndView mv = new ModelAndView();
        logger.info("\n Open BranchOffice Register Modal");
        mv.setViewName("BranchOffice/BranchOfficeInsertModal");
        return mv;
    }


}
