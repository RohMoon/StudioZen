// function RegisterAction() {
//
//     console.log('RegisterAction');
//
//     console.log('UpdatingReservAction');
//     tr_code = 'insert';
//     let registerData  = $("input.needs-validation").serialize();
//
//     console.log(registerData);

/*    /!*  ajax POST 방식으로 값 전송*!/
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
    });*/

// }