<%--
  Created by IntelliJ IDEA.
  User: Moon
  Date: 2021-09-08
  Time: 오전 11:16
  To change this template use File | Settings | File Templates.
--%>
<div id="branchOfficeBoardDetailModal" class="modal" onclick="BranchOfficeDetailModalAction()">
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="java.util.*" %>
    <%@ page import="com.example.studiozen.DTO.SpaceDTO" %>
    <%
        List<SpaceDTO> branchOfficeSelectList = (List<SpaceDTO>) request.getAttribute("spaceSelectList");
        int size = 0;
    %>
    <div id="modalbd" class="modal_body">
        <form id="branchOfficeBoardDetailModalForm" name="branchOfficeBoardDetailModal" enctype="multipart/form-data">
            <table id="branchOfficeListTable" class="table branchOfficeBoardDetailTable" style="align-content: center">
                <thead>
                <tr>
                    <th id="branchoffice_name"></th>
                </tr>
                </thead>
                <tbody id="branchOfficeBoardDetailTableTbody">
                <tr>
                    <td>
                        <label for="branchoffice_no">지점 번호</label>
                        <input id="branchoffice_no" class="branchOfficeBoardDetailArea"/>
                    </td>
                </tr>
                <td>
                    <label for="branchOffice_local">지역</label>
                    <input id="branchOffice_local" class="branchOfficeBoardDetailArea"/>
                </td>
                <tr>
                    <td>
                        <label for="branchOffice_address">주소</label>
                        <input id="branchOffice_address" class="branchOfficeBoardDetailArea"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="branchOffice_mobile">전화번호</label>
                        <input id="branchOffice_mobile" class="branchOfficeBoardDetailArea"/>
                    </td>
                </tr>
                </tbody>

            </table>
            <%--            <input type="file" id="file" name="file" class="branchOfficeBoardDetailArea" multiple="multiple"/> <br/><br/>--%>
            <%--            <a href="#this" class="btn btn-warning" id="branchOfficeBoardDetailwrite" onclick="ClientQnaBoardWrite()">작성하기</a>--%>
        </form>
        <button id="spaceAddButton" class="btn btn-primary" style="font-size:1.5rem; display:none;">
            공간 추가
        </button>
    </div>

</div>


<%-- 대여공간 디테일 페이지의 툴팁 div 영역       --%>

<%--<div id="branchOfficeBoardDetailSpaceListModal" class="extraModal">--%>
<div id="extraModalBd" class="extraModal_body" style="display: none;">
    <form id="extraBranchOfficeBoardDetailModalForm" name="branchOfficeBoardDetailModal"
          enctype="multipart/form-data">
        <table id="spaceDetailTable" class="table branchOfficeBoardDetailTable" style="align-content: center">
            <thead>
            <th>
                <input id="space_name" class="spaceDetailArea"/>
            </th>
            </thead>
            <tbody id="spaceDetailTableTbody">
            <tr>
                <td>
                    <label for="space_no">대여공간 번호</label>
                </td>
                <td>
                    <input id="space_no" class="spaceDetailArea"/>
                </td>
            </tr>
            <td>
                <label for="space_description">설명</label></td>
            <td>
                <input id="space_description" class="spaceDetailArea"/>
            </td>
            <tr>
                <td>
                    <label for="space_capacity">면적</label></td>
                <td>
                    <input id="space_capacity" class="spaceDetailArea"/>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="space_maxpeople">수용가능인원</label></td>
                <td><input id="space_maxpeople" class="spaceDetailArea"/>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="space_basicprice">가격</label></td>
                <td>
                    <input id="space_basicprice" class="spaceDetailArea"/>
                </td>
            </tr>
            </tbody>
        </table>
    </form>


    <%-- 일정표 html  --%>
    <div id="spaceBookModalbd" class="spaceBookModal_body" style="display: none">
        <div class="container">
            <div class="my-calendar clearfix">
                <div class="clicked-date">
                    <div class="cal-day"></div>
                    <div class="cal-date"></div>
                </div>
                <div class="calendar-box">
                    <div class="ctr-box clearfix">
                        <button type="button" title="prev" class="btn-cal prev"><
                        </button>
                        <span class="cal-month"></span>
                        <span class="cal-year"></span>
                        <button type="button" title="next" class="btn-cal next">>
                        </button>
                    </div>
                    <table class="cal-table">
                        <thead>
                        <tr>
                            <th>S</th>
                            <th>M</th>
                            <th>T</th>
                            <th>W</th>
                            <th>T</th>
                            <th>F</th>
                            <th>S</th>
                        </tr>
                        </thead>
                        <tbody class="cal-body"></tbody>
                    </table>
                </div>
            </div>
            <!-- // .my-calendar -->
        </div>
        <div id="timeTableArea" style="margin-top: 1vw">
            <table id="timeTable">
                <tbody id="timeTableTbody">
                <tr class="timeTableTrTd">
                    <td id="timeTableTd1" class="timeTableTd">1</td>
                    <td id="timeTableTd2" class="timeTableTd">2</td>
                    <td id="timeTableTd3" class="timeTableTd">3</td>
                    <td id="timeTableTd4" class="timeTableTd">4</td>
                    <td id="timeTableTd5" class="timeTableTd">5</td>
                    <td id="timeTableTd6" class="timeTableTd">6</td>
                    <td id="timeTableTd7" class="timeTableTd">7</td>
                    <td id="timeTableTd8" class="timeTableTd">8</td>
                    <td id="timeTableTd9" class="timeTableTd">9</td>
                    <td id="timeTableTd10" class="timeTableTd">10</td>
                    <td id="timeTableTd11" class="timeTableTd">11</td>
                    <td id="timeTableTd12" class="timeTableTd">12</td>
                    <td id="timeTableTd13" class="timeTableTd">13</td>
                    <td id="timeTableTd14" class="timeTableTd">14</td>
                    <td id="timeTableTd15" class="timeTableTd">15</td>
                    <td id="timeTableTd16" class="timeTableTd">16</td>
                    <td id="timeTableTd17" class="timeTableTd">17</td>
                    <td id="timeTableTd18" class="timeTableTd">18</td>
                    <td id="timeTableTd19" class="timeTableTd">19</td>
                    <td id="timeTableTd20" class="timeTableTd">20</td>
                    <td id="timeTableTd21" class="timeTableTd">21</td>
                    <td id="timeTableTd22" class="timeTableTd">22</td>
                    <td id="timeTableTd23" class="timeTableTd">23</td>
                    <td id="timeTableTd24" class="timeTableTd">24</td>
                </tr>
                </tbody>
            </table>
        </div>
        <%-- 확인 버튼--%>
        <div id="bookButtonControlArea">
            <button id="bookSubmitButton" class="btn btn-warning"
                    style="margin-top: 1vw; font-family: fantasy; font-size: 2vw ">
                확인
            </button>
        </div>
    </div>

</div>

