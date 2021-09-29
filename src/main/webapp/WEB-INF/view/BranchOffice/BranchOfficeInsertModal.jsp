<%--
  Created by IntelliJ IDEA.
  User: Moon
  Date: 2021-09-08
  Time: 오전 11:16
  To change this template use File | Settings | File Templates.
--%>
<div id="branchOfficeInsertModal" class="modal" onclick="qnaDetailModalAction()">
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <div id="modalbd" class="modal_body">
        <form name="branchOfficeInsertModal" enctype="multipart/form-data">
            <table id="branchOfficeInsert" class="table ">
                <thead>
                <tr>
                    <th>신규지점 등록</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th>
                        <label for="newBranchOfficeName">지점 이름</label>
                        <input id="newBranchOfficeName" class="newBranchOfficeName"/>
                    </th>
                </tr>
                <tr>
                    <th>
                        <label for="newBranchOfficeLocal">지점 지역</label>
                <input id="newBranchOfficeLocal" class="newBranchOfficeLocal"/>
                    </th>
                </tr>
                <tr>
                    <th>
                        <label for="newBranchOfficeMobile">지점 전화번호</label>
                        <input id="newBranchOfficeMobile" class="newBranchOfficeMobile"/>
                    </th>
                </tr>
                <tr>
                    <th>
                        <label for="newBranchOfficeAddress">지점 주소</label>
                        <input id="newBranchOfficeAddress" class="newBranchOfficeAddress"/>
                    </th>
                </tr>
                </tbody>
            </table>
            <label for="imageSelector">지점 이미지 첨부</label>
            <input type="file" id="imageSelector" name="files" onchange="readURL(this);"  multiple='multiple' />
            <br />
            <img id="preview" />
            <div id="image_container"></div>
            <a  class="btn btn-warning" id="branchOfficeInsertButton" onclick="newBranchOfficeInsert()">신규등록</a>
        </form>
    </div>

</div>
