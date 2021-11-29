/*  대시보드에서 Q&A 이미지영역 눌렀을 때*/
function qnaListBoardAction() {
    console.log("checkListBoardAction");

    $('#mainPanel').children().remove();
    $('#mainPanel').load(("/qna/select/MEM282108 #qnaListBoard"));

}

/*  Q&A 게시판에서 셀 클릭시 눌렀을 때*/
function qnaDetailBoardAction(e) {
    console.log('qnaDetailBoardAction');
    qna_no = e.childNodes[1].innerText;

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

    tr_code = 'insert';
    qna_recomment_writer = sid;
    qna_recomment_content = ($("input[name=qna_recomment_content]").serialize()).substr(22);
    poolBase = 0;

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
        tr_code = 'update';
        qna_recomment_writer = sid;
        qna_recomment_content = ($("input[name=qna_recomment_content]").serialize()).substr(22);
        qna_recomment_no = recoNo;

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
    tr_code = 'delete';
    qna_recomment_writer = sid;
    qna_recomment_content = ($("input[name=qna_recomment_content]").serialize()).substr(22);
    qna_recomment_no = recoNo;

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

    event.stopPropagation();
    console.log('예약번호' + e.childNodes[0].innerText);
    // document.getElementsByTagName('tr')[1].childNodes[0].innerText
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

};


/* 슬라이드 메뉴에서 대쉬보드 버튼을 눌렀을 때*/
function goDashBoardPageAction() {
    console.log("goManagementDashBoardPageAction");
    varInitial();
    stopInterval();
    slideIn();
    p_sid = (sessionStorage.getItem('sid')).split('=');
    sid = p_sid[1];

    $('#mainPanel').children().remove();

    $('#mainPanel').load("/Management/dash.do/" + sid + " #managementDashBoard");
};


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
    event.stopPropagation();
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
    event.stopPropagation();
    $('[name="member_name"]').attr('readonly', false);
    $('[name="reserv_date"]').attr('readonly', false);
    $('[name="reserv_start_time"]').attr('readonly', false);
    $('[name="reserv_end_time"]').attr('readonly', false);
    $('[name="reserv_host_mobile"]').attr('readonly', false);
    $('[name="reserv_host_email"]').attr('readonly', false);

}


/*   예약 상세 조회에서 수정 입력란에 변경후 엔터키 조작시 업데이트 진행  */
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
    stored_file_name = p_stored_file_name;
    // console.log(JSON.stringify(({stored_file_name, qna_no})));

    DownloadQnaFileFormData = new FormData();
    DownloadQnaFileFormData.append('stored_file_name', stored_file_name);
    DownloadQnaFileFormData.append('qna_no', qna_no);