<%-- 타임 테이블 스크립트 --%>
<script>
    var timeTableTd = document.getElementsByClassName('timeTableTd');
    reserv_start_time;
    reserv_end_time;
    for (let i = 0; i < timeTableTd.length; i++) {
        timeTableTd.item(i).addEventListener('click', function () {
            event.stopPropagation();
            // const text = $(this).text();
            var activeTimeCell_length = document.getElementsByClassName('timeCell-active').length;
            if (activeTimeCell_length == 0) { // 선택된 시간의 길이가 0 일때 즉 아무것도 선택되지 않았을경우
                // $(this).addClass('timeCell-active');
                if (!event.target.classList.contains('timeCell-disabled')) { // 이벤트 대상에 클래스 네임 timeCell-disabled을 포함하지 않는다면
                    event.target.classList.add('timeCell-active'); // 이벤트 대상의 클래스에 'timeCell-active' 를 추가한다.
                    // tmp = $(this).text();
                    tmp = event.target.textContent; //tmp 값에 클릭된 선택된 요소(선택된 시간값을 저장)
                    // tmp = this.innerHTML; //tmp 값에 현재
                } else { //위의 조건을 만족하지 않으면 사용 불가능한 시간이 포함 되었다는 문구 출력;
                    alert('사용 불가능한 시간이 포함 선택되었습니다.');
                } //end of Else
            } else { //' activeTimeCell'클래스 네임을 포함하는 요소가 한개 이상이라면
                var first = 0; //first를 0
                var second = 0; // second 0으로 초기화 한다. 각각 초기화한다.
                var selectedNum = Number(this.innerHTML); // 현재 이벤트 타겟의 내용을 숫자형태로 selectedNum에 저장한다.
                // var selectedNum =Number($(this).text());   // JQuery 사용시

                if (tmp > selectedNum) { // tmp = 1, selectedNum = 24 false 이지만 true 라면
                    first = selectedNum; // first 가 slectedNum이 된다. 숫자가 역전될 경우에만 적용
                    second = tmp; //두번째 클릭이 tmp가 된다.
                } else { // tmp 가 selectedNum 보다 작다면  ex)1 < 24
                    first = tmp; //first =tmp   first가 1이 된다.
                    second = selectedNum; // second = selectedNum 24가 된다.
                }
                tmp = selectedNum; // 세번째 누를 경우를 대비하여 tmp를 두번째 클릭 된 값으로 저장한다. first =1 , second =24, tmp 24
                // $('.spring-babo').removeClass('skyblue');
                for (let i = 0; i < timeTableTd.length; i++) { // 모두 색 제거
                    timeTableTd.item(i).classList.remove('timeCell-active');
                } //end of 모든 칸 색 제거 for문   first =1 , second =24, tmp 24
                if (document.getElementsByClassName('timeTableTd').item(first - 1).classList.contains('timeCell-disabled') || document.getElementsByClassName('timeTableTd').item(second - 1).classList.contains('timeCell-disabled')) {
                    alert('사용 불가능한 시간이 선택되었습니다.-');
                }
                    // (!document.getElementsByClassName('timeTableTd').item(first).classList.contains('timeCell-disabled')&&
                //     (document.getElementsByClassName('timeTableTd').item(first)<document.getElementsByClassName('timeTableTd').item(second))
                else {
                    for (var i = first; i <= second; i++) { //i =23 , 23<=24(범위2)  23 ++
                        // $('.timeTableTd:nth-child('+i+')').addClass('timeCell-active');
                        if (!document.getElementsByClassName('timeTableTd').item(i - 1).classList.contains('timeCell-disabled')) {
                            document.getElementsByClassName('timeTableTd').item(i - 1).classList.add('timeCell-active');
                            //23-1 22번에 색칠. //24-1 23번에 색칠
                        }//End of if
                        else { // 클래스 리스트에 timeCell-disabled를 포함하는 요소가 있다면 오류 처리를 한다.
                            alert('사용 불가능한 예약 시간이 범위 내에 있습니다.');
                            for (let i = 0; i < timeTableTd.length; i++) { // 모두 색 제거
                                timeTableTd.item(i).classList.remove('timeCell-active');
                            }// end of For 문
                            break; // 포문이 여돌면서 에러창을 여러번 띄워주지 않아도 되므로 break.
                        }// end of Else
                    } // End of Else
                } //End of 색칠 for 문


                // document.getElementsByClassName('timeTableTd').FILTER(FUNTOIN(IDX, ITEM){RETURN IDX < 19 || IDX >= 20})
            }
            reserv_start_time = first;
            reserv_end_time = second;
        });
    }
    ;

    /* 예약 창에서 시간 고른 후 확인 버튼 */
    document.getElementById('bookSubmitButton').addEventListener('click', async function () {
        event.stopPropagation();
        console.log('예약확인버튼');
        // if(document.querySelector('span.cal-month').textContent==null){
        //     alert('날짜를 선택해주세요.');
        // }
        // else{
        tr_code = 'insert';
        reserv_no = 'any';
        space_no = space_no;
        reserv_hostcode = sessionStorage.sid.split('=')[1];
        // reserv_date = new Date().getFullYear() + '-' + document.querySelector('span.cal-month').innerText + '-' + document.querySelector("td.day.today.day-active").innerText;
        reserv_date = new Date().getFullYear() + '-' + document.getElementsByClassName('cal-month')[0].innerText + '-' + document.getElementsByClassName('day-active')[0].innerText;
        console.log(reserv_date);
        reserv_start_time;
        reserv_end_time;
        reserv_paystatement = 'ready';
        let xhr = new XMLHttpRequest();
        loadingElement.setAttribute('style','display:block');
        if ((reserv_end_time - reserv_start_time) >= 1) { // 한시간 이상 예약인 경우

            // tr_code               = 'insert';
            // reserv_no           = 'any';
            // space_no            = space_no;
            // reserv_hostcode     = sessionStorage.sid.split('=')[1];
            // reserv_date         = new Date().getFullYear()+'-'+document.querySelector('span.cal-month').textContent+'-'+document.querySelector("td.day.day-active").textContent;
            // reserv_start_time;
            // reserv_end_time;
            // reserv_paystatement = 'ready';

            xhr.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    loadingElement.setAttribute('style','display:none');
                    alert('예약이 완료되었습니다.');
                    BranchOfficeDetailModalAction();


                } // End of if-  xhr.onreadystatechange function if.

                // else {
                //     alert('에러가 발생했습니다. 나중에 다시 시도해주세요.');
                // }//End of Else - xhr.onreadystatechange function if Else;

            }// End of function - xhr.onreadystatechange function.

            xhr.open('Post', '/reservation/book');
            xhr.setRequestHeader('Content-Type', 'application/json');
            xhr.send(JSON.stringify({
                tr_code,
                reserv_no,
                space_no,
                reserv_hostcode,
                reserv_date,
                reserv_start_time,
                reserv_end_time,
                reserv_paystatement
            }));

        } else if ((reserv_end_time - reserv_start_time) <= -1) { //선택된 시간이 아예 없는 경우

            alert('최소 한시간 이상 시간 지정을 해주세요 .');
            BranchOfficeDetailModalAction();

        } //End of Else if

        else { //한시간 예약 선택한 경우
            reserv_end_time = reserv_start_time = tmp; // 한시간 선택한 경우 사용 마감 시간 = 시작 시간

            xhr.onreadystatechange = function () {

                if (this.readyState == 4 && this.status == 200) {
                    alert(reserv_start_time + '~' + reserv_end_time + '예약이 완료되었습니다.');
                    loadingElement.setAttribute('style','display:none');
                    BranchOfficeDetailModalAction();
                } // End of if-  xhr.onreadystatechange function if.

                else if(this.readyState == 3) { //
                    /* 1. UNSENT (숫자 0) : XMLHttpRequest 객체가 생성됨.

                    2. OPENED (숫자 1) : open() 메소드가 성공적으로 실행됨.

                    3. HEADERS_RECEIVED (숫자 2) : 모든 요청에 대한 응답이 도착함.

                    4. LOADING (숫자 3) : 요청한 데이터를 처리 중임.

                    5. DONE (숫자 4) : 요청한 데이터의 처리가 완료되어 응답할 준비가 완료됨.*/

                }//End of Else - xhr.onreadystatechange function if Else;
            }//End of xhr.onreadystatechange = function

            xhr.open('Post', '/reservation/book');
            xhr.setRequestHeader('Content-Type', 'application/json');
            xhr.send(JSON.stringify({
                tr_code,
                reserv_no,
                space_no,
                reserv_hostcode,
                reserv_date,
                reserv_start_time,
                reserv_end_time,
                reserv_paystatement
            })) // End of xhr.Send;
            // }  //End of Else
        }
    });// End of bookSubmitButton EventListener.

    /*

                let node = this;
                if (node.getAttribute("class") != "on") {
                    if (node.getAttribute("class") != "nv_disable") {
                        $(node).toggleClass("on");
                    }
                    let selectedBlockList = $("#blockList").find(".on");
                    if (selectedBlockList.length >= 2) {
                        let firstNode = selectedBlockList[0];
                        let lastNode = selectedBlockList[selectedBlockList.length - 1];
                        nodeClickOn(firstNode, lastNode, node);
                    }
                } else {
                    nodeClickOff(node);
                }
            });
        }

    */


    /*
                if (timeTableTd.item(i).classList.contains('timeCell-active')){
                    timeTableTd.item(i).classList.remove('timeCell-active');
                }else {
                    if (document.getElementsByClassName('timeCell-active').length ==1){
                    timeTableTd.item(i).classList.add('timeCell-active');
                        lastClickedTime = timeTableTd.item(i).textContent;
                    }
                    else if(document.getElementsByClassName('timeCell-active').length <1){
                        timeTableTd.item(i).classList.add('timeCell-active');
                        firstClickedTime = timeTableTd.item(i).textContent;
                    }
                    else if(document.getElementsByClassName('timeCell-active').length >=2){
                        for (let i = 0; i <timeTableTd.length ; i++) {
                            timeTableTd.item(i).classList.remove('timeCell-active');
                        }
                    }
                    else {
                        timeTableTd.item(i).classList.add('timeCell-active');
                    }
                };

                for (let i = 0; i < ; i++) {

                }


            });*/
    // };

</script>


