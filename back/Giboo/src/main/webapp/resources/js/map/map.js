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
            console.log('주소값이 JSP로 전달되었습니다.');
                // 주소값을 JSP에 표시
                $(".myAdress").text(address);

        },
        error: function(xhr, status, error) {
            // 요청이 실패한 경우 처리할 내용
            console.error('AJAX 요청이 실패하였습니다.', error);
        }
    });
}




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
                        <h3>🙋‍♀️현재 위치</h3>
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






////////////////////////////////////////////////////////
    // 주소와 이름을 가져옵니다
    var addresses = [];
    var names = [];
    var categorys = [];
    var volreviews = [];
    var volcounts = [];
    var vimgs = [];
    var volunteernos = [];
    var currentpages = [];


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

    $(".vUrl").each(function() {
        var volunteerno = $(this).data("volunteerno");
        volunteernos.push(volunteerno);
    });

    $(".vUrl").each(function() {
        var currentpage = $(this).data("currentpage");
        currentpages.push(currentpage);
    });

    console.log(addresses);


    // 지도와 지오코더 인스턴스를 생성합니다
    // var mapContainer = document.getElementById('map');
    // var mapOption = {
    //     center: new kakao.maps.LatLng(33.25110701, 126.570667),
    //     level: 3
    // };
    // var map = new kakao.maps.Map(mapContainer, mapOption);
    
    var geocoder = new kakao.maps.services.Geocoder();

    var clusterer = new kakao.maps.MarkerClusterer({
        map: map, // 클러스터러가 표시될 지도 객체
        averageCenter: true, // 클러스터의 중심 좌표를 평균값으로 설정
        minLevel: 5 // 클러스터가 생성되는 최소 지도 레벨
    });

    // 주소를 반복하며 마커를 생성합니다
    for (var i = 0; i < addresses.length; i++) {
        (function( volunteerno,currentpage, vimg, address, name, category, volreview, volcount) {
            // 주소를 지오코드하여 좌표를 얻습니다
            geocoder.addressSearch(address, function(result, status) {
                if (status === kakao.maps.services.Status.OK) {
                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                    // 주소별로 마커를 생성합니다
                    var marker = new kakao.maps.Marker({
                        map: map,
                        position: coords,
                    });

                            // 클러스터러에 마커를 추가합니다
                    clusterer.addMarker(marker);

                    var infowindow = new kakao.maps.InfoWindow({
                    content: 
                    // '    <div class="mpopWrap">'+
                    // '        <div class="mpopBox">'+
                    '            <div class="mpopup">'+
                    '                   <a href="../map/mapHome/' + volunteerno + '?cp=' + currentpage + '">' +
                    '                    <div class="mpopImg">'+
                    '                        <img src="' + vimg  + '" alt="">'+
                    '                    </div>'+
                    '                    <div class="mpopContent">'+
                    '                        <div class="mpopTi">'+
                    '                                <div class="mpopTitle">'+
                    '                                    <span>' + name + '</span>'+
                    '                                </div>'+
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
                    // map.setCenter(coords);


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
        })( volunteernos[i],currentpages[i], vimgs[i],  addresses[i], names[i], categorys[i], volreviews[i], volcounts[i]);
    }

});




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

// document.cookie = 'cookieName=cookieValue; SameSite=None; Secure';