// ---------------------------------->
    let xhr = new XMLHttpRequest();
    loadingElement.setAttribute('style', 'display:block');
    xhr.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            loadingElement.setAttribute('style', 'display:none');
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
    stopInterval();
    varInitial();

    for (let i = 0; i < document.getElementById('mainPanel').children.length; i++) {
        document.getElementById('mainPanel').children.item(i).remove();
    }

    // let slideShow_container = document.createElement('div');
    // slideShow_container.classList.add('slideshow-container');

    // let mySlides_fade = document.createElement()

    // document.getElementById('mainPanel').append();

    var xhr = new XMLHttpRequest();
    loadingElement.setAttribute('style', 'display:block');

    xhr.open('GET', '/BracnchOffice/selectPage', true);
    xhr.setRequestHeader('Content-type', 'application/json');
    xhr.send('');

    xhr.onreadystatechange = function () {
        if (xhr.status == 200 && xhr.readyState == 4) {

            console.log('통신성공');

            document.getElementById('mainPanel').innerHTML = xhr.response;

            console.log('====+++> xhr1' + xhr.response);

            if (sessionStorage.getItem('sid') === 'member_no=MEM282108') {
                let bracnchOfficeManageMenu = document.getElementById("dropdown");

                bracnchOfficeManageMenu.innerHTML =

                    "<button onclick='dp_menu()' class='branchoffice_button btn btn-primary'>지점 관리</button>" +
                    "<div style='display: none;' id='drop-content'>" +
                    "<button id='createBranchOffice' class='btn btn-primary' onclick='doRegisterBranchOfficeAction()'>신규 지점</button>" +
                    // "<button id='updateBranchOffice' class='btn btn-primary' onclick='doUpdateBranchOffice()' >지점 수정</button>" +
                    // "<button id='deleteBranchOffice' class='btn btn-primary'> 지점 삭제</button>" +
                    "</div>";

            } // end of if  (sessionStorage.getItem('sid') === 'member_no=MEM282108')

            var xhr2 = new XMLHttpRequest();
            xhr2.onreadystatechange = async function () {
                if (this.status == 200 && this.readyState == 4) {
                    console.log('2nd XML');
                    console.log('====++> xhr2' + xhr2.response);
                    let bracnchOfficeSelectMap = JSON.parse(xhr2.response);
                    loadingElement.setAttribute('style', 'display:none');
                    // console.log(bracnchOfficeSelectMap.branchOfficeImgSelectList);

                    let branchOfficeSelectList = bracnchOfficeSelectMap.branchOfficeSelectList;
                    let branchOfficeImgSelectList = bracnchOfficeSelectMap.branchOfficeImgSelectList;

                    // let slideArrayData = {
                    //     slides: [],
                    //     dots: [],
                    //     size: [],
                    //     slideIndex: [],
                    //     slideLength: [],
                    //     dotsLength: []
                    // };

                    // let slideIndex = 0;

                    for (let i = 0; i < branchOfficeSelectList.length; i++) {
                        console.log(branchOfficeSelectList);

                        var imageCounter = Number(0);

                        var slideShow_container = document.createElement('div');
                        slideShow_container.setAttribute('id', 'slideshow-container' + i);
                        slideShow_container.classList.add('slideshow-container');
                        document.getElementById('branchOfficeSelectList').append(slideShow_container);

                        // console.log(branchOfficeImgSelectList[i].getBranchoffice_img_code);

                        if (branchOfficeSelectList[i].branchoffice_haspic == 'Y') {

                            var countNumForHowManyThisBranchOfficeHasImage = Number(0);

                            for (let k = 0; k < branchOfficeImgSelectList.length; k++) {
                                if (branchOfficeSelectList[i].branchoffice_no == branchOfficeImgSelectList[k].branchoffice_no) {
                                    countNumForHowManyThisBranchOfficeHasImage++;
                                }
                            }
                            for (let j = 0; j < branchOfficeImgSelectList.length; j++) {


                                if (branchOfficeSelectList[i].branchoffice_no == branchOfficeImgSelectList[j].branchoffice_no) {

                                    console.log(' j  ============>' + j);
                                    var currentImageNum = 1;
                                    let branchOfficeImgSelectList = bracnchOfficeSelectMap.branchOfficeImgSelectList;
                                    var mySlides_fade = document.createElement('div');
                                    mySlides_fade.classList.add('mySlides' + i); //sss
                                    mySlides_fade.classList.add('mySlides');

                                    mySlides_fade.classList.add('fade');
                                    slideShow_container.append(mySlides_fade);

                                    var numbertext = document.createElement('numbertext');

                                    numbertext.classList.add('numbertext');

                                    // numbertext.innerText = (j + 1) + ' / ' + countNumForHowManyThisBranchOfficeHasImage;
                                    numbertext.innerText = currentImageNum + ' / ' + countNumForHowManyThisBranchOfficeHasImage;
                                    mySlides_fade.append(numbertext);
                                    var img_src = document.createElement('img');//working here

                                    img_src.setAttribute('src', 'data:image/png; base64,' + branchOfficeImgSelectList[j].branchoffice_img_code);
                                    img_src.setAttribute('style', 'width:60%; height:40%; margin-left:20%');
                                    mySlides_fade.append(img_src);


                                    // currentImageNum++;


                                } //End of if (branchOfficeSelectList[i].branchoffice_no == branchOfficeImgSelectList[j].branchoffice_no)


                            } //End of for (let j = 0; j < branchOfficeImgSelectList.length; j++) {

                            var dots_circles = document.createElement('div');
                            dots_circles.setAttribute('style', 'text-align:center');
                            slideShow_container.append(dots_circles);
                            for (let m = 0; m < countNumForHowManyThisBranchOfficeHasImage; m++) {
                                var dot = document.createElement('span');
                                dot.classList.add('dot');
                                dot.classList.add('dotP' + i);
                                // dot.setAttribute('style','cursor: pointer;\n' +
                                //     '    height: 15px;\n' +
                                //     '    width: 15px;\n' +
                                //     '    margin: 5px;\n' +
                                //     '    background-color: #bbb;\n' +
                                //     '    border-radius: 50%;\n' +
                                //     '    display: inline-block;\n' +
                                //     '    transition: background-color 0.6s ease;')
                                // dot.addEventListener('click',currentSlide(j));

                                dots_circles.append(dot);

                            }// end of For (let j = 0; j < countNumForHowManyThisBranchOfficeHasImage;
                            // var slides = document.getElementsByClassName("mySlides");
                            // var slides = document.getElementsByClassName("mySlides" + i);


                            // Thumbnail image controls
                            function currentSlide(n) {
                                console.log('currentSlide===> 동작');
                                // slideIndex = n;
                                //  eval('slideIndex'+i+'=n;');
                                slideArrayData.slideIndex[i] = n;

                                // showSlides( eval('slideIndex'+i));
                                showSlides(slideArrayData.slideIndex[i]);
                            }

                        } // end of if (branchOfficeSelectList[i].branchoffice_haspic == 'Y')
                        /////////////////////////////////
                        slideArrayData.slides.push(document.getElementsByClassName("mySlides" + i));

                        // eval("var slides"+i+"=document.getElementsByClassName(\"mySlides\" + i);")
                        // var dots = document.getElementsByClassName('dot'); //sss
                        // var dotPs = document.getElementsByClassName('dotP' + i);

                        slideArrayData.dots.push(document.getElementsByClassName("dotP" + i));
                        // eval("var dotPs"+i+"=document.getElementsByClassName(\"dotP\" + i);");
                        // var dots = document.getElementsByClassName('dot');
                        // var size = slides.length;

                        slideArrayData.size.push(Number(document.getElementsByClassName("mySlides" + i).length));
                        // eval("var size"+i+"=slides"+i+".length;");

                        slideArrayData.slideIndex.push(Number(0));
                        // eval('var slideIndex'+i+'=0');

                        slideArrayData.slideLength.push(Number(document.getElementsByClassName("mySlides" + i).length));
                        slideArrayData.dotsLength.push(Number(document.getElementsByClassName("dotP" + i).length));

                        var sec = 4000;

                        if (slideArrayData.slideLength[i] !== 0) {

                            branchOfficeImgSlideShow = setInterval(function () { //시간마다 반복함
                                console.log(branchOfficeImgSlideShow);
                                'use strict';
                                // slideIndex++;
                                // eval('slideIndex'+i+'++;');


                                // slideArrayData.slideIndex.splice(i,1,slideArrayData.slideIndex++);

                                // console.log('setInterval에서의 slideArrayData.slideIndex[i] =====>>>>>'+slideArrayData.slideIndex[i]);
                                // console.log('setInterval에서의 slideArrayData.slideIndex[i] 타입 =====>>>>>'+typeof slideArrayData.slideIndex[i]);


                                showSlides(slideArrayData.slideIndex[i]); // i가 인이입되서 진행
                                // showSlides(slideArrayData.slides[imageCounter]); // i가 인이입되서 진행
                                // console.log('=============After showSlides');
                                // console.log('-----END OF FUNCTION----------END OF FUNCTION----------END OF FUNCTION-----');
                                // slideIndex++;
                                slideArrayData.slideIndex[i] = slideArrayData.slideIndex[i] + Number(1); // i++ 증가
                                // slideArrayData.slides[imageCounter] = slideArrayData.slides[imageCounter]+Number(1); // i++ 증가

                            }, sec); //시간마다z`

                            // showSlides(eval('slideIndex'+i));
                        } else {
                            // console.log(' 이미지가 없는 지점패스 ');
                        }

                        async function showSlides(n) { // 0 이라면
                            'use strict';

                            // console.log('최초 인입된 n === > ' +n); // 5이상 들어와도
                            // console.log('최초 인입된 n === > ' +typeof n);
                            // console.log('slideArrayData.size[i]=====>'+slideArrayData.size[i]);
                            // console.log('slideArrayData.size[i] TYPE=== > ' +typeof slideArrayData.size[i]);

                            // if ((n + 1) > eval('size'+i)) { // 0+1 > slides = 15ea // 넘버가 슬라이드 갯수보다 크다면 초기화
                            if ((n + 1) > slideArrayData.size[i]) { // 0+1 > slides = 15ea // 넘버가 슬라이드 갯수보다 크다면 초기화                                   eval('slideIndex'+i+'=0;')  // 0
                                // console.log('-----if--(n + 1) > slideArrayData.size[i]------'+(n + 1)+'(-n+1-)'+slideArrayData.size[i]);
                                n = 0; // 0
                                slideArrayData.slideIndex[i] = 0;
                                // slideArrayData.slides[imageCounter] = 0;
                                // console.log('After  N=====>' + n);
                                // console.log('if ((n + 1) > size) ====> n === >'+n+'\n ===> size '+size);
                            } else if (n < 0) {  // 0<0  N이 0보다 작다면 // -? 탈일은 없는데
                                // slideIndex = (size - 1); // 인덱스는 15-1
                                // eval('slideIndex'+i+'=(size'+i+'-1);');
                                // console.log('----else-if-------------------');
                                slideArrayData.slideIndex[i] = slideArrayData.size[i] - 1;
                                // console.log('slideArrayData.slideIndex[i] = slideArrayData.size[i] - 1;===> '+slideArrayData.slideIndex[i]);

                                // n = (size - 1); // n = 15 -1
                                // n = (eval('size'+i) - 1); // n = 15 -1
                                n = slideArrayData.size[i] - 1;
                                // console.log('After Else if ======>'+ n);

                                // console.log('if ((n + 1) > size) ====> n === >'+n+'\n ===> size '+size+'\n ===> slideIndex '+slideIndex  );
                            } else {
                                // console.log('-----------------else------------------------------');
                            }
                            // console.log('NNNNNNNNNNNNNNNNNNNN ==========> ++++++++====>'+n);
                            // console.log('slideArrayData.slideLength[i]----------------->'+slideArrayData.slideLength[i]);
                            // console.log('slideArrayData.slideLength[i]----------------->'+typeof slideArrayData.slideLength[i]);
                            // for (let o = 0; o < eval('slides'+i).length; o++) { // i = 0; 0 <15 ; 0++

                            for (let o = 0; o < slideArrayData.slideLength[i]; o++) { // i = 0; 0 <15 ; 0++

                                // console.log('========> slides.length' + slides.length +'\n'+ '======>i ==>'+i);
                                // eval('slides'+i+'[o].style.display = "none";'); //15인덱스 마다 모두 화면 없애준다.
                                // console.log(' -----------> FOR o ------->FOR o');
                                // console.log('========i>>>>'+i);
                                // console.log('========o>>>>'+o);
                                // slideArrayData.slides[i][o].style.display = "none;";
                                slideArrayData.slides[i][o].setAttribute("style", "display:none;");
                            }
                            // for (let p = 0; p < eval('dotPs'+i).length; p++) { //i =0 ; 0 < 15; 0++

                            for (let p = 0; p < slideArrayData.dotsLength[i]; p++) { //i =0 ; 0 < 15; 0++

                                // console.log('========> dotPs.length' + dotPs.length +'\n'+ '======>i ==>'+i);
                                // eval('dotPs'+i)[p].className = eval('dotPs'+i)[p].className.replace(" active", ""); // 번갈아가면 해당 번호 active 들어가있는 객체에서 active 모두 빼준다.
                                // dots[i].className = dots[i].className.replace(" active", ""); // 번갈아가면 해당 번호 active 들어가있는 객체에서 active 모두 빼준다.
                                // console.log('=============== > ============> =========== > '+slideArrayData.dots[i][p].className);
                                // console.log(slideArrayData.dots[i][p].className.replace(" active", ""));

                                slideArrayData.dots[i][p].className = slideArrayData.dots[i][p].className.replace(" active", "");
                                // slideArrayData.dots[i][p].classList.replace(" active", "");

                                // if (slideArrayData.dots[i][p].classList.contains("active")){
                                // slideArrayData.dots[i][p].classList.remove("active");
                                // }
                            }

                            // console.log('n=========>' + n + '\n' + 'i----------->' + i);


                            // eval('slides'+i)[n].style.display = "block"; // n번 슬라이드 켜주기
                            slideArrayData.slides[i][n].style.display = "block";
                            // eval('dotPs'+i)[n].className += " active"; // n번 active 구슬 켜주기
                            slideArrayData.dots[i][n].className += " active";
                        }  //End of  function showSlides(n)


                        var section = document.createElement('section');//rrr
                        section.classList.add('py-5');
                        document.getElementById('slideshow-container' + i).append(section);

                        var container = document.createElement('div');
                        container.classList.add('container');
                        container.classList.add('px-4');
                        container.classList.add('px-lg-5');
                        // container.classList.add('mt-5');
                        section.append(container);

                        var row = document.createElement('div');
                        row.classList.add('row');
                        row.classList.add('gx-4');
                        row.classList.add('gx-lg-5');
                        row.classList.add('row-cols-md-3');
                        row.classList.add('row-cols-xl-4');
                        row.classList.add('justify-content-center');
                        container.append(row);

                        var col = document.createElement('div');
                        col.classList.add('col');
                        col.classList.add('mb-5');
                        row.append(col);

                        var card = document.createElement('div');
                        card.classList.add('card');
                        card.classList.add('h-100');
                        col.append(card);

                        <!-- BranchOffice details-->

                        var cardBody = document.createElement('div');
                        cardBody.classList.add('card-body');
                        cardBody.classList.add('p-4');
                        card.append(cardBody);

                        var textBox = document.createElement('div');
                        textBox.classList.add('text-center');
                        cardBody.append(textBox);

                        var detailBox = document.createElement('div');
                        detailBox.setAttribute('style', 'display:none;')
                        detailBox.classList.add('text-center');
                        cardBody.append(detailBox);

                        <!-- BranchOffice No-->
                        var branchNo = document.createElement('h9');
                        branchNo.classList.add('branchOffice_no');
                        branchNo.classList.add('fw-bolder');
                        branchNo.setAttribute('id', 'branchOffice_no' + i);
                        // branchInfo.setAttribute('style','display:none');
                        branchNo.innerText = branchOfficeSelectList[i].branchoffice_no;
                        textBox.append(branchNo);

                        <!-- BranchOffice name-->
                        var branchName = document.createElement('h5');
                        branchName.classList.add('branchOffice_name');
                        branchName.classList.add('fw-bolder');
                        branchName.setAttribute('id', 'branchOffice_name' + i);
                        branchName.innerText = branchOfficeSelectList[i].branchoffice_name;
                        textBox.append(branchName);

                        <!-- BranchOffice local-->
                        var branchLocal = document.createElement('h8');
                        branchLocal.classList.add('branchOffice_local');
                        branchLocal.setAttribute('id', 'branchOffice_local' + i);
                        branchLocal.innerText = branchOfficeSelectList[i].branchoffice_local;
                        detailBox.append(branchLocal);

                        <!-- BranchOffice address-->
                        var branchAddress = document.createElement('h8');
                        branchAddress.classList.add('branchOffice_address');
                        branchAddress.setAttribute('id', 'branchOffice_address' + i);
                        branchAddress.innerText = branchOfficeSelectList[i].branchoffice_address;
                        detailBox.append(branchAddress);

                        <!-- BranchOffice mobile-->
                        var branchMobile = document.createElement('h8');
                        branchMobile.classList.add('branchOffice_mobile');
                        branchMobile.setAttribute('id', 'branchOffice_mobile' + i);
                        branchMobile.innerText = branchOfficeSelectList[i].branchoffice_mobile;
                        detailBox.append(branchMobile);

                        var cardFooter = document.createElement('div');
                        cardFooter.classList.add('card-footer');
                        cardFooter.classList.add('p-4');
                        cardFooter.classList.add('pt-0');
                        cardFooter.classList.add('border-top-0');
                        cardFooter.classList.add('bg-transparent');
                        card.append(cardFooter);

                        var branchButton = document.createElement('div');
                        branchButton.classList.add('text-center');
                        card.append(branchButton);

                        var goBranchOfficeDetailBoardBtn = document.createElement('a');
                        goBranchOfficeDetailBoardBtn.setAttribute('id', 'goBranchOfficeDetailBoard' + i);
                        goBranchOfficeDetailBoardBtn.classList.add('btn');
                        goBranchOfficeDetailBoardBtn.classList.add('btn-outline-dark');
                        goBranchOfficeDetailBoardBtn.classList.add('mt-auto');
                        goBranchOfficeDetailBoardBtn.innerText = '지점상세';

                        card.append(goBranchOfficeDetailBoardBtn);
                        document.getElementById('goBranchOfficeDetailBoard' + i).addEventListener('click', goBranchOfficeDetailBoard);
                        // eval("let slideIndex"+i+"=0");
                        // var slideIndex = 0; //slide index //sss

                        // showSlides(slideIndex);

                        /*
                                                for (let p = 0; p < dots.length; p++) {

                                                    var slide_num = Number(p);

                                                    dots.item(p).addEventListener('click', currentSlide(slide_num));
                                                    // dots.item(p).addEventListener('click',function (slide_num) {
                                                    //     console.log('currentSlide===> 동작');
                                                    //     slideIndex = slide_num;
                                                    //     console.log('slideIndex====>'+slideIndex);
                                                    //     showSlides(slideIndex);
                                                    //
                                                    // });
                                                }
                                                */
                    } //End of for ==>지점이 몇개인지 반복<== (let i = 0; i < branchOfficeSelectList.length; i++) {
                    // var slideIndex = 0; //slide index //sss

                    // Auto Move Slide


// HTML 로드가 끝난 후 동작
//                     window.onload=function(){


                    /*

                                        function moveSlides(n) {
                                            slideIndex = slideIndex + n
                                            showSlides(slideIndex);
                                        }
                    */


                }//End of xhr2   if (this.status == 200 && this.readyState == 4) {
            }

            xhr2.open('GET', '/BracnchOffice/select', true);
            xhr2.setRequestHeader('Content-type', 'application/json');
            xhr2.send('');
        } // end of  if (this.status==200 && this.readyState==4)
    }// end of xhr.onreadystatechange = function


    /*
        $('#mainpanel').children().remove();
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
    */


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

