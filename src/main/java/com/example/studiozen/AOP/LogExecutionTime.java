package com.example.studiozen.AOP;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target(ElementType.METHOD) // 어노테이션을 메소드에 사용할 것이라고 설정
@Retention(RetentionPolicy.RUNTIME) // 어노테이션이 RUNTIME까지 유지되도록 설정한다.

// 어떤 메소드에 AOP를 적용할것인지 알려주는 어노테이션을 정의하였다.
//이제 해당 메소드에 어떤 기능을 추가할 것인지를 알려주는 실제 aspect를 구현해야한다.

//같은 패키지에 LogAspect 클래스를 만들고 아래와 같이 작성한다.

public @interface LogExecutionTime {
}
