<%--
  Created by IntelliJ IDEA.
  User: Hoictas
  Date: 2017/8/18
  Time: 21:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  Created by IntelliJ IDEA.
  User: Hoictas
  Date: 2017/8/10
  Time: 10:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="/publicVariables.jsp" %>
<% System.out.println("**************diaryShow.jsp"); %>
<div class="data-list">
    <div class="data-list-title">
        <c:choose>
            <c:when test="${diary.diaryId!=null}">
                <img src="<%=homePath%>/picture/mainTemp/data_type_edit_icon.png"/>
                修改文章
            </c:when>
            <c:otherwise>
                <img src="<%=homePath%>/picture/mainTemp/diary_add_icon.png"/>
                编辑文章
            </c:otherwise>
        </c:choose>
    </div>
    <div>
        <form role="form" action="/ShowServlet?action=save" method="post" onsubmit="javascript:return VerifySave()">
            <input type="hidden" value="${diary.diaryId}" name="diaryIdInput">
            <div class="input-group">
                <span class="input-group-addon">标题</span>
                <input id="titleInput" type="text" name="titleInput" value="${diary.title}" class="form-control"
                       placeholder="请添加标题">
            </div>

            <%--<div class="data-content">
                <textarea id="contentInput" name="contentInput" class="ckeditor">${diary.content}</textarea>
            </div>--%>

            <div id="my-editormd">
                <textarea id="my-editormd-markdown-doc" name="my-editormd-markdown-doc" style="display:none;"></textarea>
                <!-- 注意：name属性的值-->
                <textarea id="my-editormd-html-code" name="my-editormd-html-code" style="display:none;"></textarea>
            </div>

            <div class="data-type">
                <select name="diaryTypeIdInput" id="typeIdInput">
                    <option value="-1">请选择文章类别...</option>
                    <c:forEach var="diaryType" items="${diaryTypeCountList}">
                        <option value="${diaryType.diaryTypeID}" ${diaryType.diaryTypeID==diary.typeId?"selected":""}>${diaryType.typeName}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="diary_button">
                <button type="submit" class="btn btn-primary btn-sm">&nbsp;保存&nbsp;</button>
                <button type="button" class="btn btn-default btn-sm"
                        onclick="javascript:window.location.href='/MainServlet?flag=searchAll'">&nbsp;返回&nbsp;
                </button>
                <p id="error"
                   style="display: inline-block; color: #ce4f4d;padding-left: 46px;">${error==null?"":error}</p>
            </div>
        </form>
    </div>

</div>
