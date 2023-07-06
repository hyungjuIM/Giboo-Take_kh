<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>에러 발생!</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/error.css">
</head>
<body>
<div class="mainContent">
    <div class="errorBox">
        <div class="titleBar">
            <div class="dotArea">
                <img src="${pageContext.request.contextPath}/resources/images/redDot.svg" class="redDot">
                <img src="${pageContext.request.contextPath}/resources/images/yellowDot.svg" class="yellowDot">
                <img src="${pageContext.request.contextPath}/resources/images/greenDot.svg" class="greenDot">
            </div>
            OOPS!
        </div>
        <div class="content">
            <img src="${pageContext.request.contextPath}/resources/images/traffic-cone-svgrepo-com.svg" class="errorImage">
            <div class="textArea">
                <div>사이트에 문제가 생겼어요</div>
                <div>잠시 후 다시 시도해주세요</div>
                ${e}
            </div>
        </div>
        <div class="buttonArea">
            <a href="${pageContext.request.contextPath}/main" class="button">메인 화면으로 이동하기</a>
        </div>
    </div>
</div>
</body>
</html>