<%-- 일정표 스크립트 --%>
<script>

    function drawingCalendar() {

        'use strict';
        console.log('==== > drawingCalendar 실행 === >  ');
        event.stopPropagation();
        // ================================
        // START YOUR APP HERE
        // ================================
        var init = {
            // monList: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
            monList: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'],// 배열로 월을 담아둠.
            dayList: ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'],//배열로 일을 담아둠.
            today: new Date(), //오늘 날짜 ex)Mon Nov 01 2021 16:19:33 GMT+0900 (한국 표준시)
            monForChange: new Date().getMonth(), //현재 월을 표시 getMonth는 0~11을 반환하기 때문에 현재 11월이면 10월 반환.
            activeDate: new Date(), //활성화날짜 날짜 생성 new Date()  = ex)Mon Nov 01 2021 16:19:33 GMT+0900 (한국 표준시)

            getFirstDay: (yy, mm) => new Date(yy, mm, 1), //yy년도 mm월에 해당하는 1일 반환
            getLastDay: (yy, mm) => new Date(yy, mm + 1, 0), //yy년도 mm월에 해당하는 마지막일 반환
            nextMonth: function () { // 다음달
                event.stopPropagation();
                let d = new Date(); // d = 날짜 객체 생성
                d.setDate(1); // 생성된 날짜 객체d 의 일을 1일로 변경.
                d.setMonth(++this.monForChange); // 생성된 날짜 객체 d의 월을 monForChange변경용으로 선언해둔 월에 1을 더한 값으로 변경.
                this.activeDate = d; //
                return d; // d를 반환;
            },
            prevMonth: function () { //이전달
                event.stopPropagation();
                let d = new Date(); //d = 날짜 객체 생성
                d.setDate(1); // 생성된 날짜 객체d 의 일을 1일로 변경.
                d.setMonth(--this.monForChange);//생성된 날짜 객체 d의 월을 monForChange변경용으로 선언해둔 월에 1을 뺀 값으로 변경.
                this.activeDate = d; //activeDate 의 값이 d가 된다
                return d; //d를 반환;
            },
            addZero: (num) => (num < 10) ? '0' + num : num, //addzero 로 들어온 num 이 10보다 작으면 num앞에0을 붙여서 반환하고, 아니라면 num을 그대로 반환한다.
            activeDTag: null, // activeDTag
            getIndex: function (node) { // getIndex 순서 찾기
                event.stopPropagation();
                let index = 0; // index 초기화
                while (node = node.previousElementSibling) {  //node의 이전 형제 엘리먼트 요소가 node와 같을때까지
                    index++;  //index1 씩증가
                }
                return index; // index 반환
            }
        };

        var $calBody = document.querySelector('.cal-body');
        var $btnNext = document.querySelector('.btn-cal.next');
        var $btnPrev = document.querySelector('.btn-cal.prev');

        /**
         * @param {number} date
         * @param {number} dayIn
         */
        function loadDate(date, dayIn) {  //날짜불러오기
            event.stopPropagation();
            document.querySelector('.cal-date').textContent = date; //.cal-date 클래스(왼편 일, 요일 표시화면)에서 일의 텍스트 문구는 파라미터로 넘겨진 date이다.
            document.querySelector('.cal-day').textContent = init.dayList[dayIn]; //.cal-date 클래스(왼편 일, 요일 표시화면)에서 요일의 텍스트 문구는 파라미터로 넘겨진 day로 init에서 찾아 적용한다.
        }

        /**
         * @param {date} fullDate
         */
        function loadYYMM(fullDate) { // 년월 불러오기, 파라미터 현재날짜 (날짜객체)
            event.stopPropagation();
            var yy = fullDate.getFullYear(); //현재 년도가 yy
            var mm = fullDate.getMonth(); //현재 월이 mm
            var firstDay = init.getFirstDay(yy, mm); //(yy, mm) => new Date(yy, mm, 1)에 yy,mm자리에 넣고 반환받은 요일.
            var lastDay = init.getLastDay(yy, mm);//(yy, mm) => new Date(yy, mm + 1, 0)에서 반환받은 요일.
            var markToday;  // for marking today date // 오늘 현재 일 체크

            if (mm === init.today.getMonth() && yy === init.today.getFullYear()) { //현재 월이 init에 today.getmonth값과 같고,년도가 yy와 현재 오늘 yy 같다면
                markToday = init.today.getDate(); // 오늘 날짜는 init에 들어있는 일자를 오늘날짜 체크하기로
            }

            document.querySelector('.cal-month').textContent = init.monList[mm]; //오른편 상단에 보여지는 년월에서 월은 mm이 파라미터로 들어가서 동일한 monList를 찾아 돌려준다.
            document.querySelector('.cal-year').textContent = yy; // 우측 상단에 cal-year = 년도의 값은 yy이다.

            var trtd = ''; //trtd 셀의 열과 줄
            var startCount; //카운트 세는 초기값
            var countDay = 0; // 일을 세우는 초기값
            for (let i = 0; i < 6; i++) { //최대 6주
                trtd += '<tr>'; //tr최대 6주 6줄 생성
                for (let j = 0; j < 7; j++) { // 최대 7일
                    // i가 0이고, 그리고 startCount가 아니고, (getDay는 0= 일요일~ 로 시작해서 숫자로 요일을 반환한다.) j와 요일을 반환하는 숫자가 같다면
                    if (i === 0 && !startCount && j === firstDay.getDay()) {
                        startCount = 1;//startCount(해당 달의 1일이다.)
                    } //End of If
                    if (!startCount) { //만약 startCount가 0이라면
                        trtd += '<td>' //빈 셀만 만든다.
                    } else { // 해당 달의 1일에 해당하는 조건에도 맞지않고, starCount가 1이나 0도 아니라면
                        // let fullDate = yy + '.' + init.addZero(mm + 1) + '.' + init.addZero(countDay + 1);
                        trtd += '<td class="day'; // 'day' 클래스네임을 갖는 셀을 tr td에 append 하고
                        //markToday는 현재 일자와 비교되어 확인된 현재 일자이고, 현재 일자가 날짜를 세는 countDay의 값에 +1, 즉 첫번째 카운트 되는 수와 현재 일자가 같으면
                        trtd += (markToday && markToday === countDay + 1) ? ' today" ' : '"'; //today class 를 갖게 된다. 아니라면 넘어간다.
                        <%--trtd += ` data-date="${countDay + 1}" data-fdate="${fullDate}">`;--%>
                        // trtd += `data-date="`+(countDay+1)+`">`; // data-date
                        trtd += `>`;
                    } //End of Else.

                    trtd += (startCount) ? ++countDay : ''; // startCoutnt라면 countDay를 1 증가시킨다.
                    if (countDay === lastDay.getDate()) { //CountDay 와 마지막 요일의 일자가 같다면
                        startCount = 0; // startCount를 0으로 초기화한다.
                    } // End of If
                    trtd += '</td>'; // trtd에 </td> 추가
                } //최대 7일 즉 한주 로우 반복문 끝
                trtd += '</tr>'; //<tr> 추가
            } //한달 포문 주 끝.
            $calBody.innerHTML = trtd; // $calBody에 trtd html 문 추가
        } // end of function loadYYMM(fullDate)

        /*
            /!**
             * @param {string} val
             *!/
            function createNewList(val) {
                event.stopPropagation();
                var id = new Date().getTime() + '';
                var yy = init.activeDate.getFullYear();
                var mm = init.activeDate.getMonth() + 1;
                var dd = init.activeDate.getDate();
                var $target = $calBody.querySelector(`.day[data-date="










        ${dd}"]`);

        var date = yy + '.' + init.addZero(mm) + '.' + init.addZero(dd);

        var eventData = {};
        eventData['date'] = date;
        eventData['memo'] = val;
        eventData['complete'] = false;
        eventData['id'] = id;
        init.event.push(eventData);
        $todoList.appendChild(createLi(id, val, date));
    }
    */

        loadYYMM(init.today); // today: new Date() 날짜 객체 파라미터 넣어줌
        loadDate(init.today.getDate(), init.today.getDay()); // 오늘 날짜 객체의 일자와 요일을 넣어서 출력 해주는 함수

        $btnNext.addEventListener('click', () => loadYYMM(init.nextMonth())); // next Btn에 클릭 이벤트로 LoadYYMM 함수호출 파라미터로 다음달 입력
        $btnPrev.addEventListener('click', () => loadYYMM(init.prevMonth())); // prev Btn에 클릭 이벤트로 LoadYYMM 함수 호출 파라미터로 이전달 입력

        $calBody.addEventListener('click', (e) => {   // calBody  달력 본체에 클릭 이벤트와 해당 이벤트 요소 파람
            if (e.target.classList.contains('day')) { // 이벤트 발생 요소에 클래스에 day가 포함되어 있다면
                if (init.activeDTag) { //activeDtag 가 null아니면
                    init.activeDTag.classList.remove('day-active'); //activeDtag의 class name중 'day-active'를 삭제한다.
                } //end of if(init.activeDTag)
                let day = Number(e.target.textContent); // let day 는 타겟이 갖고 있는 텍스트를 숫자로 변환한 값이다. 즉 몇일인지가 된다.
                loadDate(day, e.target.cellIndex); //loadDate 함수에 파람으로 몇일인지와  발생요소가 무슨 요일인지 (cellIndex는 열을 반환한다. 현재 열이 일~토, 0~6을 나타내기 때문에 요일을 반환하는 getday와 비슷하다. ) 그러므로 파람에 몇 일인지와 요일을 넣는다.
                e.target.classList.add('day-active'); // day가 포함되어 있고 dTag가 널이니까 dayActive를 클래스에 추가한다.
                init.activeDTag = e.target; // activeDtag의 값을null이나 다른 값이 아닌 현재 요소로 변경해준다.
                init.activeDate.setDate(day); // 활성화된 일을 setDate 일자 세팅에 day 클릭된 날짜를 넣어 주어 변경 한다.
                // reloadTodo();
                loadBookedReserv(e.target);
            }
            ; // end of if (e.target.classList.contains('day'))

        }); // end of $calBody.addEventListener


        // document.querySelector('td.day.day-active').addEventListener('click',loadBookedReserv(e));
        /* 선택된 날짜 예약현황 보기*/
        function loadBookedReserv(e) {
            for (let i = 0; i < document.getElementsByClassName('timeTableTd').length; i++) {

                if (document.getElementsByClassName('timeTableTd').item(i).classList.contains('timeCell-disabled')) {
                    document.getElementsByClassName('timeTableTd').item(i).classList.remove('timeCell-disabled');
                }
                ; // end of if contains('timeCell-disabled');
            }//end of for


            console.log('날짜별 예약 현황 보기')
            var targetday = e.textContent;
            var choosenday = (targetday) => (targetday < 10) ? '0' + targetday : targetday;
            choosenDate = document.querySelector('.cal-year').textContent + '-' + document.querySelector('.cal-month').textContent + '-' + choosenday(targetday);
            console.log(choosenDate);
            let xhr = new XMLHttpRequest;
            loadingElement.setAttribute('style','display:block');
            xhr.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    loadingElement.setAttribute('style','display:none');
                    var booKedTimeList = JSON.parse(xhr.response);

                    console.log(booKedTimeList);

                    for (let i = 0; i < booKedTimeList.length; i++) { // i = 0; 0<2 예약건수가 몇개인지 ex) 0,1 반복 2번;i가 1씩 증가
                        var startTime = Number(booKedTimeList[i].reserv_start_time); // 예약 시작시간 List안에서 [i]번째의 시작시간
                        var endTime = booKedTimeList[i].reserv_end_time; // 예약 종료 시간 List안에서 [i]번째의 종료시간
                        var del_sign = booKedTimeList[i].reserv_del_sign; // 예약이 유효한지 플래그값 확인
                        var j = Number(startTime); // 시작시간을 원시타입 변수로
                        for (let i = 0; i < endTime - startTime + 1; i++) {//12 ; 12 <= (5=(16-12+1)); 12++
                            console.log('반복횟수 ===>' + i);
                            console.log(del_sign);
                            if (del_sign == 'N') {
                                document.getElementById('timeTableTd' + j).classList.add('timeCell-disabled');
                            }

                            // document.getElementById('timeTableTd'+j).classList.remove('timeTableTd');
                            ++j;
                            console.log('닫는 번호 ===>' + j);
                        }

                        console.log(booKedTimeList[i].reserv_start_time);
                        console.log(booKedTimeList[i].reserv_end_time);
                    }

                }

            }
            xhr.open('POST', '/reservation/bookedTimeCheck');
            xhr.setRequestHeader('Content-Type', 'application/json');
            xhr.send(JSON.stringify({space_no, reserv_date: choosenDate}));
        };
    } // end of function drawingCalendar() ;

