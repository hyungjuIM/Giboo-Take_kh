<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>mapHeader</title>
    
    <script src="https://kit.fontawesome.com/a06d7ad725.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/map/mapHeader.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
    integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />

     <!-- fontawesome -->
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
     integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
     crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
     
                    <div class="mhBox">
                        <div class="mhBoxImg">
                            <a href="">
                                <img src="${pageContext.request.contextPath}${mapDetailTop.volunteerAttachement}" alt="">
                            </a>
                        </div>
                        <div class="mhBoxTi">
                            <div class="mhTiDe">
                                <div class="mhTiName">
                                    <span>${mapDetailTop.agencyName}</span>
                                    <div class="mhTiCa">
                                        <span>${mapDetailTop.parentCategoryName}</span>
                                    </div>
                                </div>
                                <div class="mhTiRe">
                                    <div class="mhTiHe">
                                        <span><i class="fa-regular fa-heart"></i></span>
                                        <span class="mhRe">${mapDetailTop.volunteerFavCount}</span>
                                    </div>
                                    <span class="mhBar">|</span>
                                    <div class="mhTiReDe">
                                        <a href="">
                                            <span>봉사자 리뷰</span>
                                            <span class="mhRe">${mapDetailTop.replyCount}</span>
                                        </a>
                                        <span>|</span>
                                        <a href="">
                                            <span>봉사자</span>
                                            <span class="mhRe">${mapDetailTop.volunteerCount}</span>
                                        </a>
                                    </div>
                                </div>
                                <div class="mhBtnWrap">
                                    <div class="mhBtn">
                                        <div class="mhBtnHe" id="mhBtnHe">
                                            <a href="" >
                                                <div class="mhBtnHe_1">
                                                    <span><i class="fa-regular fa-heart"></i></span>
                                                </div>
                                                <span>즐겨찾기</span>
                                            </a>
                                        </div>
                                        <span>|</span>
                                        <div class="mhBtnHe">
                                            <a href="">
                                                <div class="mhBtnHe_1">
                                                    <span><i class="fa-solid fa-location-dot"></i></span>
                                                </div>
                                                <span>위치찾기</span>
                                            </a>
                                        </div>
                                        <span>|</span>
                                        <div class="mhBtnHe">
                                            <a href="" onclick="copyToClipboard(); return false;">
                                                <div class="mhBtnHe_1">
                                                    <span><i class="fa-regular fa-share-from-square"></i></span>
                                                </div>
                                                <span>공유하기</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
    
                    </div>
        
        
    
    
                    <script>
                        // 댓글 관련 JS 코드에 필요한 값을 전역 변수로 선언
                
                        // jsp 파일 : html, css, js, el, jstl 사용 가능
                        // js  파일 : js
                
                        // 코드 해석 순서  :   EL == JSTL > HTML > JS
                
                        // ** JS 코드에서 EL/JSTL을 작성하게 된다면 반드시 ""를 양쪽에 추가 **
                
                        // 최상위 주소
                        const contextPath = "${pageContext.request.contextPath}";
                        
                        // 게시글 번호
                        const volunteerNo = "${mapDetailHome.volunteerNo}"; // "500"
                
                        // 로그인한 회원 번호
                        const loginMemberNo = "${loginMember.memberNo}";
                        // -> 로그인 O  : "10";
                        // -> 로그인 X  : "";  (빈문자열)
                                
                    </script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="${pageContext.request.contextPath}/resources/js/map/map.js"></script>
</body>

</html>