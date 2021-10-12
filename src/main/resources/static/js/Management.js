/*  대시보드에서 Q&A 이미지영역 눌렀을 때*/
function qnaListBoardAction() {
    console.log("checkListBoardAction");

    $('#mainPanel').children().remove();
    $('#mainPanel').load(("/qna/select/MEM282108 #qnaListBoard"));


}

/*  Q&A 게시판에서 셀 클릭시 눌렀을 때*/
function qnaDetailBoardAction(e) {
    console.log('qnaDetailBoardAction');
    let qna_no = e.childNodes[1].innerText;

    /* 입력 값 JSON 문법으로 변형 확인*/
    console.log(JSON.stringify({qna_no}));
    console.log(qna_no);
    /*  ajax Get 방식으로 값 전송*/
    $.ajax({
        method: 'GET',
        url: '/qna/select/MEM282108/' + qna_no,
        contentType: 'application/json',
        data: {qna_no},
        error: function (xhr, status, error) {
            alert(error);
        },
        success: function (data) {
            // alert(xhr) // undefined 떨어짐
            // alert(status) // Object Object 떨어짐
            //alert(result) // success 떨어짐
            console.log("Success");
            alert(data);
            console.log(data);
            $('#modalSpace').html(data);
            const body = document.querySelector('body');
            const modal = document.querySelector('.modal');
            const btnOpenPopup = document.querySelector('.btn-open-popup');

            console.log("qnaDetailBoardAction Processing");
            modal.classList.toggle('show');

            if (modal.classList.contains('show')) {
                body.style.overflow = 'hidden';
            }
        },
    });

    // $('#mainPanel').children().remove();
    // $rkv('#mainPanel').load(("/qna/select/MEM282108 #qnaListBoard"));

}

/* 모달창 켜져있을때 클릭시 */
function qnaDetailModalAction() {
    const body = document.querySelector('body');
    const modal = document.querySelector('.modal');
    const btnOpenPopup = document.querySelector('.btn-open-popup');


    if (event.target === modal) {
        modal.classList.toggle('show');

        if (!modal.classList.contains('show')) {
            body.style.overflow = 'auto';
        }
    }
}

/*  QNA 게시판 댓글 작성 버튼 작동  */
function goWritingQNARecommentAction(sid, qna_no) {
    console.log('goWritingQNARecommentAction');

    let tr_code = 'insert';
    let qna_recomment_writer = sid;
    let qna_recomment_content = ($("input[name=qna_recomment_content]").serialize()).substr(22);
    let poolBase = 0;

    /*  ajax POST 방식으로 값 전송*/
    $.ajax({
        method: 'POST',
        url: '/qna/select/' + qna_recomment_writer + '/' + qna_no + '/rewrite',
        contentType: 'application/json',
        data: JSON.stringify({tr_code, qna_no, poolBase, qna_recomment_writer, qna_recomment_content}),
        error: function (xhr, status, error) {
            alert(error);
        },
        success: function (data) {
            console.log("Success");
            qnaDetailModalAction();
            $('#mainPanel').children().remove();
            $('#mainPanel').load(("/qna/select/MEM282108 #qnaListBoard"));

        },
    });

}


/*  QNA 게시판 댓글 수정 버튼 작동  */
function goUpdatingQNARecommentAction(sid, qna_no, indexNo, recoNo) {
    console.log('goUpdatingQNARecommentAction');
    console.log('sid==>' + sid);
    console.log('qna_no==>' + qna_no);
    console.log('indexNo==>' + indexNo);
    console.log(event.target);
    $(event.target).toggle();

    /*#recomment_space+indexNo*/
    $(event.target).before(" " +
        "       <form name='QnaRecommentForm' onsubmit=\"return false\" action='/select/sessionNO/qna_no/reupdate' method='post' datatype='json'>\n" +
        "            <fieldset>\n" +
        "                <input type='text' name='qna_recomment_content' onkeyup='recommentUpdateSubmitAction(sid,qna_no,indexNo" + indexNo + "," + recoNo + ")'> \n" +
        "            </fieldset>\n" +
        "            </p>\n" +
        "        </form>\n" +
        "        ");
}

