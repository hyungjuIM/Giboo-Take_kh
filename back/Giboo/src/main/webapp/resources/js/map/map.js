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
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});


        
// --------------현재위치 js----------------

 // HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
 if (navigator.geolocation) {
    
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
        
        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
        
        // 마커와 인포윈도우를 표시합니다
        displayMarker(locPosition, message);
            
      });
    
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    
    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
        message = 'geolocation을 사용할수 없어요..'
        
    displayMarker(locPosition, message);
}

// 지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker(locPosition, message) {

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({  
        map: map, 
        position: locPosition
    }); 
    
    var iwContent = message, // 인포윈도우에 표시할 내용
        iwRemoveable = true;

    // 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({
        content : iwContent,
        removable : iwRemoveable
    });
    
    // 인포윈도우를 마커위에 표시합니다 
    infowindow.open(map, marker);
    
    // 지도 중심좌표를 접속위치로 변경합니다
    map.setCenter(locPosition);      
}  


///////////////////////////////////////////////////////////
    // 페이지 로드 시 스크롤 이동
    window.onload = function() {
        var element = document.getElementById("map_wrap");
        if (element) {
            element.scrollIntoView();
        }
    };



	$.get('http://localhost:8081/map/getMarkerData', function(markersData) {
        
    
    
        // Add the markers to the map:
        for (var i = 0; i < markersData.length; i++) {
            var data = markersData[i];
            var markerPosition  = new kakao.maps.LatLng(data.locationX, data.locationY); 
    
            // 마커를 생성합니다
            var marker = new kakao.maps.Marker({
                
                position: markerPosition
            });
    

            marker.setMap(map); // 마커를 지도에 표시합니다
        }
    });
  
 


$('#mapVoRe').click(function(){
    
    $.ajax({
        url: contextPath +"/map/mapVoRe",
        data : {"volunteerNo" : volunteerNo},
        type: "GET",
        dataType: "",
        success: function(data) {
        $("#contentArea").html(data);
        },
        error: function(xhr, status, error) {
        console.log(error);
        }
    });
});