function stopInterval() {
    for (var i = 0; i < 100; i++) {
        clearInterval(i);
    }
}


/////////////


/////////////////////
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

    varInitial();
    stopInterval();
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
    'use strict';
    loadingElement.setAttribute('style', 'display:block');
    stopInterval();
    varInitial();
    console.log("newBranchOfficeInsert()");
    tr_code = 'insert';
    branchoffice_name = document.getElementById('newBranchOfficeName').value;
    branchoffice_local = document.getElementById('newBranchOfficeLocal').value;
    branchoffice_mobile = document.getElementById('newBranchOfficeMobile').value;
    branchoffice_address = document.getElementById('newBranchOfficeAddress').value;
    branchoffice_no = '0000a0';
    imgFile = document.getElementById('imageSelector').files;

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
    newBranchOfficeFormData.append('branchoffice_name', branchoffice_name);
    newBranchOfficeFormData.append('branchoffice_local', branchoffice_local);
    newBranchOfficeFormData.append('branchoffice_mobile', branchoffice_mobile);
    newBranchOfficeFormData.append('branchoffice_address', branchoffice_address);
    newBranchOfficeFormData.append('branchoffice_no', branchoffice_no);

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
            // $('#mainPanel').children().remove();
            // $('#mainPanel').append("/BracnchOffice/select");
            goBranchOfficeListBoardAction();
            loadingElement.setAttribute('style', 'display:none');
        },
    });
}

