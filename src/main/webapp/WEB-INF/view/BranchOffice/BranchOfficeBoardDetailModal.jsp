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
    </div>



<%-- 대여공간 디테일 창 스크립트 --%>
<script>

    'use strict';

    spaceUpdateButton = document.createElement("button");
    spaceUpdateButton.setAttribute("id","spaceUpdateButton");
    spaceUpdateButton.setAttribute("style","font-size:1.5rem");
    spaceUpdateButton.innerText = "수정";
    spaceUpdateButton.className="btn btn-primary";

    spaceUpdateSubmitButton = document.createElement("button");
    spaceUpdateSubmitButton.setAttribute("id","spaceUpdateSubmitButton");
    spaceUpdateSubmitButton.setAttribute("style","font-size:1.5rem; display:none;");
    spaceUpdateSubmitButton.innerText = "확인";
    spaceUpdateSubmitButton.className = "btn btn-primary";

    spaceUpdateAbortButton = document.createElement("button");
    spaceUpdateAbortButton.setAttribute("id","spaceUpdateAbortButton");
    spaceUpdateAbortButton.setAttribute("style","font-size:1.5rem; display:none;");
    spaceUpdateAbortButton.innerText = "취소";
    spaceUpdateAbortButton.className = "btn btn-warning";


    /* 추가버튼 생성 */
    spaceAddSubmitButton = document.createElement("button");
    spaceAddSubmitButton.setAttribute("id","spaceAddSubmitButton");
    spaceAddSubmitButton.setAttribute("style","font-size:1.5rem; display:none;");
    spaceAddSubmitButton.innerText = "추가";
    spaceAddSubmitButton.className="btn btn-primary";

    /* 삭제버튼 생성 */
    spaceAddSubmitButton = document.createElement("button");
    spaceAddSubmitButton.setAttribute("id","spaceDeleteButton");
    spaceAddSubmitButton.setAttribute("style","font-size:1.5rem; display:none;");
    spaceAddSubmitButton.innerText = "삭제";
    spaceAddSubmitButton.className="btn btn-primary";

    /* 대여공간 디테일 모달창에 버튼 추가 파트 */

    //대여공간 디테일 모달창에 수정 버튼 추가
    document.getElementById("extraModalBd").append(spaceUpdateButton);
    //대여공간 디테일 모달창에 수정 확인 버튼 추가
    document.getElementById("extraModalBd").append(spaceUpdateSubmitButton);
    //대여공간 디테일 모달창에 수정창 취소 추가
    document.getElementById("extraModalBd").append(spaceUpdateAbortButton);
    /*  대여공간 디테일 모달창에 수정창 취소 추가  */
    document.getElementById("extraModalBd").append(spaceAddSubmitButton);


    /* 대여공간 디테일 창에서 수정버튼 이벤트 리스너 */
    document.getElementById("spaceUpdateButton").addEventListener("click",function () {
        /* 이벤트 전파 막기*/
        event.stopPropagation();
        /* 수정 버튼이 눌렀을 때 수정 버튼 숨김. */
        document.getElementById("spaceUpdateButton").style.display ="none";
        /* 수정 버튼이 눌렸을 때 확인 버튼 나타남. */
        document.getElementById("spaceUpdateSubmitButton").style.display ="block";
        /* 수정 버튼이 눌렸을 때 취소 버튼 나타남. */
        document.getElementById("spaceUpdateAbortButton").style.display ="block";
    });
    //수정 버튼 이벤트 리스너 끝//

    /* 수정버튼 후 나오는 취소 버튼 이벤트 리스너, 다시 수정버튼만 나오게끔 */
    document.getElementById("spaceUpdateAbortButton").addEventListener("click", function () {
        /* 이벤트 전파 막기*/
        event.stopPropagation();
        /* 수정 버튼이 눌렀을 때 수정 버튼 나타냄. */
        document.getElementById("spaceUpdateButton").style.display ="block";
        /* 수정 버튼이 눌렸을 때 확인 버튼 숨김. */
        document.getElementById("spaceUpdateSubmitButton").style.display ="none";
        /* 수정 버튼이 눌렸을 때 취소 버튼 숨김. */
        document.getElementById("spaceUpdateAbortButton").style.display ="none";
    });
    // 취소 버튼 이벤트 리스너 끝//


    /* 수정 버튼 이벤트 */
    document.getElementById("spaceUpdateSubmitButton").addEventListener("click", function () {
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
        spaceFormData.append('tr_code','UPDATE');
        spaceFormData.append('space_no',p_space_no);
        spaceFormData.append('space_basicprice',p_space_basicprice);
        spaceFormData.append('space_maxpeople',p_space_maxpeople);
        spaceFormData.append('space_capacity',p_space_capacity);
        spaceFormData.append('space_name',p_space_name);
        spaceFormData.append('space_description',p_space_description);
        spaceFormData.append('branchoffice_no',p_branchoffice_no);

        for (var pair of spaceFormData.entries()){
            console.log(pair);
        }

        xhr.onreadystatechange = function () {
                alert(xhr.responseText);

            /* 수정 버튼이 눌렀을 때 수정 버튼 나타냄. */
            document.getElementById("spaceUpdateButton").style.display ="block";
            /* 수정 버튼이 눌렸을 때 확인 버튼 숨김. */
            document.getElementById("spaceUpdateSubmitButton").style.display ="none";
            /* 수정 버튼이 눌렸을 때 취소 버튼 숨김. */
            document.getElementById("spaceUpdateAbortButton").style.display ="none";
        };
        // AJAX는 반대로 제출 버튼을 누르면 기본 폼 동작은 e.preventDefault()로 멈추고, 페이지 전환 없이 데이터를 전송합니다.
        xhr.open('post', '/space/update',true);
        // xhr.setRequestHeader('Content-type','application/json');
        // xhr.setRequestHeader('Content-type',"false");
        // xhr.send(JSON.stringify(spaceFormData));
        // xhr.send(JSON.stringify(spaceFormData));
        xhr.send(spaceFormData);
    });



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
                out.print("document.getElementById(\"branchOfficeBoardDetailTableTbody\").lastElementChild.className=\"spaceList\";\n");
                /* branchOfficeBoardDetailTableTbody ID를 가진 엘리먼트 요소의 마지막 자식 엘리먼트 요소의 자식 요소 중 마지막 요소 안에 td 태그 생성 후 추가  */
                out.print("document.getElementById(\"branchOfficeBoardDetailTableTbody\").lastElementChild.appendChild(document.createElement(\"td\"));\n");
                /* 대여 공간 이름을 제외한 것들의 정보를 쏟아 놓기 위한 div */
                out.print("document.getElementById(\"branchOfficeBoardDetailTableTbody\").lastElementChild.appendChild(document.createElement(\"div\"));\n");
                /* 대여공간 정보가 담기는 div 태그에 클래스명 부여 */
                out.print("document.getElementById(\"branchOfficeBoardDetailTableTbody\").lastElementChild.getElementsByTagName(\"div\").item(0).className=\"spaceInfo\";\n");
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

    /*  spaceList라는 클래스 네임을 가진 요소 변수 지정 */
    var spaceList = document.getElementsByClassName("spaceList");
    var spaceInfo = document.getElementsByClassName("spaceInfo");

    // spaceList라는 이름의 클래스에 style - 커서 포인터 속성 추가.
    for (let i = 0; i < document.getElementsByClassName("spaceList").length; i++) {
        document.getElementsByClassName("spaceList").item(i).setAttribute("style", "cursor:pointer");
    }



    /* 지점의 대여공간 목록 디테일 이벤트 리스너 (className="spaceList"인 항목들에 마우스 클릭시 상세 정보를 보여주게 하는 이벤트 리스너 */
    for (let i = 0; i < spaceList.length; i++) {

        /* Space Detail Listener Function */
        spaceList.item(i).addEventListener("click",function() {
            console.log(" 마우스 클릭");
            event.stopPropagation();

            var spaceListTextString = spaceInfo.item(i).textContent.split("/");

             space_name           = spaceList.item(i).getElementsByTagName("td").item(0).textContent;
             space_no             = spaceListTextString[0];
             space_description    = spaceListTextString[1];
             space_capacity       = spaceListTextString[2];
             space_maxpeople      = spaceListTextString[3];
             space_basicprice     = spaceListTextString[4];

            document.getElementById("space_name").value =space_name;
            document.getElementById("space_no").value =space_no;
            document.getElementById("space_description").value =space_description;
            document.getElementById("space_capacity").value =space_capacity;
            document.getElementById("space_maxpeople").value =space_maxpeople;
            document.getElementById("space_basicprice").value =space_basicprice;

            /* 대여 공간 디테일창을 관리자가 봤을 때*/
            if ((sessionStorage.getItem("sid").split("=")[1])=='MEM282108'){
                event.stopPropagation();
                console.log("관리자 확인.");
                document.getElementById("spaceUpdateButton").style.display = "block;"
                for (let i = 0; i < document.getElementsByClassName("spaceDetailArea").length; i++) {
                    document.getElementsByClassName("spaceDetailArea").item(i).removeAttribute("readonly");
                }
            }

            /* 대여공간 디테일 모달창이 열려 있을 때 클릭시 닫힘.*/
            if(!document.getElementById("extraModalBd").classList.contains('show')){
            // document.getElementById("branchOfficeBoardDetailModal").removeEventListener("click",BranchOfficeDetailModalAction,true);
            // document.getElementById("branchOfficeBoardDetailSpaceListModal").style.marginLeft = "25%";
                document.getElementById("extraModalBd").classList.add("show");
                document.getElementById("extraModalBd").style.display = "block";
                document.getElementById("spaceUpdateButton").style.display ="block";
                document.getElementById("spaceUpdateSubmitButton").style.display ="none";
                document.getElementById("spaceUpdateAbortButton").style.display ="none";


            }else{
                /* 대여공간 디테일 모달창이 열려 있지 않는 상태에서 창이 닫히면*/
            // document.getElementById("branchOfficeBoardDetailModal").removeEventListener("click",BranchOfficeDetailModalAction,false);
            document.getElementById("extraModalBd").classList.remove("show");
            document.getElementById("extraModalBd").style.display = "none";

            }
        });
    }  //  끝 // 지점의 대여공간 목록 디테일 이벤트 리스너 끝 //


    
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

    
    
    
    /* 모달창 켜져있을때 클릭시 */
    function BranchOfficeDetailModalAction() {
        event.stopPropagation();
        var body = document.querySelector('body');
        var modal = document.querySelector('.modal');
        console.log("모달창 떠있으니 닫자");

        // document.getElementById("extraModalBd").classList.remove("show");
        // document.getElementById("extraModalBd").style.display = "none";
        if(document.getElementById("extraModalBd").classList.contains('show')){
            document.getElementById("extraModalBd").classList.remove("show");
            document.getElementById("extraModalBd").style.display = "none";
            document.getElementById("spaceUpdateButton").style.display ="block";
            document.getElementById("spaceUpdateSubmitButton").style.display ="none";
            document.getElementById("spaceUpdateAbortButton").style.display ="none";
            document.getElementById("spaceAddSubmitButton").style.display = "none";
        }
        if (event.target === modal) {
            modal.classList.toggle('show');

            if (!modal.classList.contains('show')) {
                body.style.overflow = 'auto';
            }
        }
    }


    /* 공간 추가 버튼  */
    document.getElementById("spaceAddButton").addEventListener('click',function () {
        console.log("aa");
        event.stopPropagation(); // 이벤트 전파 방지
        /* 수정 폼을 재활용위한 input태그 내부 값 초기화 */
        document.getElementById("extraBranchOfficeBoardDetailModalForm").reset();
        /* 업데이트 버튼은 사용X */
        document.getElementById("spaceUpdateButton").style.display ="none";
        /* 공간 추가 버튼 가시 */
        // document.getElementById("spaceAddButton").style.display = "block";
        document.getElementById("spaceAddSubmitButton").style.display = "block";

        if(!document.getElementById("extraModalBd").classList.contains('show')){
            // document.getElementById("branchOfficeBoardDetailModal").removeEventListener("click",BranchOfficeDetailModalAction,true);
            // document.getElementById("branchOfficeBoardDetailSpaceListModal").style.marginLeft = "25%";
            document.getElementById("extraModalBd").classList.add("show");
            document.getElementById("extraModalBd").style.display = "block";

        }else{
            /* 대여공간 디테일 모달창이 열려 있지 않는 상태에서 창이 닫히면*/
            // document.getElementById("branchOfficeBoardDetailModal").removeEventListener("click",BranchOfficeDetailModalAction,false);
            document.getElementById("extraModalBd").classList.remove("show");
            document.getElementById("extraModalBd").style.display = "none";

        }

    });


    /* 대여 공간 추가 버튼 이벤트 리스너*/
    document.getElementById("spaceAddSubmitButton").addEventListener('click',function () {

        for (let i = 0; i < document.getElementsByClassName("spaceDetailArea").length; i++) {
            document.getElementsByClassName("spaceDetailArea").item(i).removeAttribute("readonly");
        }

        let xhr = new XMLHttpRequest();
        tr_code = "insert";
        space_no = document.getElementById("space_no").value;
        space_name = document.getElementById("space_name").value;
        space_basicprice = document.getElementById("space_basicprice").value;
        space_maxpeople = document.getElementById("space_maxpeople").value;
        space_capacity = document.getElementById("space_capacity").value;
        space_description = document.getElementById("space_description").value;
        branchoffice_no = document.getElementById("branchoffice_no").value;


            alert("빈 칸을 확인해주세요.");


            // var p_branchoffice_no = document.getElementById("branchoffice_no").value;

            xhr.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    BranchOfficeDetailModalAction();

                    alert("입력완료");

                }
                ;

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
            } });

</script>
<%--    디테일 페이지의 자바스크립트  끝--%>