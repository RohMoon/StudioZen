package com.example.studiozen.AOP;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;


@Component
@Aspect
public class LogMonitorAspect {



    Logger logger = LoggerFactory.getLogger(LogMonitorAspect.class);

    @Around("@annotation(com.example.studiozen.AOP.LogExecutionMonitoring)")
    public Object logMonitorAspect(ProceedingJoinPoint joinPoint)throws  Throwable{

        Object proceed = joinPoint.proceed();


        return proceed;
    }
}