function readURL(input) {
    if (input.files && input.files[0]) {
        for (image of event.target.files) {
            reader = new FileReader();
            reader.onload = function (e) {
                img = document.createElement("img");
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

            // document.getElementById("SpaceList_Head").setAttribute('cur', 'default')
            // reader.readAsDataURL(input.files[0]);
            reader.readAsDataURL(image);
        }
    } else {
        document.getElementById('image_container').src = "";
    }
};


/* 지점관리페이지에서 지점상세 버튼 버튼 클릭시 */
function goBranchOfficeDetailBoard() {
    //p_branchoffice_no,
    //p_branchoffice_name,
    //p_branchOffice_local,
    //p_branchOffice_address,
    //p_branchOffice_mobile
// ) {
    console.log("goBranchOfficeDetailBoard");

    let parent = event.target.closest(".card");

    branchoffice_no = parent.getElementsByClassName("branchOffice_no").item(0).textContent;
    branchoffice_name = parent.getElementsByClassName("branchOffice_name").item(0).textContent;
    branchoffice_local = parent.getElementsByClassName("branchOffice_local").item(0).textContent;
    branchoffice_address = parent.getElementsByClassName("branchOffice_address").item(0).textContent;
    branchoffice_mobile = parent.getElementsByClassName("branchOffice_mobile").item(0).textContent;

    console.log(JSON.stringify(({branchoffice_no})));

    sessionStorage.setItem("branchoffice_name", branchoffice_name);
    sessionStorage.setItem("branchoffice_no", branchoffice_no);
    sessionStorage.setItem("branchOffice_local", branchoffice_local);
    sessionStorage.setItem("branchOffice_address", branchoffice_address);
    sessionStorage.setItem("branchOffice_mobile", branchoffice_mobile);

    // document.getElementById("branchOfficeBoardDetailTableTbody").
    // document.getElementById().parentNode.parentNode.parentNode.firstElementChild.firstElementChild.
    // document.getElementById().parentNode.parentNode.parentNode.firstElementChild.firstElementChild.nextElementSibling
    // branchoffice_no      = event.target.parentNode.parentNode.parentNode.firstElementChild.firstElementChild.firstElementChild.textContent;
    // document.getElementById("branchOfficeBoardDetailTableTbody").lastElementChild.getElementsByTagName("td").item(0).

    /*
    let branchoffice_no = document.getElementById("branchOffice_no").textContent;
    let branchoffice_name = document.getElementById("branchOffice_name").textContent;
    let branchOffice_local = document.getElementById("branchOffice_local").textContent;
    let branchOffice_address = document.getElementById("branchOffice_address").textContent;
    let branchOffice_mobile = document.getElementById("branchOffice_mobile").textContent;
    */

    // branchoffice_name    = event.target.parentNode.parentNode.parentNode.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.textContent;
    // branchoffice_name    = e.target.parentNode.parentNode.parentNode.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.textContent;
    // branchOffice_local   = event.target.parentNode.parentNode.parentNode.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.textContent.split("\n")[0];
    // branchOffice_address = event.target.parentNode.parentNode.parentNode.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.textContent.split("\n")[1];
    // branchOffice_address = event.target.parentNode.parentNode.parentNode.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.textContent;
    // branchOffice_mobile  = event.target.parentNode.parentNode.parentNode.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.textContent.split("\n")[2];
    // branchOffice_mobile  = event.target.parentNode.parentNode.parentNode.firstElementChild.firstElementChild.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.textContent


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
            /* 대여 공간 디테일창을 관리자가 봤을 때*/

            if (modal.classList.contains('show')) {
                body.style.overflow = 'hidden';

            }
            ;

            if ((sessionStorage.getItem("sid").split("=")[1]) == 'MEM282108') {

                console.log("관리자 확인.");
                document.getElementById("spaceAddButton").setAttribute("style", "display:block;");
                document.getElementById("spaceAddButton").setAttribute("style", "font-size:1.5rem;");

                document.getElementById("updateBranchOffice").setAttribute("style", "display:block;");
                document.getElementById("updateBranchOffice").setAttribute("style", "font-size:1.5rem;");

                document.getElementById("deleteBranchOffice").setAttribute("style", "display:block;");
                document.getElementById("deleteBranchOffice").setAttribute("style", "font-size:1.5rem;");


            }

        }

    });
}

