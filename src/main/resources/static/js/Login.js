/*  로그인 버튼을 눌렀을 때*/
function loginButtonAction() {
    console.log("로그인 버튼 눌렀을때");
    /* 입력한 멤버 번호 직렬화*/
    let member_no = $("input[name=member_no]").serialize();
    /* 입력한 멤버 패스워드 직렬화*/
    let member_password = $("input[name=member_password]").serialize();
    /* 입력 값 JSON 문법으로 변형 확인*/
    console.log(JSON.stringify({member_no, member_password}));
    /*  ajax Post 방식으로 값 전송*/
    $.ajax({
        method: 'POST',
        url: '/member/login',
        contentType: 'application/json',
        data: JSON.stringify({member_no, member_password}),
        error: function (xhr, status, error) {
            alert(error);
        },
        success: function (data) {
            // alert(xhr) // undefined 떨어짐
            // alert(status) // Object Object 떨어짐
            //alert(result) // success 떨어짐
            console.log("Success");
            $('#mainPanel').children().remove();
            $('#beforeLoginPanel').children().remove();
            $('#mainPanel').html(data);
            console.log(data);
            let result = data.split('"');
            sessionStorage.setItem('sid',member_no);
            console.log(result[1])
            if (result[1]=='managementDashBoard'){
                $('#beforeLoginPanel').load("/Management/managerMenu.do #managementMenu");
            }
            if (result[1]=='clientDashBoard'){
                $('#beforeLoginPanel').load("/Client/ClientMenu.do #clientMenu");
            }
        },
    });

}

/* 회웝가입 버튼 눌렀을 때 */
function RegisterButtonAction() {

    console.log('RegisterButtonAction');

    $('#mainPanel').children().remove();
    $('#mainPanel').load("/register.do #registerPage");

    console.log('After   === ==RegisterButtonAction');

}

/* serializeObject  --  */
$(document).ready(function () {

    jQuery.fn.serializeObject = function () {
        var obj = null;
        try {
            if (this[0].tagName && this[0].tagName.toUpperCase() == "FORM") {
                var arr = this.serializeArray();
                if (arr) {
                    obj = {};
                    jQuery.each(arr, function () {
                        obj[this.name] = this.value;
                    });
                }

            }
        } catch (e) {
            alert(e.message());
        } finally {
            return obj;
        }
        ;
    }

});

/* 회원 가입 창에서 Sign UP버튼 눌렀을 때*/
function RegisterAction(input) {

    'use strict'


    console.log('UpdatingReservAction');
    console.log(JSON.stringify($("form[name=registerForm]").serializeArray()));
    let regiData = $("form[name=registerForm]").serializeObject();

    console.log($("form[name=registerForm]").serializeObject());

    regiData.tr_code = 'insert';

    console.log(regiData);

    /*  ajax POST 방식으로 값 전송*/
    $.ajax({
        method: 'POST',
        url: '/member/register',
        contentType: 'application/json',
        data: JSON.stringify(regiData),
        error: function (xhr, status, error) {
            alert('에러 ' + error + '\n' + status);
        },
        success: function (data) {
            console.log("Success");
            alert('입력하신 메일주소의 링크를 클릭하셔서 인증하셔야 회원가입이 완료됩니다.');
            $('#mainPanel').children().remove();
            $('#mainPanel').load("/loginProc.do #longinPanel");
            // https://coding-groot.tistory.com/91  CORS 이슈 <<

        },
    });

}

/* null Check */
function check_null() {
    if (
        ((document.getElementById('name').value != '') && (document.getElementById('password').value != '')&&(document.getElementById('password_confirm').value != '') && (document.getElementById('email').value != '')&&(document.getElementById('member_phone').value != ''))) {
        pw = document.getElementById('password').value;
        let sc = ["!", "@", "#", "$", "%"];
        let check_sc = 0;

        if (pw.length < 6 || pw.length > 16) {
            window.alert('비밀번호는 6글자 이상, 16글자 이하만 사용 가능 합니다.');
            document.getElementById('password').value = '';
        }
        for (var i = 0; i < sc.length; i++) {
            if (pw.indexOf(sc[i]) != -1) {
                check_sc = 1;
            }
        }
        if (check_sc == 0) {
            window.alert('!,@,#,$,% 의 특수문자가 들어가 있지 않습니다.');
            document.getElementById('password').value = '';
        }
        if (document.getElementById('password').value != '' && document.getElementById('password_confirm').value != '') {
            if (document.getElementById('password').value == document.getElementById('password_confirm').value) {
                document.getElementById('check').innerHTML = '<p>비밀번호가 일치합니다.</p>';
                document.getElementById('check').style.color = 'blue';
                if (document.getElementById('mailCheck').value=='OK'){
                    document.getElementById('registerButton').disabled = false;
                }else if(document.getElementById('mailCheck').value=='NO'){
                    document.getElementById('registerButton').disabled = true;
                }
            } else {
                document.getElementById('check').innerHTwML = '<p>비밀번호가 일치하지 않습니다.</p>';
                document.getElementById('check').style.color = 'red';
            }
        }
    } else {
        return false;
    }


}

function emailValueCheck() {

    let member_mail = (document.getElementById("email").value);

    console.log(JSON.stringify(member_mail));
    /*  ajax POST 방식으로 값 전송*/
    $.ajax({
        method: 'POST',
        url: '/member/duplicateMailCheck',
        contentType: 'application/json',
        data: (document.getElementById("email").value),
        error: function (xhr, status, error) {
            alert('에러 ' +'\n'+error+ '\n' + status + '\n' +onmessageerror+'\n'+error);
        },
        success: function (data) {
            console.log(data);
            let EXAM = data.split(':');
            console.log(EXAM[4][0]);
            if (EXAM[4][0]==1){
                document.getElementById('mailCheck').innerHTML = '<p>중복되는 메일이 존재합니다.</p>';
                document.getElementById('mailCheck').style.color = 'red';
                document.getElementById('mailCheck').value = 'NO';
            }else{
                document.getElementById('mailCheck').innerHTML = '<p>중복되는 메일이 존재하지 않습니다.</p>';
                document.getElementById('mailCheck').value = 'OK';
                document.getElementById('mailCheck').style.color = 'blue';
                console.log(document.getElementById('mailCheck').value);
            }
        },
    });
   }