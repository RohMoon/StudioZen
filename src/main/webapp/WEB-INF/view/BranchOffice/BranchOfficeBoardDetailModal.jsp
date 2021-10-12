<%--
  Created by IntelliJ IDEA.
  User: Moon
  Date: 2021-09-08
  Time: 오전 11:16
  To change this template use File | Settings | File Templates.
--%>
<div id="BranchOfficeBoardWriteModal" class="modal" onclick="qnaDetailModalAction()">
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="java.util.*" %>
    <%@ page import="com.example.studiozen.DTO.SpaceDTO" %>
    <%
        List<SpaceDTO> branchOfficeSelectList = (List<SpaceDTO>) request.getAttribute("spaceSelectList");
        int size = 0;
    %>

    <div id="modalbd" class="modal_body">
        <form id="branchOfficeBoardDetailModalForm" name="branchOfficeBoardDetailModal" enctype="multipart/form-data">
            <table id="branchOfficeListTable" class="table branchOfficeBoardDetailTable" style="align-content: center">
                <thead>
                <tr>
                    <th id="branchoffice_name"></th>
                </tr>
                </thead>
                <tbody id="branchOfficeBoardDetailTableTbody">
                <tr>
                    <td>
                        <label for="branchoffice_no">지점 번호</label>
                        <input id="branchoffice_no" class="branchOfficeBoardDetailArea"/>
                    </td>
                </tr>
                <td>
                    <label for="branchOffice_local">지역</label>
                    <input id="branchOffice_local" class="branchOfficeBoardDetailArea"/>
                </td>
                <tr>
                    <td>
                        <label for="branchOffice_address">주소</label>
                        <input id="branchOffice_address" class="branchOfficeBoardDetailArea"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="branchOffice_mobile">전화번호</label>
                        <input id="branchOffice_mobile" class="branchOfficeBoardDetailArea"/>
                    </td>
                </tr>
                </tbody>
            </table>
            <%--            <input type="file" id="file" name="file" class="branchOfficeBoardDetailArea" multiple="multiple"/> <br/><br/>--%>
            <%--            <a href="#this" class="btn btn-warning" id="branchOfficeBoardDetailwrite" onclick="ClientQnaBoardWrite()">작성하기</a>--%>
        </form>
    </div>
    }
</div>
<script>
    document.getElementById("branchoffice_name").innerText = sessionStorage.getItem("branchoffice_name");
    document.getElementById("branchoffice_no").value = sessionStorage.getItem("branchoffice_no");
    document.getElementById("branchOffice_local").value = sessionStorage.getItem("branchOffice_local");
    document.getElementById("branchOffice_address").value = sessionStorage.getItem("branchOffice_address");
    document.getElementById("branchOffice_mobile").value = sessionStorage.getItem("branchOffice_mobile");

    document.querySelectorAll(".branchOfficeBoardDetailArea").forEach(function (e) {
        e.setAttribute("readonly", "readonly");
        e.setAttribute("border-width", "0");
    })
    // const extraTr = document.createElement("tr");
    // const extraTd = document.createElement("td");
    // let extraTextNodeSpaceTitle = document.createTextNode("대여 공간 리스트");
    // let extraCell = extraTr.appendChild(extraTd);
    // document.getElementById("branchOfficeBoardDetailTableTbody").appendChild(extraTr);
    // document.getElementById("branchOfficeBoardDetailTableTbody").lastElementChild.appendChild(extraTd);
    // document.getElementById("branchOfficeBoardDetailTableTbody").lastElementChild.lastElementChild.appendChild(extraTextNodeSpaceTitle);
    // document.getElementById("branchOfficeBoardDetailTableTbody").before(document.getElementById("branchOfficeBoardDetailTableTbody").lastElementChild)
    if (sessionStorage.getItem('sid').split('=')[1] == 'MEM282108') {

    } else {

    }
    <% if (branchOfficeSelectList.size()!=0){
        out.print("document.getElementById(\"branchOfficeBoardDetailTableTbody\").appendChild(document.createElement(\"tr\"));");
        out.print("\n");
        out.print("document.getElementById(\"branchOfficeBoardDetailTableTbody\").lastElementChild.appendChild(document.createElement(\"td\"));");
        out.print("\n");
        out.print("document.getElementById(\"branchOfficeBoardDetailTableTbody\").lastElementChild.lastElementChild.appendChild(document.createTextNode(\"대여 공간 리스트\"));");
        out.print("\n");
        for (SpaceDTO index: branchOfficeSelectList) {
        out.print("document.getElementById(\"branchOfficeBoardDetailTableTbody\").appendChild(document.createElement(\"tr\"));");
        out.print("document.getElementById(\"branchOfficeBoardDetailTableTbody\").lastElementChild.id=\""+index.getBranchoffice_no()+"\"");
        out.print("\n");
        out.print("document.getElementById(\"branchOfficeBoardDetailTableTbody\").lastElementChild.appendChild(document.createElement(\"td\"));");
        out.print("\n");
        out.print("document.getElementById(\"branchOfficeBoardDetailTableTbody\").lastElementChild.lastElementChild.appendChild(document.createTextNode(\""+index.getSpace_name()+"\"));");
        out.print("\n");
        out.print("document.getElementById(\"branchOfficeBoardDetailTableTbody\").lastElementChild.lastElementChild.appendChild(document.createTextNode(\""+index.getSpace_capacity()+"\"));");
        out.print("\n");
        }

    }
     %>
    // branchOfficeBoardDetailTableTbody


</script>