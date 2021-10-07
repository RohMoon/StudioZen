<%--
  Created by IntelliJ IDEA.
  User: Moon
  Date: 2021-08-25
  Time: 오후 3:01
  To change this template use File | Settings | File Templates.
--%>
<script>
let testVar = "";
alert("BBB");
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.example.studiozen.DTO.BranchOfficeDTO" %>
<%
    List<BranchOfficeDTO> branchOfficeSelectList = (List<BranchOfficeDTO>) request.getAttribute("branchOfficeSelectList");
    List<BranchOfficeDTO> branchOfficeImgSelectList = (List<BranchOfficeDTO>) request.getAttribute("branchOfficeImgSelectList");
    int size = 0;
    String imgTest =branchOfficeImgSelectList.get(0).getBranchoffice_img_code();
   out.print("<script>alert(\"aaaaa\");</script>");
   out.print("why------?");
%>

<script type="text/javascript" defer>

    window.onload = function () {
        alert("TTT");
    }
    document.onreadystatechange =function () {
        testVar = "<%=imgTest%>";
        testVar = "";
        alert("TEsta");
    }
</script>
<div id="branchOfficeSelectList">

<div id="modalSpace">

</div>
<%-- 관리자 번호를 갖고 있다면 메뉴를 보여주지않는다. --%>
<div id="dropdown" class="dropdown">
</div>



    <%
        if (branchOfficeSelectList.size() > 0) {
            for (BranchOfficeDTO index : branchOfficeSelectList) {
                out.print(
                        "<section class=\"py-5\">" +
                                "<div class=\"container px-4 px-lg-5 mt-5\">" +
                                "<div class=\"row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center\">" +
                                "<div class=\"col mb-5\">" +
                                "<div class= \"card h-100\">" +
                                /*이미지 컨터이너 부분 */
                                /*<!-- BranchOffice image-->*/
                                "<div class=\"slideshow-container\">"+
                                "<div class=\"mySlides fade\">"+
                                "<div class=\"numbertext\">1 / 6</div>"+
                                "<div class=\"text\">ZENSTUDIO</div>"+
                                "</div>"+
                                "</div>"+
                                "<img class=\"card-img-top\" src=\"https://dummyimage.com/450x300/dee2e6/6c757d.jpg\" >" +
                                "<!-- BranchOffice details-->" +
                                "<div class=\"card-body p-4\">" +
                                "<div class=\"text-center\">" +
                                "<!-- BranchOffice name-->" +
                                "<h5 class=\"fw-bolder\">" + index.getBranchoffice_name() + "</h5>" +
                                "<!-- BranchOffice price-->" +
                                index.getBranchoffice_address() +
                                "</div>" +
                                "</div>" +
                                "<!-- Product actions-->" +
                                "<div class=\"card-footer p-4 pt-0 border-top-0 bg-transparent\">" +
                                "<div class=\"text-center\"><a class=\"btn btn-outline-dark mt-auto\" onclick=\"goBranchOfficeDetailBoard()\" > 지점 관리</a></div>" +
                                "</div>" +
                                "</div>" +
                                "</div>" +
                                "</div>" +
                                "</div>" +
                                "</div>" +
                                "</section>"
                );
            }
        }
    %>

</div>
