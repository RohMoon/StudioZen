package com.example.studiozen.Payroll;

import com.example.studiozen.DTO.Payroll_HistoryDTO;
import org.apache.ibatis.session.SqlSessionException;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PayrollDAO {
    private static Logger logger = LogManager.getLogger(PayrollDAO.class);
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    public void Payroll_CUD(Payroll_HistoryDTO payroll_historyDTO) throws SqlSessionException {

        sqlSessionTemplate.selectList("Payroll_CUD",payroll_historyDTO);

    }

}