/////////////////////

var IMP = window.IMP; // 생략 가능
IMP.init("imp43709408"); // 예: imp00000000

document.querySelectorAll('.doPay').forEach(function (doPays) {
    doPays.addEventListener('click', function (e) {
        alert('결제하기 버튼 작동');
        console.log(e.target.closest('tr').childNodes[1]);
        reserv_no = e.target.closest('tr').childNodes[1].innerText;
        name = e.target.closest('tr').childNodes[3].innerText + '  ' + e.target.closest('tr').childNodes[5].innerText + '시간';//대여장소
        buyer_name = e.target.closest('tr').childNodes[2].innerText;
        amount = Number(e.target.closest('tr').childNodes[8].innerText);
        requestPay(e);

    }, false);
});

function requestPay(e) {
    // IMP.request_pay(param, callback) 결제창 호출
    IMP.request_pay({ // param
        pg: "html5_inicis",
        pay_method: "card",
        merchant_uid: reserv_no,
        name: name,
        amount,
        buyer_email: "rs.moony@gmail.com",
        buyer_name,
        buyer_tel: "010-4242-4242",
        // buyer_addr: "서울특별시 강남구 신사동",
        // buyer_postcode: "01181"
    }, function (rsp) { // callback
        if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
            console.log('merchant_uid  ====>' + merchant_uid);
            console.log('name  ====>' + name);
            // jQuery로 HTTP 요청
            jQuery.ajax({
                url: "/payroll/register", // 가맹점 서버
                method: "POST",
                headers: {"Content-Type": "application/json"},
                data: JSON.stringify({
                    tr_code: 'INSERT',
                    payroll_hist_no: 'any',
                    reserv_no: reserv_no,
                    payroll_hist_price: amount,
                    payroll_hist_method: pay_method
                })
                // imp_uid: rsp.imp_uid,
                // merchant_uid: rsp.merchant_uid
                //기타 필요한 데이터가 있으면 추가 전달

            }).done(function (data) {
                alert('결제완료 ');
                // 가맹점 서버 결제 API 성공시 로직
                // var xhr = new XMLHttpRequest;
                // xhr.onreadystatechange = function () {
                //     if (this.readyState == 4 && this.status == 200) {}
                //     alert('결제 완료 되었습니다. ');
                // } //End of onreadystatechange
                // xhr.open('post','/payroll/register', true);
                // xhr.setRequestHeader('Content-type','application/json');
                // xhr.send(JSON.stringify({
                //     TR_CODE:'INSERT',
                //     P_PAYROLL_HIST_NO:'any',
                //     P_RESERV_NO:reserv_no,
                //     P_PAYROLL_HIST_PRICE:amount ,
                //     P_PAYROLL_HIST_METHOD:pay_method
                // }));
            });
        } else {
            alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
        }
    });
}

function varInitial() {
    tr_code = '';
    poolBase = 0;
    p_sid = '';
    sid = '';

    member_name = '';

    reserv_no = '';
    reserv_date = '';
    reserv_hostcode = '';
    reserv_start_time = '';
    reserv_end_time = '';
    reserv_host_mobile = '';
    reserv_paystatement = '';
    reserv_regdate = '';
    reserv_host_email = '';
    reserv_updatedate = '';
    reserv_pay_limited = '';
    reserv_space = '';
    reserv_del_sign = '';

    qna_no = '';
    qna_recomment_no = '';
    qna_recomment_writer = '';
    qna_recomment_content = '';

    branchoffice_no = '';
    branchoffice_name = '';
    branchoffice_local = '';
    branchoffice_address = '';
    branchoffice_mobile = 0;


    space_no = '';
    space_name = '';
    space_description = '';
    space_capacity = 0;
    space_maxpeople = 0;
    space_basicprice = 0;
    spaceUpdateButton = '';
    spaceUpdateSubmitButton = '';
    spaceUpdateAbortButton = '';
    spaceAddSubmitButton = '';
    spaceDeleteButton = '';
    spaceBookButton = '';
    spaceBookSubmitButton = '';
    spaceBookAbortButton = '';

    imgFile = '';
    stored_file_name = '';
    DownloadQnaFileFormData = '';
    image = '';
    reader = '';
    img = '';
    choosenDate = '';

    pg = '';
    pay_method = '';
    merchant_uid = '';
    name = '';
    amount = 0;
    buyer_email = '';
    buyer_name = '';
    buyer_tel = '';

    slideArrayData = {
        slides: [],
        dots: [],
        size: [],
        slideIndex: [],
        slideLength: [],
        dotsLength: []
    }
}


