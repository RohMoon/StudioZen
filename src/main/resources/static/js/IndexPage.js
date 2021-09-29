/*<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js "/>
<script type="text/javascript">
    $(document).ready(function(){
   console.log('a');

});
</script>*/
document.addEventListener('DOMContentLoaded',function () {
    // 슬라이드 메뉴에서 우측 x 버튼 누르면 메뉴  집어넣기
    document.querySelector(".btn-leftMenuIn").addEventListener("click",slideOut);
    // 좌측 상단에 메뉴 버튼 누르면 슬라이드 메뉴 꺼내기
    document.querySelector(".btn-leftMenuOut").addEventListener("click", slideIn);
    // 슬라이드 메뉴에서 로그인하기 버튼 누르면 로그인 화면으로 이동
    document.querySelector('#goLoginButton').addEventListener("click",function (e) {
        console.log('로그인 화면으로 이동');
        slideIn();
        $('#mainPanel').load("/loginProc.do #longinPanel");
    });
    $('.readonly').attr("readonly",true);

})



/* 슬라이드 메뉴 집어넣기*/
function slideIn() {

    document.querySelector('.menu_wrap').classList.contains('on')

    document.querySelector('.menu_wrap').classList.remove("on");

    document.querySelector("#dimmed").remove();

}


/* 슬라이드 메뉴 꺼내기 */
function slideOut() {

    document.querySelector(".menu_wrap").classList.add("on");

    let div = document.createElement("div");
    div.id = "dimmed";

    document.body.append(div);

    document
        .querySelector("#dimmed")
        .addEventListener(
            "scroll touchmove touchend mousewheel",
            function (e) {
                e.preventDefault();
                e.stopPropagation();
                return false;

            })
}

