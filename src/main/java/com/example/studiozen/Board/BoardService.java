package com.example.studiozen.Board;

import com.example.studiozen.DTO.MemberDTO;
import com.example.studiozen.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//@Service
public class BoardService {
//    @Autowired
    BoardMapper boardMapper;

    public MemberDTO getMemberData(String userName) throws Exception{
        return boardMapper.getMemberData("노상문");
    }
}