/* 수정 입력란에 엔터키 조작시 업데이트 진행*/
function recommentUpdateSubmitAction(sid, qna_no, indexNo, recoNo) {
    if (window.event.keyCode == 13) {
        console.log('recommentUpdateSubmitAction');
        console.log(sid);
        console.log(qna_no);
        console.log(indexNo);
        let tr_code = 'update';
        let qna_recomment_writer = sid;
        let qna_recomment_content = ($("input[name=qna_recomment_content]").serialize()).substr(22);
        let qna_recomment_no = recoNo;

        /*  ajax POST 방식으로 값 전송*/
        $.ajax({
            method: 'POST',
            // url: "/qna/select/"+sid+"/"+qna_no+"/rewrite",
            url: '/qna/select/' + sid + '/' + qna_no + '/reupdate',
            contentType: 'application/json',
            data: JSON.stringify({tr_code, qna_no, qna_recomment_no, qna_recomment_writer, qna_recomment_content}),
            error: function (xhr, status, error) {
                alert(error);
            },
            success: function (data) {
                console.log("Success");
                qnaDetailModalAction();
                $('#mainPanel').children().remove();
                $('#mainPanel').load(("/qna/select/MEM282108 #qnaListBoard"));

            },
        });
    }
}

/* qna 게시판 댓글 삭제 버튼 조작*/
function goDeletingQNARecommentAction(sid, qna_no, indexNo, recoNo) {
    console.log('goDeletingQNARecommentAction');
    console.log(sid);
    console.log(qna_no);
    console.log(indexNo);
    let tr_code = 'delete';
    let qna_recomment_writer = sid;
    let qna_recomment_content = ($("input[name=qna_recomment_content]").serialize()).substr(22);
    let qna_recomment_no = recoNo;

    console.log(tr_code);
    console.log('qna_recomment_writer' + qna_recomment_writer);
    console.log('qna_recomment_content' + qna_recomment_content);
    console.log('qna_recomment_no' + qna_recomment_no);


    /*  ajax POST 방식으로 값 전송*/
    $.ajax({
        method: 'POST',
        // url: "/qna/select/"+sid+"/"+qna_no+"/rewrite",
        url: '/qna/select/' + sid + '/' + qna_no + '/redelete',
        contentType: 'application/json',
        data: JSON.stringify({tr_code, qna_no, qna_recomment_no, qna_recomment_writer, qna_recomment_content}),
        error: function (xhr, status, error) {
            alert(error);
        },
        success: function (data) {
            console.log("Success");
            qnaDetailModalAction();
            $('#mainPanel').children().remove();
            $('#mainPanel').load(("/qna/select/MEM282108 #qnaListBoard"));

        },
    });
}


/*  대쉬보드에서 예약현황 셀 클릭시 눌렀을 때*/
function reservationListBoardAction(e) {
    console.log('예약번호' + e.childNodes[0].innerText);
    console.log('reservationListBoardAction');

    reserv_no = e.childNodes[1].innerText;

    /* 입력 값 JSON 문법으로 변형 확인*/
    console.log('reserv_no ======> ' + reserv_no);

    /*  ajax Get 방식으로 값 전송*/
    $.ajax({
        method: 'GET',
        url: '/reservation/selectDetatil/' + reserv_no,
        contentType: 'application/json',
        data: reserv_no,
        error: function (xhr, status, error) {
            alert(error);
        },
        success: function (data) {
            // alert(xhr) // undefined 떨어짐
            // alert(status) // Object Object 떨어짐
            //alert(result) // success 떨어짐
            console.log("Success");
            alert(data);
            // console.log(data);
            $('#modalSpace').html(data);
            const body = document.querySelector('body');
            const modal = document.querySelector('.modal');
            const btnOpenPopup = document.querySelector('.btn-open-popup');

            console.log("reservationListBoardAction Processing");
            modal.classList.toggle('show');
            if (modal.classList.contains('show')) {
                body.style.overflow = 'hidden';
            }
        },
    });

    // $('#mainPanel').children().remove();
    // $rkv('#mainPanel').load(("/qna/select/MEM282108 #qnaListBoard"));

}


