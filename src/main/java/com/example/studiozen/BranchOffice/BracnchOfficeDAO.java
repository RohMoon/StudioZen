package com.example.studiozen.BranchOffice;

import com.example.studiozen.DTO.BranchOfficeDTO;
import com.example.studiozen.DTO.SpaceDTO;
import org.apache.ibatis.session.SqlSessionException;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BracnchOfficeDAO {
    private static Logger logger = LogManager.getLogger(BracnchOfficeDAO.class);
    private final SqlSessionTemplate sqlSessionTemplate;

    public BracnchOfficeDAO(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    /* CUD 프로시저에 연결*/
    public void BracnchOffice_CUD(BranchOfficeDTO branchOfficeDTO) throws SqlSessionException {

        sqlSessionTemplate.selectList("BranchOffice_CUD",branchOfficeDTO);

    }

    /* 파일 삽입에 Insert */
    public void BracnchOffice_FileInsert(BranchOfficeDTO branchOfficeDTO) throws SqlSessionException {

        sqlSessionTemplate.selectList("BracnchOffice_FileInsert",branchOfficeDTO);

    }
    
    /* 지점 전체 조회 */
    public List<BranchOfficeDTO> BracnchOfficeSelect(BranchOfficeDTO branchOfficeDTO) throws SqlSessionException {

        List<BranchOfficeDTO> branchOfficeSelectList = sqlSessionTemplate.selectList("BracnchOfficeSelect",branchOfficeDTO);
        return branchOfficeSelectList;

    }

    /* 지점 상세 조회 */
    public List<SpaceDTO> BracnchOfficeDetailSelect(SpaceDTO spaceDTO) throws SqlSessionException {

        List<SpaceDTO> spaceSelectList = sqlSessionTemplate.selectList("BracnchOfficeDetailSelect_ShowSpace", spaceDTO);

        return spaceSelectList;

    }
}
