$(document).ready(function(){

    // 마커를 담을 배열입니다
    var markers = [];
    
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = {
            center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };  
    
    // 지도를 생성합니다    
    var map = new kakao.maps.Map(mapContainer, mapOption); 
    
    // 장소 검색 객체를 생성합니다
    // var ps = new kakao.maps.services.Places();  
    
    // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
    // var infowindow = new kakao.maps.InfoWindow({zIndex:1});
    
    
            
    
    
    
        // 페이지 로드 시 스크롤 이동
        window.onload = function() {
            var element = document.getElementById("map_wrap");
            if (element) {
                element.scrollIntoView();
            }
        };
    
    
    
    
    // $(document).ready(function() {
    
        // --------------현재위치 js----------------
    
        // HTML5의 geolocation으로 사용할 수 있는지 확인합니다
    // 주소값을 JSP로 전달하는 AJAX 요청
    function sendAddressToJSP(address) {
        $.ajax({
            url: contextPath + '/map/mapList',
            type: 'GET',
            data: { address: address },
            success: function(response) {
                // 요청이 성공한 경우 처리할 내용
                console.log('주소값이 JSP로 전달되었습니다.~~');
                    // 주소값을 JSP에 표시
                    $(".myAdress").text(address);
            },
            error: function(xhr, status, error) {
                // 요청이 실패한 경우 처리할 내용
                console.error('AJAX 요청이 실패하였습니다.', error);
            }
        });
    }

    function getCPFromURL() {
        var url = window.location.href;
        var params = url.split('?')[1].split('&');
        for (var i = 0; i < params.length; i++) {
            var param = params[i].split('=');
            if (param[0] === 'cp') {
                return param[1];
            }
        }
        return null;
    }
    
    // 사용 예시
    var cp = getCPFromURL();
    console.log('cp 값:', cp);

    
    
    // HTML5의 geolocation으로 사용할 수 있는지 확인합니다
    if (navigator.geolocation) {
        // GeoLocation을 이용해서 접속 위치를 얻어옵니다
        navigator.geolocation.getCurrentPosition(function(position) {
            var lat = position.coords.latitude; // 위도
            var lon = position.coords.longitude; // 경도
    
    // 좌표를 주소로 변환합니다
    var geocoder = new kakao.maps.services.Geocoder();
    geocoder.coord2Address(lon, lat, function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
            var address = result[0].address.address_name; // 현재 주소
            console.log(address); // 주소 출력 또는 원하는 처리 수행
    
            // 주소값을 JSP로 전달
            sendAddressToJSP(address);
    
            var markerPosition = new kakao.maps.LatLng(lat, lon);
            var marker = new kakao.maps.Marker({
                position: markerPosition
            });
            marker.setMap(map);
    
            // 지도의 중심을 마커의 위치로 설정합니다
            map.setCenter(markerPosition);
    
            // 팝업 내용을 HTML로 작성합니다
            var popupContent = `
                <div class="popup">
                    <div class="popup-inner">
                        <div class="popup-content">
                            <h3>현재 위치</h3>
                            <p>${address}</p>
                        </div>
                    </div>
                </div>
            `;
    
            // 팝업 오버레이를 생성합니다
            var overlay = new kakao.maps.CustomOverlay({
                content: popupContent,
                position: markerPosition,
                yAnchor: 1.5 // 팝업이 마커 위에 정확히 표시되도록 y 좌표 조정
            });
    
            // 팝업을 지도에 표시합니다
            overlay.setMap(map);
        }  
    });

        }, function(error) {
            console.log('위치 정보를 가져오는데 실패했습니다:', error);
        });
    } else {
        console.log('geolocation을 사용할 수 없어요..');
    }
    





        // 하.. 겁나 삽질...
        // if (navigator.geolocation) {
        //     navigator.geolocation.getCurrentPosition(function(position) {
        //       var lat = position.coords.latitude; // 위도
        //       var lon = position.coords.longitude; // 경도
        //       var geocoder1 = new kakao.maps.services.Geocoder();
        //       geocoder1.coord2Address(lon, lat, function(result, status) {
        //         if (status === kakao.maps.services.Status.OK) {
        //           var currentAddress = result[0].address.address_name; // 현재 주소
          
                  
        //         // $.ajax({
        //         //     url: contextPath +'/map/getName2', // 위에서 정의한 엔드포인트 URL
        //         //     type: 'GET',
        //         //     data: { "volunteerNo": volunteerNo},
        //         //     dataType: 'JSON',
        //         //     success: function(name2) {
        //         //     name2 = name2; // name2 값을 서버 응답 데이터에서 가져옴
        //         //     console.log("name2:", name2);
                
        //         //     // 주소값을 JSP로 전달
        //         //     getAddressFromServer(currentAddress, name2);

        //         //     },
        //         //     error: function(req, status, error) {
        //         //     console.error('AJAX 요청이 실패하였습니다.', error);
        //         //     console.log(req.responseText);
        
        //         //     }
        //         // });  
        //         var name2 = $(".hagencyName").data("hagencyName");
        //         console.log("name2:", name2);
        //         getAddressFromServer(currentAddress, name2);

        //         }
                
        //       });
              
        //     });
        // }


                
        //   // 주소값을 JSP로 전달하는 함수
        // // 주소값을 JSP로 전달 하는 함수
        // function getAddressFromServer(currentAddress, name2) {
            
        //     $.ajax({
        //         url: contextPath + '/map/getAddressFromServer',
        //         type: 'GET',
        //         data: { currentAddress: currentAddress, name2: name2 },
        //         dataType: "JSON",
        //         success: function(responseData) {
          
        //           var mapLink = "https://map.kakao.com/?sName=" + encodeURIComponent(responseData.currentAddress) + "&eName=" + encodeURIComponent(responseData.name2);
        //           $("#addressInput").attr("href", mapLink);
        //           console.log("gk.........", responseData.currentAddress);
        //         },
        //         error: function(xhr, status, error) {
        //           console.error('AJAX 요청이 실패하였습니다.', error);
        //         }
        //     });
        // }


          
          
          

          
          
          
          
          


    
    
    
    
    // url 복사
    function copyToClipboard() {
        var urlToCopy = window.location.href; // 복사할 URL
      
        // Clipboard API를 지원하는지 확인
        if (navigator.clipboard && window.isSecureContext) {
          navigator.clipboard.writeText(urlToCopy)
            .then(function() {
              console.log('URL이 성공적으로 복사되었습니다.');
              alert("URL이 복사되었습니다.")
              // 복사 성공한 경우 추가로 처리할 작업을 여기에 작성하세요.
            })
            .catch(function(error) {
              console.error('URL 복사에 실패했습니다.', error);
              // 복사 실패한 경우 추가로 처리할 작업을 여기에 작성하세요.
            });
        } else {
          // Clipboard API를 지원하지 않는 경우 대체 방법을 사용할 수 있습니다.
          console.warn('Clipboard API가 지원되지 않습니다. 다른 방법을 사용하세요.');
      
          // 대체 방법으로 클립보드에 복사할 수 있도록 구현하세요.
        }
    }
    
    

    
    //------------------
    
    
    