function Reserv_filterSelect() {
    // var reserv_select_opcode = new Array();
    let p_reserv_select_opcode = new Map();
    var wantSearchWord_box = document.getElementById('reserv_search_input').value;

    // for (let i = 0; i < document.getElementsByTagName('tbody').length; i++) {
    //
    //     document.getElementsByTagName('tbody').item(i).remove();
    // }

    if (document.getElementById('reserv_search_detailCheckBox_reserv_no_input').checked
    ){
        p_reserv_select_opcode.set("reserv_no_box","checked");
        // reserv_select_opcode.push("reserv_no_box","checked");
    }

    if(document.getElementById('reserv_search_detailCheckBox_space_no_input').checked
    ){
        p_reserv_select_opcode.set("space_no_box","checked");
        // reserv_select_opcode.push("space_no_box","checked");
    }

    if(document.getElementById('reserv_search_detailCheckBox_reserv_date_input').checked
    ){
        p_reserv_select_opcode.set("reserv_date_box","checked");
        // reserv_select_opcode.push("reserv_date_box","checked");
    }

    if(document.getElementById('reserv_search_detailCheckBox_reserv_start_time_input').checked
    ){
        p_reserv_select_opcode.set("reserv_start_time_box","checked");
        // reserv_select_opcode.push("reserv_start_time_box","checked");
    }

    if(document.getElementById('reserv_search_detailCheckBox_reserv_end_time_input').checked
    ){
        p_reserv_select_opcode.set("reserv_end_time_box","checked");
        // reserv_select_opcode.push("reserv_start_time_box","checked");
    }

    if(document.getElementById('reserv_search_detailCheckBox_reserv_host_mobile_input').checked
    ){
        p_reserv_select_opcode.set("reserv_host_mobile_box","checked");
        // reserv_select_opcode.push("reserv_host_mobile_box","checked");
    }

    if(document.getElementById('reserv_search_detailCheckBox_reserv_host_email_input').checked
    ){
        p_reserv_select_opcode.set("reserv_host_email_box","checked");
        // reserv_select_opcode.push("reserv_host_email_box","checked");
    }

    if(document.getElementById('reserv_search_detailCheckBox_reserv_hostcode_input').checked
    ){
        p_reserv_select_opcode.set("reserv_hostcode_box","checked");
        // reserv_select_opcode.push("reserv_hostcode_box","checked");
    }

    if(document.getElementById('reserv_search_detailCheckBox_reserv_paystatement_input').value!='paystatement'
    ){
        p_reserv_select_opcode.set("reserv_paystatement_box",document.getElementById('reserv_search_detailCheckBox_reserv_paystatement_input').value);
        // reserv_select_opcode.push("reserv_paystatement_box",document.getElementById('reserv_search_detailCheckBox_reserv_paystatement_input').value);
    }

    if(document.getElementById('reserv_search_input').value!=null
    ){
        p_reserv_select_opcode.set("wantSearchWord_box",document.getElementById('reserv_search_input').value);
        // reserv_select_opcode.push("wantSearchWord_box",document.getElementById('reserv_search_input').value);
    }
    // console.log(p_reserv_select_opcode);
    //
    // for (let param of p_reserv_select_opcode){
    //     reserv_select_opcode.push(param);
    // }
    // console.log(reserv_select_opcode);
    // console.log(p_reserv_select_opcode);

    // var obj = Object.fromEntries(p_reserv_select_opcode);
    p_reserv_select_opcode.set('reserv_hostcode',sessionStorage.sid.split("=")[1]);

    var xhr = new XMLHttpRequest();

    xhr.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById('managementDashBoard').remove();
            alert('xhr.response');
            document.getElementById('mainPanel').innerHTML=xhr.response;
        }
    }
    // console.log(JSON.stringify(p_reserv_select_opcode));
    console.log(JSON.stringify(Object.fromEntries(p_reserv_select_opcode)));
    // reserv_select_opcode
    xhr.open('POST', 'reservation/selectAll');
    xhr.setRequestHeader('Content-type', 'application/json');
    xhr.send(JSON.stringify(Object.fromEntries(p_reserv_select_opcode)));

}

/*

function findMatches(wordToMatch, autoFilledList) {
    return autoFilledList.filter(function (autoFilledListPaper) {
        const regex = new RegExp(wordToMatch, 'gi');
        return autoFilledListPaper.match(regex)
    });
}

function displayInputValue() {
    const matchedArray = findMatches(this.value, autoFilledListPaper);
}

*/

