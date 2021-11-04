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
                    "<button id='updateBranchOffice' class='btn btn-primary' >지점 수정</button>" +
                    "<button id='deleteBranchOffice' class='btn btn-primary'> 지점 삭제</button>" +
                    "</div>";

            } // end of if  (sessionStorage.getItem('sid') === 'member_no=MEM282108')

            var xhr2 = new XMLHttpRequest();
            xhr2.onreadystatechange = function () {
                if (this.status == 200 && this.readyState == 4) {
                    console.log('2nd XML');
                    console.log('====++> xhr2' + xhr2.response);
                    let bracnchOfficeSelectMap = JSON.parse(xhr2.response);
                    loadingElement.setAttribute('style', 'display:none');
                    // console.log(bracnchOfficeSelectMap.branchOfficeImgSelectList);

                    let branchOfficeSelectList = bracnchOfficeSelectMap.branchOfficeSelectList;
                    let branchOfficeImgSelectList = bracnchOfficeSelectMap.branchOfficeImgSelectList;
                    for (let i = 0; i < branchOfficeSelectList.length; i++) {

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

                                    var mySlides_fade = document.createElement('div');
                                    mySlides_fade.classList.add('mySlides');

                                    mySlides_fade.classList.add('fade');
                                    slideShow_container.append(mySlides_fade);

                                    var numbertext = document.createElement('numbertext');

                                    numbertext.classList.add('numbertext');

                                    numbertext.innerText = (j + 1) + ' / ' + countNumForHowManyThisBranchOfficeHasImage;
                                    mySlides_fade.append(numbertext);
                                    var img_src = document.createElement('img');//working here

                                    img_src.setAttribute('src', 'data:image/png; base64,' + branchOfficeImgSelectList[j].branchoffice_img_code);
                                    img_src.setAttribute('style', 'width:60%; height:40%; margin-left:20%');
                                    mySlides_fade.append(img_src);


                                } //End of if (branchOfficeSelectList[i].branchoffice_no == branchOfficeImgSelectList[j].branchoffice_no)
                            } //End of for (let j = 0; j < branchOfficeImgSelectList.length; j++) {

                            var dots_circles = document.createElement('div');
                            dots_circles.setAttribute('style', 'text-align:center');
                            slideShow_container.append(dots_circles);
                            for (let j = 0; j < countNumForHowManyThisBranchOfficeHasImage; j++) {
                                var dot = document.createElement('span');
                                dot.classList.add('dot'+i);
                                dot.setAttribute()
                                // dot.addEventListener('click',currentSlide(j));

                                dots_circles.append(dot);

                            }// end of For (let j = 0; j < countNumForHowManyThisBranchOfficeHasImage;
                            var slides = document.getElementsByClassName("mySlides");
                            var dots = document.getElementsByClassName('dot'+i); //sss
                            var size = slides.length;

                        } // end of if (branchOfficeSelectList[i].branchoffice_haspic == 'Y')

                        var section = document.createElement('section');//rrr
                        section.classList.add('py-5');
                        document.getElementById('slideshow-container'+i).append(section);

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
                        detailBox.setAttribute('style','display:none;')
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
                        goBranchOfficeDetailBoardBtn.setAttribute('id','goBranchOfficeDetailBoard'+i);
                        goBranchOfficeDetailBoardBtn.classList.add('btn');
                        goBranchOfficeDetailBoardBtn.classList.add('btn-outline-dark');
                        goBranchOfficeDetailBoardBtn.classList.add('mt-auto');
                        goBranchOfficeDetailBoardBtn.innerText = '지점상세';

                        card.append(goBranchOfficeDetailBoardBtn);
                        document.getElementById('goBranchOfficeDetailBoard'+i).addEventListener('click', goBranchOfficeDetailBoard);

                    } //End of for ==>지점이 몇개인지 반복<== (let i = 0; i < branchOfficeSelectList.length; i++) {
                    var slideIndex = 0; //slide index
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

// HTML 로드가 끝난 후 동작
//                     window.onload=function(){

                    showSlides(slideIndex);

                    // Auto Move Slide
                    var sec = 3000;
                    setInterval(function () {
                        slideIndex++;
                        console.log('slideIndex=====>' + slideIndex);
                        showSlides(slideIndex);

                    }, sec);

// Next/previous controls
                    function moveSlides(n) {
                        slideIndex = slideIndex + n
                        showSlides(slideIndex);
                    }

// Thumbnail image controls
                    function currentSlide(n) {
                        console.log('currentSlide===> 동작');
                        slideIndex = n;
                        showSlides(slideIndex);
                    }


                    function showSlides(n) {

                        if ((n + 1) > size) {
                            slideIndex = 0;
                            n = 0;
                        } else if (n < 0) {
                            slideIndex = (size - 1);
                            n = (size - 1);
                        }

                        for (i = 0; i < slides.length; i++) {
                            slides[i].style.display = "none";
                        }
                        for (i = 0; i < dots.length; i++) {
                            dots[i].className = dots[i].className.replace(" active", "");
                        }

                        slides[n].style.display = "block";
                        dots[n].className += " active";
                    }

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
            $('#mainPanel').children().remove();
            $('#mainPanel').append("/BracnchOffice/select");

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
        amount: 500,
        buyer_email: "rs.moony@gmail.com",
        buyer_name: " ",
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