package com.example.studiozen.Common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class Common {


    @RequestMapping(value="/index.do")
    public ModelAndView index(HttpServletRequest req){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("common/Index");

        return mv;
    }

    @RequestMapping(value="/loginProc.do")
    public ModelAndView LoginProc(HttpServletRequest req){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("common/login");

        return mv;
    }
    @RequestMapping(value="/register.do")
    public ModelAndView MemberRegister(HttpServletRequest req){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("member/Register");

        return mv;
    }




}
