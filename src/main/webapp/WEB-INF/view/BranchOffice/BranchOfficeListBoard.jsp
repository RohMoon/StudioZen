<%--
  Created by IntelliJ IDEA.
  User: Moon
  Date: 2021-08-25
  Time: 오후 3:01
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.example.studiozen.DTO.BranchOfficeDTO" %>
<%
    List<BranchOfficeDTO> branchOfficeSelectList = (List<BranchOfficeDTO>) request.getAttribute("branchOfficeSelectList");
    List<BranchOfficeDTO> branchOfficeImgSelectList = (List<BranchOfficeDTO>) request.getAttribute("branchOfficeImgSelectList");
    int size = 0;
//    String imgTest =branchOfficeImgSelectList.get(0).getBranchoffice_img_code();
%>
<%--<script>
    &lt;%&ndash;let testVar = "<%=imgTest%>";&ndash;%&gt;
    document.getElementById('modalSpace').appendChild(document.createElement("img"));
    document.querySelector("img").setAttribute("src","data:image/png;base64,"+ testVar);
    document.querySelector("img").setAttribute("width",450);
    document.querySelector("img").setAttribute("height",300);
</script>--%>
<div id="branchOfficeSelectList">

<div id="modalSpace">

    <script>
        // let branchoffice_no;
        // let branchoffice_name;
        // let branchOffice_local;
        // let branchOffice_address;
        // let branchOffice_mobile;
        //
        // let space_description   ;
        // let space_capacity      ;
        // let space_maxpeople     ;
        // let space_basicprice    ;
        // let spaceUpdateButton   ;
        // let spaceUpdateSubmitButton   ;
        // let spaceUpdateAbortButton   ;
        // let spaceAddSubmitButton   ;
    </script>
</div>
<%-- 관리자 번호를 갖고 있다면 메뉴를 보여주지않는다. --%>
<div id="dropdown" class="dropdown">
</div>

