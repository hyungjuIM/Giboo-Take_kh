(function(){
    const deleteBtn = document.getElementById("deleteBtn"); // 존재하지 않으면 null

    if(deleteBtn != null){ // 버튼이 화면에 존재할 때
        deleteBtn.addEventListener("click", function(){
            
            let url = contextPath + "/notice/noticeDelete/" +  noticeNo + "?cp=" + cp;
         
            if( confirm("정말로 삭제 하시겠습니까?") ){
                location.href = url; // get방식으로 url에 요청
            }

        });
    }

})();
(function(){
    const listBack = document.getElementById("listBack");

    if(listBack != null){ // 목록으로 버튼이 화면에 있을 때만 이벤트 추가

        listBack.addEventListener("click", function(){

            const pathname = location.pathname; // 주소상에서 요청 경로 반환

            // 이동할 주소 저장
            let url = pathname.substring(0,  pathname.indexOf("/", 1)); // 
         
            url += "/notice/noticeList/"+"?";  //   /board/list/1?cp=1
            const params = new URL(location.href).searchParams;

            let cp;

            if(params.get("cp") != null){ // 쿼리스트링에 cp가 있을 경우
                cp =  "cp=" + params.get("cp");     
            }else{
                cp = "cp=1";
            }
        
            url += cp;

            // 검색 key, query가 존재하는 경우 url에 추가
            if(params.get("key") != null){
                const key = "&key=" + params.get("key");
                const query = "&query=" + params.get("query");

                url += key + query; // url 뒤에 붙이기
            }

            location.href = url; 

        });
    }

})();