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
                        <button type="button" title="prev" class="btn-cal prev">
                        </button>
                        <span class="cal-month"></span>
                        <span class="cal-year"></span>
                        <button type="button" title="next" class="btn-cal next">
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
            if (activeTimeCell_length == 0) {
                // $(this).addClass('timeCell-active');
                if (!event.target.classList.contains('timeCell-disabled')){
                event.target.classList.add('timeCell-active');
                // tmp = $(this).text();
                tmp = this.innerHTML;
                }else{
                    alert('사용 불가능한 시간이 포함 선택되었습니다.');
                }
                // console.log(' $(this)   ===>'+tmp)

                // tmp2 = document.querySelector(this).textContent;


                // console.log('===>'+tmp2);
                // tmp = document.querySelector(this).text();
            } else {
                var first = 0;
                var second = 0;
                var selectedNum = Number(this.innerHTML);
                // var selectedNum =Number($(this).text());

                if (tmp > selectedNum) { // tmp =  23, selectedNum = 24 false
                    first = selectedNum;
                    second = tmp;
                } else {
                    first = tmp; //first =tmp = 23 ,
                    second = selectedNum; // second = selectedNum 24
                }
                tmp = selectedNum; // tmp = 23
                // $('.spring-babo').removeClass('skyblue');
                for (let i = 0; i < timeTableTd.length; i++) { // 모두 색 제거
                    timeTableTd.item(i).classList.remove('timeCell-active');
                } //end of 모든 칸 색 제거 for문
                if (document.getElementsByClassName('timeTableTd').item(first-1).classList.contains('timeCell-disabled')||document.getElementsByClassName('timeTableTd').item(second-1).classList.contains('timeCell-disabled')) {
                    alert('사용 불가능한 시간이 포함 선택되었습니다.');
                }
                // (!document.getElementsByClassName('timeTableTd').item(first).classList.contains('timeCell-disabled')&&
                //     (document.getElementsByClassName('timeTableTd').item(first)<document.getElementsByClassName('timeTableTd').item(second))
                else {
                    for (var i = first; i <= second; i++) { //i =23 , 23<=24(범위2)  23 ++
                        // $('.timeTableTd:nth-child('+i+')').addClass('timeCell-active');
                        if (!document.getElementsByClassName('timeTableTd').item(i).classList.contains('timeCell-disabled')) {
                            document.getElementsByClassName('timeTableTd').item(i - 1).classList.add('timeCell-active');
                            //23-1 22번에 색칠. //24-1 23번에 색칠
                        }//End of if
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
    document.getElementById('bookSubmitButton').addEventListener('click', function () {
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

        } else if ((reserv_end_time - reserv_start_time) == 0) { //선택된 시간이 아예 없는 경우

            alert('최소 한시간 이상 시간 지정을 해주세요 .');

        } //End of Else if

        else { //한시간 예약 선택한 경우
            reserv_end_time = reserv_start_time; // 한시간 선택한 경우 사용 마감 시간 = 시작 시간

            xhr.onreadystatechange = function () {

                if (this.readyState == 4 && this.status == 200) {

                    alert(reserv_start_time + '~' + reserv_end_time + '예약이 완료되었습니다.');

                } // End of if-  xhr.onreadystatechange function if.

                else { //성공 못할 경우

                    alert('에러가 발생했습니다. 나중에 다시 시도해주세요.');

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

    event.stopPropagation();
    // ================================
    // START YOUR APP HERE
    // ================================
    var init = {
        // monList: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
        monList: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'],
        dayList: ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'],
        today: new Date(),
        monForChange: new Date().getMonth(),
        activeDate: new Date(),
        getFirstDay: (yy, mm) => new Date(yy, mm, 1),
        getLastDay: (yy, mm) => new Date(yy, mm + 1, 0),
        nextMonth: function () {
            event.stopPropagation();
            let d = new Date();
            d.setDate(1);
            d.setMonth(++this.monForChange);
            this.activeDate = d;
            return d;
        },
        prevMonth: function () {
            event.stopPropagation();
            let d = new Date();
            d.setDate(1);
            d.setMonth(--this.monForChange);
            this.activeDate = d;
            return d;
        },
        addZero: (num) => (num < 10) ? '0' + num : num,
        activeDTag: null,
        getIndex: function (node) {
            event.stopPropagation();
            let index = 0;
            while (node = node.previousElementSibling) {
                index++;
            }
            return index;
        }
    };

    var $calBody = document.querySelector('.cal-body');
    var $btnNext = document.querySelector('.btn-cal.next');
    var $btnPrev = document.querySelector('.btn-cal.prev');

    /**
     * @param {number} date
     * @param {number} dayIn
     */
    function loadDate(date, dayIn) {
        event.stopPropagation();
        document.querySelector('.cal-date').textContent = date;
        document.querySelector('.cal-day').textContent = init.dayList[dayIn];
    }

    /**
     * @param {date} fullDate
     */
    function loadYYMM(fullDate) {
        event.stopPropagation();
        var yy = fullDate.getFullYear();
        var mm = fullDate.getMonth();
        var firstDay = init.getFirstDay(yy, mm);
        var lastDay = init.getLastDay(yy, mm);
        var markToday;  // for marking today date

        if (mm === init.today.getMonth() && yy === init.today.getFullYear()) {
            markToday = init.today.getDate();
        }

        document.querySelector('.cal-month').textContent = init.monList[mm];
        document.querySelector('.cal-year').textContent = yy;

        var trtd = '';
        var startCount;
        var countDay = 0;
        for (let i = 0; i < 6; i++) {
            trtd += '<tr>';
            for (let j = 0; j < 7; j++) {
                if (i === 0 && !startCount && j === firstDay.getDay()) {
                    startCount = 1;
                }
                if (!startCount) {
                    trtd += '<td>'
                } else {
                    let fullDate = yy + '.' + init.addZero(mm + 1) + '.' + init.addZero(countDay + 1);
                    trtd += '<td class="day';
                    trtd += (markToday && markToday === countDay + 1) ? ' today" ' : '"';
                    trtd += ` data-date="${countDay + 1}" data-fdate="${fullDate}">`;
                }
                trtd += (startCount) ? ++countDay : '';
                if (countDay === lastDay.getDate()) {
                    startCount = 0;
                }
                trtd += '</td>';
            }
            trtd += '</tr>';
        }
        $calBody.innerHTML = trtd;
    }

    /**
     * @param {string} val
     */
    function createNewList(val) {
        event.stopPropagation();
        var id = new Date().getTime() + '';
        var yy = init.activeDate.getFullYear();
        var mm = init.activeDate.getMonth() + 1;
        var dd = init.activeDate.getDate();
        var $target = $calBody.querySelector(`.day[data-date="${dd}"]`);

        var date = yy + '.' + init.addZero(mm) + '.' + init.addZero(dd);

        var eventData = {};
        eventData['date'] = date;
        eventData['memo'] = val;
        eventData['complete'] = false;
        eventData['id'] = id;
        init.event.push(eventData);
        $todoList.appendChild(createLi(id, val, date));
    }

    loadYYMM(init.today);
    loadDate(init.today.getDate(), init.today.getDay());

    $btnNext.addEventListener('click', () => loadYYMM(init.nextMonth()));
    $btnPrev.addEventListener('click', () => loadYYMM(init.prevMonth()));

    $calBody.addEventListener('click', (e) => {
        if (e.target.classList.contains('day')) {
            if (init.activeDTag) {
                init.activeDTag.classList.remove('day-active');
            }
            let day = Number(e.target.textContent);
            loadDate(day, e.target.cellIndex);
            e.target.classList.add('day-active');
            init.activeDTag = e.target;
            init.activeDate.setDate(day);
            // reloadTodo();
        }
    });
}
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
    })

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
                alert(xhr.responseText);

                /* 수정 버튼이 눌렀을 때 수정 버튼 나타냄. */
                document.getElementById("spaceUpdateButton").style.display = "block";
                /* 수정 버튼이 눌렸을 때 확인 버튼 숨김. */
                document.getElementById("spaceUpdateSubmitButton").style.display = "none";
                /* 수정 버튼이 눌렸을 때 취소 버튼 숨김. */
                document.getElementById("spaceUpdateAbortButton").style.display = "none";
                /* 삭제 버튼 나타냄 */
                document.getElementById("spaceDeleteButton").style.display = "block";


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

        let xhr = new XMLHttpRequest;
        xhr.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                drawingCalendar();
                var booKedTimeList = JSON.parse(xhr.response);
                console.log(booKedTimeList[0]);
                for (let i = 0; i < booKedTimeList.length; i++) {
                    var startTime = booKedTimeList[i].reserv_start_time;
                    var endTime = booKedTimeList[i].reserv_end_time;
                    var j = Number(startTime);
                    for (let i = 0; i < endTime - startTime; i++) {//12 ;  12<= (4=(16-12)); 12++
                        console.log('반복횟수 ===>' + i);
                        document.getElementById('timeTableTd' + j).classList.add('timeCell-disabled');
                        // document.getElementById('timeTableTd'+j).classList.remove('timeTableTd');
                        ++j;
                        console.log('닫는 번호 ===>' + j);
                    }

                    console.log(booKedTimeList[i].reserv_start_time);
                    console.log(booKedTimeList[i].reserv_end_time);
                }
            }
            // else {
            //     setTimeout(function () {
            //         alert('오류가 발생했습니다. 나중에 다시 시도해주세요.');
            //     }, 3000);
            //     ;
            // }
        }
        xhr.open('POST', '/reservation/bookedTimeCheck');
        xhr.setRequestHeader('Content-Type', 'application/json');
        xhr.send(JSON.stringify({space_no}));
        // "<div id=\"spaceBookModal\" class=\"spaceBookModal\" onclick=\"SpaceBookModalAction()\" style='z-index: 7777'>"+

        ;


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
