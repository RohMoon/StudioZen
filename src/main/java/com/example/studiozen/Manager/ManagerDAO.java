package com.example.studiozen.Manager;

import com.example.studiozen.DTO.ManagerDTO;
import org.apache.ibatis.session.SqlSessionException;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ManagerDAO {
    private static Logger logger = LogManager.getLogger(ManagerDAO.class);
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    public void Manager_CUD(ManagerDTO managerDTO) throws SqlSessionException {

        sqlSessionTemplate.selectList("Manager_CUD",managerDTO);

    }

}
