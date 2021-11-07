package com.example.studiozen.BranchOffice;


import com.example.studiozen.DTO.BranchOfficeDTO;
import com.example.studiozen.DTO.SpaceDTO;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Base64;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

@Service
public class BracnchOfficeLogic {
    private static Logger logger = LogManager.getLogger(BracnchOfficeLogic.class);

    private final BracnchOfficeDAO bracnchOfficeDAO;

    private final String branchOfficeImgPath = "C:\\dev\\file\\images\\branchoffice\\";

    public BracnchOfficeLogic(BracnchOfficeDAO bracnchOfficeDAO) {
        this.bracnchOfficeDAO = bracnchOfficeDAO;
    }

    /* 지점 검색 Select 기능 서비스 메소드   */
    public Map<String, List<BranchOfficeDTO>> BracnchOfficeSelect(BranchOfficeDTO branchOfficeDTO) {
        Map<String, List<BranchOfficeDTO>> bracnchOfficeSelectMap = null;

        String imgCode;
        try {
            bracnchOfficeSelectMap = bracnchOfficeDAO.BracnchOfficeSelect(branchOfficeDTO);

        } catch (Exception e) {
            logger.info(e.getStackTrace());
            logger.info("e.getMessage()====== > " + e.getMessage());
        } // end of Catch
        for (int i = 0; i < bracnchOfficeSelectMap.get("branchOfficeImgSelectList").size(); i++) {
            /// Transfer
             imgCode = ImgToTransfer(bracnchOfficeSelectMap.get("branchOfficeImgSelectList").get(i).getStored_file_name());
            bracnchOfficeSelectMap.get("branchOfficeImgSelectList").get(i).setBranchoffice_img_code(imgCode);
        }

        return bracnchOfficeSelectMap;

    } //end of BracnchOfficeSelect Method


    public String BracnchOfficeRegister(MultipartFile[] multi, BranchOfficeDTO branchOfficeDTO) {

            if (multi != null) {
                branchOfficeDTO.setBranchoffice_haspic("Y");
            }
        String result = null;

        bracnchOfficeDAO.BracnchOffice_CUD(branchOfficeDTO);

        try {
            if (multi != null) {
                branchOfficeDTO.setBranchoffice_haspic("Y");
                for (int i = 0; i < multi.length; i++) {
                    try {
                        logger.info("=>=>=>=>=>=>=>=>=>Request has files ");
                        String uploadpath = branchOfficeImgPath;
                        String originFilename = multi[i].getOriginalFilename();
                        String extName = originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
                        long size = multi[i].getSize();
                        String saveFileName = genSaveFileName(extName);

                        logger.info("uploadpath : " + uploadpath);

                        logger.info("originFilename : " + originFilename);
                        logger.info("extensionName : " + extName);
                        logger.info("size : " + size);
                        logger.info("saveFileName : " + saveFileName);

                        branchOfficeDTO.setOriginal_file_name(originFilename);
                        branchOfficeDTO.setFile_size(size);
                        branchOfficeDTO.setStored_file_name(saveFileName);

                        String fileInsertResult = BracnchOfficeFileInsert(branchOfficeDTO);
                        logger.info(fileInsertResult);
                        if (!multi[i].isEmpty()) {
                            File file = new File(uploadpath, saveFileName);
                            multi[i].transferTo(file);
                        }
                    } catch (IOException e) {
                        logger.info(e.getMessage());
                        e.printStackTrace();
                    }
                }
            }



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


    public String ImgToTransfer(String targetFileStoredName){
        String imgOut = null;
        try {
            //요기서 DB에서 받아온 경로 파일이름 다잡아줘서 파람으로 넣어주고
            byte[] imgBytes = fileDown(targetFileStoredName);
            byte[] baseIncodingBytes = encodingBase64(imgBytes);
            imgOut = new String(baseIncodingBytes);

//                httpServletRequest.setAttribute("brImgCode"+i,bracnchOfficeSelectMap.get("branchOfficeImgSelectList").get(i).getBranchoffice_img_code());
            logger.info("imgString=============>imgString=========>imgString=====>" + imgOut);
        } catch (Exception e) {
            logger.info("e.getMessage() ==========================>" + e.getMessage());
            logger.error("e.toString() ==========================>" + e.toString());
        }
        return imgOut;
    }

    //여기서 받아서 파람으로 받아서 !
    public byte[] fileDown(String storedName) throws IOException {

        File file = new File(branchOfficeImgPath + storedName);
        logger.info("\nroot ==>" + branchOfficeImgPath + storedName);
        FileInputStream fis = null;
        byte[] fileArray = null;
        ByteArrayOutputStream byteArrayOutputStream = new  ByteArrayOutputStream();
        int len=0;
        try {

            if (file.exists() && file.isFile()) {//여기서 if문을 안타니까 바로 터진거

                byte[] buf = new byte[1024];
                fis = new FileInputStream(file); // 아 얘네
                while ((len=fis.read(buf))!=-1){
                    byteArrayOutputStream.write(buf,0,len);
                }
                logger.info("FileDownLoad Loading");
                fileArray = byteArrayOutputStream.toByteArray();

            } else {
                logger.info("Has not File");
            }
        } catch (Exception e) {
            logger.info(e.getMessage());
        } finally {
            if (fis != null) {
                fis.close();
            }
        }
        return fileArray;
    }

    public static byte[] encodingBase64(byte[] targetBytes){
        Base64.Encoder encoder = Base64.getEncoder();
        return encoder.encode(targetBytes);
    }

    // 현재 시간을 기준으로 파일 이름 생성
    private String genSaveFileName(String extName) {
        String fileName = "";

        Calendar calendar = Calendar.getInstance();
        fileName += calendar.get(Calendar.YEAR);
        fileName += calendar.get(Calendar.MONTH);
        fileName += calendar.get(Calendar.DATE);
        fileName += calendar.get(Calendar.HOUR);
        fileName += calendar.get(Calendar.MINUTE);
        fileName += calendar.get(Calendar.SECOND);
        fileName += calendar.get(Calendar.MILLISECOND);
        fileName += extName;

        return fileName;
    }


}
