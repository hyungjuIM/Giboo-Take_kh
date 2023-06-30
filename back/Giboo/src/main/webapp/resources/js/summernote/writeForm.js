$(document).ready(function () {
    $('#summernote').summernote({
        toolbar: [
            //글씨 사이즈, 폰트 선택
            ['fontsize', ['fontsize', 'fontname']],
            //정렬 
            ['para', ['ul', 'ol', 'paragraph']],
            //글씨체 굵게, 기울임, 밑줄, 지우기, 색상
            ['style', ['bold', 'italic', 'underline', 'clear', 'color']],
            //글씨 취소선, 위에, 아래
            ['font', ['strikethrough', 'superscript', 'subscript']],
            // 되돌리기, 되살리기
            ['undo', ['undo', 'redo']],
            // 이미지
            ['picture', ['picture']],
            // 테이블, 코드 뷰
            ['table', ['table', 'codeview']],
            //줄 높이 
            ['height', ['height']]],



        height: 400, // 에디터 높이 


        minHeight: null, // 최소 높이 
        maxHeight: null, // 최대 높이 
        lang: "ko-KR", //한글 설정 
        placeholder: '본문을 작성해주세요', //placeholder 설정 
        disableResizeEditor: true,
        focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부





        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋움체', '바탕체'],
        fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36', '50', '72'],
        callbacks: {
            onImageUpload: function (files) {

                // 파일 업로드(다중업로드를 위해 반복문 사용)
                for (var i = files.length - 1; i >= 0; i--) {
                    uploadImageFile(files[i], this);
                }
            }
        }
    });


    const jsonArray = [];
    function uploadImageFile(file, editor) {
        var data = new FormData();
        data.append("file", file);
        $.ajax({
            url: 'uploadSNoticeImageFile',
            type: "POST",
            enctype: 'multipart/form-data',
            data: data,
            cache: false,
            contentType: false,
            processData: false,
            success: function (data) {
              console.log(data);
                let json = JSON.parse(data);
                $(editor).summernote('editor.insertImage', json["url"]);
                jsonArray.push(json["url"]);
                jsonFn(jsonArray);

                console.log("성공 후 반환 메시지11", data);

            },
            error: function (e) {
                console.log(e);
            }
        });
    }

    function jsonFn(jsonArray) {
        console.log(jsonArray);
    }

});


