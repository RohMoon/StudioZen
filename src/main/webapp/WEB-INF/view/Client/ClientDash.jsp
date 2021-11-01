
<%--
  Created by IntelliJ IDEA.1
  User: Moon
  Date: 2021-08-24
  Time: 오후 3:14
  To change this template use File | Settings | File Templates.
--%>

<div id="clientDashBoard" class="main com-mainPanel">
    <div>


        <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <%@ page import="java.util.*" %>
        <%@ page import="com.example.studiozen.DTO.ReservationDTO" %>
        <% List<ReservationDTO> reservationSelectList = (List<ReservationDTO>) request.getAttribute("reservationSelectList");
            int size = 0;
        %>

        <div id="modalSpace">

        </div>
        <%--  <link href="/css/bootStrap/bootstrap.min.css" rel="stylesheet">--%>
        <%--    <script type ="text/javascript" src="/js/bootStrap/bootstrap.js"></script>--%>
        <script type="text/javascript" src="/js/Management.js"></script>

        <h1 class="page-header">Dashboard</h1>
        </p>
        <button id="doReservation" type="button" class="btn btn-warning" onclick="goBranchOfficeListBoardAction()">
            <h3> 예약하기</h3>
        </button>

        <button id="doWriteQna" type="button" class="btn btn-warning" onclick="doWriteQnaAction(this)">
            <h3>문의하기</h3>
        </button>

<%--        <button id="doPay" type="button" class="btn btn-warning">
            <h3>결제하기</h3>
        </button>--%>
    </div>

    </p>
    </p>
    <h2 class="sub-header">예약 내역</h2>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>#</th>
                <th>예약번호</th>
                <th>예약자</th>
                <th>대여장소</th>
                <th>대여일자</th>
                <th>대여시간</th>
                <th>시작시간</th>
                <th>종료시간</th>
                <th>예약상태</th>
            </tr>
            </thead>
            <tbody>
            <%
                if (reservationSelectList != null && reservationSelectList.size() > 0) {
                    int end_time;
                    int start_time;
                    for (ReservationDTO index : reservationSelectList) {
                        end_time = Integer.parseInt(index.getReserv_end_time());
                        start_time = Integer.parseInt(index.getReserv_start_time());
                        out.print("<tr class=\"btn-open-popup\" onclick=\"reservationListBoardAction(this)\",>");
                        out.print("<td>");
                        out.print(index.getRow_num());
                        out.print("</td>");
                        out.print("<td>");
                        out.print(index.getReserv_no());
                        out.print("</td>");
                        out.print("<td>");
                        out.print(index.getReserv_hostname());
                        out.print("</td>");
                        out.print("<td>");
                        out.print(index.getSpace_name());
                        out.print("</td>");
                        out.print("<td>");
                        out.print((index.getReserv_date()).substring(0, 10));
                        out.print("</td>");
                        out.print("<td>");
                        out.print(end_time - start_time);
                        out.print("</td>");
                        out.print("<td>");
                        out.print(index.getReserv_start_time());
                        out.print("</td>");
                        out.print("<td>");
                        out.print(index.getReserv_end_time());
                        out.print("</td>");
                        out.print("<td>");
                        out.print(index.getReserv_paystatement());
                        if (index.getReserv_paystatement().equals("READY")) {
                            out.print(
                                    "        <button type=\"button\" class=\"btn btn-warning doPay\">" +
                                            "            <h3>결제하기</h3>" +
                                            "        </button>");
                        }else{
                            out.print("결제완료");
                        }
                        out.print("</td>");
                        out.print("</tr>");
                    }
                    return;

                }
            %>
            </tbody>
        </table>
    </div>
</div>
</div>
<script type="text/javascript" src="/js/ClientDashBoard.js"></script>