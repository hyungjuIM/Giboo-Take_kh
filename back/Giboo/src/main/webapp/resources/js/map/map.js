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


// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        // alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'click', function() {
                infowindow.setContent(title);
                infowindow.open(marker, title);
            });

            kakao.maps.event.addListener(marker, 'click', function() {
                infowindow.setContent(title);
                infowindow.close();
            });

            itemEl.onclick =  function () {
                infowindow.open(marker, title);
            };
            // itemEl.onclick = function () {
            //     infowindow.setContent(title); // 인포윈도우 내용을 장소명으로 설정
            //     infowindow.open(map, marker); // 인포윈도우를 마커 위치에 표시
            // };

            itemEl.onclick =  function () {
                infowindow.close();
            };
            // itemEl.onclick = function () {
            //     infowindow.setContent(title); // 인포윈도우 내용을 장소명으로 설정
            //     infowindow.close(map, marker); // 인포윈도우를 마커 위치에 표시
            // };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = 
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span class="mplaces">' + places.road_address_name + '</span>' ;
                    // '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
         

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        //https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png(원래마커이미지주소)
        imageSize = new kakao.maps.Size(64, 69),  // 마커 이미지의 크기
        imgOptions =  {
            // spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            // spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(27, 69) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage,
            clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var Content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(Content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}

//////////////////////////////////////////////////////////////////////////////////////

// 지도타입 컨트롤의 지도 또는 스카이뷰 버튼을 클릭하면 호출되어 지도타입을 바꾸는 함수입니다
function setMapType(maptype) { 
    var roadmapControl = document.getElementById('btnRoadmap');
    var skyviewControl = document.getElementById('btnSkyview'); 
    if (maptype === 'roadmap') {
        map.setMapTypeId(kakao.maps.MapTypeId.ROADMAP);    
        roadmapControl.className = 'selected_btn';
        skyviewControl.className = 'btn';
    } else {
        map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);    
        skyviewControl.className = 'selected_btn';
        roadmapControl.className = 'btn';
    }
}

// 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
function zoomIn() {
    map.setLevel(map.getLevel() - 1);
}

// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
function zoomOut() {
    map.setLevel(map.getLevel() + 1);
}




//-------------------------------------------------------------------------------
// function mapList() {
//     // contextPath, boardNo, memberNo 전역 변수 사용
//     $.ajax({
//         url: contextPath + "/map/mapList",
//         data: { "mapNo": mapNo },
//         type: "GET",
//         dataType: "JSON", // JSON 형태의 문자열 응답 데이터를 JS 객체로 자동 변환
//         success: function (mapList) {
//             console.log(mapList);

//             mapList.forEach(function (map) {
//                 const li = document.createElement('li');
//                 li.classList.add('mlistLi');

//                 const a = document.createElement('a');
//                 a.href = '';

//                 const img = document.createElement('img');
//                 img.src = "${pageContext.request.contextPath}/resources/images/doCenter.jpg";
//                 img.alt = '';

//                 const divDetail = document.createElement('div');
//                 divDetail.classList.add('mlistDetail');

//                 const divTi = document.createElement('div');
//                 divTi.classList.add('mlistTi');

//                 const divCa = document.createElement('div');
//                 divCa.classList.add('mlistCa');

//                 const spanCategoryName = document.createElement('span');
//                 spanCategoryName.innerText = map.categoryName;

//                 const divHe = document.createElement('div');
//                 divHe.classList.add('mlistHe');

//                 const span14 = document.createElement('span');
//                 span14.innerText = '14';

//                 const spanHeart = document.createElement('span');
//                 spanHeart.innerHTML = '<i class="fa-regular fa-heart"></i>';

//                 const divName = document.createElement('div');
//                 divName.classList.add('mlistName');

//                 const spanVagencyName = document.createElement('span');
//                 spanVagencyName.innerText = map.vagencyName;

//                 const divAdd = document.createElement('div');
//                 divAdd.classList.add('mlistAdd');

//                 const spanVolunteerPlace = document.createElement('span');
//                 spanVolunteerPlace.innerText = map.volunteerPlace;

//                 const divDo = document.createElement('div');
//                 divDo.classList.add('mlistDo');

//                 const spanReview = document.createElement('span');
//                 spanReview.innerText = '봉사자 리뷰';

//                 const spanReviewCount = document.createElement('span');
//                 spanReviewCount.classList.add('mDe');
//                 spanReviewCount.innerText = '135';

//                 const spanSeparator = document.createElement('span');
//                 spanSeparator.innerText = '|';

//                 const spanVolunteerCount = document.createElement('span');
//                 spanVolunteerCount.classList.add('mDe');
//                 spanVolunteerCount.innerText = '432';

//                 divCa.appendChild(spanCategoryName);
//                 divHe.appendChild(span14);
//                 divHe.appendChild(spanHeart);
//                 divTi.appendChild(divCa);
//                 divTi.appendChild(divHe);
//                 divName.appendChild(spanVagencyName);
//                 divAdd.appendChild(spanVolunteerPlace);
//                 divDo.appendChild(spanReview);
//                 divDo.appendChild(spanReviewCount);
//                 divDo.appendChild(spanSeparator);
//                 divDo.appendChild(spanVolunteerCount);
//                 divDetail.appendChild(divTi);
//                 divDetail.appendChild(divName);
//                 divDetail.appendChild(divAdd);
//                 divDetail.appendChild(divDo);
//                 a.appendChild(img);
//                 a.appendChild(divDetail);
//                 li.appendChild(a);

//                 const mbox = document.createElement('div');
//                 mbox.classList.add('mbox');
//                 li.appendChild(mbox);

//                 const ul = document.querySelector('.mlistUl');
//                 ul.appendChild(li);
//             });

//         },
//         error: function (req, status, error) {
//             console.log("에러 발생");
//             console.log(req.responseText);
//         }
//     });
// }