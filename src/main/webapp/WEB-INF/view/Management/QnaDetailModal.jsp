<%--
  Created by IntelliJ IDEA.
  User: Moon
  Date: 2021-08-27
  Time: 오후 1:52
  To change this template use File | Settings | File Templates.
--%>
<%-- qna detail Modal 창 --%>
<div class="modal" onclick="qnaDetailModalAction()">
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="java.util.*" %>
    <%@ page import="com.example.studiozen.DTO.QNABoardDTO" %>
    <%--<% List<QNABoardDTO> detailList = (List<QNABoardDTO>) request.getAttribute("detailList");%>--%>
    <% List<QNABoardDTO> detailList = (List<QNABoardDTO>) request.getAttribute("detailList");%>
    <% QNABoardDTO detailInfo = (detailList.get(0));
        String sid = ((String) session.getAttribute("sessionNO")).substring(10);
    %>
    <script> qna_no = '<%=detailInfo.getQna_no()%>';
    sid = '<%= sid%>';

    console.log(sid);
    console.log(qna_no);

    </script>
    <%-- 모달 번호  --%>
    <div id="modalbd" class="modal_body">
        <div class="modal_contentArea">
            Q&A 접수 번호 : </br>
            <% out.print(detailInfo.getQna_no());%>
            </br>
            Q&A 제목 :
            </br>
            <% out.print(detailInfo.getQna_title());%>
            </br>
            Q&A 작성자 :
            </br>
            <% out.print(detailInfo.getQna_writer()); %>
            </br>
            Q&A 글 내용 :
            </br>
            <% out.print(detailInfo.getQna_content()); %>
            </br>
            Q&A 게시 날짜 :
            </br>
            <% out.print(detailInfo.getQna_regidate());%>
            <%-- 댓글 입력 폼--%>
            <form name="QnaRecommentForm" onsubmit="return false" action="qna/select/" method="post" datatype="json">
                <%-- 댓글 입력 필드셋 --%>
                <fieldset>
                    <%-- 댓글 내용 입력란 --%>
                    <input type='text' name='qna_recomment_content'>
                </fieldset>
                </p>
            </form>
            <button id="goWritingQNARecomment" type="button" class="btn btn-primary"
                    onclick="goWritingQNARecommentAction(sid,qna_no)">댓글 달기
            </button>

            <%
                if (detailList != null && detailList.size() > 0) {
                            %>

            <%
                    for (QNABoardDTO index : detailList) {
                        if (index.getFile_size() > 0) {
                            out.print("</br>");
                            out.print("</br>");

                            out.print("업로드된 파일");
                            out.print("</br>");
                            out.print("<a>"+index.getOriginal_file_name()+"</a>");
                            out.print("<script>var p_stored_file_name = '"+index.getStored_file_name()+"';</script>");
                            out.print("</br>");
                            out.print("파일 크기");
                            out.print(index.getFile_size() / 1024+"KB");
                            out.print("</br>");
                            out.print("업로드된 날짜");
                            out.print(index.getCrea_dtm());
                            out.print("</br>");
                            out.print("   </br> <button id=\"goDownloadQnaFile\" type=\"button\" class=\"btn btn-primary\"\n" +
                                    "                    onclick=\"goDownloadQnaFileAction(p_stored_file_name)\">다운로드\n" +
                                    "            </button>");
                        }
                    }

                        %>


            <%
                    for (QNABoardDTO index : detailList) {
                        out.print("<script>var indexNo" + index.getRow_num() + " = " + index.getRow_num() + ";" +
                                "var recoNo" + index.getRow_num() + "=" + index.getQna_recomment_no() + ";" +
                                "console.log(indexNo" + index.getRow_num() + ")" + " </script>");
                        out.print("<div id=\"recomment_space" + index.getRow_num() + "\" >");
                        out.print("</br>");
                        out.print(index.getRow_num());
                        out.print("   댓글  내용 :</br>");
                        out.print(index.getQna_recomment_content());
                        out.print("  </br> 댓글 작성자 </br>");
                        out.print(index.getQna_recomment_writer());
                        out.print("  </br> 댓글 게시 날짜</br>");
                        out.print(index.getQna_recomment_regdate());
                        out.print("</br>");
                        if (sid.equals(index.getQna_recomment_writer())) {
                            out.print("   <div id=\"recommentCUDSpace\">    " +
                                    "<button id=\"goWritingQNARecomment\" type=\"button\" class=\"btn btn-primary\"\n" +
                                    "                onclick=\"goUpdatingQNARecommentAction(sid,qna_no,indexNo" + index.getRow_num() + ",recoNo" + index.getRow_num() + ")\">수정\n" +
                                    "        </button>");
                            out.print("        <button id=\"goWritingQNARecomment\" type=\"button\" class=\"btn btn-primary\"\n" +
                                    "                onclick=\"goDeletingQNARecommentAction(sid,qna_no,indexNo" + index.getRow_num() + ",recoNo" + index.getRow_num() + ")\">삭제\n" +
                                    "        </button></div>");
                        } else {
                            out.print("<script>console.log('no author'); </script>");
                        }
                        out.print("</div>");
                    }
                    return;
                } %>
            <%--</div>--%>
        </div>
    </div>
</div>