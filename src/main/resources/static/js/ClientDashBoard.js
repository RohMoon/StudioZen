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
}

/* 클라이언트 모달창 켜져있을때 클릭시 */
function ClientModalCloseAction() {
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


/* Q&A 글쓰기 */
function ClientQnaBoardWrite() {
    'use strict'
    console.log("ClientQnaBoardWrite()");
    tr_code = 'insert';
    let qna_title = document.getElementById('clientQnaBoardWriteModalTitleArea').value;
    let qna_content = document.getElementById('clientQnaBoardWriteModalTextArea').value;
    let qna_no = '00000';
    let p_sid = (sessionStorage.getItem('sid')).split('=');
    let sid = p_sid[1];
    let qna_writer = sid;
    console.log(JSON.stringify({tr_code, qna_no, qna_writer, qna_title, qna_content}));
    let file = document.getElementById('file').files[0];
    console.log(file);
    let formData = new FormData();
    if(file != null){
    formData.append('file',file);
        console.log('===> formData==>'+formData.get(file));
    }
    formData.append('tr_code',tr_code);
    formData.append('qna_title',qna_title);
    formData.append('qna_content',qna_content);
    formData.append('qna_no',qna_no);
    formData.append('qna_writer',qna_writer);

    // FormData의 key 확인
    for (let key of formData.keys()) {
        console.log(key);
    }

// FormData의 value 확인
    for (let value of formData.values()) {
        console.log(value);
    }

    /*  ajax POST 방식으로 값 전송*/
    $.ajax({
        method: 'POST',
        url: '/qna/write',
        contentType: false,
        enctype: 'multipart/form-data',
        data: formData,
        processData: false,
        error: function (xhr, status, error) {
            alert(error);
        },
        success: function (data) {
            console.log("Success");
            ClientModalCloseAction();
            $('#mainPanel').children().remove();
            $('#mainPanel').load("qna/select/" + qna_writer + " #qnaListBoard");

        },
    });
}

function goClientDashBoardPageAction() {
    console.log("goClientDashBoardPageAction");

    slideIn();
    let p_sid = (sessionStorage.getItem('sid')).split('=');
    let sid = p_sid[1];
    $('#mainPanel').children().remove();
    $('#mainPanel').load("/Client/dash.do/" + sid + " #clientDashBoard");
}

function goClientQnaHistoryPageAction() {
    console.log("goClientDashBoardPageAction");

    slideIn();
    let p_sid = (sessionStorage.getItem('sid')).split('=');
    let sid = p_sid[1];

    $('#mainPanel').children().remove();
    $('#mainPanel').load("qna/select/" + sid + " #qnaListBoard");

}


/////////////

//////////////
