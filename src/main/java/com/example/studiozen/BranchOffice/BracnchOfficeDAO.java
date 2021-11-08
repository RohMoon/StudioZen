package com.example.studiozen.BranchOffice;

import com.example.studiozen.DTO.BranchOfficeDTO;
import com.example.studiozen.DTO.SpaceDTO;
import org.apache.ibatis.session.SqlSessionException;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
            logger.info("=========> branchOfficeDTO =====> after\n branchOfficeDTO \n "+ branchOfficeDTO);
    }

    /* 파일 삽입에 Insert */
    public void BracnchOffice_FileInsert(BranchOfficeDTO branchOfficeDTO) throws SqlSessionException {

        sqlSessionTemplate.selectList("BracnchOffice_FileInsert",branchOfficeDTO);
        sqlSessionTemplate.update("BracnchOffice_itHasFile",branchOfficeDTO);

    }

    /* 지점 전체 조회 */
    public Map<String, List<BranchOfficeDTO>> BracnchOfficeSelect(BranchOfficeDTO branchOfficeDTO) throws SqlSessionException {
        Map<String, List<BranchOfficeDTO>> bracnchOfficeSelectMap = new HashMap<>();
        List<BranchOfficeDTO> branchOfficeSelectList = sqlSessionTemplate.selectList("BracnchOfficeSelect",branchOfficeDTO);
        List<BranchOfficeDTO> branchOfficeImgSelectList = sqlSessionTemplate.selectList("BracnchOfficeImgSelect",branchOfficeDTO);
        bracnchOfficeSelectMap.put("branchOfficeSelectList",branchOfficeSelectList);
        bracnchOfficeSelectMap.put("branchOfficeImgSelectList",branchOfficeImgSelectList);

        return bracnchOfficeSelectMap;

    }

    /* 지점 상세 조회 */
    public List<SpaceDTO> BracnchOfficeDetailSelect(SpaceDTO spaceDTO) throws SqlSessionException {

        List<SpaceDTO> spaceSelectList = sqlSessionTemplate.selectList("BracnchOfficeDetailSelect_ShowSpace", spaceDTO);

        return spaceSelectList;

    }
}