</script>


<%-- 대여공간 디테일 창 스크립트 --%>
<script>

    'use strict';

    spaceBookButton = document.createElement("button");
    spaceBookButton.setAttribute("id", "spaceBookButton");
    spaceBookButton.setAttribute("style", "font-size:1.5rem");
    spaceBookButton.innerText = "예약";
    spaceBookButton.className = "btn btn-primary";

    spaceUpdateButton = document.createElement("button");
    spaceUpdateButton.setAttribute("id", "spaceUpdateButton");
    spaceUpdateButton.setAttribute("style", "font-size:1.5rem");
    spaceUpdateButton.innerText = "수정";
    spaceUpdateButton.className = "btn btn-primary";

    spaceDeleteButton = document.createElement("button");
    spaceDeleteButton.setAttribute("id", "spaceDeleteButton");
    spaceDeleteButton.setAttribute("style", "font-size:1.5rem");
    spaceDeleteButton.innerText = "삭제";
    spaceDeleteButton.className = "btn btn-primary";

    spaceUpdateSubmitButton = document.createElement("button");
    spaceUpdateSubmitButton.setAttribute("id", "spaceUpdateSubmitButton");
    spaceUpdateSubmitButton.setAttribute("style", "font-size:1.5rem; display:none;");
    spaceUpdateSubmitButton.innerText = "확인";
    spaceUpdateSubmitButton.className = "btn btn-primary";

    spaceUpdateAbortButton = document.createElement("button");
    spaceUpdateAbortButton.setAttribute("id", "spaceUpdateAbortButton");
    spaceUpdateAbortButton.setAttribute("style", "font-size:1.5rem; display:none;");
    spaceUpdateAbortButton.innerText = "취소";
    spaceUpdateAbortButton.className = "btn btn-warning";

    /* 추가 확인 버튼 생성 */
    // spaceAddSubmitButton = document.createElement("button");
    // spaceAddSubmitButton.setAttribute("id","spaceDeleteButton");
    // spaceAddSubmitButton.setAttribute("style","font-size:1.5rem; display:none;");
    // spaceAddSubmitButton.innerText = "확인";
    // spaceAddSubmitButton.className="btn btn-primary";

    /* 클라이언트 페이지에서는 예약하기 버튼 */
    document.getElementById("extraModalBd").append(spaceBookButton);


    /* 관리자일 경우 대여공간 디테일 모달창에 버튼 추가 파트 */
    if ((sessionStorage.getItem("sid").split("=")[1]) == 'MEM282108') {
        //대여공간 디테일 모달창에 수정 버튼 추가
        document.getElementById("extraModalBd").append(spaceUpdateButton);
        //대여공간 디테일 모달창에 수정 확인 버튼 추가
        document.getElementById("extraModalBd").append(spaceUpdateSubmitButton);
        //대여공간 디테일 모달창에 수정창 취소 추가
        document.getElementById("extraModalBd").append(spaceUpdateAbortButton);
        //대여공간 디테일 모달창에 삭제 추가
        document.getElementById("extraModalBd").append(spaceDeleteButton);
    }


</script>
<%-- ////////////////   디테일 페이지의 툴팁 div 영역 끝      --%>


