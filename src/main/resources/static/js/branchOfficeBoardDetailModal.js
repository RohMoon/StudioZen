/* 대여공간 디테일 창에서 수정버튼 이벤트 리스너 */
document.getElementById("spaceUpdateButton").addEventListener('click', function () {
    /* 이벤트 전파 막기*/
    event.stopImmediatePropagation();
    /* 수정 버튼이 눌렀을 때 수정 버튼 숨김. */
    document.getElementById("spaceUpdateButton").style.display = "none";
    /* 수정 버튼이 눌렸을 때 확인 버튼 나타남. */
    document.getElementById("spaceUpdateSubmitButton").style.display = "block";
    /* 수정 버튼이 눌렸을 때 취소 버튼 나타남. */
    document.getElementById("spaceUpdateAbortButton").style.display = "block";
    /* 석제 버튼 가림*/
    document.getElementById("spaceDeleteButton").style.display = "none";
});
//수정 버튼 이벤트 리스너 끝//




/* 수정버튼 후 나오는 취소 버튼 이벤트 리스너, 다시 수정버튼만 나오게끔 */
document.getElementById("spaceUpdateAbortButton").addEventListener("click", function () {
    /* 이벤트 전파 막기*/
    event.stopImmediatePropagation();
    /* 수정 버튼이 눌렀을 때 수정 버튼 나타냄. */
    document.getElementById("spaceUpdateButton").style.display = "block";
    /* 수정 버튼이 눌렸을 때 확인 버튼 숨김. */
    document.getElementById("spaceUpdateSubmitButton").style.display = "none";
    /* 수정 버튼이 눌렸을 때 취소 버튼 숨김. */
    document.getElementById("spaceUpdateAbortButton").style.display = "none";
    /* 수정버튼 취소 누르면 삭제 버튼 나타냄 */
    document.getElementById("spaceDeleteButton").style.display = "block";
});
// 취소 버튼 이벤트 리스너 끝//




/* 수정 확인 버튼 이벤트 리스너 */
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
            console.log("관리자 확인.");
            document.getElementById("spaceUpdateButton").style.display = "block;";
            document.getElementById("spaceDeleteButton").style.display = "block";
            for (let i = 0; i < document.getElementsByClassName("spaceDetailArea").length; i++) {
                document.getElementsByClassName("spaceDetailArea").item(i).removeAttribute("readonly");
            }
        }

        /* 대여공간 디테일 모달창이 열려 있을 때 클릭시 닫힘.*/
        if (!document.getElementById("extraModalBd").classList.contains('show')) {
            // document.getElementById("branchOfficeBoardDetailModal").removeEventListener("click",BranchOfficeDetailModalAction,true);
            // document.getElementById("branchOfficeBoardDetailSpaceListModal").style.marginLeft = "25%";
            document.getElementById("extraModalBd").classList.add("show");
            document.getElementById("extraModalBd").style.display = "block";
            document.getElementById("spaceUpdateButton").style.display = "block";
            document.getElementById("spaceUpdateSubmitButton").style.display = "none";
            document.getElementById("spaceUpdateAbortButton").style.display = "none";


        } else {
            /* 대여공간 디테일 모달창이 열려 있지 않는 상태에서 창이 닫히면*/
            // document.getElementById("branchOfficeBoardDetailModal").removeEventListener("click",BranchOfficeDetailModalAction,false);
            document.getElementById("extraModalBd").classList.remove("show");
            document.getElementById("extraModalBd").style.display = "none";

        }
    });
}  //  끝 // 지점의 대여공간 목록 디테일 이벤트 리스너 끝 //

/* 모달창 켜져있을때 클릭시 */
function BranchOfficeDetailModalAction() {
    event.stopPropagation();
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
        document.getElementById("spaceBookModalbd").style.display = "none";

    }

    if (event.target === modal) {
        modal.classList.toggle('show');

        if (!modal.classList.contains('show')) {
            body.style.overflow = 'auto';
        }
    }
}



/* 공간 추가 버튼  */
document.getElementById("spaceAddButton").addEventListener('click', function () {
    console.log("aa");
    event.stopPropagation(); // 이벤트 전파 방지

    /* 수정 폼을 재활용위한 input태그 내부 값 초기화 */
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


    if (!document.getElementById("extraModalBd").classList.contains('show')) {
        // document.getElementById("branchOfficeBoardDetailModal").removeEventListener("click",BranchOfficeDetailModalAction,true);
        // document.getElementById("branchOfficeBoardDetailSpaceListModal").style.marginLeft = "25%";
        document.getElementById("extraModalBd").classList.add("show");
        document.getElementById("extraModalBd").style.display = "block";

    } else {
        /* 대여공간 디테일 모달창이 열려 있지 않는 상태에서 창이 닫히면*/
        // document.getElementById("branchOfficeBoardDetailModal").removeEventListener("click",BranchOfficeDetailModalAction,false);
        document.getElementById("extraModalBd").classList.remove("show");
        document.getElementById("extraModalBd").style.display = "none";

    }

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
            BranchOfficeDetailModalAction();

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
            // console.log(xhr.responseText);
            //  var afterRes = JSON.parse(xhr.responseText);
            // console.log((xhr.responseText));
            // console.log(afterRes[0].space_no);
            //e08
            // for (let i = 0; i < document.getElementsByClassName('spaceList').length; i++) {
            //     document.getElementsByClassName('spaceList').item(i).remove();
            // }

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



/* 예약 버튼 이벤트 리스너  */
document.getElementById("spaceBookButton").addEventListener('click', function () {

    event.stopImmediatePropagation();
    console.log("예약하기 버튼");

    document.getElementById("modalSpace").innerHTML +=
        "<div id=\"spaceBookModalbd\" class=\"spaceBookModal_body\" style='z-index: 5001'>"+
        "<table id=\"calendar\" align=\"center\">"+
        "<thead>"+
        "<tr class=\"btn-wrap clearfix\">"+
        "<td>"+
        "<label id=\"prev\">"+
        "&#60;"+
        "</label>"+
        "</td>"+
        "<td align=\"center\" id=\"current-year-month\" colspan=\"5\"></td>"+
        "<td>"+
        "<label id=\"next\">"+
        "&#62;"+
        "</label>"+
        "</td>"+
        "</tr>"+
        "<tr>"+
        "<td class=\"sun\" align=\"center\">Sun</td>"+
        "<td align=\"center\">Mon</td>"+
        "<td align=\"center\">Tue</td>"+
        "<td align=\"center\">Wed</td>"+
        "<td align=\"center\">Thu</td>"+
        "<td align=\"center\">Fri</td>"+
        "<td class=\"sat\" align=\"center\">Sat</td>"+
        "</tr>"+
        "</thead>"+
        "<tbody id=\"calendar-body\" class=\"calendar-body\"></tbody>"+
        "</table>"+
        "</div>"
    ;


});


