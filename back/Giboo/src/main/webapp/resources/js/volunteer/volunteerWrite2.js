const imgInput = document.getElementById("imgInput");
const imgInputPlaceholder = document.getElementById("imgInputPlaceholder");

imgInput.addEventListener("change", () => {
    imgInputPlaceholder.style.opacity = "0";
});

$('.summernote').summernote({
    placeholder : '내용을 입력해 주세요',
    width:1080,
    height: 500,
    minHeight:null,
    maxHeight: null,             // 최대 높이
    focus: true,
    lang: "ko-KR", toolbar: [
        ['fontname', ['fontname']],
        ['fontsize', ['fontsize']],
        ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
        ['font', ['bold', 'underline', 'clear']],
        ['color', ['forecolor','color']],
        ['para', ['ul', 'ol', 'paragraph']],
        ['height', ['height']],
        ['table', ['table']],
        ['insert', ['link', 'picture', 'video']],

    ],
    fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
    fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
});