async function AutoFilled() {
    autoFilledList = [];

    var wantSearchWord_box = document.getElementById('reserv_search_input').value;


    fetch('reservation/autofilled?wantSearchWord_box='+wantSearchWord_box)
        .then(function (res) {
           return res.json();
        })
        .then(function (res) {
            for (let i = 0; i < document.getElementById('autoMaker').childNodes.length; i++) {
                document.getElementById('autoMaker').childNodes.item(i).remove();
            }
                console.log(res);
            autoFilledList.push(...res);
            console.log('====##'+autoFilledList);
            // document.getElementById('autoMaker').append(document.createElement('div').innerText);
            // displayInputValue(wantSearchWord_box,autoFilledList);
            for (let i = 0; i < autoFilledList.length; i++) {
                document.getElementById('autoMaker').append(document.createElement('div'));
                document.getElementById('autoMaker').lastElementChild.setAttribute('id','recommendWord'+i);
                document.getElementById('autoMaker').lastElementChild.classList.add('automakerDiv');
                document.getElementById('autoMaker').lastElementChild.textContent = autoFilledList[i];
                document.getElementById('autoMaker').children.item(i).addEventListener('click',function () {
                document.getElementById('reserv_search_input').value = this.textContent;
                });
            }
               return autoFilledList;
        })
        .catch(function () {
            console.log("error:",onmessageerror);
        })

    //fetch() 기본 문법
    // let promise = fetch('reservation/autofilled?wantSearchWord_box='+wantSearchWord_box,get)
    /*
    * let promise = fetch(url, [options])
    * url = 접근하고자 하는 URL
    * options - 선택 매개 변수, method나 header등 을 지정할 수 있음.
    *
    * options에 아무것도 없으면 요청은 GET 메소드로 진행 되어 URL 로부터 콘텐츠가 다운로드 됩니다.
    *
    * fetch()를 호출하면 브라우저는 네트워크 요청을 보내고 프로미스가 반환됩니다.
    * 반환되는 프로미스는 fetch()를 호출하는 코드에서 사용됩니다.
    *
    * 응답은 대게 두단계를 거쳐서 진행됩니다.
    *
    * 먼저, 서버에서 응답 헤더를 받자마자 fetch 호출시 반환받은 promise가 내장 클래스 Response의 인스턴스와 함께 이행상태가 된다.
    *
    * 이 단계는 아직 본문(body)이 도착하기 전이지만, 개발자는 응답 헤더를 보고 요청이 성공적으로 처리 되었는지 아닌지 확인할 수 있습니다.
    *
    * 네트워크 문제나 존재하지 않는 사이트에 접속하려는 경우 같이 HTTP 요청을 보낼 수 없는 상태에선 프로미스는 거부상태가 됩니다.
    *
    * HTTP 상태는 응답 프로퍼티를 사용해 확인할 수 있습니다.
    *
    *  - Status : HTTP 상태코드 (예:200)
    *  - Ok : 불린 값 , HTTP 상태 코드가 200과 299 사이일 경우 true
    *
    * 예시 :
    *
    * */
/*
    let responese = await fetch('reservation/autofilled?wantSearchWord_box=' + wantSearchWord_box);

    if (responese.ok){ //HTTP 상태 코드가 200~299일 경우
        //응답 본문을 받습니다. (관련 메서드는 아래에서 설명.)
        let json = await responese.json();
    }else {
        alert("Http-Error : "+ responese.status);
    }
*/

    /*
    * 두번째 단계에선 추가 메소드를 호출해 본문을 받습니다.
    * response에는 프로미스를 기반으로 하는 다양한 메서드가 있습니다. 이 메서드들을 사용하면 다양한 형태의 응답 본문을 처리할 수 있습니다.
    *
    * * response.text() : 응답을 읽고 텍스트를 반환합니다.
    * * response.json() : 응답을 JSON 형태로 파싱합니다.
    * * response.formData() : 응답을 FormData 객체 형태로 반환합니다.
    * * response.blob() : 응답을 Blob (타입이 있는 바이너리 데이터)형태로 반환 합니다.
    * * response.arrayBuffer() : 응답을 ArrayBuffer(바이너 데이터를 로우 레벨 형식으로 표현한것)형태로 반환합니다.
    *
    * 이 외에도 response.body가 있는데, ReadableStream 객체인  response.body를 사용하면 응답 본문을 청크 단위로 읽을 수 있습니다.
    *
    * */

/*

    let url = 'http://172.30.1.43:8080/reservation/autofilled?wantSearchWord_box=' + wantSearchWord_box;

    let response = await fetch(url);

    let commits = await response.json(); // 응답 본문을 읽고 JSON 형태로 파싱함.

    alert(commits[0].author.login);
*/
/*

    //위 예시를 await 없이 프로미스만 사용하면 다음처럼 바뀐다.
fetch('http://172.30.1.43:8080/reservation/autofilled?wantSearchWord_box=' + wantSearchWord_box)
.then(response => response.json())
.then(commits => alert(commits[0].author.login));

*/
/*
    let response = await fetch('/article/fetch/logo-fetch.svg');

    let blob = await response.blob(); // 응답을 Blob 객체로 형태로 다운로드 받습니다.

    //다운로드 받은 Blob 을 담을 <img>를 만듭니다.
    let img = document.createElement('img');
    img.style = 'position:fixed; top:10px; left:10px; width:100px';
    document.body.append(img);

    //이미지를 화면에 보여줍니다.
    img.src = URL.createObjectURL(blob);

    setTimeout(() =>{//3초 후 이미지를 숨깁니다.
        img.remove();
        URL.revokeObjectURL(img.src);
    },3000);
    */
    /*
    * !중요!
    * 
    * 본문을 읽을 때 사용되는 메서드는 딱 하나만 사용할 수 있습니다.
    * response.text()를 사용해 응답을 얻었다면 본문의 콘텐츠는 모두 처리 된 상태이기 때문에
    * response.json()은 동작하지 않습니다.
    *
    * let text = await response.text(); //응답 본문이 소비됩니다.
    * let parsed = await response.json(); //실패
    * */

    /*
    * 응답 헤더
    *
    * 응답 헤더는 response.headers 에 맵과 유사한 형태로 저장됩니다.
    * 
    * 맵은 아닙니다, 하지만 맵과 유사한 메서드를 지원하죠. 이 메서드들을 사용하면 헤더 일부만 추출하거나
    * 헤더 전체를 순회할 수 있습니다.
    * */
/*

    let response = await fetch('https://api.github.com/repos/javascript-tutorial/en.javascript.info/commits');

    //헤더 일부를 추출
    alert(response.headers.get('Content-type')); //application/json; charset=utf-8
    
    //헤더 전체를 순회
    for (let [key, value]of response.headers){
        alert(`${key} = ${value}`);
    }
*/

    /*
    * 요청헤더
    * headers 옵션을 사용하면 fetch에 요청 헤더를 설정할 수 있습니다.
    * headers 엔 아래와 같이 다양한 헤더 정보가 담긴 객체를 넘기게 됩니다.
    * */
  /*
    let response = fetch(protectedUrl,{
            headers: {
                Authentication : 'secret'
            }
    });
*/
/*
* Headers를 사용해 설정할 수 없는 헤더도 있다. 전체목록은 따로 확인할 것.
*  Accept-Charset, Accept-Encoding
*  Access-Control-Request-Headers
*  Access-Control-Request-Method
*  Connection
*  Content-Length
*  Cookie, Cookie2
*  Date
*  DNT
*  Expect
*  Host
*  Keep-Alive
*  Origin
*  Referer
*  TE
*  Trailer
*  Transfer-Encoding
*  Upgrade
*  Via
*  Proxy-*
*  Sec-*
*
* 이런 제약은 hTTP 를 목적에 맞고 안전하게 사용할 수 있도록 하려고 만들어졌습니다.
* 금지 목록에 있는 헤더는 브라우저만 배타적으로 설정, 관리 할 수 있습니다.
* */
    
    /*
    * POST 요청
    * GET 이외의 요청을 보내려면 추가 옵션을 사용해야 합니다.
    * method - HTTP 메서드 (예: POST)
    * body - 요청 본문으로 다음 항 목중 하나이어야 합니다.
    * * 문자열 (예: JSON 문자열)
    * FormData 객체 - form/Multipart 형태로 데이터를 전송을 하기 위해 쓰입니다.
    * Blob이나 BufferSource : 바이너리 데이터 전송을 위해 쓰입니다.
    * URLSerachParams : 데이터를 x-www-form-urlencoded 형태로 보내기 위해 쓰이는데, 요즘엔 잘 사용하지 않습니다.
    *
    * 대부분 JSON을 요청 본문에 실어 보내게 됩니다.
    * user 객체를 본문에 실어 보내는 예시를 살펴봅시다.
    * */
/*

    let user = {
        name: 'John',
        surname: 'Smith'
    };

    let response = await fetch('/article/fetch/post/user',{
        method : 'Post',
        headers : {
            'Content-Type':'application/json;charset=utf-8'
        },
        body : JSON.stringify(user)
    });

    let result = await response.json();
    alert(result.message);
*/
/*
* POST 요청을 보낼 때 주의할 점은 요청 본문이 문자열일 때 Content-Type 헤더가
* text/plain; charset=UTF-8 로 기본 설정된다는 점 입니다.
*
* 하지만 위 예시에선 JSON 을 전송하고 있기 때문에 headers에 제대로 된 Content-Type 인 application/json을 설정해주었습니다.
*
* 이미지 전송하기
* Blob 이나 BufferSource 객체를 사용하면 fetch 로 바이너리 데이터를 전송할 수 있습니다.
* 예시를 살펴봅시다. <canvas> 에 마우스를 움직여 이미지를 만들고 '전송' 버튼을 눌러 이미지를 서버에 전송해보겠습니다.
*
* <body style = "margin:0">
* <canvas id="canvasElem" width ="100" height="80" style="border:1px solid"></canvas>
*
* <input type="button" value="전송" onclick="submit()">
* <script>
* canvasElem.onmousemove = function(e) {
* let ctx = canvasElem.getContext('2d');
* ctx.lineTo(e.clientX, e.clientY);
* ctx.stroke();
* };
*
* async function submit(){
* let blob = await new Promise(resolve =>canvasElem.toBlob(resolve, 'image/png')
* let response= await fetch('/article/fetch/post/image',{
* method : 'Post',
* body : blob
* });
*
* //전송이 잘 되었다는 응답이 오고 이미지 사이즈가 얼럿창에 출력됩니다.
*
* let result = await response.json();
* alert(result.message);
* }
* </script>
* </body>
*
* */
/*
* 이번엔 Content-Type 헤더를 명시적으로 설정하지 않은 점에 주목해주시기 바랍니다.
* Blob 객체는 내장 타입을 갖기 때문에 특별히 Content-Type을 설정하지 안하도 됩니다.
*  예시는 이미지를 전송하기 때문에 toBlob에 의해 image/png 가 자동으로 설정되었습니다.
* 이렇게 Blob 객체의 경우 해당 객체의 타입이 Content-type헤더의 값이 됩니다.
*
* 위 예시의 함수 submit ()을 async/await 없이 작성하면 아래와 같습니다.
* */
/*
    function submit() {
        canvasElem.toBlob(function (blob) {
            fetch('/article/fetch/post/image',{
                method :'Post',
                body: blob
            })
                .then(response =>response.json())
                .then(result =>alert(JSON.stringify(result,null,2)))
        },'image/png');
    }
    */
    /* 요약
     * 일반적인 fetch 요청은 두 개의 await 호출로 구성됩니다.
     *
     * let response = await fetch(url, options);  //응답 헤더와 함께 이행됨
     * let result = await response.json();   //json 본문을 읽음
     *
     * 물론 awiat 없이도 요청을 보낼 수 있습니다.
     *  */


/*
    fetch(url, options)
        .then(response =>response.json())
        .then(result => /!*결과 처리 *!/)
*/
/*
* 응답 객체의 프로퍼티는 다음과 같습니다.
* response.status : 응답의 HTTP코드
* response.ok : 응답 상태가 200과 299 사이에 있는 경우 true
* response.headers : 맵과 유사한 형태의 HTTP 헤더
*
* 응답 본문을 얻으려면 다음과 같은 메서드를 사용하면 됩니다.
* response.text() : 응답을 텍스트 형태로 반환함.
* response.json() : 응답을 파싱해 JSON 객체로 변경함.
* response.formData() : 응답을 FormData 객체로 반환 (form/multipart인코딩에 대한 내용은 다음 챕터에서 다룸)
* response.blob() : 응답을 Blob(타입이 있는 바이너리 데이터)형태로 반환.
* response.arrayBuffer() : 응답을 ArrayBuffer(바이너리 데이터를 로우레벨로 표현한 것) 형태로 반환
*
* 지금까지 fetch 옵션은 다음과 같습니다.
* method - HTTP 메서드
* headers - 요청 헤드가 담긴 객체 (제약 사항이 있음)
* body - 보내려는 데이터 (요청 본문)로 string 이나 FormData, BufferSource, Blob, UrlSearchParams 객체 형태
*
*
* */

    /*
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function () {

        }
        xhr.open('GET','reservation/autofilled?wantSearchWord_box='+wantSearchWord_box);
        // xhr.setRequestHeader('Content-type', 'application');
        xhr.send();
    */

}