/* 슬라이드 메뉴에서 대쉬보드 버튼을 눌렀을 때*/
function goDashBoardPageAction() {
    console.log("goManagementDashBoardPageAction");

    slideIn();
    let p_sid = (sessionStorage.getItem('sid')).split('=');
    let sid = p_sid[1];

    $('#mainPanel').children().remove();

    $('#mainPanel').load("/Management/dash.do/" + sid + " #managementDashBoard");
}


/* 대쉬보드에서 예약현황 삭제버튼 눌렀을 때 */
function goDeleteReservAction(reserv_no,
                              space_no,
                              reserv_hostcode,
                              reserv_date,
                              reserv_start_time,
                              reserv_end_time,
                              reserv_host_mobile,
                              reserv_paystatement,
                              reserv_host_email) {
    console.log('reserv_no          ===> ' + reserv_no);
    console.log('space_no           ===> ' + space_no);
    console.log('reserv_hostcode    ===> ' + reserv_hostcode);
    console.log('reserv_date        ===> ' + reserv_date);
    console.log('reserv_start_time  ===> ' + reserv_start_time);
    console.log('reserv_end_time    ===> ' + reserv_end_time);
    console.log('reserv_host_mobile ===> ' + reserv_host_mobile);
    console.log('reserv_paystatement===> ' + reserv_paystatement);
    console.log('reserv_host_email  ===> ' + reserv_host_email);

    tr_code = 'delete';
    p_reserv_no = $("input[name=reserv_no]").serialize().split('=');
    p_space_no = $("input[name=space_no]").serialize().split('=');
    p_reserv_hostcode = $("input[name=reserv_hostcode]").serialize().split('=');
    p_reserv_date = $("input[name=reserv_date]").serialize().split('=');
    p_reserv_start_time = $("input[name=reserv_start_time]").serialize().split('=');
    p_reserv_end_time = $("input[name=reserv_end_time]").serialize().split('=');
    p_reserv_host_mobile = $("input[name=reserv_host_mobile]").serialize().split('=');
    p_reserv_paystatement = $("input[name=reserv_paystatement]").serialize().split('=');
    p_reserv_host_email = ($("input[name=reserv_host_email]").serialize()).split('=');

    reserv_no = p_reserv_no[1];
    space_no = p_space_no[1];
    reserv_hostcode = p_reserv_hostcode[1];
    reserv_date = p_reserv_date[1].substr(0, 10);
    reserv_start_time = p_reserv_start_time[1];
    reserv_end_time = p_reserv_end_time[1];
    reserv_host_mobile = p_reserv_host_mobile[1];
    reserv_paystatement = p_reserv_paystatement[1];
    reserv_host_email = p_reserv_host_email[1];


    // $('[name="reserv_detail_page_form"]').serialize();
    console.log(JSON.stringify({
        tr_code,
        reserv_no,
        space_no,
        reserv_hostcode,
        reserv_date,
        reserv_start_time,
        reserv_end_time,
        reserv_host_mobile,
        reserv_host_email,
        reserv_paystatement
    }));
    // console.log(JSON.stringify($('[name="reserv_detail_page_form"]')));

    /*  ajax POST 방식으로 값 전송*/
    $.ajax({
        method: 'POST',
        url: '/reservation/delete',
        contentType: 'application/json',
        data: JSON.stringify({
            tr_code,
            reserv_no,
            space_no,
            reserv_hostcode,
            reserv_date,
            reserv_start_time,
            reserv_end_time,
            reserv_host_mobile,
            reserv_host_email,
            reserv_paystatement
        }),
        // data: JSON.stringify($('[name="reserv_detail_page_form"]')),
        error: function (xhr, status, error) {
            alert(error);
        },
        success: function (data) {
            console.log("Success");
            qnaDetailModalAction();
            $('#mainPanel').children().remove();
            $('#mainPanel').load("/Management/dash.do #managementDashBoard");
            // https://coding-groot.tistory.com/91
        },
    });

}

function goUpdatingReservAction() {
    $('[name="member_name"]').attr('readonly', false);
    $('[name="reserv_date"]').attr('readonly', false);
    $('[name="reserv_start_time"]').attr('readonly', false);
    $('[name="reserv_end_time"]').attr('readonly', false);
    $('[name="reserv_host_mobile"]').attr('readonly', false);
    $('[name="reserv_host_email"]').attr('readonly', false);

}


