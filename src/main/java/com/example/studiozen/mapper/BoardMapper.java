package com.example.studiozen.mapper;

import com.example.studiozen.DTO.MemberDTO;
import org.apache.ibatis.annotations.Mapper;

//@Mapper
public interface BoardMapper {
    public MemberDTO getMemberData(String userName);

}