<%



    if (branchOfficeSelectList.size() > 0) {
        for (int i = 0; i < branchOfficeSelectList.size(); i++) {

            /*이미지 컨터이너 부분 */
            if (branchOfficeSelectList.get(i).getBranchoffice_haspic().equals("Y")) {
                out.print("<div id=\"slideshow-container"+i+"\" class=\"slideshow-container\">");//
                int imgNo = 1;
                for (int y = 0; y < branchOfficeImgSelectList.size(); y++) {
//            if(branchOfficeImgSelectList.get(i).getBranchoffice_img_code()!=null){
                    if (branchOfficeSelectList.get(i).getBranchoffice_no().equals(branchOfficeImgSelectList.get(y).getBranchoffice_no())) {
                        out.print("<div id=\"mySlides-fade"+i+y+"\" class=\"mySlides fade\">");//document.querySelector("td.day.day-active").textContent
                        out.print("<Script>");
                        out.print("var imgVar" + i + y + " =\"" + branchOfficeImgSelectList.get(y).getBranchoffice_img_code() + "\";");
                        out.print("</Script>");
                        out.print("\n");
                        out.print("\n");
                        out.print("\n");
                        out.print("<div class=\"numbertext\">"+imgNo+"/5</div>");//
                        out.print("\n");
                        out.print("<div class=\"text\">Zen Studio</div>");//
                        out.print("\n");
                        out.print("<script>");
                        out.print("\n");
                        out.print("document.querySelector(\"div#slideshow-container"+i+" div#mySlides-fade"+i+y+"\").appendChild(document.createElement(\"img\"));");
                        out.print("\n");
                        out.print("document.querySelector(\"div#slideshow-container"+i+" div#mySlides-fade"+i+y+" img\").setAttribute(\"src\",\"data:image/png;base64,\"" + "+imgVar" + i + y + ");");
                        out.print("\n");
                        out.print("</script>");
                        out.print("\n");
                        out.print("</div>");//
//                        out.print("</div>");//
                        out.print("\n");

                    }
                    ++imgNo;
                }
                out.print("<a class=\"prev\" onclick=\"moveSlides(-1)\">&#10094;</a>");
                out.print("\n");
                out.print("<a class=\"next\" onclick=\"moveSlides(1)\">&#10095;</a>");
                out.print("<div style= \"text-align:center\">");//
                out.print("<span class=\"dot\" onclick=\"currentSlide(0)\"></span>");
                out.print("<span class=\"dot\" onclick=\"currentSlide(1)\"></span>");
                out.print("<span class=\"dot\" onclick=\"currentSlide(2)\"></span>");
                out.print("<span class=\"dot\" onclick=\"currentSlide(3)\"></span>");
                out.print("<span class=\"dot\" onclick=\"currentSlide(4)\"></span>");
                out.print("</div>");//

            } else {
//              out.print("<img id=\"branchOfficeImg\" class=\"card-img-top\" src=\"https://dummyimage.com/450x300/dee2e6/6c757d.jpg\">");
//              out.print("document.getElementById(\"slideshow-container"+i+"\").appendChild(document.createElement(\"img\"));");
//                out.print("\n");
//              out.print("document.querySelector(\"div#slideshow-container"+i+" img\").setAttribute(\"src=https://dummyimage.com/450x300/dee2e6/6c757d.jpg\");");
                out.print("\n");

            }
//            out.print("<script>");
//            out.print("branchoffice_no       =  \""+branchOfficeSelectList.get(i).getBranchoffice_no()+"\"");
//            out.print("branchoffice_name     =  \""+branchOfficeSelectList.get(i).getBranchoffice_name()+"\"");
//            out.print("branchOffice_local    =  \""+branchOfficeSelectList.get(i).getBranchoffice_local()+"\"");
//            out.print("branchOffice_address  =  \""+branchOfficeSelectList.get(i).getBranchoffice_address()+"\"");
//            out.print("branchOffice_mobile   =  \""+branchOfficeSelectList.get(i).getBranchoffice_mobile()+"\"");
//            out.print("</script>");
            out.print("<section class=\"py-5\">" +"\n"+
                            "<div class=\"container px-4 px-lg-5 mt-5\">" +"\n"+
                            "<div class=\"row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center\">" +"\n"+
                            "<div class=\"col mb-5\">"       +"\n"+
                            "<div class= \"card h-100\">"    +"\n"+
                    "<!-- BranchOffice details-->" +          "\n"+
                            "<div class=\"card-body p-4\">" + "\n"+
                            "<div class=\"text-center\">" +   "\n"+
                            "<!-- BranchOffice name-->" +     "\n"+
//                            "<h9 id=\"branchOffice_no"+i+"\" class=\"branchOffice_no fw-bolder\" style = \"display: none;\">" + branchOfficeSelectList.get(i).getBranchoffice_no() + "</h9>" +"\n"+
                            "<h9 id=\"branchOffice_no"+i+"\" class=\"branchOffice_no fw-bolder\" >" + branchOfficeSelectList.get(i).getBranchoffice_no() + "</h9>" +"\n"+
                            "<h5 id=\"branchOffice_name"+i+"\" class=\"branchOffice_name fw-bolder\">" + branchOfficeSelectList.get(i).getBranchoffice_name() + "</h5>" +"\n"+
                            "<!-- BranchOffice price-->" +"\n"+
                            "<h8 id=\"branchOffice_local"+i+"\" class=\"branchOffice_local\">"+branchOfficeSelectList.get(i).getBranchoffice_local()+"</h8></br>" +"\n"+
                            "<h8 id=\"branchOffice_address"+i+"\" class=\"branchOffice_address\">"+branchOfficeSelectList.get(i).getBranchoffice_address()+"</h8></br>" +"\n"+
                            "<h8 id=\"branchOffice_mobile"+i+"\" class=\"branchOffice_mobile\">"+branchOfficeSelectList.get(i).getBranchoffice_mobile()+"</h8></br>" +"\n"+
                            "</div>" +"\n"+
                            "</div>" +"\n"+
                            "<!-- Product actions-->" +"\n"+
                            "<div class=\"card-footer p-4 pt-0 border-top-0 bg-transparent\">" +"\n"+
                            "<div class=\"text-center\"><a id=\"goBranchOfficeDetailBoard"+i+"\" class=\"btn btn-outline-dark mt-auto\" onclick=\"goBranchOfficeDetailBoard("+
                    //branchOfficeSelectList.get(i).getBranchoffice_no()+","+
                    //branchOfficeSelectList.get(i).getBranchoffice_name()+","+
                    //branchOfficeSelectList.get(i).getBranchoffice_local()+","+
                    //branchOfficeSelectList.get(i).getBranchoffice_address()+","+
                    //branchOfficeSelectList.get(i).getBranchoffice_mobile()+
                    ")\" >지점 상세</a></div>" +"\n"+
                            "</div>" +"\n"+
                            "</div>" +"\n"+
                            "</div>" +"\n"+
                            "</div>" +"\n"+
                            "</div>" +"\n"+
                            "</div>" +"\n"+
                            "</section>"

            );
        }
    }