const mhBtnHea = document.getElementById("mhBtnHea");

mhBtnHea.addEventListener("click", function(event) {
    // 1) 로그인이 되어있나? -> 전역변수 loginMemberNo 이용
    if (loginMemberNo == "") { // 로그인 X
        alert("로그인 후 이용해주세요.");
        event.preventDefault();
    } else {
        $.ajax({
            url: contextPath + "/map/insertFav",
            data: {
                "memberNo": loginMemberNo,
                "volunteerNo": volunteerNo
            },
            type: "post",
            success: function(result) {
                if (result === "red") { // 색상 변경 성공
                    alert("즐겨찾기에 등록되었습니다.");
                    // mhBtnHe.classList.add("loggedIn"); // 버튼에 클래스 추가 (예: "loggedIn")
                    mhBtnHea.style.backgroundColor = "red"; // 색상 변경
                    console.log("즐찾성공");
                } else { // 실패
                    alert("이미 추가한 즐겨찾기 입니다.");
                }
            },
            error: function(req, status, error) {
                console.log("즐겨찾기 등록 실패");
                console.log(req.responseText);
            }
        });
        
        event.preventDefault(); // 이벤트 전파 중지
    }
});




// document.cookie = 'cookieName=cookieValue; SameSite=None; Secure';
// document.addEventListener("DOMContentLoaded", function() {
//     var name2 = $(".hagencyName").data("hagencyName");
//     console.log("name2:", name2);
//   });

})