function goMemberListBoardAction() {

    for (let i = 0; i < document.getElementById('mainPanel').children.length; i++) {

        document.getElementById('mainPanel').children.item(i).remove();

    }

    var memberListBorad = document.createElement('div');
    memberListBorad.setAttribute('id','memberListBorad');
    memberListBorad.innerHTML =
        "<div id=\"modalSpace\">"+
        "</div>"+
    "<div id=\"dropdown\" class=\"dropdown\">"+
        "</div>"+
    "<div class=\"table-responsive\">"+
        "<table class=\"table table-striped\">"+
            "<thead>"+
            "<tr>"+
                "<th>#</th>      "   +
                "<th>멤버번호</th>   "   +
                "<th>이름</th>     "   +
                "<th>메일</th>     "   +
                "<th>연락처</th>    "   +
                "<th>가입날짜</th>   "   +
                "<th>메일 인증여부</th>"   +
                "<th>탈퇴여부</th>   "   +
            "</tr>"+
            "</thead>"+
            "<tbody>"+
            "</tbody>"+
        "</table>"+
    "</div>";

    document.getElementById('mainPanel').append(memberListBorad);

    fetch('member/memberSelect')
        .then(function (res) {
            return res.json();
        })
        .then(function (res) {

            console.log(res);

            return
        })
        .catch(function () {
            console.log("error:",onmessageerror);
        })


}

