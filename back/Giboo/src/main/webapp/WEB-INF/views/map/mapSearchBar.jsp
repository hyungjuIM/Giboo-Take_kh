<%@ page language="java" contentType="text/html; charset=UTF-8"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>hunny</title>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/map/map.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/map/mapPopup.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
        integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://kit.fontawesome.com/50a1d35924.js" crossorigin="anonymous"></script>
        

    </head>
    <body>
                <!-- 검색하는 영역 -->
                    <div class="MsearchBar">
                        <form method="get" id="mapSearch" onsubmit="searchPlaces(); return false;">
                            <select name="key" id="search-key">
                                <option value="t">기관명</option>
                                <option value="c">카테고리</option>
                                <option value="w">주소</option>
                            </select>
                            <input type="text" name="query" id="searchArea" placeholder="봉사, 기부 장소 검색">
                            <button class="MsearchBtn" id="MsearchBtn">🔍</button>  
                        </form>
                    </div>

        <script src="${pageContext.request.contextPath}/resources/js/map/map.js"></script>

    </body>
</html>
