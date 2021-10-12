package com.example.studiozen.BranchOffice;


import com.example.studiozen.DTO.BranchOfficeDTO;
import com.example.studiozen.DTO.SpaceDTO;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class BracnchOfficeLogic {
    private static Logger logger = LogManager.getLogger(BracnchOfficeLogic.class);

    private final BracnchOfficeDAO bracnchOfficeDAO;

    public BracnchOfficeLogic(BracnchOfficeDAO bracnchOfficeDAO) {
        this.bracnchOfficeDAO = bracnchOfficeDAO;
    }

    /* 지점 검색 Select 기능 서비스 메소드   */
    public Map<String, List<BranchOfficeDTO>> BracnchOfficeSelect(BranchOfficeDTO branchOfficeDTO) {
        Map<String, List<BranchOfficeDTO>> bracnchOfficeSelectMap = null;

        try {
            bracnchOfficeSelectMap = bracnchOfficeDAO.BracnchOfficeSelect(branchOfficeDTO);
        } catch (Exception e) {
            logger.info(e.getStackTrace());
            logger.info("e.getMessage()====== > " + e.getMessage());
        } // end of Catch
        return bracnchOfficeSelectMap;

    } //end of BracnchOfficeSelect Method


    public String BracnchOfficeRegister(BranchOfficeDTO branchOfficeDTO) {

        String result = null;

        try {

            bracnchOfficeDAO.BracnchOffice_CUD(branchOfficeDTO);

//                try {
//                    //파일 인서트 DAO 메소드로 연결
//                    bracnchOfficeDAO.BracnchOffice_FileInsert(branchOfficeDTO);
//                    //파일 저장 완료
//                } catch (Exception e) {
//                    logger.info(e.getStackTrace());
//                    logger.info(e.getMessage());
//                } // end of file insert catch //end of file insert catch

        } catch (Exception e) {
            result = "bad";
            logger.info("Exception ==== >> " + e.getMessage());
        }// end of if method //
        logger.info("서비스 클래스에서의 동작 성공 결과 구분 ==== > " + branchOfficeDTO.getResult());

        return result;

    }// end of  BracnchOfficeRegister method //

    public String BracnchOfficeFileInsert(BranchOfficeDTO branchOfficeDTO) {

            String fileInsertResult = null;
            try {
                //파일 인서트 DAO 메소드로 연결
                bracnchOfficeDAO.BracnchOffice_FileInsert(branchOfficeDTO);
                fileInsertResult = "FileInsertSuccess";
                //파일 저장 완료
            } catch (Exception e) {
                logger.info(e.getStackTrace());
                logger.info(e.getMessage());
                fileInsertResult = "FileInsertFail";
            } // end of file insert catch //end of file insert catch

        return fileInsertResult;
    }// end of  BracnchOfficeRegister method //


    /* 지점 수정 로직 메소드 */
    public String BracnchOfficeUpdater(BranchOfficeDTO branchOfficeDTO) {
        String result = null;
        try {
            bracnchOfficeDAO.BracnchOffice_CUD(branchOfficeDTO);
            result = "Nice";
        } catch (Exception e) {
            result = "bad";
            logger.info(e.getStackTrace());
        }// end of catch
        logger.info(branchOfficeDTO.getResult());
        return result;

    } //end of BracnchOfficeUpdater Method
    
    /* 지점 삭제 로직 메소드 */
    public String BracnchOfficeDelete(BranchOfficeDTO branchOfficeDTO) {
        String result = null;
        try {
            bracnchOfficeDAO.BracnchOffice_CUD(branchOfficeDTO);
            result = "Nice";
        } catch (Exception e) {
            result = "bad";
            logger.info(e.getStackTrace());
        } // End Of Catch
        logger.info(branchOfficeDTO.getResult());
        return result;

    } // End of BracnchOfficeDelete Method

    /* 지점 상세 검색 DetailSelect 기능 서비스 메소드   */
    public List<SpaceDTO> BracnchOfficeDetailSelect(SpaceDTO spaceDTO) {

        List<SpaceDTO> spaceSelectList = null;

        try {
            spaceSelectList = bracnchOfficeDAO.BracnchOfficeDetailSelect(spaceDTO);
        } catch (Exception e) {
            logger.info(e.getStackTrace());
            logger.info("e.getMessage()====== > " + e.getMessage());
        } // end of Catch
        return spaceSelectList;

    } //end of BracnchOfficeSelect Method


}
