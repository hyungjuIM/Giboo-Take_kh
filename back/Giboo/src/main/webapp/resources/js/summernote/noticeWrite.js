

  $(document).ready(function() {
    $('#summernote').summernote({
        // 에디터 높이
        height: 450,
        // 에디터 한글 설정
        lang: "ko-KR",
        // 에디터에 커서 이동 (input창의 autofocus라고 생각하시면 됩니다.)
        focus : true,
        toolbar: [
              // 글꼴 설정
              ['fontname', ['fontname']],
              // 글자 크기 설정
              ['fontsize', ['fontsize']],
              // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
              ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
              // 글자색
              ['color', ['forecolor','color']],
              // 표만들기
              ['table', ['table']],
              // 글머리 기호, 번호매기기, 문단정렬
              ['para', ['ul', 'ol', 'paragraph']],
              // 줄간격
              ['height', ['height']],
              // 그림첨부, 링크만들기, 동영상첨부
              ['insert',['picture','link','video']],
              // 코드보기, 확대해서보기, 도움말
              ['view', ['codeview','fullscreen', 'help']]
            ],
           
            // 추가한 글꼴
          fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
           // 추가한 폰트사이즈
          fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
          
      });
	var toolbar = [
        
		    // 글꼴 설정
		    ['fontname', ['fontname']],
		    // 글자 크기 설정
		    ['fontsize', ['fontsize']],
		    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		    // 글자색
		    ['color', ['forecolor','color']],
		    // 표만들기
		    ['table', ['table']],
		    // 글머리 기호, 번호매기기, 문단정렬
		    ['para', ['ul', 'ol', 'paragraph']],
		    // 줄간격
		    ['height', ['height']],
		    // 그림첨부, 링크만들기, 동영상첨부
		    ['insert',['picture','link','video']],
		    // 코드보기, 확대해서보기, 도움말
		    ['view', ['codeview','fullscreen', 'help']]
		  ];

	var setting = {
            height : 450,
            minHeight : null,
            maxHeight : null,
            focus : true,
            lang : 'ko-KR',
            toolbar : toolbar,
            callbacks : { //여기 부분이 이미지를 첨부하는 부분
            onImageUpload : function(files, editor,
            welEditable) {
            for (var i = files.length - 1; i >= 0; i--) {
            uploadSummernoteImageFile(files[i],
            this);
            		}
            	}
            }
         };

        $('#summernote').summernote(setting);
        });
        const jsonArray = [];
        function uploadSummernoteImageFile(file, el) {
          data = new FormData();
          data.append("file", file);
          $.ajax({
            
            url : "uploadSNoticeImageFile",
            type: "POST",
            enctype: 'multipart/form-data',
            data: data,
            cache: false,
            contentType: false,
            processData: false,
            success: function (data) {
              console.log("성공이여")
                var json = JSON.parse(data);
                $(el).summernote('editor.insertImage', json["url"]);
                jsonArray.push(json["url"]);
                jsonFn(jsonArray);
            },
            error: function (e) {
                console.log(e);
            }
        });
    }

    function jsonFn(jsonArray) {
        console.log(jsonArray);
    }




// $(document).ready(function () {
//     $('#summernote').summernote({
//         toolbar: [
//             //글씨 사이즈, 폰트 선택
//             ['fontsize', ['fontsize', 'fontname']],
//             //정렬 
//             ['para', ['ul', 'ol', 'paragraph']],
//             //글씨체 굵게, 기울임, 밑줄, 지우기, 색상
//             ['style', ['bold', 'italic', 'underline', 'clear', 'color']],
//             //글씨 취소선, 위에, 아래
//             ['font', ['strikethrough', 'superscript', 'subscript']],
//             // 되돌리기, 되살리기
//             ['undo', ['undo', 'redo']],
//             // 이미지
//             ['picture', ['picture']],
//             // 테이블, 코드 뷰
//             ['table', ['table', 'codeview']],
//             //줄 높이 
//             ['height', ['height']]],
//         height: 450, // 에디터 높이 
//         minHeight: null, // 최소 높이 
//         maxHeight: null, // 최대 높이 
//         lang: "ko-KR", //한글 설정 
//         placeholder: '본문을 작성해주세요', //placeholder 설정 
//         disableResizeEditor: true,
//         focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부

//         fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋움체', '바탕체'],
//         fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36', '50', '72'],
//         callbacks: {
//             onImageUpload: function (files, editor, welEditable) {

//                 // 파일 업로드(다중업로드를 위해 반복문 사용)
//                 for (var i = files.length - 1; i >= 0; i--) {
//                     uploadImageFile(files[i], this);
//                 }
//             }
//         }
//     });
//     // const jsonArray = [];

//     // function uploadImageFile(file, el) {
//     //     var data = new FormData();
//     //     data.append("file", file);
//     //     $.ajax({
//     //         url: 'uploadSNoticeImageFile',
//     //         type: "POST",
//     //         enctype: 'multipart/form-data',
//     //         data: data,
//     //         cache: false,
//     //         contentType: false,
//     //         processData: false,
//     //         success: function (data) {
//     //             var json = JSON.parse(data);
//     //             $(el).summernote('editor.insertImage', json["url"]);
//     //             jsonArray.push(json["url"]);
//     //             jsonFn(jsonArray);
//     //         },
//     //         error: function (e) {
//     //             console.log(e);
//     //         }
//     //     });
//     // }

//     // function jsonFn(jsonArray) {
//     //     console.log(jsonArray);
//     // }

// });