<%--
  Created by IntelliJ IDEA.
  User: Moon
  Date: 2021-08-24
  Time: 오후 12:43
  To change this template use File | Settings | File Templates.
--%>

<%--  왼쪽 슬라이드 메뉴 영역  --%>
<div id="clientMenu" class ="managementMenu slideMenu">
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%-- 로그인한 멤버 번호(세션값) 확인 --%>
    <% String sid = (String) session.getAttribute("sessionNO");  %>
    <% String MemberNo = sid.substring(10);%>
    <%-- 번호값 확인  --%>
    <h1 class="h6">어서오세요!</br>
        <% out.print(MemberNo);%>님</h1>
    </br>
    <%--  대쉬보드 페이지 가기 버튼  --%>
    <button id="goClientDashBoardPage" type="button" class="btn btn-warning" onclick="goClientDashBoardPageAction()">
        대쉬보드
    </button>
    </br>
    </br>
    <%--  회원 본인 정보 관리 페이지 가기 버튼  --%>
    <button id="goMemberManagePage" type="button" class="btn btn-warning">
            정보 관리

    </button>
    </br>
    </br>
    <%--  문의 내역 페이지 가기 버튼  --%>
    <button id="goClientQnaHistoryPage" type="button" class="btn btn-warning" onclick="goClientQnaHistoryPageAction()">
        문의하기
    </button>
    </br>
    </br>
    <%--  로그아웃  버튼  --%>
    <button id="goLogOut" type="button" class="btn btn-warning" onclick="logOutButtonAction()">
        로그아웃
    </button>
    </br>
    </br>
</div>