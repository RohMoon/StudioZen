package com.example.studiozen.Reservation;

import com.example.studiozen.DTO.ReservationDTO;
import org.apache.ibatis.session.SqlSessionException;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ReservationDAO {
    private static Logger logger = LogManager.getLogger(ReservationDAO.class);
    private final SqlSessionTemplate sqlSessionTemplate;

    public ReservationDAO(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    public List<ReservationDTO> ReservationSelect(ReservationDTO reservationDTO) throws SqlSessionException {

        logger.info("\n============>@@@"+reservationDTO);

        List<ReservationDTO> reservationSelectList =  sqlSessionTemplate.selectList("reservation_Select",reservationDTO);
        logger.info("reservationSelectList.size()===========>"+reservationSelectList.size());
        return reservationSelectList;
    }


    public List<ReservationDTO> Reservation_BookedTimeSelect(ReservationDTO reservationDTO) throws SqlSessionException {

        List<ReservationDTO> reservation_BookedTimeSelectList =  sqlSessionTemplate.selectList("reservation_BookedTimeSelect",reservationDTO);

        return reservation_BookedTimeSelectList;
    }

    public void Reservation_CUD(ReservationDTO reservationDTO) throws SqlSessionException {

        sqlSessionTemplate.selectList("reservation_CUD",reservationDTO);

    }

    public List<ReservationDTO> ReservationDetail(ReservationDTO reservationDTO) throws SqlSessionException {

        List<ReservationDTO> reservationDetailList =  sqlSessionTemplate.selectList("reservation_Detail",reservationDTO);

        return reservationDetailList;
    }

    public List<ReservationDTO> AutoFilled(ReservationDTO reservationDTO) throws SqlSessionException {

        List<ReservationDTO> reservationDetailList =  sqlSessionTemplate.selectList("AutoFilled",reservationDTO);

        return reservationDetailList;
    }

}
