<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
    
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/event/eventList.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
        integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://kit.fontawesome.com/50a1d35924.js" crossorigin="anonymous"></script>
        
        <!-- jQuery 라이브러리 추가(CDN) -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    </head>
    <body>
        <header>
            <jsp:include page="/WEB-INF/views/main/header.jsp" />
        </header>
    
        <div class="eventContent">
            <div class="eventBody">
                <div class="eventList_main">
                    <div class="ewrap_tab">
                        <ul class="elist_tab">
                            <li class="eon">
                                <a href="" class="elink_tab">
                                    <span class="etxt_tab">전체</span>
                                </a>
                            </li>
                            <li class="eon">
                                <a href="" class="elink_tab">
                                    <span class="etxt_tab">진행중</span>
                                </a>
                            </li>
                            <li class="eon">
                                <a href="" class="elink_tab">
                                    <span class="etxt_tab">종료</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="egroup_catalog">
                        <ul class="elist_official">
                            <li>  
                                <a href="" class="elink_official">
                                    <span class="earea_thumb">
                                        <img src="/images/dog.jpeg" alt="썸네일이미지">
                                        <div class="earea_thumb_period">
                                            <span>종료<br>임박</span>
                                        </div>
                                    </span>
                                    <span class="etxt_official">
                                        <div class="etxt_officialTi">
                                            <span>
                                                강아지의 날! 행복한 강아지 만들기
                                            </span>
                                        </div>
                                        <span class="edate_official">
                                            <span class="escrean_out">
                                                2023.05.05 ~ 2023.06.07
                                            </span>
                                        </span>
                                    </span>
                                    <span class="ereg">
                                        <span>✔️ 5,023명 참여중</span>
                                    </span>
                                </a>
                            </li>
                            <li class="eother"><!--두번째는 다른 스타일-->
                                <a href="" class="elink_official_2">
                                    <span class="earea_thumb_2">
                                        <img src="/images/dogil.png" alt="썸네일이미지">
                                    </span>
                                    <span class="etxt_official_2">
                                        <span>강아지의 날! 이벤트</span>
                                    </span>
                                    <span class="ereg_2">
                                        <span>5,000명 달성</span>
                                    </span>
                                </a>
                                <div class="edetail">
                                    <a href="">
                                        <span>자세히보기</span>
                                    </a>
                                </div>
                            </li>
                            <li>  
                                <a href="" class="elink_official">
                                    <span class="earea_thumb">
                                        <img src="/images/dog.jpeg" alt="썸네일이미지">
                                        <div class="earea_thumb_period">
                                            <span>종료<br>임박</span>
                                        </div>
                                    </span>
                                    <span class="etxt_official">
                                        <div class="etxt_officialTi">
                                            <span>
                                                강아지의 날! 행복한 강아지 만들기
                                            </span>
                                        </div>
                                        <span class="edate_official">
                                            <span class="escrean_out">
                                                2023.05.05 ~ 2023.06.07
                                            </span>
                                        </span>
                                    </span>
                                    <span class="ereg">
                                        <span>✔️ 5,023명 참여중</span>
                                    </span>
                                </a>
                            </li>
                            <li>  
                                <a href="" class="elink_official">
                                    <span class="earea_thumb">
                                        <img src="/images/dog.jpeg" alt="썸네일이미지">
                                        <div class="earea_thumb_period">
                                            <span>종료<br>임박</span>
                                        </div>
                                    </span>
                                    <span class="etxt_official">
                                        <div class="etxt_officialTi">
                                            <span>
                                                강아지의 날! 행복한 강아지 만들기
                                            </span>
                                        </div>
                                        <span class="edate_official">
                                            <span class="escrean_out">
                                                2023.05.05 ~ 2023.06.07
                                            </span>
                                        </span>
                                    </span>
                                    <span class="ereg">
                                        <span>✔️ 5,023명 참여중</span>
                                    </span>
                                </a>
                            </li>
                            <li>  
                                <a href="" class="elink_official">
                                    <span class="earea_thumb">
                                        <img src="/images/dog.jpeg" alt="썸네일이미지">
                                        <div class="earea_thumb_period">
                                            <span>종료<br>임박</span>
                                        </div>
                                    </span>
                                    <span class="etxt_official">
                                        <div class="etxt_officialTi">
                                            <span>
                                                강아지의 날! 행복한 강아지 만들기
                                            </span>
                                        </div>
                                        <span class="edate_official">
                                            <span class="escrean_out">
                                                2023.05.05 ~ 2023.06.07
                                            </span>
                                        </span>
                                    </span>
                                    <span class="ereg">
                                        <span>✔️ 5,023명 참여중</span>
                                    </span>
                                </a>
                            </li>
                            <li>  
                                <a href="" class="elink_official">
                                    <span class="earea_thumb">
                                        <img src="/images/dog.jpeg" alt="썸네일이미지">
                                        <div class="earea_thumb_period">
                                            <span>종료<br>임박</span>
                                        </div>
                                    </span>
                                    <span class="etxt_official">
                                        <div class="etxt_officialTi">
                                            <span>
                                                강아지의 날! 행복한 강아지 만들기
                                            </span>
                                        </div>
                                        <span class="edate_official">
                                            <span class="escrean_out">
                                                2023.05.05 ~ 2023.06.07
                                            </span>
                                        </span>
                                    </span>
                                    <span class="ereg">
                                        <span>✔️ 5,023명 참여중</span>
                                    </span>
                                </a>
                            </li>
                            <li>  
                                <a href="" class="elink_official">
                                    <span class="earea_thumb">
                                        <img src="/images/dog.jpeg" alt="썸네일이미지">
                                        <div class="earea_thumb_period">
                                            <span>종료<br>임박</span>
                                        </div>
                                    </span>
                                    <span class="etxt_official">
                                        <div class="etxt_officialTi">
                                            <span>
                                                강아지의 날! 행복한 강아지 만들기
                                            </span>
                                        </div>
                                        <span class="edate_official">
                                            <span class="escrean_out">
                                                2023.05.05 ~ 2023.06.07
                                            </span>
                                        </span>
                                    </span>
                                    <span class="ereg">
                                        <span>✔️ 5,023명 참여중</span>
                                    </span>
                                </a>
                            </li>
                            <li>  
                                <a href="" class="elink_official">
                                    <span class="earea_thumb">
                                        <img src="/images/dog.jpeg" alt="썸네일이미지">
                                        <div class="earea_thumb_period">
                                            <span>종료<br>임박</span>
                                        </div>
                                    </span>
                                    <span class="etxt_official">
                                        <div class="etxt_officialTi">
                                            <span>
                                                강아지의 날! 행복한 강아지 만들기
                                            </span>
                                        </div>
                                        <span class="edate_official">
                                            <span class="escrean_out">
                                                2023.05.05 ~ 2023.06.07
                                            </span>
                                        </span>
                                    </span>
                                    <span class="ereg">
                                        <span>✔️ 5,023명 참여중</span>
                                    </span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="epnation">
                        <div class="epnation_wrap">
                            <button><</button>
                            <ul class="epnation_ul">
                                <li>1</li>
                                <li>2</li>
                                <li>3</li>
                                <li>4</li>
                                <li>5</li>
                                <li>6</li>
                                <li>7</li>
                            </ul>
                            <button>></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
    
    <!-- 푸터 영역 -->
    <header>
        <jsp:include page="/WEB-INF/views/main/footer.jsp" />
    </header>

    </body>
    </html>