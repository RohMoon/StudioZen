<%--
  Created by IntelliJ IDEA.
  User: Moon
  Date: 2021-08-25
  Time: 오후 3:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="com.example.studiozen.DTO.QNABoardDTO" %>
<%
    List<QNABoardDTO> qnaBoardList = (List<QNABoardDTO>) request.getAttribute("qnaBoardList");
    int size = 0;
%>
<main id="qnaListBoard">
    <div id="modalSpace">

    </div>
    <div class="container-fluid px-4">
        <h1 class="mt-4">QNA 현황</h1>
        <div class="card mb-4">

            <%--card-body--%>
            <div class="table-responsive">
                <%--id="datatablesSimple"--%>
                <table id="management_qnaList" class="table table-striped">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>접수번호</th>
                        <th>작성자</th>
                        <th>제목</th>
                        <th>작성날짜</th>
                        <th>확인여부</th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <th>#</th>
                        <th>접수번호</th>
                        <th>작성자</th>
                        <th>제목</th>
                        <th>작성날짜</th>
                        <th>확인여부</th>
                    </tr>
                    </tfoot>
                    <tbody>
                    <% if (qnaBoardList != null && qnaBoardList.size() > 0) {
                        for (QNABoardDTO index : qnaBoardList) {
                            out.print("<tr class=\"btn-open-popup\" onclick=\"qnaDetailBoardAction(this)\">");
                            out.print("<td>");
                            out.print(index.getRow_num());
                            out.print("</td>");
                            out.print("<td>");
                            out.print(index.getQna_no());
                            out.print("</td>");
                            out.print("<td>");
                            out.print(index.getQna_writer());
                            out.print("</td>");
                            out.print("<td>");
                            out.print(index.getQna_title());
                            out.print("</td>");
                            out.print("<td>");
                            out.print(index.getQna_regidate());
                            out.print("</td>");
                            out.print("<td>");
                            if (index.getQna_confirmflag() == 0) {
                                out.print("미확인");
                            } else {
                                out.print("확인");
                            }
                            out.print("</td>");
                            out.print("<tr>");
                        }
                        return;

                    }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</main>