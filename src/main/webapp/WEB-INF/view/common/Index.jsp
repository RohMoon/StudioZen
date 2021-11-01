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
    <link rel="stylesheet" type="text/css" href="/css/calender.css">
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
    <script type="text/javascript" src="/js/ClientDashBoard.js"></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <!-- 아래 제이쿼리는 1.0이상이면 원하는 버전을 사용하셔도 무방합니다. -->
    <!-- jQuery -->
     <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>

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
<script>

    let tr_code;
    let poolBase ;
    let p_sid ;
    let sid   ;

    let member_name;

    let reserv_no;
    let reserv_date;
    let reserv_hostcode;
    let reserv_start_time;
    let reserv_end_time;
    let reserv_host_mobile;
    let reserv_paystatement;
    let reserv_regdate;
    let reserv_host_email;
    let reserv_updatedate;
    let reserv_pay_limited;
    let reserv_space;
    let reserv_del_sign;

    let qna_no;
    let qna_recomment_no;
    let qna_recomment_writer;
    let qna_recomment_content;

    let branchoffice_no;
    let branchoffice_name;
    let branchoffice_local;
    let branchoffice_address;
    let branchoffice_mobile;

    let space_no;
    let space_name;
    let space_description   ;
    let space_capacity      ;
    let space_maxpeople     ;
    let space_basicprice    ;
    let spaceUpdateButton   ;
    let spaceUpdateSubmitButton  ;
    let spaceUpdateAbortButton   ;
    let spaceAddSubmitButton     ;
    let spaceDeleteButton        ;
    let spaceBookButton   ;
    let spaceBookSubmitButton   ;
    let spaceBookAbortButton   ;

    let imgFile                 ;
    let stored_file_name        ;
    let DownloadQnaFileFormData ;
    let image                   ;
    let reader                  ;
    let img                     ;

    let pg;
    let pay_method;
    let merchant_uid;
    let name;
    let amount;
    let buyer_email;
    let buyer_name;
    let buyer_tel;

    ////////////

</script>
</html>
