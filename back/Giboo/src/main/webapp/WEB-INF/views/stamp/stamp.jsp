<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>stamp</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/event/eventDetail.css">
</head>
<body>
    <div class="stampWrap">
        <div class="stampBox">
            <div class="stampCount">
                <span>총 개수</span>
                <span>3</span>
            </div>
            <c:choose>
                <c:when test="&{empty mapList}">
                    <span>목록이 존재하지 않습니다.</span>
                </c:when>
            <ul class="stampUl">
                <li class="stampLi">
                    <div class="stampDiv">
                        <div class="stampReal">
                            <span>스템프</span>
                            <span>1</span>
                        </div>
                    </div>
                </li>
            </ul>
            </c:choose>
        </div>
    </div>
</body>
</html>