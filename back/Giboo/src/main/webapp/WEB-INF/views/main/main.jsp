<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>main</title>
    <!-- jQuery 라이브러리 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/main.css" />
            <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/reset.css" />


</head>

<body>
      <!-- 헤더 영역 -->
            <header>
                <jsp:include page="/WEB-INF/views/main/header.jsp" />
            </header>



    <main>
        <section class="banner_Container">
            <div class="mainBanner"></div>
        </section>
        
        <section class="mainContent">
            <article class="goalBtn_Container">
                    <div class="showGoal goalBtn">
                        <div class="userPhoto"></div>
                        <div class="showGoal_content">
                            <h3>올해 기부금 목표 <span>60%</span>달성🎉</h3>
                            <div>
                                <span>모두 화이팅 해야지 👍</span>
                                <span>leeu2u</span>
                            </div>
                            <div>
                                <div></div>
                                <span>3,809,000</span>
                                <span>60%</span>
                            </div>
                        </div>
                    </div>
                    <div class="showGoal goalBtn">
                        <div class="userPhoto"></div>
                        <div class="showGoal_content">
                            
                        </div>
                    </div>
                    <div class="showStroyBtn goalBtn"></div>
                    <div class="showStroyBtn goalBtn"></div>
            </article>
            <article class="bestDonation_Container">
                <div></div>
                <div>
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                </div>
            </article>
        </section>

    </main>
    <!-- 푸터 영역 -->
    <footer>
        <jsp:include page="/WEB-INF/views/main/footer.jsp" />
    </footer>

 
</body>

</html>