/* 예약 상세 조회에서 수정 입력란에 변경후 엔터키 조작시 업데이트 진행*/
function UpdatingReservAction() {
    if (window.event.keyCode == 13) {
        console.log('UpdatingReservAction');
        tr_code = 'update';
        p_reserv_no = $("input[name=reserv_no]").serialize().split('=');
        p_space_no = $("input[name=space_no]").serialize().split('=');
        p_reserv_hostcode = $("input[name=reserv_hostcode]").serialize().split('=');
        p_reserv_date = $("input[name=reserv_date]").serialize().split('=');
        p_reserv_start_time = $("input[name=reserv_start_time]").serialize().split('=');
        p_reserv_end_time = $("input[name=reserv_end_time]").serialize().split('=');
        p_reserv_host_mobile = $("input[name=reserv_host_mobile]").serialize().split('=');
        p_reserv_paystatement = $("input[name=reserv_paystatement]").serialize().split('=');
        p_reserv_host_email = ($("input[name=reserv_host_email]").serialize()).split('=');

        reserv_no = p_reserv_no[1];
        space_no = p_space_no[1];
        reserv_hostcode = p_reserv_hostcode[1];
        reserv_date = p_reserv_date[1].substr(0, 10);
        reserv_start_time = p_reserv_start_time[1];
        reserv_end_time = p_reserv_end_time[1];
        reserv_host_mobile = p_reserv_host_mobile[1];
        reserv_paystatement = p_reserv_paystatement[1];
        reserv_host_email = p_reserv_host_email[1];

        /*  ajax POST 방식으로 값 전송*/
        $.ajax({
            method: 'POST',
            url: '/reservation/delete',
            contentType: 'application/json',
            data: JSON.stringify({
                tr_code,
                reserv_no,
                space_no,
                reserv_hostcode,
                reserv_date,
                reserv_start_time,
                reserv_end_time,
                reserv_host_mobile,
                reserv_host_email,
                reserv_paystatement
            }),
            // data: JSON.stringify($('[name="reserv_detail_page_form"]')),
            error: function (xhr, status, error) {
                alert(error);
            },
            success: function (data) {
                console.log("Success");
                qnaDetailModalAction();
                $('#mainPanel').children().remove();
                $('#mainPanel').load("/Management/dash.do #managementDashBoard");
                // https://coding-groot.tistory.com/91
            },
        });
    }
}

/* 파일 다운로드 액션  */
function goDownloadQnaFileAction(p_stored_file_name) {
    'use strict'
    let stored_file_name = p_stored_file_name;
    // console.log(JSON.stringify(({stored_file_name, qna_no})));


    let DownloadQnaFileFormData = new FormData();
    DownloadQnaFileFormData.append('stored_file_name', stored_file_name);
    DownloadQnaFileFormData.append('qna_no', qna_no);
// ---------------------------------->
    let xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {

            let fileName = getFileName(xhr.getResponseHeader('content-disposition'));
            fileName = decodeURI(fileName);

//this.response is what you're looking for
            console.log(this.response, typeof this.response);
            let a = document.createElement("a");
            let url = URL.createObjectURL(this.response)
            a.href = url;
            a.download = fileName;
            document.body.appendChild(a);
            a.click();
            window.URL.revokeObjectURL(url);
        }
    }
    xhr.open('POST', '/qna/download');
    xhr.responseType = 'blob'; // !!필수!!
    xhr.send(DownloadQnaFileFormData);
}


//   --------------------------------- >
/*

    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            var filename = "";
            var disposition = xhr.getResponseHeader('Content-Disposition');
            if (disposition && disposition.indexOf('attachment') !== -1) {
                var filenameRegex = /filename[^;=\n]*=((['"]).*?\2|[^;\n]*)/;
                var matches = filenameRegex.exec(disposition);
                if (matches != null && matches[1]) filename = matches[1].replace(/['"]/g, '');
            }
//this.response is what you're looking for
            console.log(this.response, typeof this.response);
            var a = document.createElement("a");
            var url = URL.createObjectURL(this.response)
            a.href = url;
            a.download = filename;
            document.body.appendChild(a);
            a.click();
            window.URL.revokeObjectURL(url);
        }
    }
    xhr.open('POST', '/qna/download');
    xhr.responseType = 'blob'; // !!필수!!
    xhr.send(DownloadQnaFileFormData);
};
*/