out.print("\n");
    %>




<%--

    <%
        if (branchOfficeSelectList.size() > 0) {
//            for (BranchOfficeDTO index : branchOfficeSelectList) {
            for (int i=0; i<branchOfficeSelectList.size(); i++) {
                out.print(
                        "<section class=\"py-5\">" +"\n"+
                                "<div class=\"container px-4 px-lg-5 mt-5\">" +"\n"+
                                "<div class=\"row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center\">" +"\n"+
                                "<div class=\"col mb-5\">" +"\n"+
                                "<div class= \"card h-100\">" +"\n"+
                                /*이미지 컨터이너 부분 */
                                /*<!-- BranchOffice image-->*/
                                "<div id=\"slideshow-container"+i+"\""+" class=\"slideshow-container\">"+"\n"+
                                "<div class=\"mySlides fade\">"+
                                "<div class=\"numbertext\">1 / 6</div>"+"\n"+
                                "<div class=\"text\">ZENSTUDIO</div>"+"\n"+
                                "<a class=\"prev\" onclick=\"moveSlides(-1)\">&#10094;</a>"+"\n"+
                                "<a class=\"next\" onclick=\"moveSlides(1)\">&#10095;</a>"+"\n"+
                                "<div style=\"text-align:center\">"+"\n"+
                                "<span class=\"dot\" onclick=\"currentSlide(0)\"></span>"+"\n"+
                                "<span class=\"dot\" onclick=\"currentSlide(1)\"></span>"+"\n"+
                                "<span class=\"dot\" onclick=\"currentSlide(2)\"></span>"+"\n"+
                                "<span class=\"dot\" onclick=\"currentSlide(3)\"></span>"+"\n"+
                                "<span class=\"dot\" onclick=\"currentSlide(4)\"></span>"+"\n"+
                                "<span class=\"dot\" onclick=\"currentSlide(5)\"></span>"+"\n"+
                                "</div>"+"\n"+
                                "</div>"+"\n"+
//                                "<img "+"id=\"branchOfficeImg\""+index+"class=\"card-img-top\" src=\"https://dummyimage.com/450x300/dee2e6/6c757d.jpg\" >" +
//                                "<img "+"id=\"branchOfficeImg\""+"class=\"card-img-top\" src=\"https://dummyimage.com/450x300/dee2e6/6c757d.jpg\" >" +
                                "<!-- BranchOffice details-->" +  "\n"+
                                "<div class=\"card-body p-4\">" + "\n"+
                                "<div class=\"text-center\">" +   "\n"+
                                "<!-- BranchOffice name-->" +     "\n"+
                                "<h5 class=\"fw-bolder\">" + branchOfficeSelectList.get(i).getBranchoffice_name() + "</h5>" +"\n"+
                                "<!-- BranchOffice price-->" +"\n"+
                                branchOfficeSelectList.get(i).getBranchoffice_address() +"\n"+
                                "</div>" +"\n"+
                                "</div>" +"\n"+
                                "<!-- Product actions-->" +"\n"+
                                "<div class=\"card-footer p-4 pt-0 border-top-0 bg-transparent\">" +"\n"+
                                "<div class=\"text-center\"><a class=\"btn btn-outline-dark mt-auto\" onclick=\"goBranchOfficeDetailBoard()\" > 지점 관리</a></div>" +"\n"+
                                "</div>" +"\n"+
                                "</div>" +"\n"+
                                "</div>" +"\n"+
                                "</div>" +"\n"+
                                "</div>" +"\n"+
                                "</div>" +"\n"+
                                "</section>"
                );
            }
        }
        out.print("<Script>");

        for (int i=0; i<branchOfficeSelectList.size(); i++){
            if (branchOfficeSelectList.get(i).getBranchoffice_haspic() != "N"){
                for (int y=0; y<branchOfficeImgSelectList.size(); y++){
//            if(branchOfficeImgSelectList.get(i).getBranchoffice_img_code()!=null){
                    if (branchOfficeSelectList.get(i).getBranchoffice_no().equals(branchOfficeImgSelectList.get(y).getBranchoffice_no())) {
                        out.print("let imgVar"+i+y+" =\""+branchOfficeImgSelectList.get(y).getBranchoffice_img_code()+"\";");
                        out.print("\n");
                        out.print("document.getElementById(\"slideshow-container"+i+"\").appendChild(document.createElement(\"div\")).className=\"mySlides fade\";");
                        out.print("\n");
//                        out.print("document.querySelector(\"div#slideshow-container"+i+" div.mySlides.fade\").appendChild(document.createElement(\"div\")).className=\"numbertext\";");
//                        out.print("document.querySelector(\"#slideshow-container"+i+" div.mySlides fade\").appendChild(document.createElement(\"div\").className='numbertext';)");
                        out.print("\n");
//                        out.print("document.querySelector(\".numbertext\").innerText = \"1 / 6\"");
                        out.print("\n");
//                        out.print("document.getElementById(\"slideshow-container"+i+"\").appendChild(document.createElement(\"img\"));");
//                        out.print("document.querySelector(\"div#slideshow-container"+i+" div.mySlides div.numbertext\").appendChild(document.createElement(\"img\")).className=\"card-img-top\";");
                        out.print("document.querySelector(\"div#slideshow-container"+i+" div.mySlides\").appendChild(document.createElement(\"img\"));");
                        out.print("\n");
//                        out.print("document.querySelector(\"slideshow-container"+i+"\").className=\"card-img-top\";");
                        out.print("\n");
//                        out.print("document.querySelector(\"div#slideshow-container"+i+" div.mySlides.fade div.numbertext img.card-img-top\").setAttribute(\"src\",\"data:image/png;base64,\""+"+imgVar"+i+y+");");
                        out.print("document.querySelector(\"div#slideshow-container"+i+" div.mySlides img\").setAttribute(\"src\",\"data:image/png;base64,\""+"+imgVar"+i+y+");");
                        out.print("\n");
//                        out.print("document.querySelector(\"img\").setAttribute(\"style\",\"width:450px\");");
//                out.print("document.querySelector(\"img\").setAttribute(\"width\",450);");
                        out.print("\n");
//                out.print("document.querySelector(\"img\").setAttribute(\"height\",300);");
//                        out.print("document.querySelectorAll(\"img\").forEach(function (x) {x.setAttribute(\"style\",\"height:300px\");});");
                        out.print("document.querySelectorAll(\"img\").forEach(function (x) {x.setAttribute(\"style\",\"width:300px, height:300px\");});");
                        out.print("\n");
//                out.print("document.querySelector(\"img\").setAttribute(\"class\",\"card-img-top\");");
//                        out.print("document.querySelectorAll(\"img\").forEach(function (x) {x.setAttribute(\"class\",\"card-img-top\");});");


//            }
                    }
              }
              }
            else {
//              out.print("<img id=\"branchOfficeImg\" class=\"card-img-top\" src=\"https://dummyimage.com/450x300/dee2e6/6c757d.jpg\">");
//              out.print("document.getElementById(\"slideshow-container"+i+"\").appendChild(document.createElement(\"img\"));");
//                out.print("\n");
//              out.print("document.querySelector(\"div#slideshow-container"+i+" img\").setAttribute(\"src=https://dummyimage.com/450x300/dee2e6/6c757d.jpg\");");
                out.print("\n");
            }
        }
        out.print("</Script>");
    %>
--%>


</div>

<script>



    var slideIndex = 0; //slide index

    // HTML 로드가 끝난 후 동작
    window.onload=function(){
        showSlides(slideIndex);

        // Auto Move Slide
        var sec = 3000;
        setInterval(function(){
            slideIndex++;
            showSlides(slideIndex);

        }, sec);
    }


    // Next/previous controls
    function moveSlides(n) {
        slideIndex = slideIndex + n
        showSlides(slideIndex);
    }

    // Thumbnail image controls
    function currentSlide(n) {
        slideIndex = n;
        showSlides(slideIndex);
    }

    function showSlides(n) {

        var slides = document.getElementsByClassName("mySlides");
        var dots = document.getElementsByClassName("dot");
        var size = slides.length;

        if ((n+1) > size) {
            slideIndex = 0; n = 0;
        }else if (n < 0) {
            slideIndex = (size-1);
            n = (size-1);
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
</script>