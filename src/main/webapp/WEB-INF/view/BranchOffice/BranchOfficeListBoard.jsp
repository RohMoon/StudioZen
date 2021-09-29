<%--
  Created by IntelliJ IDEA.
  User: Moon
  Date: 2021-08-25
  Time: 오후 3:01
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="com.example.studiozen.DTO.BranchOfficeDTO" %>

<%
    List<BranchOfficeDTO> branchOfficeSelectList = (List<BranchOfficeDTO>) request.getAttribute("branchOfficeSelectList");
    int size = 0;
%>
<div id="modalSpace">

</div>
<%-- 관리자 번호를 갖고 있다면 메뉴를 보여주지않는다. --%>
<div id="dropdown" class="dropdown">
</div>


<div id="branchOfficeSelectList">

    <%
        if (branchOfficeSelectList.size() > 0) {
            for (BranchOfficeDTO index : branchOfficeSelectList) {
                out.print(
                        "<section class=\"py-5\">" +
                                "<div class=\"container px-4 px-lg-5 mt-5\">" +
                                "<div class=\"row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center\">" +
                                "<div class=\"col mb-5\">" +
                                "<div class= \"card h-100\">" +
                                "<!-- BranchOffice image-->" +
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
<%--    ${branchOfficeDTOList}--%>
</p>

</p>
<%--        <div class="col mb-5">
            <div class="card h-100">
                <!-- BranchOffice image-->
                <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="...">
                <!-- BranchOffice details-->
                <div class="card-body p-4">
                    <div class="text-center">
                        <!-- BranchOffice name-->
                        <h5 class="fw-bolder">Fancy Product</h5>
                        <!-- BranchOffice price-->
                        $40.00 - $80.00
                    </div>--%>

<%--</main>--%>