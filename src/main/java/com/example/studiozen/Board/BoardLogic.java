package com.example.studiozen.Board;


import com.example.studiozen.DTO.CommonDTO;
import com.example.studiozen.DTO.QNABoardDTO;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

@Service
public class BoardLogic {
    private static Logger logger = LogManager.getLogger(BoardLogic.class);

    private final BoardDAO boardDAO;

    public BoardLogic(BoardDAO boardDAO) {
        this.boardDAO = boardDAO;
    }

    public List<QNABoardDTO> QNABoardSelect(QNABoardDTO qnaBoardDTO) {
        List<QNABoardDTO> qnaBoardDTOList = null;
        String result = null;
        try {
            qnaBoardDTOList = boardDAO.QNABoardSelect(qnaBoardDTO);
            result = "Nice";
        } catch (Exception e) {
            result = "bad";
            e.printStackTrace(System.err);
        }
        return qnaBoardDTOList;

    }

    public List<QNABoardDTO> QNABoardDetail(QNABoardDTO qnaBoardDTO) {
        List<QNABoardDTO> qnaBoardDTOList = null;
        String result = null;
        try {
            qnaBoardDTOList = boardDAO.QNABoardDetail(qnaBoardDTO);
            result = "Nice";
        } catch (Exception e) {
            result = "bad";
            e.printStackTrace(System.err);
        }
        return qnaBoardDTOList;


    }

    public String QNABoardWriter(QNABoardDTO qnaBoardDTO) throws SQLException {

        String result;

        try {
            boardDAO.QNABoardCUD(qnaBoardDTO);
            logger.info("qnaBoardDTO.getFile_size()" + qnaBoardDTO.getFile_size());
            if (qnaBoardDTO.getFile_size() != 0) {
                logger.info("qnaBoardDTO.getFile_size()!=0 === > if문 ");

                try {
                    logger.info("====FileINSERT======== >");
                    boardDAO.QNABoardFileInsert(qnaBoardDTO);
                } catch (Exception e) {
                    logger.info("====FileINSERT====e.getStackTrace ==== >" + e.getStackTrace());
                    logger.info("====FileINSERT====e.getMessage====>" + e.getMessage() + "\n\n");
                }
            }

            result = "Nice";
        } catch (Exception e) {
            result = "bad";
            logger.info("e.getStackTrace ==== >" + e.getStackTrace());
            logger.info("e.getMessage====>" + e.getMessage());
            logger.info("e.getMessage====>" + e.getMessage() + "\n\n");

        }

        logger.info("qnaBoardDTO.getResult()=>>" + qnaBoardDTO.getResult());
        logger.info("qnaBoardDTO.getResultmessage()===>" + qnaBoardDTO.getResultmessage());

        return result;

    }

    public String QNABoardUpdater(QNABoardDTO qnaBoardDTO) {
        String result;
        try {
            boardDAO.QNABoardCUD(qnaBoardDTO);
            result = "Nice";
        } catch (Exception e) {
            result = "bad";
            logger.info(e.getStackTrace());
        }
        logger.info(qnaBoardDTO.getResult());
        return result;

    }

    public String QNABoardDelete(QNABoardDTO qnaBoardDTO) {
        String result = null;
        try {
            boardDAO.QNABoardCUD(qnaBoardDTO);
            result = "Nice";
        } catch (Exception e) {
            result = "bad";
            logger.info(e.getStackTrace());
        }
        logger.info(qnaBoardDTO.getResult());
        return result;

    }

    public String QNARecoWriter(QNABoardDTO qnaBoardDTO) {
        String result = null;
        try {
            boardDAO.QNARecoCUD(qnaBoardDTO);
            result = "Nice";
        } catch (Exception e) {
            result = "bad";
            e.printStackTrace();
        }
        logger.info(qnaBoardDTO.getResult());
        return result;


    }

    public String QNARecoUpdater(QNABoardDTO qnaBoardDTO) {

        String result = null;
        try {
            boardDAO.QNARecoCUD(qnaBoardDTO);
            result = "Nice";
        } catch (Exception e) {
            result = "bad";
            logger.info(e.getStackTrace());
        }
        logger.info(qnaBoardDTO.getResult());
        return result;


    }

    public String QNARecoDelete(QNABoardDTO qnaBoardDTO) {

        String result = null;

        try {

            boardDAO.QNARecoCUD(qnaBoardDTO);
            result = "Nice";

        } catch (Exception e) {

            result = "bad";
            logger.info(e.getStackTrace());
            logger.info(e.getMessage());

        }

        return result;

    }

    public QNABoardDTO QNABoardDownloadFileChecking(QNABoardDTO qnaBoardDTO) {
        String result = null;
        QNABoardDTO res_qnaBoardDTO = new QNABoardDTO();
//        List<QNABoardDTO> qnaBoardDTOFileList = null;
        try {
//            qnaBoardDTOFileList.addAll(boardDAO.QNABoardDownloadFileChecking(qnaBoardDTO));
//            result = "Nice";
//            qnaBoardDTOFileList.add(boardDAO.QNABoardBringDownloadFile(qnaBoardDTO));
//            logger.info("qnaBoardDTOFileList === > \n"+qnaBoardDTOFileList.get(0));


            boardDAO.QNABoardDownloadFileChecking(qnaBoardDTO);
//            logger.info("qnaBoardDTO === > \n"+qnaBoardDTO);
            logger.info("res_qnaBoardDTO === >111  \n"+res_qnaBoardDTO.toString());
            if (qnaBoardDTO.getResult()==1){
                res_qnaBoardDTO= boardDAO.QNABoardBringDownloadFile(qnaBoardDTO);
                logger.info("qnaBoardDTO === > \n"+qnaBoardDTO);
                logger.info("res_qnaBoardDTO === > \n"+res_qnaBoardDTO);
            }

        } catch (Exception e) {
            result = "bad";
//            logger.info(e.getStackTrace());
            logger.info(e.getMessage());
            logger.info("res_qnaBoardDTO === eeerrrooorr> \n"+res_qnaBoardDTO);
        }

        return res_qnaBoardDTO;

    }
}
