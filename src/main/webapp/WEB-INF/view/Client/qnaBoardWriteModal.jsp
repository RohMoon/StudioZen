<%--
  Created by IntelliJ IDEA.
  User: Moon
  Date: 2021-09-08
  Time: 오전 11:16
  To change this template use File | Settings | File Templates.
--%>
<div id="clientQnaBoardWriteModal" class="modal" onclick="ClientModalCloseAction()">
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <script>


    </script>


    <div id="modalbd" class="modal_body">
        <form name="clientQnaBoardWriteModal" enctype="multipart/form-data">
            <table id="management_qnaList" class="table ">
                <thead>
                <tr>
                    <th>Q&A</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th>
                        <input id="clientQnaBoardWriteModalTitleArea" class="clientQnaBoardWriteModalTitleArea"/>
                    </th>
                </tr>
                <tr>
                    <th>
                <textarea id="clientQnaBoardWriteModalTextArea" class="clientQnaBoardWriteModalTextArea">
                    </textarea>
                    </th>
                </tr>
                </tbody>
            </table>
            <input type="file" id="file" name="file" multiple="multiple"/> <br/><br/>
            <a href="#this" class="btn btn-warning" id="write" onclick="ClientQnaBoardWrite()">작성하기</a>
        </form>
    </div>
</div>
