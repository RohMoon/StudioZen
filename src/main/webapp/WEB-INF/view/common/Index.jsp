<%--
  Created by IntelliJ IDEA.
  User: Moon
  Date: 2021-08-20
  Time: 오전 11:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/css/comm.css">
    <link href="/css/bootStrap/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/bootStrap/bootstrap.css">
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet"/>
    <link href="css/styles.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="/js/bootStrap/bootstrap.js"></script>
    <script type="text/javascript" src="/js/IndexPage.js"></script>
    <script type="text/javascript" src="/js/login.js"></script>
    <script type="text/javascript" src="/js/Management.js"></script>
    <script type="text/javascript" src="/js/ManagementMenu.js"></script>

</head>
<body>
<div id="baseContainer">
    <!-- 상단 고정 메뉴 영역 -->
    <nav class="upper">
        <%--슬라이드 꺼내기--%>
        <button class="btn-leftMenuIn">
            <i name class="clear_menu_icon"></i>
        </button>
<%--            <%session = request.getSession();%>
            <%out.print("session == > "+session.getAttribute("SessionNO"));%>--%>
        <%--  메인 문구  --%>
        <span id="title"><b>MANAGEMENT PROGRAM</b></span>
    </nav>
    <%--  왼쪽 슬라이드 메뉴 영역  --%>
    <div class="menu_wrap">
        <%-- 슬라이드 집어넣기 --%>
        <button class="btn-leftMenuOut">
            <i class="clear_menu_icon"></i>
        </button>
        <%-- 로그인한 회원의 유형에 따라 바뀌는 슬라이드메뉴 --%>
        <div id="beforeLoginPanel">
            <%--  로그인 버튼  --%>
            <button id="goLoginButton" type="button" class="btn btn-warning">
                로그인
            </button>
        </div>
    </div>
    <!-- 중앙 페이지 내용 영역-->
    <div id="mainPanel" class="com-mainPanel">

    </div>

    <!--  footer 하단 영역  -->
    <footer>
        copyrigt

    </footer>
</div>
<!--End of BaseContainer-->


</body>
</html>