<%--    디테일 페이지의 자바스크립트--%>
<script>


    //use Strcit 사용
    'use strict'

    /* Tbody 태그에 적용되어있는 커서 모양 해제 */
    document.getElementById("branchOfficeBoardDetailTableTbody").setAttribute('style', 'cursor:default')

    /* 디테일의 페이지 이름을 세션에 넣고 받아 넘겨준다. */
    /* 세션에 저장된 지점 이름을 텍스트 형태 Thead 태그로 넘겨준다*/
    document.getElementById("branchoffice_name").innerText = sessionStorage.getItem("branchoffice_name");
    /* 세션에 저장된 지점의 번호를 ID로 찾은 인풋태그에 넘겨준다. */
    document.getElementById("branchoffice_no").value = sessionStorage.getItem("branchoffice_no");
    /* 세션에 저장된 지점의 지역명을 ID로 찾은 인풋태그에 넘겨준다. */
    document.getElementById("branchOffice_local").value = sessionStorage.getItem("branchOffice_local");
    /* 세션에 저장된 지점의 주소를 ID로 찾은 인풋태그에 넘겨준다. */
    document.getElementById("branchOffice_address").value = sessionStorage.getItem("branchOffice_address");
    /* 세션에 저장된 지점의 전화번호를 ID로 찾은 인풋태그에 넘겨준다. */
    document.getElementById("branchOffice_mobile").value = sessionStorage.getItem("branchOffice_mobile");

    /* 생성된 위의 지점 항목들에 className = "branchOfficeBoardDetailArea"을 주고 읽기전용 속성 및 경계선 속성 추가 */
    document.querySelectorAll(".branchOfficeBoardDetailArea").forEach(function (e) {
        e.setAttribute("readonly", "readonly");
        e.setAttribute("border-width", "0");
    });

    /* 생성시 테스트 코드 및 레거시 */
    // const extraTr = document.createElement("tr");
    // const extraTd = document.createElement("td");
    // let extraTextNodeSpaceTitle = document.createTextNode("대여 공간 리스트");
    // let extraCell = extraTr.appendChild(extraTd);
    // document.getElementById("branchOfficeBoardDetailTableTbody").appendChild(extraTr);
    // document.getElementById("branchOfficeBoardDetailTableTbody").lastElementChild.appendChild(extraTd);
    // document.getElementById("branchOfficeBoardDetailTableTbody").lastElementChild.lastElementChild.appendChild(extraTextNodeSpaceTitle);
    // document.getElementById("branchOfficeBoardDetailTableTbody").before(document.getElementById("branchOfficeBoardDetailTableTbody").lastElementChild)

    /* 지점 번호에 매칭되는 공간 데이터가 있다면  */
    <% if (branchOfficeSelectList.size()!=0){
        /* "branchOfficeBoardDetailTableTbody"의 Id를 가진 Tbody 요소의 마지막에 <tr>태그 추가 */
        out.print("document.getElementById(\"branchOfficeBoardDetailTableTbody\").appendChild(document.createElement(\"tr\"));\n");
        /* "branchOfficeBoardDetailTableTbody"의 Id를 가진 Tbody 요소의 마지막자식 엘리먼트 요소에 <td>태그 추가  */
        out.print("document.getElementById(\"branchOfficeBoardDetailTableTbody\").lastElementChild.appendChild(document.createElement(\"td\"));\n");
        /* "branchOfficeBoardDetailTableTbody"의 Id를 가진 Tbody 요소의 마지막자식 엘리먼트 요소가 가진 태그 중 td 태그를 찾고 대여공간 리스트라는 자식 텍스트 노드를 추가  */
        out.print("document.getElementById(\"branchOfficeBoardDetailTableTbody\").lastElementChild.getElementsByTagName(\"td\").item(0).appendChild(document.createTextNode(\"대여 공간 리스트\"));\n");
        /* "branchOfficeBoardDetailTableTbody"의 Id를 가진 Tbody 요소의 마지막 엘리먼트 자식요소에 id="SpaceList_Head" 추가*/
        out.print("document.getElementById(\"branchOfficeBoardDetailTableTbody\").lastElementChild.id=\"SpaceList_Head\";\n");

            /* branchOfficeSelectList에 들어있는 각 지점별 공간정보 중에 Name만 출력하려는 반복문 */
            for (SpaceDTO index: branchOfficeSelectList) {

                /* branchOfficeBoardDetailTableTbody ID를 가진 엘리먼트 요소의 마지막에 TR태그를 생성 하고 추가함. */
                out.print("document.getElementById(\"branchOfficeBoardDetailTableTbody\").appendChild(document.createElement(\"tr\"));\n");

                // 동적일 필요 없음.
//              out.print("document.getElementById(\"branchOfficeBoardDetailTableTbody\").lastElementChild.className=\""+index.getBranchoffice_no()+"_SpaceList\";");

                /* branchOfficeBoardDetailTableTbody ID를 가진 엘리먼트 요소의 마지막 자식 엘리먼트 요소에 클래스네임 부여 */
                out.print("document.getElementById(\"branchOfficeBoardDetailTableTbody\").lastElementChild.className=\"spaceList\"; \n");
                /* branchOfficeBoardDetailTableTbody ID를 가진 엘리먼트 요소의 마지막 자식 엘리먼트 요소의 자식 요소 중 마지막 요소 안에 td 태그 생성 후 추가  */
                out.print("document.getElementById(\"branchOfficeBoardDetailTableTbody\").lastElementChild.appendChild(document.createElement(\"td\"));\n");
                /* 대여 공간 이름을 제외한 것들의 정보를 쏟아 놓기 위한 div */
                out.print("document.getElementById(\"branchOfficeBoardDetailTableTbody\").lastElementChild.appendChild(document.createElement(\"div\"));\n");
                /* 대여공간 정보가 담기는 div 태그에 클래스명 부여 */
                out.print("document.getElementById(\"branchOfficeBoardDetailTableTbody\").lastElementChild.getElementsByTagName(\"div\").item(0).className=\"spaceInfo\" \n");
                /* branchOfficeBoardDetailTableTbody ID를 가진 엘리먼트 요소의 마지막 자식 엘리먼트 요소의 중에 태그이름이 td 인 요소의 첫번째 인덱스에 대여공간 이름 추가 */
                out.print("document.getElementById(\"branchOfficeBoardDetailTableTbody\").lastElementChild.getElementsByTagName(\"td\").item(0).appendChild(document.createTextNode(\""+index.getSpace_name()+"\"));\n");

                out.print("document.getElementById(\"branchOfficeBoardDetailTableTbody\").lastElementChild.getElementsByTagName(\"div\").item(0).appendChild(document.createTextNode(\""+index.getSpace_no()+"/"+index.getSpace_description()+"/"+index.getSpace_capacity()+"/"+index.getSpace_maxpeople()+"/"+index.getSpace_basicprice()+"\"));\n");

            }
                out.print(
                // div 속 정보를 들고 있는 상태인 div를 감추기 위한 속성 설정.
                         "for (var i = 0; i < document.getElementsByClassName(\"SpaceInfo\").length; i++) \n{"+
                         "document.getElementsByClassName(\"SpaceInfo\").item(i).setAttribute(\"style\", \"display:none;\");"+
                         "};\n"+

                         "for (var i = 0; i < document.getElementsByClassName(\"spaceDetailArea\").length; i++) \n{"+
                         "document.getElementsByClassName(\"spaceDetailArea\").item(i).setAttribute(\"readonly\", \"readonly\");\n"+
                         "document.getElementsByClassName(\"spaceDetailArea\").item(i).setAttribute(\"style\",\"border-width :0; text-align:center;\");\n"+
//                         "document.getElementsByClassName(\"spaceDetailArea\").item(i).setAttribute(\"style\",\"text-align:center\");\n"+
                         "};\n"
                  );
    }
     %>



    /*
    /!* 지점의 대여공간 목록 (className="spaceList"인 항목들에 마우스 오버가 아닐시 상세 정보를 보여주게 하는 이벤트 리스너 *!/
    for (let i = 0; i < spaceList.length; i++) {
        spaceList.item(i).addEventListener("mouseleave",function () {
            console.log(" 마우스 리브");

            document.getElementById("branchOfficeBoardDetailSpaceListModal").style.display = "none";
            document.getElementById("branchOfficeBoardDetailSpaceListModal").classList.remove("show");
        })
    }
*/

</script>

