<%--
  Created by IntelliJ IDEA.
  User: Moon
  Date: 2021-08-24
  Time: 오후 12:43
  To change this template use File | Settings | File Templates.
--%>

<%--  왼쪽 슬라이드 메뉴 영역  --%>
<div id="managementMenu" class ="managementMenu slideMenu">
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%-- 로그인한 멤버 번호(세션값) 확인 --%>
    <% String sid = (String) session.getAttribute("sessionNO");  %>
    <% String MemberNo = sid.substring(10);%>
    <%-- 번호값 확인  --%>
    <h1 class="h6">어서오세요!</br>
        <% out.print(MemberNo);%>님</h1>
    </br>
    <%--  대쉬보드 페이지 가기 버튼  --%>
    <button id="goManagementDashBoardPage" type="button" class="btn btn-primary" onclick="goDashBoardPageAction()">
        대쉬  보드
    </button>
    </br>
    </br>

    <%--  예약관리 페이지 가기 버튼  --%>
    <button id="goReservationManagePage" type="button" class="btn btn-primary">
        예약  관리
    </button>
    </br>
    </br>
    <%--  회원관리 페이지 가기 버튼  --%>
    <button id="goMemberManagePage" type="button" class="btn btn-primary">
            회원  관리

    </button>
    </br>
    </br>
    <%--   매니져 관리 페이지 가기 버튼  --%>
    <button id="goManagerManagePage" type="button" class="btn btn-primary">
        매니져 관리
    </button>
    </br>
    </br>
    <%--   지점 관리 페이지 가기 버튼  --%>
    <button id="goBranchOfficePage" type="button" class="btn btn-primary">
        지점  관리
    </button>
</div>