// ------------------------------------------->

/*  ajax POST 방식으로 값 전송*/

/*  $.ajax({
      method: 'POST',
      url: '/qna/download',
      contentType: false,
      enctype: 'multipart/form-data',
      data: DownloadQnaFileFormData,
      responseType: 'blob',
      // dataType: 'binary',
      processData: false,
     /!* method: 'POST',
      url: '/qna/download',
      contentType: 'application/json', // 여기타입 안맞아서 그런듯? 근데 POST로 보내는데 JSOn으로 dto에 떤져주는뎅.. 포스트랑 컨텐트타입 상관없어요 헤더에 정의 된대로 해석할뿐헐 사기당했네;
      data: JSON.stringify(({stored_file_name, qna_no})),*!/
      error: function (xhr, status, error) {
          alert(error);
      },
      success: function (data, textStatus, jqXhr) {
          console.log("Success");
          console.log(data);

          if (!data) {
              return;
          }
          try {
              var blob = new Blob([data], { type: jqXhr.getResponseHeader('content-type') });
              var fileName = getFileName(jqXhr.getResponseHeader('content-disposition'));
              fileName = decodeURI(fileName);
              if (window.navigator.msSaveOrOpenBlob) { // IE 10+
                  window.navigator.msSaveOrOpenBlob(blob, fileName);
              } else { // not IE
                  var link = document.createElement('a');
                  var url = window.URL.createObjectURL(blob);
                  link.href = url;
                  link.target = '_self';
                  if (fileName) link.download = fileName;
                  document.body.append(link);
                  link.click();
                  link.remove();
                  window.URL.revokeObjectURL(url);
              }
          } catch (e) {
              console.error(e)
          }

      }});}*/
