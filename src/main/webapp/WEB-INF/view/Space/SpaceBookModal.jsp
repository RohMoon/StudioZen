<%--
  Created by IntelliJ IDEA.
  User: Moon
  Date: 2021-09-08
  Time: 오전 11:16
  To change this template use File | Settings | File Templates.
--%>
<div id="branchOfficeBoardDetailModal" class="modal" onclick="BranchOfficeDetailModalAction()">
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="java.util.*" %>
    <%@ page import="com.example.studiozen.DTO.SpaceDTO" %>
    <%
        List<SpaceDTO> branchOfficeSelectList = (List<SpaceDTO>) request.getAttribute("spaceSelectList");
        int size = 0;
    %>

    <div id="spaceBookModalbd" class="spaceBookModal_body">
        <table id="calendar" align="center">
            <thead>
            <tr class="btn-wrap clearfix">
                <td>
                    <label id="prev">
                        &#60;
                    </label>
                </td>
                <td align="center" id="current-year-month" colspan="5"></td>
                <td>
                    <label id="next">
                        &#62;
                    </label>
                </td>
            </tr>
            <tr>
                <td class="sun" align="center">Sun</td>
                <td align="center">Mon</td>
                <td align="center">Tue</td>
                <td align="center">Wed</td>
                <td align="center">Thu</td>
                <td align="center">Fri</td>
                <td class="sat" align="center">Sat</td>
            </tr>
            </thead>
            <tbody id="calendar-body" class="calendar-body"></tbody>
        </table>
    </div>

</div>