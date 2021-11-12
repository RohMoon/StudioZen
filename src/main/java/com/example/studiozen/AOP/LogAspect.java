package com.example.studiozen.AOP;


import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;

@Component
@Aspect
public class LogAspect {
    Logger logger = LoggerFactory.getLogger(LogAspect.class);

    @Around("@annotation(com.example.studiozen.AOP.LogExecutionTime)")
    //해당 어노테이션이 붙은 메소드에서는 ProceedingJoinPoint 파라미터를 받 수 있다.
    //어노테이션의 value를 "@annotation(LogExecutionTime)"로 지정함으로써
    //joinPoint는 @LogExecutionTime를 붙인 타겟 메소드를 의미하게 된다.

    public Object logExecutionTime(ProceedingJoinPoint joinPoint) throws Throwable{
        StopWatch stopWatch = new StopWatch();
        stopWatch.start();

        //@LogExcutionTime 어노테이션이 붙어있는 타겟 메소드를 실행
        Object proceed = joinPoint.proceed();
        // 타겟 메소드를 실행한다. 이 라인 앞뒤로 StopWatch를 이용한 메소드 성능 측정 코드를 넣어준다.

        stopWatch.stop();
        logger.info('\n'+stopWatch.prettyPrint());

        return proceed; // 결과 리턴
    }

}
