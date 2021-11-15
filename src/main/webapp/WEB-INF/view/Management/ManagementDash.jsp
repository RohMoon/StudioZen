<%--
  Created by IntelliJ IDEA.
  User: Moon
  Date: 2021-08-24
  Time: 오후 3:14
  To change this template use File | Settings | File Templates.
--%>
<div id="managementDashBoard" class="main com-mainPanel">
    <script type="text/javascript">
        // var tr_code
        // var reserv_no            ;
        // var space_no             ;
        // var space_name           ;
        // var reserv_hostcode      ;
        // var member_name          ;
        // var reserv_date          ;
        // var reserv_start_time    ;
        // var reserv_end_time      ;
        // var reserv_host_mobile   ;
        // var reserv_paystatement  ;
        // var reserv_regdate       ;
        // var reserv_host_email    ;
        // var reserv_updatedate    ;
        // var reserv_pay_limited   ;
    </script>


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

    <div class="row placeholders">
        <%--      <div class="col-xs-6 col-sm-3 placeholder">--%>
        <div class="col-xs-6 col-sm-3 " style="cursor: pointer" onclick="qnaListBoardAction()">
            <img src="../images/dash-check.png" class="img-responsive dash-icon" alt="Generic placeholder thumbnail">
            <h4>Q&A리스트</h4>
        </div>
        <%--    <div class="col-xs-6 col-sm-3 placeholder">--%>
        <div class="col-xs-6 col-sm-3 " style="cursor: pointer" onclick="goBranchOfficeListBoardAction()">
            <img src="../images/dash-branchOffice.png" class="img-responsive dash-icon"
                 alt="Generic placeholder thumbnail">
            <h4>지점별 현황</h4>
            <%--      <span class="text-muted">Something else</span>--%>
        </div>
        <%--    <div class="col-xs-6 col-sm-3 placeholder">--%>
        <div class="col-xs-6 col-sm-3 ">
            <img src="../images/dash-qna.png" class="img-responsive dash-icon" alt="Generic placeholder thumbnail">
            <h4>Q&A</h4>
            <%--      <span class="text-muted">Something else</span>--%>
        </div>
        <%--    <div class="col-xs-6 col-sm-3 placeholder">--%>
        <div class="col-xs-6 col-sm-3 ">
            <img src="../images/dash-Manager.png" class="img-responsive dash-icon" alt="Generic placeholder thumbnail">
            <h4>매니져</h4>
            <%--      <span class="text-muted">Something else</span>--%>
        </div>
    </div>
    <p>
    </p>
    <p>
    </p>
    <h2 class="sub-header">예약현황</h2>

    <div id="reserv_search">

        <div id="reserv_search_detailCheckBox_reserv_no" style="font-size: 1.7rem">

            <input class="form-check-input" type="checkbox" value="checked_reserv_no" id="reserv_search_detailCheckBox_reserv_no_input">
            <label class="form-check-label" for="reserv_search_detailCheckBox_reserv_no_input"
                   style="font-size: 1.7rem">
                예약번호
            </label>

            <input class="form-check-input" type="checkbox" value="checked_space_no" id="reserv_search_detailCheckBox_space_no_input">
            <label class="form-check-label" for="reserv_search_detailCheckBox_space_no_input" style="font-size: 1.7rem">
                공간번호
            </label>

            <input class="form-check-input" type="checkbox" value="checked_reserv_date"
                   id="reserv_search_detailCheckBox_reserv_date_input">
            <label class="form-check-label" for="reserv_search_detailCheckBox_reserv_date_input"
                   style="font-size: 1.7rem">
                예약날짜
            </label>

            <input class="form-check-input" type="checkbox" value="checked_reserv_start_time"
                   id="reserv_search_detailCheckBox_reserv_start_time_input">
            <label class="form-check-label" for="reserv_search_detailCheckBox_reserv_start_time_input"
                   style="font-size: 1.7rem">
                사용 시작 시간
            </label>

            <input class="form-check-input" type="checkbox" value="checked_reserv_end_time"
                   id="reserv_search_detailCheckBox_reserv_end_time_input">
            <label class="form-check-label" for="reserv_search_detailCheckBox_reserv_end_time_input"
                   style="font-size: 1.7rem">
                사용 마감 시간
            </label>

            <input class="form-check-input" type="checkbox" value="checked_reserv_host_mobile"
                   id="reserv_search_detailCheckBox_reserv_host_mobile_input">
            <label class="form-check-label" for="reserv_search_detailCheckBox_reserv_host_mobile_input"
                   style="font-size: 1.7rem">
                예약자 전화번호
            </label>

            <input class="form-check-input" type="checkbox" value="checked_reserv_host_email"
                   id="reserv_search_detailCheckBox_reserv_host_email_input">
            <label class="form-check-label" for="reserv_search_detailCheckBox_reserv_host_email_input"
                   style="font-size: 1.7rem">
                예약자 이메일
            </label>

            <input class="form-check-input" type="checkbox" value="checked_reserv_hostcode"
                   id="reserv_search_detailCheckBox_reserv_hostcode_input">
            <label class="form-check-label" for="reserv_search_detailCheckBox_reserv_hostcode_input"
                   style="font-size: 1.7rem">
                예약자 번호
            </label>

            <select class="" value=""
                   id="reserv_search_detailCheckBox_reserv_paystatement_input">
                <option value="paystatement">결제상태</option>
                <option value="ready">결제대기</option>
                <option value="done">결제완료</option>
                <option value="cancel">결제취소</option>
            </select>

        </div>

        <div id="reserv_search_input_div">
            <input id="reserv_search_input" style="font-size: 1.7rem">
            <button id="reserv_search_button" class="btn btn-primary" style="font-size: 1.7rem" onclick="Reserv_filterSelect()" >검색</button>
        </div>

    </div>

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
                <th>결제금액</th>
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
                        out.print("<tr class=\"btn-open-popup\" onclick=\"reservationListBoardAction(this)\">");
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
                        out.print(index.getSpace_basicprice() * ((Integer.parseInt(index.getReserv_end_time()) - Integer.parseInt(index.getReserv_start_time()))));
                        out.print("</td>");
                        out.print("<td>");
                        out.print(index.getReserv_paystatement());
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