package com.example.studiozen.Common;

import com.example.studiozen.Client.ClientController;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Component("fileUtils")
public class FileUtils {

    private static final String filePath = "C:\\dev\\file\\";
    private static Logger logger = LogManager.getLogger(FileUtils.class);

    public List<Map<String, Object>> parseInsertFileInfo(Map<String, Object> map, HttpServletRequest httpservletrequest) throws IOException {
        MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) httpservletrequest;
        Iterator<String> iterator = multipartHttpServletRequest.getFileNames();

        MultipartFile multipartFile = null;
        String originalFileName = null;
        String orginalFileExtension = null;
        String storedFileName = null;

        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        Map<String, Object> listMap = null;

        String boardidx = (String) map.get("IDX");

        File file = new File(filePath);
        if (file.exists() == false) {
            file.mkdir();
        }

        while (iterator.hasNext()) {

            multipartFile = multipartHttpServletRequest.getFile(iterator.next());

            if (multipartFile.isEmpty() == false) {

                originalFileName = multipartFile.getOriginalFilename();
                orginalFileExtension =
                        originalFileName.substring(originalFileName.lastIndexOf("."));
                storedFileName = CommonUtils.getRandomString() + orginalFileExtension;

                file = new File(filePath + storedFileName);
                multipartFile.transferTo(file);

                listMap = new HashMap<String, Object>();
                listMap.put("BOARD_IDX", boardidx);
                listMap.put("ORIGINAL_FILE_NAME", originalFileName);
                listMap.put("STORED_FILE_NAME", storedFileName);
                listMap.put("FILE_SIZE", multipartFile.getSize());
                list.add(listMap);

            }

        }

        return list;

    }
}