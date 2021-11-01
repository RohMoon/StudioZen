<%--
  Created by IntelliJ IDEA.
  User: Moon
  Date: 2021-08-27
  Time: 오후 1:52
  To change this template use File | Settings | File Templates.
--%>

<div class="modal" onclick="qnaDetailModalAction()">
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="java.util.*" %>
    <%@ page import="com.example.studiozen.DTO.ReservationDTO" %>


        <% List<ReservationDTO> reserv_detailList = (List<ReservationDTO>) request.getAttribute("reservationDetailList");%>
        <% ReservationDTO reserv_detailInfo = (reserv_detailList.get(0)); %>
    <script type="text/javascript">
        // let p_reserv_no;
        // let p_space_no;
        // let p_reserv_hostcode;
        // let p_reserv_date;
        // let p_reserv_start_time;
        // let p_reserv_end_time;
        // let p_reserv_host_mobile;
        // let p_reserv_paystatement;
        // let p_reserv_host_email;


        reserv_no = "<%=reserv_detailInfo.getReserv_no()          %>";
        space_no = "<%=reserv_detailInfo.getSpace_no()           %>";
        space_name = "<%=reserv_detailInfo.getSpace_name()         %>";
        reserv_hostcode = "<%=reserv_detailInfo.getReserv_hostcode()    %>";
        member_name = "<%=reserv_detailInfo.getReserv_hostname()    %>";
        reserv_date = "<%=reserv_detailInfo.getReserv_date()        %>";
        reserv_start_time = "<%=reserv_detailInfo.getReserv_start_time()  %>";
        reserv_end_time = "<%=reserv_detailInfo.getReserv_end_time()    %>";
        reserv_host_mobile = "<%=reserv_detailInfo.getReserv_host_mobile() %>";
        reserv_paystatement = "<%=reserv_detailInfo.getReserv_paystatement()%>";
        reserv_regdate = "<%=reserv_detailInfo.getReserv_regdate()     %>";
        reserv_host_email = "<%=reserv_detailInfo.getReserv_host_email()  %>";
        reserv_updatedate = "<%=reserv_detailInfo.getReserv_updatedate()  %>";
        reserv_pay_limited = "<%=reserv_detailInfo.getReserv_pay_limited() %>";
        reserv_paystatement = "<%=reserv_detailInfo.getReserv_paystatement() %>";
        console.log(reserv_no);
        console.log(space_no);
        console.log(space_name);
        console.log(reserv_hostcode);
        console.log(member_name);
    </script>
    <script type="text/javascript">
        document.reserv_detail_page_form.reserv_no.value = reserv_no;
        document.reserv_detail_page_form.space_no.value = space_no;
        document.reserv_detail_page_form.space_name.value = space_name;
        document.reserv_detail_page_form.reserv_hostcode.value = reserv_hostcode;
        document.reserv_detail_page_form.member_name.value = member_name;
        document.reserv_detail_page_form.reserv_date.value = reserv_date;
        document.reserv_detail_page_form.reserv_start_time.value = reserv_start_time;
        document.reserv_detail_page_form.reserv_end_time.value = reserv_end_time;
        document.reserv_detail_page_form.reserv_host_mobile.value = reserv_host_mobile;
        document.reserv_detail_page_form.reserv_paystatement.value = reserv_paystatement;
        document.reserv_detail_page_form.reserv_regdate.value = reserv_regdate;
        document.reserv_detail_page_form.reserv_host_email.value = reserv_host_email;
        document.reserv_detail_page_form.reserv_updatedate.value = reserv_updatedate;
        document.reserv_detail_page_form.reserv_pay_limited.value = reserv_pay_limited;
        document.reserv_detail_page_form.reserv_paystatement.value = reserv_paystatement;

    </script>
    <div id="modalbd" class="modal_body">
        <div class="modal_contentArea">
            <%--  예약 상세 보기 --%>
            <%-- 예약 상세 폼--%>
            <form name="reserv_detail_page_form" action="/reservation/delete" method="post" datatype="json"
                  onkeyup="UpdatingReservAction()">
                <label>예약번호<input type="text" name="reserv_no" class="detatilModal" readonly/></label>

                <label>대여공간번호<input type="text" name="space_no" class="detatilModal" readonly/></label>

                <label>대여공간이름<input type="text" name="space_name" class="detatilModal" readonly/></label>

                <label>예약자번호<input type="text" name="reserv_hostcode" class="detatilModal" readonly/></label>

                <label>예약자이름<input type="text" name="member_name" class="detatilModal canWrite" readonly/></label>

                <label>예약지정날짜<input type="text" name="reserv_date" class="detatilModal canWrite" readonly/></label>

                <label>사용시작시간<input type="text" name="reserv_start_time" class="detatilModal canWrite"
                                    readonly/></label>

                <label>사용종료시간<input type="text" name="reserv_end_time" class="detatilModal canWrite" readonly/></label>

                <label>예약자 연락처<input type="text" name="reserv_host_mobile" class="detatilModal canWrite"
                                     readonly/></label>

                <label>결제 상태<input type="text" name="reserv_paystatement" class="detatilModal" readonly/></label>

                <label>예약 신청 날짜<input type="text" name="reserv_regdate" class="detatilModal" readonly/></label>

                <label>예약자 메일<input type="text" name="reserv_host_email" class="detatilModal canWrite"
                                    readonly/></label>

                <label>최종 수정날짜<input type="text" name="reserv_updatedate" class="detatilModal readonly"
                                     readonly/></label>

                <label>결제 시한 <input type="text" name="reserv_pay_limited" class="detatilModal" readonly/></label>
                <div>
                    <button id="goUpdatingReserv" type="button" class="btn btn-primary"
                            onclick="goUpdatingReservAction()">수정
                    </button>
                    <button id="goDeleteReserv" type="button" class="btn btn-primary" onclick="goDeleteReservAction(
        reserv_no           ,
        space_no            ,
        reserv_hostcode     ,
        reserv_date         ,
        reserv_start_time   ,
        reserv_end_time     ,
        reserv_host_mobile  ,
        reserv_paystatement ,
        reserv_host_email   ,
         )">삭제
                    </button>
                </div>
            </form>
            </p>
        </div>
    </div>