<script>

    /*  spaceList라는 클래스 네임을 가진 요소 변수 지정 */
    var spaceList = document.getElementsByClassName("spaceList");
    var spaceInfo = document.getElementsByClassName("spaceInfo");

    /* 추가버튼 생성 */
    spaceAddSubmitButton = document.createElement("button");
    spaceAddSubmitButton.setAttribute("id", "spaceAddSubmitButton");
    spaceAddSubmitButton.setAttribute("style", "font-size:1.5rem; display:none;");
    spaceAddSubmitButton.innerText = "추가";
    spaceAddSubmitButton.className = "btn btn-primary";
    /*  대여공간 디테일 모달창에 추가버튼 추가  */
    document.getElementById("extraModalBd").append(spaceAddSubmitButton);

    /* 대여공간 디테일 창에서 수정버튼 이벤트 리스너 */
    if (document.getElementById("spaceUpdateButton") != null) {
        document.getElementById("spaceUpdateButton").addEventListener('click', function () {
            /* 이벤트 전파 막기*/
            event.stopPropagation();
            /* 수정 버튼이 눌렀을 때 수정 버튼 숨김. */
            document.getElementById("spaceUpdateButton").style.display = "none";
            /* 수정 버튼이 눌렸을 때 확인 버튼 나타남. */
            document.getElementById("spaceUpdateSubmitButton").style.display = "block";
            /* 수정 버튼이 눌렸을 때 취소 버튼 나타남. */
            document.getElementById("spaceUpdateAbortButton").style.display = "block";
            /* 석제 버튼 가림*/
            document.getElementById("spaceDeleteButton").style.display = "none";
            /* 수정 버튼 누르면 읽기전용 속성 삭제*/
            for (let i = 0; i < document.getElementsByClassName("spaceDetailArea").length; i++) {
                document.getElementsByClassName("spaceDetailArea").item(i).removeAttribute("readonly");
            }

        });
    }
    ;
    //수정 버튼 이벤트 리스너 끝//


    /* 수정버튼 후 나오는 취소 버튼 이벤트 리스너, 다시 수정버튼만 나오게끔 */
    if (document.getElementById("spaceUpdateAbortButton") != null) {
        document.getElementById("spaceUpdateAbortButton").addEventListener("click", function () {
            /* 이벤트 전파 막기*/
            event.stopImmediatePropagation();
            /* 수정 버튼이 눌렀을 때 수정 버튼 나타냄. */
            if (document.getElementById("spaceUpdateButton") != null) {
                document.getElementById("spaceUpdateButton").style.display = "block";
                /* 수정 버튼이 눌렸을 때 확인 버튼 숨김. */
                document.getElementById("spaceUpdateSubmitButton").style.display = "none";
                /* 수정 버튼이 눌렸을 때 취소 버튼 숨김. */
                document.getElementById("spaceUpdateAbortButton").style.display = "none";
                /* 수정버튼 취소 누르면 삭제 버튼 나타냄 */
                document.getElementById("spaceDeleteButton").style.display = "block";
            }

        });
    }
    ;
    // 취소 버튼 이벤트 리스너 끝//


    /* 수정 확인 버튼 이벤트 리스너 */
    if (document.getElementById("spaceUpdateSubmitButton") != null) {
        document.getElementById("spaceUpdateSubmitButton").addEventListener("click", function () {
            event.stopImmediatePropagation();
            let xhr = new XMLHttpRequest();
            loadingElement.setAttribute('style','display:block');
            // let newBranchOfficeUpdateFormData = document.getElementById("extraBranchOfficeBoardDetailModalForm");

            var p_space_no = document.getElementById("space_no").value;
            var p_space_name = document.getElementById("space_name").value;
            var p_space_basicprice = document.getElementById("space_basicprice").value;
            var p_space_maxpeople = document.getElementById("space_maxpeople").value;
            var p_space_capacity = document.getElementById("space_capacity").value;
            var p_space_description = document.getElementById("space_description").value;
            // var p_branchoffice_no = document.getElementById("branchoffice_no").value;
            var p_branchoffice_no = document.getElementById("space_no").value.split("S")[0];

            let spaceFormData = new FormData();
            spaceFormData.append('tr_code', 'UPDATE');
            spaceFormData.append('space_no', p_space_no);
            spaceFormData.append('space_basicprice', p_space_basicprice);
            spaceFormData.append('space_maxpeople', p_space_maxpeople);
            spaceFormData.append('space_capacity', p_space_capacity);
            spaceFormData.append('space_name', p_space_name);
            spaceFormData.append('space_description', p_space_description);
            spaceFormData.append('branchoffice_no', p_branchoffice_no);

            for (var pair of spaceFormData.entries()) {
                console.log(pair);
            }

            xhr.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200){
                alert(xhr.responseText);
                loadingElement.setAttribute('style','display:none');
                /* 수정 버튼이 눌렀을 때 수정 버튼 나타냄. */
                document.getElementById("spaceUpdateButton").style.display = "block";
                /* 수정 버튼이 눌렸을 때 확인 버튼 숨김. */
                document.getElementById("spaceUpdateSubmitButton").style.display = "none";
                /* 수정 버튼이 눌렸을 때 취소 버튼 숨김. */
                document.getElementById("spaceUpdateAbortButton").style.display = "none";
                /* 삭제 버튼 나타냄 */
                document.getElementById("spaceDeleteButton").style.display = "block";

                }
            };
            // AJAX는 반대로 제출 버튼을 누르면 기본 폼 동작은 e.preventDefault()로 멈추고, 페이지 전환 없이 데이터를 전송합니다.
            xhr.open('post', '/space/update', true);
            xhr.send(spaceFormData);
        });
    }
    ;

    // spaceList라는 이름의 클래스에 style - 커서 포인터 속성 추가.
    for (let i = 0; i < document.getElementsByClassName("spaceList").length; i++) {
        document.getElementsByClassName("spaceList").item(i).setAttribute("style", "cursor:pointer");
    }


    /* 지점의 대여공간 목록 디테일 이벤트 리스너 (className="spaceList"인 항목들에 마우스 클릭시 상세 정보를 보여주게 하는 이벤트 리스너 */
    for (let i = 0; i < spaceList.length; i++) {

        /* Space Detail Listener Function */
        spaceList.item(i).addEventListener("click", function () {
            console.log(" 마우스 클릭");
            event.stopImmediatePropagation();

            var spaceListTextString = spaceInfo.item(i).textContent.split("/");

            space_name = spaceList.item(i).getElementsByTagName("td").item(0).textContent;
            space_no = spaceListTextString[0];
            space_description = spaceListTextString[1];
            space_capacity = spaceListTextString[2];
            space_maxpeople = spaceListTextString[3];
            space_basicprice = spaceListTextString[4];

            document.getElementById("space_name").value = space_name;
            document.getElementById("space_no").value = space_no;
            document.getElementById("space_description").value = space_description;
            document.getElementById("space_capacity").value = space_capacity;
            document.getElementById("space_maxpeople").value = space_maxpeople;
            document.getElementById("space_basicprice").value = space_basicprice;

            /* 추가확인버튼 사라짐 */
            document.getElementById("spaceAddSubmitButton").style.display = "none";
            /* 예약 버튼 나타냄 */
            document.getElementById("spaceBookButton").style.display = "block";

            /* 대여 공간 디테일창을 관리자가 봤을 때*/
            if ((sessionStorage.getItem("sid").split("=")[1]) == 'MEM282108') {
                event.stopPropagation();
                console.log("관리자가 디테일 창을 본다. 확인.");
                document.getElementById("spaceUpdateButton").style.display = "block;";
                document.getElementById("spaceDeleteButton").style.display = "block";

            }

            // /* 대여공간 디테일 모달창이 열려 있을 때 클릭시 닫힘.*/
            if (!document.getElementById("extraModalBd").classList.contains('show')) {
                // document.getElementById("branchOfficeBoardDetailModal").removeEventListener("click",BranchOfficeDetailModalAction,true);
                // document.getElementById("branchOfficeBoardDetailSpaceListModal").style.marginLeft = "25%";
                document.getElementById("extraModalBd").classList.add("show");
                document.getElementById("extraModalBd").style.display = "block";
                if (document.getElementById("spaceUpdateButton") != null) {
                    document.getElementById("spaceUpdateButton").style.display = "block";
                    document.getElementById("spaceUpdateSubmitButton").style.display = "none";
                    document.getElementById("spaceUpdateAbortButton").style.display = "none";
                }

            }// else {
            //     /* 대여공간 디테일 모달창이 열려 있지 않는 상태에서 창이 닫히면*/
            //     // document.getElementById("branchOfficeBoardDetailModal").removeEventListener("click",BranchOfficeDetailModalAction,false);
            //     document.getElementById("extraModalBd").classList.remove("show");
            //     document.getElementById("extraModalBd").style.display = "none";
            //
            // }
        });
    }  //  끝 // 지점의 대여공간 목록 디테일 이벤트 리스너 끝 //


    /!* 모달창 켜져있을때 클릭시 모달창 닫기 *!/

    function BranchOfficeDetailModalAction() {
        console.log("모달창 떠있으니 닫자");
        console.log(" BranchOfficeDetailModalAction 작동");
        // event.stopPropagation();
        var body = document.querySelector('body');
        var modal = document.querySelector('.modal');

        // document.getElementById("extraModalBd").classList.remove("show");
        // document.getElementById("extraModalBd").style.display = "none";
        if (document.getElementById("extraModalBd").classList.contains('show')) {
            document.getElementById("extraModalBd").classList.remove("show");
            document.getElementById("extraModalBd").style.display = "none";
            if (document.getElementById("spaceUpdateButton") != null) {
                document.getElementById("spaceUpdateButton").style.display = "block";
                document.getElementById("spaceUpdateSubmitButton").style.display = "none";
                document.getElementById("spaceUpdateAbortButton").style.display = "none";
            }
            if (document.getElementById("spaceAddSubmitButton") != null) {
                document.getElementById("spaceAddSubmitButton").style.display = "none";
            }
            ;
            // if (document.getElementById("spaceBookModalbd")!=null){
            // document.getElementById("spaceBookModalbd").style.display = "none";
            // }
            if (document.getElementById("spaceBookModalbd") != null) {
                document.getElementById("spaceBookModalbd").style.display = "none";
            }
        }

        if (event.target === modal) {
            modal.classList.toggle('show');

            if (!modal.classList.contains('show')) {
                body.style.overflow = 'auto';
            }
        }
    };


    /* 예약 모달창 켜져있을때 클릭시 모달창 닫기 달력 닫기*/
    function SpaceBookModalAction() {
        event.stopPropagation();
        var body = document.querySelector('body');
        var modal = document.querySelector('.modal');
        console.log("모달창 떠있으니 닫자");

        document.getElementById("spaceBookModal").style.display = "none";

    };

    /* 공간 추가 버튼 이벤트 리스너  */
    document.getElementById("spaceAddButton").addEventListener('click', function () {
        console.log("aa");
        event.stopPropagation(); // 이벤트 전파 방지
        document.getElementById("extraModalBd").classList.add("show");

        /* 수정 폼을 재활용위한 input태그 내부 값 초기화 */
        // document.getElementById("extraModalBd").style.display = "block";
        document.getElementById("extraBranchOfficeBoardDetailModalForm").reset();

        /* 업데이트 예약 삭제 버튼은 사용X */
        document.getElementById("spaceUpdateButton").style.display = "none";
        document.getElementById("spaceDeleteButton").style.display = "none";
        document.getElementById("spaceBookButton").style.display = "none";

        /* 공간 추가 확인 버튼 가시 */
        // document.getElementById("spaceAddButton").style.display = "block";
        document.getElementById("spaceAddSubmitButton").style.display = "block";

        for (let i = 0; i < document.getElementsByClassName("spaceDetailArea").length; i++) {
            document.getElementsByClassName("spaceDetailArea").item(i).removeAttribute("readonly");
        }


        /*
                if (!document.getElementById("extraModalBd").classList.contains('show')) {
                    // document.getElementById("branchOfficeBoardDetailModal").removeEventListener("click",BranchOfficeDetailModalAction,true);
                    // document.getElementById("branchOfficeBoardDetailSpaceListModal").style.marginLeft = "25%";
                    document.getElementById("extraModalBd").classList.add("show");
                    document.getElementById("extraModalBd").style.display = "block";

                } else {
                    /!* 대여공간 디테일 모달창이 열려 있지 않는 상태에서 창이 닫히면*!/
                    // document.getElementById("branchOfficeBoardDetailModal").removeEventListener("click",BranchOfficeDetailModalAction,false);
                    document.getElementById("extraModalBd").classList.remove("show");
                    document.getElementById("extraModalBd").style.display = "none";

                }
        */

    });


    /* 대여 공간 추가 버튼 이벤트 리스너*/
    document.getElementById("spaceAddSubmitButton").addEventListener('click', function () {
        event.stopImmediatePropagation();

        let xhr = new XMLHttpRequest();
        loadingElement.setAttribute('style','display:block');
        tr_code = "insert";
        space_no = document.getElementById("space_no").value;
        space_name = document.getElementById("space_name").value;
        space_basicprice = document.getElementById("space_basicprice").value;
        space_maxpeople = document.getElementById("space_maxpeople").value;
        space_capacity = document.getElementById("space_capacity").value;
        space_description = document.getElementById("space_description").value;
        branchoffice_no = document.getElementById("branchoffice_no").value;


        xhr.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                loadingElement.setAttribute('style','display:none');
                // 추가 버튼 누르면 모달 창 닫힘.
                var body = document.querySelector('body');
                var modal = document.querySelector('.modal');
                console.log("모달창 떠있으니 닫자");

                // document.getElementById("extraModalBd").classList.remove("show");
                // document.getElementById("extraModalBd").style.display = "none";
                if (document.getElementById("extraModalBd").classList.contains('show')) {
                    document.getElementById("extraModalBd").classList.remove("show");
                    document.getElementById("extraModalBd").style.display = "none";
                    document.getElementById("spaceUpdateButton").style.display = "block";
                    document.getElementById("spaceUpdateSubmitButton").style.display = "none";
                    document.getElementById("spaceUpdateAbortButton").style.display = "none";
                    document.getElementById("spaceAddSubmitButton").style.display = "none";
                }

                if (event.target === modal) {
                    modal.classList.toggle('show');

                    if (!modal.classList.contains('show')) {
                        body.style.overflow = 'auto';
                    }
                }
                alert("입력완료");

            }
            ;
        };

        xhr.open('post', '/space/register', true);
        xhr.setRequestHeader('Content-type', 'application/json');
        xhr.send(JSON.stringify({
            tr_code,
            space_no,
            space_name,
            space_basicprice,
            space_maxpeople,
            space_capacity,
            space_description,
            branchoffice_no
        }));
    });


    /* 삭제 버튼 이벤트 리스너 */
    if (document.getElementById("spaceDeleteButton") != null) {
        document.getElementById("spaceDeleteButton").addEventListener('click', function () {
            event.stopImmediatePropagation();
            let xhr = new XMLHttpRequest();
            loadingElement.setAttribute('style','display:block');
            tr_code = "DELETE";
            space_no = document.getElementById("space_no").value;
            space_name = document.getElementById("space_name").value;
            space_basicprice = document.getElementById("space_basicprice").value;
            space_maxpeople = document.getElementById("space_maxpeople").value;
            space_capacity = document.getElementById("space_capacity").value;
            space_description = document.getElementById("space_description").value;
            branchoffice_no = document.getElementById("branchoffice_no").value;

            xhr.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    loadingElement.setAttribute('style','display:none');
                    BranchOfficeDetailModalAction();
                    document.getElementById('modalSpace').innerHTML = "";
                }
                ;
            };

            xhr.open('post', '/space/delete', true);
            // xhr.responseType = 'json';
            xhr.setRequestHeader('Content-type', 'application/json');
            xhr.send(JSON.stringify({
                tr_code,
                space_no,
                space_name,
                space_basicprice,
                space_maxpeople,
                space_capacity,
                space_description,
                branchoffice_no
            }));

        });
    }
    ;


    /* 예약 버튼 이벤트 리스너  */
    document.getElementById("spaceBookButton").addEventListener('click', function () {
        event.stopImmediatePropagation();
        console.log("예약하기 버튼");

        document.getElementById("spaceBookModalbd").style.display = "block";
        drawingCalendar();

    });


    /*    document.getElementById("extraModalBd").innerHTML =
            "<div class=\"calander-main\">" +
            "<div class=\"content-wrap\">" +
            "<div class=\"content-left\">" +
            "<div class=\"main-wrap\">" +
            "<div id=\"main-day\" class=\"main-day\"></div>" +
            "<div id=\"main-date\" class=\"main-date\"></div>" +
            "</div>" +
            "<div class=\"todo-wrap\">" +
            "<div class=\"todo-title\">Todo List</div>" +
            "<div class=\"input-wrap\">" +
            "<input type=\"text\" placeholder=\"please write here!\" id=\"input-box\" class=\"input-box\">" +
            "<button type=\"button\" id=\"input-data\" class=\"input-data\">INPUT</button>" +
            "<div id=\"input-list\" class=\"input-list\"></div>" +
            "</div>" +
            "</div>" +
            "</div>" +
            "<div class=\"content-right\">" +
            "<table id=\"calender\" align=\"center\">" +
            "<thead>" +
            "<tr class=\"btn-wrap clearfix\">" +
            "<td>" +
            "<label id=\"prev\">" +
            "&#60;" +
            "</label>" +
            "</td>" +
            "<td align=\"center\" id=\"current-year-month\" colspan=\"5\"></td>" +
            "<td>" +
            "<label id=\"next\">" +
            "&#62;" +
            "</label>" +
            "</td>" +
            "</tr>" +
            "<tr>" +
            "<td class=\"sun\" align=\"center\">Sun</td>" +
            "<td align=\"center\">Mon</td>" +
            "<td align=\"center\">Tue</td>" +
            "<td align=\"center\">Wed</td>" +
            "<td align=\"center\">Thu</td>" +
            "<td align=\"center\">Fri</td>" +
            "<td class=\"sat\" align=\"center\">Sat</td>" +
            "</tr>" +
            "</thead>" +
            "<tbody id=\"calendar-body\" class=\"calendar-body\"></tbody>" +
            "</table>" +
            "</div>" +
            "</div>" +
            "</div>";


        */
    <%--

            /* 달력 그리기 현재 날짜 기준 월 일 확인 후 셀 출력 */
            var currentTitle = document.getElementById('current-year-month');
            var calendarBody = document.getElementById('calendar-body');
            var today = new Date();
            var first = new Date(today.getFullYear(), today.getMonth(), 1);
            var dayList = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
            var monthList = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
            var leapYear = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
            var notLeapYear = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
            var pageFirst = first;
            var pageYear;
            if (first.getFullYear() % 4 === 0) {
                pageYear = leapYear;
            } else {
                pageYear = notLeapYear;
            }

            function showCalendar() {
                let monthCnt = 100;
                let cnt = 1;
                for (var i = 0; i < 6; i++) {
                    var $tr = document.createElement('tr');
                    $tr.setAttribute('id', monthCnt);
                    for (var j = 0; j < 7; j++) {
                        if ((i === 0 && j < first.getDay()) || cnt > pageYear[first.getMonth()]) {
                            var $td = document.createElement('td');
                            $tr.appendChild($td);
                        } else {
                            var $td = document.createElement('td');
                            $td.textContent = cnt;
                            $td.setAttribute('id', cnt);
                            $tr.appendChild($td);
                            cnt++;
                        }
                    }
                    monthCnt++;
                    calendarBody.appendChild($tr);
                }
            }

            showCalendar();

            function removeCalendar() {
                let catchTr = 100;
                for (var i = 100; i < 106; i++) {
                    var $tr = document.getElementById(catchTr);
                    $tr.remove();
                    catchTr++;
                }
            }


            function prev() {
                inputBox.value = "";
                const $divs = document.querySelectorAll('#input-list > div');
                $divs.forEach(function (e) {
                    e.remove();
                });
                const $btns = document.querySelectorAll('#input-list > button');
                $btns.forEach(function (e1) {
                    e1.remove();
                });
                if (pageFirst.getMonth() === 1) {
                    pageFirst = new Date(first.getFullYear() - 1, 12, 1);
                    first = pageFirst;
                    if (first.getFullYear() % 4 === 0) {
                        pageYear = leapYear;
                    } else {
                        pageYear = notLeapYear;
                    }
                } else {
                    pageFirst = new Date(first.getFullYear(), first.getMonth() - 1, 1);
                    first = pageFirst;
                }


            today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
            currentTitle.innerHTML = monthList[first.getMonth()] + '&nbsp;&nbsp;&nbsp;&nbsp;' + first.getFullYear();
            removeCalendar();
            showCalendar();
            showMain();
            clickedDate1 = document.getElementById(today.getDate());
            clickedDate1.classList.add('active');
            clickStart();
            reshowingList();
            }

            function next() {
                inputBox.value ="";
                const $divs = document.querySelectorAll('#input-list > div');
                $divs.forEach(function (e) {
                    e.remove();
                });
                const $btns= document.querySelectorAll('#input-list > button');
                $btns.forEach(function (e1) {
                    e1.remove();
                });
                if (pageFirst.getMonth() === 12){
                    pageFirst = new Date(first.getFullYear()+1,1,1);
                    first = pageFirst;
                    if(first.getFullYear()%4 === 0){
                        pageYear = leapYear;
                    }else {
                        pageYear = notLeapYear;
                    }
                }else {
                    pageFirst = new Date(first.getFullYear(),first.getMonth()+1,1);
                    first = pageFirst;
                }
                today = new Date(today.getFullYear(),today.getMonth()+1,today.getDate());
                currentTitle.innerHTML = monthList[first.getMonth()]+ '&nbsp;&nbsp;&nbsp;&nbsp;' + first.getFullYear();
                removeCalendar();
                showCalendar();
                showMain();
                clickedDate1 = document.getElementById(today.getDate);
                clickedDate1.classList.add('active');
                clickStart();
                reshowingList();
            }

            function showMain() {
                mainTodayDay.innerHTML = dayList[today.getDay()];
                mainTodayDate.innerHTML = today.getDate();
            }
            var clickedDate1 = document.getElementById(today.getDate());
            clickedDate1.classList.add('active');
            var prevBtn = document.getElementById('prev');
            var nextBtn = document.getElementById('next');
            prevBtn.addEventListener('click', prev);
            nextBtn.addEventListener('click', next);

            var tdGroup = [];
            function clickStart() {
                for (let i = 0; i <=pageYear[first.getMonth()] ; i++) {
                    tdGroup[i] = document.getElementById(i);
                    tdGroup[i].addEventListener('click',changeToday);
                }
            }
            function changeToday(e) {
                for (let i = 1; i <=pageYear[first.getMonth()]; i++) {
                    if (tdGroup[i].classList.contains('active')){
                        tdGroup[i].classList.remove('active');
                    }
                }
                clickedDate1 = e.currentTarget;
                clickedDate1.classList.add('active');
                today = new Date(today.getFullYear(),today.getMonth(),clickedDate1.id);
                showMain();
                keyValue = today.getFullYear() + '' + today.getMonth()+''+today.getDate();
                reshowingList();
            }

            function reshowingList() {
                keyValue = today.getFullYear()+''+today.getMonth()+''+today.getDate();
                if (todoList[keyValue] ===undefined){
                    input.textContent = '';
                    todoList[keyValue] = [];
                    const $divs = document.querySelectorAll('#input-list > div');
                    $divs.forEach(function (e) {
                        e.remove();
                    });
                    const $btns = document.querySelectorAll('#input-list >button');
                    $btns.forEach(function (e1) {
                        e1.remove();
                    });
                }else if (todoList[keyValue].length ===0){
                    inputList.textContent = "";
                    const $divs = document.querySelectorAll('#input-list>div');
                    $divs.forEach(function (e) {
                        e.remove();
                    });
                    const $btns = document.querySelectorAll('#input-list > button');
                    $btns.forEach(function (e1) {
                        e1.remove();
                    });
                }else {
                    const $divs = document.querySelectorAll('input-list>div');
                    $divs.forEach(function (e) {
                        e.remove();
                    });
                    const $btns = document.querySelectorAll('#input-List >button');
                    $btns.forEach(function (e1) {
                        e1.remove();
                    });
                    var $div = document.createElement('div');
                    for (var i = 0; i <todoList[keyValue].length; i++) {
                        var $div = document.createElement('div');
                        $div.textContent = '-' + todoList[keyValue][i];
                        var $btn = document.createElement('button');
                        $btn.setAttribute('type','button');
                        $btn.setAttribute('id','del-ata');
                        $btn.setAttribute('id',dataCnt+keyValue);
                        $btn.setAttribute('class','del-data');
                        $btn.textContent = delText;
                        inputList.appendChild($div);
                        inputList.appendChild($btn);
                        $div.addEventListener('click',checkList);
                        $btn.addEventListener('click',deleteTodo);

                        inputBox.value = '';
                        function deleteTodo() {
                            $div.remove();
                            $btn.remove();
                        }
                    }
                }
            }
            var mainTodayDay = document.getElementById('main-day');
            var mainTodayDate = document.getElementById('main-date');
        var inputBox = document.getElementById('input-box');
        var inputDate = document.getElementById('input-data');
        var inputList = document.getElementById('input-list');
        var delText = 'X';
        inputDate.addEventListener('click',addTodoList);
        var dataCnt = 1;
        var keyValue = today.getFullYear()+ '' +today.getMonth()+''+today.getDate();
        let todoList = [];
        todoList[keyValue] = [];
        function addTodoList() {
            var $div = document.createElement('div');
            $div.textContent = '-'+inputBox.value;
            var $btn = document.createElement('button');
            $btn.setAttribute('type','button');
            $btn.setAttribute('id','del-ata');
            $btn.setAttribute('id',dataCnt+keyValue);
            $btn.setAttribute('class','del-data');
            $btn.textContent = delText;
            inputList.appendChild($div);
            inputList.appendChild($btn);
            todoList[keyValue].push(inputBox.value);
            dataCnt++;
            inputBox.value = '';
            $div.addEventListener('click',checkList);
            $btn.addEventListener('click',deleteTodo);
            function deleteTodo() {
                $div.remove();
                $btn.remove();
            }
        }
        console.log(keyValue);
        function checkList(e) {
            e.currentTarget.classList.add('checked');
        }
        });




    </script>
    --%>



    <%--    디테일 페이지의 자바스크립트  끝--%>
    <%--

    <script>

        var currentTitle = document.getElementById('current-year-month');
        var calendearBody = document.getElementById('calendar-body');
        var today = new Date();
        var first = new Date(today.getFullYear(),today.getMonth(),1);
        var dayList = ['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'];
        var monthList =['January','February','March','April','May','June','July','August','September','October','November','December'];
        var leapYear=[31,29,31,30,31,30,31,31,30,31,30,31];
        var notLeapYear=[31,28,31,30,31,30,31,31,30,31,30,31];
        var pageFirst = first;
        var pageYear;
        if (first.getFullYear() % 4 === 0){
            pageYear = leapYear;
        }else{
            pageYear = notLeapYear;
        }

        function showCalendar() {
            let monthCnt = 100;
            let cnt = 1;
            for (let i = 0; i < 6; i++) {
                var $tr = document.createElement('tr');
                $tr.setAttribute('id',monthCnt);
                for (let j = 0; j < 7; j++) {
                    if ((i === 0&& j <first.getDay())|| cnt > pageYear[first.getMonth()]){
                        var $td = document.createElement('td');
                        $tr.appendChild($td);
                    }else {
                        var $td = document.createElement('td');
                        $td.textContent = cnt;
                        $td.setAttribute('id',cnt);
                        $tr.appendChild($td);
                        cnt++;
                    }
                }
                monthCnt++;
                calendearBody.appendChild($tr);
            }
        }
        showCalendar();

        function removeCalendar() {
            let catchTr = 100;
            for (let i = 100; i < 106; i++) {
                var $tr = document.getElementById('catchTr');
                $tr.remove();
                catchTr++;
            }
        }

    </script>

    --%>
