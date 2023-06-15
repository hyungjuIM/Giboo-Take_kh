<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ì¬ë¼ì´ë ì°ìµ</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">

<style>
    *{
        margin: 0;
        padding: 0;
        list-style: none;
    }

    .slider{
        height: 400px;
        position: relative;
    }

    .slider .slides > div{
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-position: center;
        background-size: cover;
        background-repeat:no-repeat;
        opacity:0;
    }

    .slider .slides > div.active{
        opacity: 1;
    }

    .active > img{
        width: 400px;
        height: 400px;
    }

    @media (max-width:400px){
        .slider{
            height: 300px;
        }
    }

    .slideBtn > div{
        position: absolute;
        top: 0;
        left: 0;
        width: 30px;
        height: 30px;
        cursor: pointer;
        z-index: 10;
        background-color: yellowgreen;
    }

    .slideBtn > div:last-child{
        left: auto;
        right: 0;
    }

    .div1{
        background-color: yellowgreen;
        display: flex;
        justify-content: center;
    }

    .div2{
        display: flex;
        background-color: yellow;
        justify-content: flex-end;
        width: 70%;
    }


    .div3{
        background-color: wheat;
        display: flex;
        justify-content: flex-end;
        width: 30%;
    }

</style>

</head>
<body>
    <div class="div1">
        <div class="div2">
            <div class="div5">
                <span>dfakldfa</span>
            </div>
        </div>
        <div class="div3">
            <div class="div4">
                <button>111</button>
            </div>
        </div>
    </div>
    <!-- <div class="slider">
        <div class="slideBtn">
            <div>
                <span>â¤ï¸</span>
            </div>
            <div>
                <span>ð</span>
            </div>
        </div>

        <div class="slides">
            <div class="active">
                <img src="/images/doCenter.jpg" alt="">
            </div>
            <div class="active">
                <img src="/images/profile.jpeg" alt="">
            </div>
            <div class="active">
                <img src="/images/thumnailImg.jpg" alt="">
            </div>
            <div class="active">
                <img src="/images/news_1486098867_610387_m_1.jpg" alt="">
            </div>
        </div>
    </div>

    <div class="slider">
        <div class="slideBtn">
            <div>
                <span>â¤ï¸</span>
            </div>
            <div>
                <span>ð</span>
            </div>
        </div>

        <div class="slides">
            <div class="active">
                <img src="/images/doCenter.jpg" alt="">
            </div>
            <div class="active">
                <img src="/images/profile.jpeg" alt="">
            </div>
            <div class="active">
                <img src="/images/thumnailImg.jpg" alt="">
            </div>
            <div class="active">
                <img src="/images/news_1486098867_610387_m_1.jpg" alt="">
            </div>
        </div>
    </div> -->




    <script>
// ì´ $(document).ready()í¨ìë ë¬¸ì ë¡ëê° ìë£ë í JavaScript ì½ëê° 
// ì¤íëëë¡ íë ë° ì¬ì©ë©ëë¤.
$(document).ready(function() {
    // ë³ì slideIndexë íìëë íì¬ ì¬ë¼ì´ëë¥¼ ì¶ì íê³  $slidesëª¨ë  ì¬ë¼ì´ë ììë¥¼ ì ì¥í©ëë¤.
        var slideIndex = 0;
        var $slides = $('.slider .slides > div');
        var slideCount = $slides.length;

        // Function to show the current slide
        // ì´ showSlide()ê¸°ë¥ì íì¬ ì¬ë¼ì´ëì 
        // "íì±" í´ëì¤ë¥¼ ì¶ê°íì¬ ë¤ë¥¸ ì¬ë¼ì´ëë ì¨ê¸°ê³  íìëëë¡ í©ëë¤
        function showSlide() {
            $slides.removeClass('active');
            $slides.eq(slideIndex).addClass('active');
        }

        // Function to move to the next slide
        // ì´ í¨ìë ë° í¸ì¶ì nextSlide()ì¦ê°ìì¼ ë¤ì ì¬ë¼ì´ëë¥¼ íìí©ëë¤. 
        // ì¸ë±ì¤ê° ì¬ë¼ì´ë ìë¥¼ ì´ê³¼íë©´ ì²« ë²ì§¸ ì¬ë¼ì´ëë¡ ëì´ê°ëë¤.
        // 'slideIndex' 'showSlide()'
        function nextSlide() {
            slideIndex++;
            if (slideIndex >= slideCount) {
                slideIndex = 0;
            }
            showSlide();
        }

        // Function to move to the previous slide
        // ì´ í¨ìë ë° í¸ì¶ì previousSlide()ê°ììì¼ 
        // ì´ì  ì¬ë¼ì´ëë¥¼ íìí©ëë¤. 
        // ì¸ë±ì¤ê° ììê° ëë©´ ë§ì§ë§ ì¬ë¼ì´ëë¡ ëìê°ëë¤.
        function previousSlide() {
            slideIndex--;
            if (slideIndex < 0) {
                slideIndex = slideCount - 1;
            }
            showSlide();
        }

        // Event handler for the next button
        // ì´ë²¤í¸ í¸ë¤ë¬ë í¨ìë¥¼ ì¬ì©íì¬ ë¤ì ë° ì´ì  ë²í¼ì ì¶ê°ë©ëë¤ 
        // .click(). ë²í¼ì í´ë¦­íë©´ í´ë¹ ì¬ë¼ì´ë ê¸°ë¥ì´ í¸ì¶ë©ëë¤.
        $('.slider > .slideBtn > div:last-child').click(function() {
            nextSlide();
        });

        // Event handler for the previous button
        $('.slider > .slideBtn > div:first-child').click(function() {
            previousSlide();
        });
    });
    </script>
</body>
</html>