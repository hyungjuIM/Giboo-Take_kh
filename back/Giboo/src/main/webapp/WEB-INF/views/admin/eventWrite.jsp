<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>eventWrite2</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/eventWrite2.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- 서머노트를 위해 추가해야할 부분 -->
    <script src="/JS/summernote/summernote-lite.js"></script>
    <script src="/JS/summernote/lang/summernote-ko-KR.js"></script>
    <link rel="stylesheet" href="/css/summernote/summernote-lite.css">
</head>

<body>
    <header>
        <jsp:include page="/WEB-INF/views/main/header.jsp" />
    </header>

    <div class="mainTitleArea">
        <div class="mainTitle">이벤트 등록</div>
    </div>

    <section class="mainContainer">
        <div class="mainContent">
            <ul class="writeArea">
                <li>
                    <div class="titleAreaInner">
                        <div class="listTitle">이벤트명</div>
                        <input type="text" id="titleInput" placeholder="제목을 입력해 주세요.">
                    </div>
                </li>

                <li>
                    <div class="titleAreaInner">
                        <div class="listTitle">목표인원 수</div>
                        <input type="text" id="targetInput" placeholder="참여인원을 입력해 주세요.">
                    </div>
                </li>
                <li>
                    <div>
                        <div class="listTitle">이벤트 기간 </div>
                        <input type="date" id="beginDate" data-placeholder="시작일" required aria-required="true">
                        <div class="margin">~</div>
                        <input type="date" id="endDate" data-placeholder="종료일" required aria-required="true">
                    </div>
                </li>

                <li>
                    <div class="titleAreaInner">
                        <div class="listTitle">인증방식</div>
                        <input type="radio" id="photo" value="photo" name="method" checked>
                        <label for="photo">사진</label>

                        <input type="radio" id="review" value="review" name="method">
                        <label for="review">댓글</label>
                    </div>
                </li>

                <li>
                    <div class="contentArea">
                        <div class="listTitle">내용1</div>
                        <form action="#" method="post" class="contentContiner">
                            <textarea class="summernote" name="editordata"></textarea>
                        </form>
                        <script>
                            $('.summernote').summernote({
                                placeholder: '내용을 입력해 주세요',
                                width: 1080,
                                height: 500,
                                minHeight: null,
                                maxHeight: null,             // 최대 높이
                                focus: true,
                                lang: "ko-KR", toolbar: [
                                    ['fontname', ['fontname']],
                                    ['fontsize', ['fontsize']],
                                    ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
                                    ['font', ['bold', 'underline', 'clear']],
                                    ['color', ['forecolor', 'color']],
                                    ['para', ['ul', 'ol', 'paragraph']],
                                    ['height', ['height']],
                                    ['table', ['table']],
                                    ['insert', ['link', 'picture', 'video']],

                                ],
                                fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋움체', '바탕체'],
                                fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36', '50', '72']
                            });
                        </script>
                    </div>
                </li>

                <li class="eventWrite2">
                    <div class="listTitle">내용2</div>
                    <div class="eventCont2">
                        <textarea></textarea>
                    </div>
                </li>



                <li>
                    <div class="imgInputArea">
                        <div class="listTitle">첨부파일</div>
                        <div class="imgInputInner">
                            <input id="imgInput" type="file" accept="image/*">
                            <label for="imgInput" class="imgSelectButton">찾아보기</label>
                            <div id="imgInputPlaceholder"></div>
                        </div>
                    </div>
                </li>
            </ul>

            <div class="optionArea">
                <a href="" class="list">목록으로</a>
                <div>
                    <button type="submit" class="edit">등록</button>
                    <button class="delete">취소</button>
                </div>
            </div>

        </div>
    </section>

    <footer>
        <jsp:include page="/WEB-INF/views/main/footer.jsp" />
    </footer>



    
    <script src="${pageContext.request.contextPath}/resources/js/event/eventWrite2.js"></script>

    <script type="text/javascript">
        jQuery(document).ready(function () {

            $('#summernote').summernote({
                lang: 'ko-KR',              // default: 'en-US'
                height: 300,                 // set editor height
                minHeight: null,             // set minimum height of editor
                maxHeight: null,             // set maximum height of editor
                focus: true,                 // set focus to editable area after initializing summernote
                toolbar: [
                    ['fontname', ['fontname']],
                    ['fontsize', ['fontsize']],
                    ['style', ['bold', 'italic', 'underline', 'clear']],
                    ['color', ['color']],
                    ['para', ['paragraph']],
                    ['insert', ['picture', 'link', 'video']],
                    ['view', ['codeview']]
                ],
                fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', 'Helvetica neue', 'Helvetica', 'Impact', 'Lucida Grande', 'Tahoma', 'Times New Roman', 'Verdana', 'Tahoma', 'Courier New', '맑은 고딕', '굴림', '돋움'],
                fontNamesIgnoreCheck: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', 'Helvetica neue', 'Helvetica', 'Impact', 'Lucida Grande', 'Tahoma', 'Times New Roman', 'Verdana', 'Tahoma', 'Courier New', '맑은 고딕', '굴림', '돋움'],
            });

        });
    </script>


</body>

</html>