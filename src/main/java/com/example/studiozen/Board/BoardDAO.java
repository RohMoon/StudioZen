package com.example.studiozen.Board;

import com.example.studiozen.DTO.QNABoardDTO;
import org.apache.ibatis.session.SqlSessionException;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BoardDAO {
    private static Logger logger = LogManager.getLogger(BoardDAO.class);
    private final SqlSessionTemplate sqlSessionTemplate;

    public BoardDAO(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    /* 1 = 파일 확인 게시글번호와 동일, -1 = 확인안됨.
     *  qna보드에 올라온 파일을 다운로드 위해 해당 파일이 존재하는지 qna 게시번호와 이름이 동일한지 체크  */
    public QNABoardDTO QNABoardDownloadFileChecking(QNABoardDTO qnaBoardDTO) {
        QNABoardDTO res_qnaBoardDTO =  sqlSessionTemplate.selectOne("PROC_CheckQnaFile", qnaBoardDTO);
        return res_qnaBoardDTO;
    } // end of QNABoardDownloadFileChecking 체킹

    public QNABoardDTO QNABoardBringDownloadFile(QNABoardDTO qnaBoardDTO) {
        QNABoardDTO res_qnaBoardDTO =  sqlSessionTemplate.selectOne("qnaBoardBringDownloadFile", qnaBoardDTO);
        return res_qnaBoardDTO;
    }

    public List<QNABoardDTO> QNABoardSelect(QNABoardDTO qnaBoardDTO) throws SqlSessionException {
        logger.info("  === >DAO 실행 완료 . < ==== ");
        List<QNABoardDTO> qnaBoardDTOList = sqlSessionTemplate.selectList("qnaBoard_SELECT", qnaBoardDTO);
        logger.info(" === > XML 실행 완료 < ===");

        return qnaBoardDTOList;
    }

    public List<QNABoardDTO> QNABoardDetail(QNABoardDTO qnaBoardDTO) {

        logger.info("  === > QNABoardDetail === > DAO 실행 완료 . < ==== ");

        List<QNABoardDTO> qnaBoardDTOList = sqlSessionTemplate.selectList("qnaBoard_Detail", qnaBoardDTO);
        qnaBoardDTOList.addAll(sqlSessionTemplate.selectList("qnaBoard_RecoDetail", qnaBoardDTO));
        qnaBoardDTOList.addAll(sqlSessionTemplate.selectList("qnaBoard_SelectUploadedFile", qnaBoardDTO));

        int result = sqlSessionTemplate.update("detailChecked", qnaBoardDTO);

        logger.info(" === > QNABoardDetail === > XML 실행 완료 < ===");

        logger.info("QNABoardDetail ===> DAO ==== >" + result);

        return qnaBoardDTOList;

    }


    public void QNABoardCUD(QNABoardDTO qnaBoardDTO) throws SqlSessionException {
        logger.info("DAO=========>CUD_XML타기전");
        sqlSessionTemplate.selectList("qnaBoard_CUD", qnaBoardDTO);
        logger.info("DAO========>CUD XML 타고난 후");
        logger.info("AfterKey ===== > " + qnaBoardDTO.getAfter_key());
    }

    public void QNABoardFileInsert(QNABoardDTO qnaBoardDTO) throws SqlSessionException {
        logger.info("DAO ===  QNABoardFileInsert=========>CUD_XML타기전");
        sqlSessionTemplate.insert("QNABoardFileInsert", qnaBoardDTO);
        logger.info("DAO====QNABoardFileInsert====>CUD XML 타고난 후");
        logger.info("AfterKey ===== > " + qnaBoardDTO.getAfter_key());
    }

    public void QNARecoCUD(QNABoardDTO qnaBoardDTO) {

        sqlSessionTemplate.selectList("qnaReco_CUD", qnaBoardDTO);


    }




}
