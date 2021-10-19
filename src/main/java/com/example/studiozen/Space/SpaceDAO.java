package com.example.studiozen.Space;

import com.example.studiozen.DTO.SpaceDTO;
import org.apache.ibatis.session.SqlSessionException;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SpaceDAO {
    private static Logger logger = LogManager.getLogger(SpaceDAO.class);
    private final SqlSessionTemplate sqlSessionTemplate;

    public SpaceDAO(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    public void Space_CUD(SpaceDTO spaceDTO) throws SqlSessionException {

        sqlSessionTemplate.selectList("Space_CUD",spaceDTO);

    }

}