function getFileName(contentDisposition) {
    var fileName = contentDisposition
        .split(';')
        .filter(function (ele) {
            return ele.indexOf('filename') > -1
        })
        .map(function (ele) {
            return ele
                .replace(/"/g, '')
                .split('=')[1]
        });
    return fileName[0] ? fileName[0] : null
}

/* 대쉬보드에서 지점관리 버튼, 혹은 슬라이드 메뉴에서 지점 관리 버튼 클릭시 */
function goBranchOfficeListBoardAction() {
    console.log("goBranchOfficeListBoardAction");
    $('#mainPanel').children().remove();
    $('#mainPanel').load("/BracnchOffice/select", function () {

        console.log(sessionStorage.getItem('sid'));

        if (sessionStorage.getItem('sid') === 'member_no=MEM282108') {
            let bracnchOfficeManageMenu = document.getElementById("dropdown");
            bracnchOfficeManageMenu.innerHTML = "<button onclick='dp_menu()' class='branchoffice_button btn btn-primary'>지점 관리</button>" +
                "<div style='display: none;' id='drop-content'>" +
                "<button id='createBranchOffice' class='btn btn-primary' onclick='doRegisterBranchOfficeAction()'>신규 지점</button>" +
                "<button id='updateBranchOffice' class='btn btn-primary' >지점 수정</button>" +
                "<button id='deleteBranchOffice' class='btn btn-primary'> 지점 삭제</button>" +
                "</div>";
        }
    });
    /*

        // ---------------------------------->
        let xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {

                let elementMainPanel = document.getElementById("mainPanel");
                elementMainPanel.removeChild(elementMainPanel.firstElementChild);
                // $('#mainPanel').children().remove($('#mainPanel').children());
                elementMainPanel.innerHTML += xhr.responseText;
                // document.getElementById("modalSpace").innerHTML += "<script> console.log('ABCt'); </script>";
                console.log(xhr.responseText);

                // let fileName = getFileName(xhr.getResponseHeader('content-disposition'));
                // fileName = decodeURI(fileName);

                if (localStorage.getItem('session_no') === 'MEM282108') {
                    let session_no = localStorage.getItem('session_no');
                    console.log(session_no);
                    let bracnchOfficeManageMenu = document.getElementById(''');
                    bracnchOfficeManageMenu.innerHTML =
                        "<button onclick=\"dp_menu()\" class=\"branchoffice_button btn btn-primary\">지점 관리</button>" +
                        "<div style=\"display: none;\" id=\"drop-content\">" +
                        "<button id='createBranchOffice' class=\"btn btn-primary\" onclick='doRegisterBranchOfficeAction()'>신규 지점</button>" +
                        "<button id='updateBranchOffice' class=\"btn btn-primary\" >지점 수정</button>" +
                        "<button id='deleteBranchOffice' class=\"btn btn-primary\"> 지점 삭제</button>" +
                        "</div>";
                }

            }

        }
        let p_sid = (sessionStorage.getItem('sid')).split('=');
        let session_no = p_sid[1];
        localStorage.setItem("session_no", session_no);
        xhr.open('POST', '/BracnchOffice/select');
        // xhr.responseType = 'blob'; // !!필수!!
        xhr.setRequestHeader('Content-Type','application/json');
        console.log(JSON.stringify(({session_no})));
        xhr.send(JSON.stringify(({session_no})));
        // ----------------------------------------------<<
        */


}

//----------------

/*    //---------
    method: 'POST',
        url: '/qna/download',
        contentType: false,
        enctype: 'multipart/form-data',
        data: DownloadQnaFileFormData,
        responseType: 'blob',
        // dataType: 'binary',
        processData: false,
    // ---*/
//
// /*  ajax POST 방식으로 값 전송*/
// $.ajax({
//     method: 'POST',
//     url: '/BracnchOffice/select',
//     // contentType: 'application/json',
//     contentType: false,
//     enctype: 'multipart/form-data',
//     data: JSON.stringify(({session_no})),
//     responseType: 'blob',
//     // responseType: 'blo',
//     error: function (xhr, status, error) {
//         alert(error);
//     },
//     success: function (data) {
//         console.log("Success");
//         console.log(data);
//         $('#mainPanel').children().remove();
//
//         $('#mainPanel').html(data);
//         // $('#mainPanel').load("/BracnchOffice/select #branchOfficeSelectList");
//         localStorage.setItem("session_no", session_no);
//         //div생성할것
//         if (localStorage.getItem('session_no') === 'MEM282108') {
//             let session_no = localStorage.getItem('session_no');
//             console.log(session_no);
//             let bracnchOfficeManageMenu = document.getElementById(''');
//             bracnchOfficeManageMenu.innerHTML = "<button onclick=\"dp_menu()\" class=\"branchoffice_button btn btn-primary\">지점 관리</button>" +
//                 "<div style=\"display: none;\" id=\"drop-content\">" +
//                 "<button id='createBranchOffice' class=\"btn btn-primary\" onclick='doRegisterBranchOfficeAction()'>신규 지점</button>" +
//                 "<button id='updateBranchOffice' class=\"btn btn-primary\" >지점 수정</button>" +
//                 "<button id='deleteBranchOffice' class=\"btn btn-primary\"> 지점 삭제</button>" +
//                 "</div>";
//         }
/*
else {
    let session_no = localStorage.getItem('session_no');
    console.log(session_no);
    let bracnchOfficeManageMenu = document.getElementById(''');
    bracnchOfficeManageMenu.innerHTML = "<button onclick=\"dp_menu()\" class=\"branchoffice_button btn btn-primary\">지점 관리</button>" +
        "<div style=\"display: none;\" id=\"drop-content\">" +
        "<button id='createBranchOffice' class=\"btn btn-primary\">신규 지점</button>" +
        "<button id='updateBranchOffice' class=\"btn btn-primary\" >지점 수정</button>" +
        "<button id='deleteBranchOffice' class=\"btn btn-primary\"> 지점 삭제</button>" +
        "</div>";
}
*/
//         },
//     })
//
// }

function dp_menu() {
    let click = document.getElementById("drop-content");
    if (click.style.display === "none") {
        click.style.display = "block";

    } else {
        click.style.display = "none";

    }
}


/* ClientDashBoard에서 문의하기 클릭시 눌렀을 때*/
function doWriteQnaAction() {


    console.log("doWriteQnaAction");
    $('#modalSpace').load("/Client/qnaWrite.do #clientQnaBoardWriteModal", function () {
        const body = document.querySelector('body');
        const modal = document.querySelector('.modal');
        const btnOpenPopup = document.querySelector('.btn-open-popup');

        console.log("qnaDetailBoardAction Processing");
        modal.classList.toggle('show');

        if (modal.classList.contains('show')) {
            body.style.overflow = 'hidden';
        }
    });
} //end of doWriteQnaAction


/* 지점관리에서 신규지점 버튼 눌렀을때*/
function doRegisterBranchOfficeAction() {

    console.log("doRegisterBranchOfficeAction");
    $('#modalSpace').load("/Management/newbranchoffice.do #branchOfficeInsertModal", function () {
        const body = document.querySelector('body');
        const modal = document.querySelector('.modal');
        const btnOpenPopup = document.querySelector('.btn-open-popup');

        console.log("BranchOfficeAction Processing");
        modal.classList.toggle('show');

        if (modal.classList.contains('show')) {
            body.style.overflow = 'hidden';
        }
    });
} //End of doRegisterBranchOfficeAction()

/* 신규 지점 등록 */
function newBranchOfficeInsert(e) {
    'use strict'

    console.log("newBranchOfficeInsert()");
    let tr_code = 'insert';
    let branchOffice_name = document.getElementById('newBranchOfficeName').value;
    let branchOffice_local = document.getElementById('newBranchOfficeLocal').value;
    let branchOffice_mobile = document.getElementById('newBranchOfficeMobile').value;
    let branchOffice_address = document.getElementById('newBranchOfficeAddress').value;
    let branchOffice_no = '0000a0';
    let imgFile = document.getElementById('imageSelector').files;

    console.log(imgFile);

    for (var i = 0; i < imgFile.length; i++) {
        console.log(imgFile[i]);
    }

    let newBranchOfficeFormData = new FormData();

    if (imgFile.length != 0) {
        for (var i = 0; i < imgFile.length; i++) {
            newBranchOfficeFormData.append('imgFile', imgFile[i]);
        }
    }
    for (var i = 0; i < imgFile.length; i++) {
        console.log('===> formData==>' + newBranchOfficeFormData.get('imgFile'));
    }
    console.log('===>>   ' + newBranchOfficeFormData.getAll('imgFile'));

    newBranchOfficeFormData.append('tr_code', tr_code);
    newBranchOfficeFormData.append('branchoffice_name', branchOffice_name);
    newBranchOfficeFormData.append('branchoffice_local', branchOffice_local);
    newBranchOfficeFormData.append('branchoffice_mobile', branchOffice_mobile);
    newBranchOfficeFormData.append('branchoffice_address', branchOffice_address);
    newBranchOfficeFormData.append('branchoffice_no', branchOffice_no);

    // FormData의 key 확인
    for (let newBranchOfficeDatakey of newBranchOfficeFormData.keys()) {
        console.log('FormData의 key 확인' + newBranchOfficeDatakey);
    }

// FormData의 value 확인
    for (let newBranchOfficeFormValue of newBranchOfficeFormData.values()) {
        console.log('FormData의 value 확인' + newBranchOfficeFormValue);
    }

    /*  ajax POST 방식으로 값 전송*/
    $.ajax({
        method: 'POST',
        url: '/BracnchOffice/register',
        contentType: false,
        enctype: 'multipart/form-data',
        data: newBranchOfficeFormData,
        processData: false,
        error: function (xhr, status, error) {
            alert(error);
        },
        success: function (data) {
            console.log("Success");
            qnaDetailModalAction();
            $('#mainPanel').children().remove();
            $('#mainPanel').append("/BracnchOffice/select");

        },
    });
}


function readURL(input) {
    if (input.files && input.files[0]) {
        for (let image of event.target.files) {
            let reader = new FileReader();
            reader.onload = function (e) {
                let img = document.createElement("img");
                // document.getElementById('preview').src = e.target.result;
                // document.getElementById('preview').setAttribute('width', 250);
                img.setAttribute("src", event.target.result);
                document.querySelector("div#image_container").appendChild(img);
                // document.querySelector("div#image_container").setAttribute('width',250);
                // document.querySelector("div#image_container img").setAttribute('width',250);
                var jb = document.querySelectorAll('div#image_container img');
                for (var i = 0; i < jb.length; i++) {
                    jb[i].style.width = 250;
                    jb[i].addEventListener('dblclick', function () {
                        if (document.querySelector("div#image_container") != null) {
                            document.querySelector("div#image_container").removeChild(this);
                        }
                    })
                }

            };

            // reader.readAsDataURL(input.files[0]);
            reader.readAsDataURL(image);
        }
    } else {
        document.getElementById('image_container').src = "";
    }
}


/* 지점관리페이지에서 지점상세 버튼 버튼 클릭시 */
function goBranchOfficeDetailBoard(){
                                   //p_branchoffice_no,
                                   //p_branchoffice_name,
                                   //p_branchOffice_local,
                                   //p_branchOffice_address,
                                   //p_branchOffice_mobile
// ) {
    console.log("goBranchOfficeDetailBoard");

    /*
    let branchoffice_no = document.getElementById("branchOffice_no").textContent;
    let branchoffice_name = document.getElementById("branchOffice_name").textContent;
    let branchOffice_local = document.getElementById("branchOffice_local").textContent;
    let branchOffice_address = document.getElementById("branchOffice_address").textContent;
    let branchOffice_mobile = document.getElementById("branchOffice_mobile").textContent;
    */
    // document.getElementById().parentNode.parentNode.parentNode.firstElementChild.firstElementChild.
    // document.getElementById().parentNode.parentNode.parentNode.firstElementChild.firstElementChild.nextElementSibling
    // branchoffice_no      = event.target.parentNode.parentNode.parentNode.firstElementChild.firstElementChild.firstElementChild.textContent;
    let parent = event.target.closest(".card");
    branchoffice_no      = parent.getElementsByClassName("branchOffice_no").item(0).textContent;
    branchoffice_name    = parent.getElementsByClassName("branchOffice_name").item(0).textContent;
    // branchoffice_name    = event.target.parentNode.parentNode.parentNode.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.textContent;
    // branchoffice_name    = e.target.parentNode.parentNode.parentNode.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.textContent;
    // branchOffice_local   = event.target.parentNode.parentNode.parentNode.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.textContent.split("\n")[0];
    branchOffice_local   = parent.getElementsByClassName("branchOffice_local").item(0).textContent;
    // branchOffice_address = event.target.parentNode.parentNode.parentNode.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.textContent.split("\n")[1];
    // branchOffice_address = event.target.parentNode.parentNode.parentNode.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.textContent;
    branchOffice_address = parent.getElementsByClassName("branchOffice_address").item(0).textContent;
    // branchOffice_mobile  = event.target.parentNode.parentNode.parentNode.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.textContent.split("\n")[2];
    // branchOffice_mobile  = event.target.parentNode.parentNode.parentNode.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.textContent
    branchOffice_mobile  = parent.getElementsByClassName("branchOffice_mobile").item(0).textContent;


    console.log(JSON.stringify(({branchoffice_no})));

    sessionStorage.setItem("branchoffice_name", branchoffice_name);
    sessionStorage.setItem("branchoffice_no", branchoffice_no);
    sessionStorage.setItem("branchOffice_local", branchOffice_local);
    sessionStorage.setItem("branchOffice_address", branchOffice_address);
    sessionStorage.setItem("branchOffice_mobile", branchOffice_mobile);

    /*  ajax POST 방식으로 값 전송*/
    $.ajax({
        method: 'POST',
        url: '/BracnchOffice/detail',
        contentType: 'application/json',
        data: JSON.stringify(({branchoffice_no})),
        error: function (xhr, status, error) {
            alert(error);
        },
        success: function (data) {
            console.log("Success");
            $('#modalSpace').html(data);
            const body = document.querySelector('body');
            const modal = document.querySelector('.modal');
            const btnOpenPopup = document.querySelector('.btn-open-popup');

            console.log("qnaDetailBoardAction Processing");
            modal.classList.toggle('show');

            if (modal.classList.contains('show')) {
                body.style.overflow = 'hidden';

            }
            ;
        }

    });
}