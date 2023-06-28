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




$(document).ready(function() {

    // --------------현재위치 js----------------

 // HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
 if (navigator.geolocation) {
    
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
        
        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            message = '<div style="padding:5px;">찾았다</div>'; // 인포윈도우에 표시될 내용입니다
        
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
    // map.setCenter(locPosition);      
}  


////////////////////////////////////////////////////////
    // 주소와 이름을 가져옵니다
    var addresses = [];
    var names = [];
    var categorys = [];
    var volreviews = [];
    var volcounts = [];
    var vimgs = [];


    // HTML에서 주소와 이름을 가져옵니다
    $(".mlistAdd span").each(function() {
        var address = $(this).data("address");
        addresses.push(address);
    });

    $(".mlistName span").each(function() {
        var name = $(this).data("volname");
        names.push(name);
    });

    $(".mlistCa span").each(function() {
        var category = $(this).data("category");
        categorys.push(category);
    });

    $(".mDe").each(function() {
        var volreview = $(this).data("volreview");
        // replyCount가 0이면 0으로 설정합니다
        volreview = volreview !== null ? volreview : 0;
        volreviews.push(volreview);
    });

    $(".mDee").each(function() {
        var volcount = $(this).data("volcount");
        volcount = volcount !== null ? volcount : 0;
        volcounts.push(volcount);
    });

    $(".vimg").each(function() {
        var vimg = $(this).data("vimg");
        vimg = vimg !== null ? vimg : 0;
        vimgs.push(vimg);
    });


    // 지도와 지오코더 인스턴스를 생성합니다
    // var mapContainer = document.getElementById('map');
    // var mapOption = {
    //     center: new kakao.maps.LatLng(33.25110701, 126.570667),
    //     level: 3
    // };
    // var map = new kakao.maps.Map(mapContainer, mapOption);
    var geocoder = new kakao.maps.services.Geocoder();

    // 주소를 반복하며 마커를 생성합니다
    for (var i = 0; i < addresses.length; i++) {
        (function(vimg, address, name, category, volreview, volcount) {
            // 주소를 지오코드하여 좌표를 얻습니다
            geocoder.addressSearch(address, function(result, status) {
                if (status === kakao.maps.services.Status.OK) {
                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                    // 주소별로 마커를 생성합니다
                    var marker = new kakao.maps.Marker({
                        map: map,
                        position: coords,
                    });

                                        // // 팝업 클릭 이벤트 리스너를 추가합니다
                                        // kakao.maps.event.addListener(infowindow, 'click', function() {

                                        //     var volunteerNo = ${mapList.volunteerNo}
                                        //     // 팝업을 클릭했을 때 수행할 동작을 정의합니다
                                        //     // 특정 경로로 이동하는 예시 코드입니다
                                        //     var url = "../map/mapHome/" + mapList.volunteerNo + "?cp=" + pagination.currentPage + sURL;
                                        //     window.location.href = url;
                                        // });

                    // 이름을 내용으로 하는 인포윈도우를 생성합니다
                    // var infowindow = new kakao.maps.InfoWindow({
                    //     content: '<div style="width:150px;text-align:center;padding:3px 0;">' + name + '</div>'
                    // });
                    var infowindow = new kakao.maps.InfoWindow({
                    content: 
                    // '    <div class="mpopWrap">'+
                    // '        <div class="mpopBox">'+
                    '            <div class="mpopup">'+
                    '                <a href="">'+
                    '                    <div class="mpopImg">'+
                    '                        <img src="' + vimg  + '" alt="">'+
                    '                    </div>'+
                    '                    <div class="mpopContent">'+
                    '                        <div class="mpopTi">'+
                    '                                <div class="mpopTitle">'+
                    '                                    <span>' + name + '</span>'+
                    '            </div>'+
                    '        <div class="mpopCa">'+
                    '            <span>' + category + '</span>'+
                    '        </div>'+
                    '    </div>'+
                    '    <div class="mpopAd">'+
                    '        <span>' + address + '</span>'+
                    '    </div>'+
                    '    <div class="mpopFoot">'+
                    '        <div class="mpopBtn">'+
                    '        </div>'+
                    '        <div class="mpopV">'+
                    '            <div class="mpopVr">'+
                    '                <span>봉사자 리뷰</span>'+
                    '                <span>' + volreview + '</span>'+
                    '            </div>'+
                    '            <span>|</span>'+
                    '            <div class="mpopVn">'+
                    '                <span>봉사자</span>'+
                    '                <span>' + volcount + '</span>'+
                    '            </div>'+
                    '        </div>'+
                    '    </div>'+
                    '                    </div>'+
                    '                </a>'+
                    '            </div>'
                    // '        </div>'+
                    // '   </div>'
                
                    });
                    infowindow.open(map, marker);

                    // 지도의 중심을 마커의 위치로 설정합니다
                    map.setCenter(coords);

                    // 마커에 클릭 이벤트 리스너를 추가합니다
                    kakao.maps.event.addListener(marker, 'click', function() {

                        if (infowindow.getMap()) {
                            // 이미 열려있는 경우 팝업 닫기
                            infowindow.close();
                        } else {
                            // 팝업 열기
                            infowindow.open(map, marker);
                        }
                    });
                    // 처음에는 팝업이 닫혀있도록 설정
                    infowindow.close();
                }
            });
        })(vimgs[i], addresses[i], names[i], categorys[i], volreviews[i], volcounts[i]);
    }
});

})
