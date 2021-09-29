<%--
  Created by IntelliJ IDEA.
  User: Moon
  Date: 2021-08-23
  Time: 오후 4:46
  To change this template use File | Settings | File Templates.
  로그인 페이지 페널 역할을 수행.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<link rel="stylesheet" href="/css/bootStrap/bootstrap.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js "></script>
<script type ="text/javascript" src="/js/bootStrap/bootstrap.js"></script>--%>

<div id="longinPanel">
    <%--  로그인 페이지 타이틀 영역 --%>
    <div class="btn-warning ">
        <%--  로그인 페이지 타이틀 문구 --%>
        <h1 id="loginTitle"><b>로그인</b></h1>
    </div>
    <%--  로그인 페이지 양식 / 입력 받는 부분--%>
    <%-- 로그인 폼--%>
    <form name="loginForm" action="/member/login" method="post" datatype="json">
        <%-- 로그인 필드셋 --%>
        <fieldset>
            </p>
            <%-- 로그인 회원번호 입력란 --%>
            <label class="loginLabel"> 회원번호 <input type="text" name="member_no"></label>
            </p>
            <%-- 로그인 비밀번호 입력란--%>
            <label class="loginLabel"> 비밀번호 <input type="password" name="member_password"></label>
        </fieldset>
        </p>
    </form>
    <%--  로그인 수행 버튼  --%>
    <button id="loginButton" type="submit" class="btn btn-warning loginPageButton" onclick="loginButtonAction()"> 로그인
    </button>
    <%--  회원 가입 수행 버튼  --%>
    <button type="button" class="btn btn-warning loginPageButton" onclick="RegisterButtonAction()"> 회원가입
    </button>
</div>