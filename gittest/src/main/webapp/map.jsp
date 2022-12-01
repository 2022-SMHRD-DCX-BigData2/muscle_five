<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지도</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6f52ffd0c746ee592129221513282961&libraries=services"></script>
</head>
<body>
	<!-- 지도를 표시할 div 입니다 -->
    <div id="map" style="width:850px; height:450px; margin:0 auto;"></div>
    
    <script>
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div
            mapOption = {
                center: new kakao.maps.LatLng(34.946029, 127.515990), // 지도의 중심좌표
                level: 7 // 지도의 확대 레벨
            };
        
        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

        // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
        var mapTypeControl = new kakao.maps.MapTypeControl();

        // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
        // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
        map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

        // 지도 확대 축소를 제어할 수 있는 줌 컨트롤을 생성합니다
        var zoomControl = new kakao.maps.ZoomControl();
        map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
        
     	
        
        // 주소-좌표 변환 객체를 생성합니다
        var geocoder = new kakao.maps.services.Geocoder();
    
        var positions = [
        // 보건소, 건강생활지원센터
        // 전남
        {
            title: '순천시 보건소', 
            address: '전남 순천시 중앙로 232',
            category: '전남'
        },
        {
            title: '광양시 보건소', 
            address: '전남 광양시 인덕로 1100',
            category: '전남'
        },
        {
            title: '여수시 보건소', 
            address: '전라남도 여수시 시청서4길 47',
            category: '전남'
        },
        {
            title: '목포시 보건소', 
            address: '전라남도 목포시 원산로45번길 5',
            category: '전남'
        },
        {
            title: '나주시 보건소', 
            address: '전라남도 나주시 풍물시장2길 57-32',
            category: '전남'
        },
        {
            title: '담양군 보건소', 
            address: '전라남도 담양군 담양읍 완동길 10-11',
            category: '전남'
        },
        {
            title: '고흥군 보건소', 
            address: '전라남도 고흥군 고흥읍 등암3길 5',
            category: '전남'
        },
        {
            title: '보성군 보건소', 
            address: '전라남도 보성군 보성읍 송재로 153',
            category: '전남'
        },
        {
            title: '화순군 보건소',
            address: '전라남도 화순군 화순읍 쌍충로 62',
            category: '전남'
        },
        {
            title: '장흥군 보건소', 
            address: '전라남도 장흥군 장흥읍 흥성로 49',
            category: '전남'
        },
        {
            title: '강진군 보건소', 
            address: '전라남도 강진군 강진읍 목리길 11',
            category: '전남'
        },
        {
            title: '해남군 보건소', 
            address: '전라남도 해남군 해남읍 해남로 46',
            category: '전남'
        },
        {
            title: '영암군 보건소', 
            address: '전라남도 영암군 영암읍 오리정길 39',
            category: '전남'
        },
        {
            title: '무안군 보건소', 
            address: '전라남도 무안군 무안읍 무안로 530',
            category: '전남'
        },
        {
            title: '함평군 보건소', 
            address: '전라남도 함평군 함평읍 중앙길 54-8',
            category: '전남'
        },
        {
            title: '영광군 보건소', address: '전라남도 영광군 영광읍 신남로4길 17'
        },
        {
            title: '장성군 보건소', address: '전라남도 장성군 장성읍 청운11길 13'
        },
        {
            title: '완도군 보건소', address: '전라남도 완도군 완도읍 농공단지길 34'
        },
        {
            title: '진도군 보건소', address: '전라남도 진도군 남동1길 40-9'
        },
        {
            title: '신안군 보건소', address: '전라남도 신안군 압해읍 천사로 1004'
        },
        {
            title: '신안군보건소', address: '전라남도 신안군 압해읍 천사로 1004'
        },
        {
            title: '순천시건강생활지원센터', address: '전라남도 순천시 팔마3길 14-7'
        },
        {
            title: '신대건강생활지원센터', address: '전라남도 순천시 해룡면 신대리 1980-1'
        },
        {
            title: '빛가람건강생활지원센터', address: '전라남도 나주시 빛가람로 721'
        },
        {
            title: '완도군건강생활지원센터', address: '전라남도 완도군 완도읍 청해진동로 70'
        },
        {
            title: '남악건강생활지원센터', address: '전라남도 무안군 삼향읍 남악3로 40'
        },
        {
            title: '광영건강생활지원센터', address: '전라남도 광양시 금영로 127'
        },
        // 전북
        {
            title: '전주시보건소', address: '전라북도 전주시 완산구 전라감영로 33'
        },
        {
            title: '군산시보건소', address: '전라북도 군산시 수송동로 58'
        },
        {
            title: '익산시보건소', address: '전라북도 익산시 무왕로 975'
        },
        {
            title: '정읍시보건소', address: '전라북도 정읍시 수성1로 61'
        },
        {
            title: '군산시보건소', address: '전라북도 군산시 수송동로 58'
        },
        {
            title: '남원시보건소', address: '전라북도 남원시 요천로 1285'
        },
        {
            title: '김제시보건소', address: '전라북도 김제시 성산길 138'
        },
        {
            title: '완주군보건소', address: '전라북도 완주군 삼례읍 삼봉로 215-20'
        },
        {
            title: '진안군보건소', address: '전라북도 진안군 진안읍 진무로 1189'
        },
        {
            title: '고창군보건소', address: '전라북도 고창군 고창읍 전봉준로 90'
        },
        {
            title: '부안군보건소', address: '전라북도 부안군 부안읍 오리정로 124'
        },
        {
            title: '동부건강생활지원센터', address: '전라북도 익산시 금마면 고도길 26-6'
        },
        {
            title: '100세건강생활지원센터', address: '전라북도 익산시 목천로 326'
        },
        {
            title: '서부건강생활지원센터', address: '전라북도 군산시 설림5길 83'
        },
        {
            title: '장계면건강생활지원센터', address: '전라북도 장수군 장계면 한들로 124'
        },
        // 광주
        {
            title: '광주광역시 서구 보건소', address: '광주광역시 서구 경영로 33'
        },
        {
            title: '광주광역시 북구 보건소', address: '광주광역시 북구 우치로 65'
        },
        {
            title: '광주광역시 남구 보건소', address: '광주광역시 남구 봉선로 1 남구청'
        },
        {
            title: '광주광역시 동구보건소', address: '광주광역시 동구 서남로 1'
        },
        {
            title: '광산구 보건소', address: '광주광역시 광산구 광산로29번길 15'
        },
        {
            title: '서구건강생활지원센터', address: '광주광역시 서구 운천로172번길 32'
        },
        {
            title: '광산구수완건강생활지원센터', address: '광주광역시 광산구 장덕로 158'
        },
        {
            title: '북구건강생활지원센터', address: '광주광역시 북구 군왕로141번길 6'
        },
        {
            title: '주월건강생활지원센터', address: '광주광역시 남구 군분로13번길 10'
        },
        {
            title: '우산건강생활지원센터', address: '광주광역시 광산구 사암로 167'
        },
        {
            title: '월산건강생활지원센터', address: '광주광역시 남구 중앙로 12'
        },
        {
            title: '쌍촌건강생활지원센터', address: '광주광역시 서구 쌍학로 47'
        },
        {
            title: '지원건강생활지원센터', address: '광주광역시 동구 지원로 31-9'
        },
        // 경남
        {
            title: '창원보건소', address: '경상남도 창원시 의창구 중앙대로 162번길 9'
        },
        {
            title: '마산보건소', address: '경상남도 창원시 마산합포구 월영동북로 15'
        },
        {
            title: '진해보건소', address: '경상남도 창원시 진해구 진해대로 1101'
        },
        {
            title: '진주시보건소', address: '경상남도 진주시 월아산로 2026'
        },
        {
            title: '통영시보건소', address: '경상남도 통영시 안개4길 108'
        },
        {
            title: '사천시보건소', address: '경상남도 사천시 용현면 시청로77'
        },
        {
            title: '김해시보건소', address: '경상남도 김해시 분성로 227'
        },
        {
            title: '밀양시보건소', ddress: '경상남도 밀양시 삼문중앙로 41'
        },
        {
            title: '거제시보건소', address: '경상남도 거제시 수양로 506'
        },
        {
            title: '양산시보건소', address: '경상남도 양산시 삽량로 169'
        },
        {
            title: '의령군보건소', address: '경상남도 의령군 의령읍 의병로8길 16'
        },
        {
            title: '함안군보건소', address: '경상남도 함안군 가야읍 중앙남4길 10'
        },
        {
            title: '창녕군보건소', address: '경상남도 창녕군 창녕읍 우포2로 1189-35'
        },
        {
            title: '고성군보건소', address: '경상남도 고성군 고성읍 남포로 79번길103-3'
        },
        {
            title: '남해군보건소', address: '경상남도 남해군 남해읍 선소로 6'
        },
        {
            title: '하동군보건소', address: '경상남도 하동군 하동읍 군청로 31'
        },
        {
            title: '함양군보건소', address: '경상남도 함양군 함양읍 한들로 141'
        },
        {
            title: '거창군보건소', address: '경상남도 거창군 거창읍 거함대로 3079'
        },
        {
            title: '합천군보건소', address: '경상남도 합천군 합천읍 동서로 39'
        },
        {
            title: '김해건강생활지원센터', address: '경상남도 김해시 주촌면 주선로 29-1'
        },
        {
            title: '함안군건강생활지원센터', address: '경상남도 함안군 칠원읍 용산1길 54-5'
        },
        {
            title: '양산동부건강생활지원센터', address: '경상남도 양산시 덕계회야길 68'
        },
        {
            title: '동부건강생활지원센터', address: '경상남도 창원시 진해구 용원로41번길 8'
        },
        {
            title: '김해시 동부건강생활지원센터', address: '경상남도 김해시 분성로727번길 8-35'
        },
        {
            title: '삼천포건강생활지원센터', address: '경상남도 사천시 동금로 33'
        },
        // 경북
        {
            title: '포항시남구보건소', address: '경상북도 포항시 남구 동해안로 6119'
        },
        {
            title: '포항시북구보건소', address: '경상북도 포항시 북구 삼흥로 98'
        },
        {
            title: '경주시보건소', address: '경상북도 경주시 양정로 300'
        },
        {
            title: '김천시보건소', address: '경상북도 김천시 시청1길 221'
        },
        {
            title: '안동시보건소', address: '경상북도 안동시 서동문로 165'
        },
        {
            title: '구미시보건소', address: '경상북도 구미시 선산대로 111'
        },
        {
            title: '영주시보건소', address: '경상북도 영주시 시청로 1번길 19'
        },
        {
            title: '영천시보건소', address: '경상북도 영천시 옛군청1길 31'
        },
        {
            title: '상주시보건소', address: '경상북도 상주시 중앙로 111'
        },
        {
            title: '문경시보건소', address: '경상북도 문경시 점촌1길 9'
        },
        {
            title: '경산시보건소', address: '경상북도 경산시 남매로 158'
        },
        {
            title: '군위군보건소', address: '경상북도 군위군 군위읍 군청로 70'
        },
        {
            title: '의성군보건소', address: '경상북도 의성군 의성읍 구봉길 228'
        },
        {
            title: '영양군보건소', address: '경상북도 문경시 점촌1길 9'
        },
        {
            title: '영덕군보건소', address: '경상북도 영덕군 영덕읍 군청길 53'
        },
        {
            title: '청도군보건소', address: '경상북도 청도군 화양읍 청화로 79-11'
        },
        {
            title: '고령군보건소', address: '경상북도 고령군 대가야읍 왕릉로 56-5'
        },
        {
            title: '문경시보건소', address: '경상북도 문경시 점촌1길 9'
        },
        {
            title: '성주군보건소', address: '경상북도 성주군 성주읍 성밖숲길 12'
        },
        {
            title: '칠곡군보건소', address: '경상북도 칠곡군 왜관읍 관문로 1길 30'
        },
        {
            title: '예천군시보건소', address: '경상북도 예천군 예천읍 군청길 33'
        },
        {
            title: '봉화군보건소', address: '경상북도 봉화군 봉화읍 봉화로 1203'
        },
        {
            title: '울진군보건소', address: '경상북도 울진군 울진읍 읍내8길 61-8'
        },
        {
            title: '구미건강생활지원센터', address: '경상북도 구미시 박정희로 45-7'
        },
        {
            title: '봉산면건강생활지원센터', address: '경상북도 김천시 봉산면 예지송정길 9'
        },
        // 제주
        {
            title: '제주보건소', address: '제주특별자치도 제주시 연삼로 264'
        },
        {
            title: '제주시동부보건소', address: '제주특별자치도 제주시 구좌읍 김녕로14길 6'
        },
        {
            title: '제주시서부보건소', address: '제주특별자치도 제주시 한림읍 강구로 5'
        },
        {
            title: '서귀포시서귀포보건소', address: '제주특별자치도 서귀포시 중앙로101번길 52'
        },
        {
            title: '서귀포시동부보건소', address: '제주특별자치도 서귀포시 남원읍 태위로 527'
        },
        {
            title: '서귀포시서부보건소', address: '제주특별자치도 서귀포시 대정읍 최남단해안로 15길 12'
        },
        {
            title: '노형건강생활지원센터', address: '제주특별자치도 제주시 정원로 16'
        },
        {
            title: '화북건강생활지원센터', address: '제주특별자치도 제주시 동화로1길 45-22'
        },
        // 대전
        {
            title: '동구보건소', address: '대전광역시 동구 동구청로 147'
        },
        {
            title: '중구보건소', address: '대광역시 중구 산성로 63'
        },
        {
            title: '서구보건소', address: '대전광역시 서구 만년로 74'
        },
        {
            title: '유성구보건소', address: '대전광역시 유성구 박산로177'
        },
        {
            title: '대덕구보건소', address: '대전광역시 대덕구 석봉동 38번길 55'
        },
        {
            title: '대덕구남부건강생활지원센터', address: '대전광역시 대덕구 동춘당로 187'
        },
        // 울산
        {
            title: '중구보건소', address: '울산광역시 중구 외솔큰길 225'
        },
        {
            title: '남구보건소', address: '울산광역시 남구 산산중로 132'
        },
        {
            title: '동구보건소', address: '울산광역시 동구 봉수로 155'
        },
        {
            title: '북구보건소', address: '울산광역시 북구 산업로 1080'
        },
        {
            title: '울주군보건소', address: '울산광역시 울주군 삼남면 서향교1길 67-12'
        },
        {
            title: '무거건강생활지원센터', address: '울산광역시 남구 대학로147번길 41-26'
        },
        // 부산
        {
            title: '중구보건소', address: '부산광역시 중구 중구로 120'
        },
        {
            title: '서구보건소', address: '부산광역시 서구 부용로 30'
        },
        {
            title: '동구보건소', address: '부산광역시 동구 구청로 1'
        },
        {
            title: '영도구보건소', address: '부산광역시 영도구 태종로 423'
        },
        {
            title: '부산진구보건소', address: '부산광역시 부산진구 황령대로8번길 36'
        },
        {
            title: '동래구보건소', address: '부산광역시 동래구 명륜로187번길 56'
        },
        {
            title: '남구보건소', address: '부산광역시 남구 못골로 23'
        },
        {
            title: '북구보건소', address: '부산광역시 북구 금곡대로 348'
        },
        {
            title: '해운대구보건소', address: '부산광역시 해운대구 양운로37번길 59'
        },
        {
            title: '사하구보건소', address: '부산광역시 사하구 하신중앙로185'
        },
        {
            title: '금정구보건소', address: '부산광역시 금정구 중앙대로 1777'
        },
        {
            title: '강서구보건소', address: '부산광역시 강서구 공항로 811번길 10'
        },
        {
            title: '연제구보건소', address: '부산광역시 연제구 연제로 2'
        },
        {
            title: '수영구보건소', address: '부산광역시 수영구 수영로 637-5'
        },
        {
            title: '사상구보건소', address: '부산광역시 사상구 학감대로 242'
        },
        {
            title: '기장군보건소', address: '부산광역시 기장군 기장읍 기장대로 560'
        },
        {
            title: '다대건강생활지원센터', address: '부산광역시 사하구 다대로530번길 7'
        },
        {
            title: '당감건강생활지원센터', address: '부산광역시 부산진구 백양순환로 40'
        },
        {
            title: '금정구건강생활지원센터', address: '부산광역시 금정구 서동로175번길 41-5'
        },
        {
            title: '동래구건강생활지원센터', address: '부산광역시 동래구 명장로 32'
        },
        {
            title: '장전2동건강생활지원센터', address: '부산광역시 금정구 금정로 29-6'
        },
        {
            title: '행복동구건강생활지원센터', address: '부산광역시 동구 범일동 1545-4'
        },
        {
            title: '개금2동건강생활지원센터', address: '부산광역시 부산진구 복지로 93'
        },
        // 충남
        {
            title: '동남구 보건소', address: '충청남도 천안시 동남구 버들로 34'
        },
        {
            title: '서북구 보건소', address: '충청남도 천안시 서북구 번영로 156'
        },
        {
            title: '아산시 보건소', address: '충청남도 아산시 번영로224번길 20'
        },
        {
            title: '당진시 보건소', address: '충청남도 당진시 서부로 56'
        },
        {
            title: '서산시 보건소', address: '충청남도 서산시 호수공원6로 6'
        },
        {
            title: '공주시 보건소', address: '충청남도 공주시 봉황로 123'
        },
        {
            title: '홍성군 보건소', address: '충청남도 홍성군 홍성읍 문화로 106'
        },
        {
            title: '논산시 보건소', address: '충청남도 논산시 논산대로 382'
        },
        {
            title: '보령시 보건소', address: '충청남도 보령시 남포면 보령남로 234'
        },
        {
            title: '예산군 보건소', address: '충청남도 예산군 예산읍 예산리 777'
        },
        {
            title: '부여군 보건소', address: '충청남도 부여군 부여읍 성왕로 205'
        },
        {
            title: '금산군 보건소', address: '충청남도 금산군 금산읍 금산로 1559'
        },
        {
            title: '서천군 보건소', address: '충청남도 서천군 서천읍 사곡길 26'
        },
        {
            title: '계룡시 보건소', address: '충청남도 계룡시 장안로 54'
        },
        {
            title: '배방 건강생활지원센터', address: '충청남도 아산시 배방읍 용연동길 50'
        },
        {
            title: '송악 건강생활지원센터', address: '충청남도 당진시 송악읍 신복운로 99'
        },
        {
            title: '안면읍 건강생활지원센터', address: '충청남도 태안군 안면읍 승언리 1027'
        },
        {
            title: '논산시 건강생활지원센터', address: '충청남도 논산시 해월로125번길 26'
        },
        {
            title: '청수 건강생활지원센터', address: '충청남도 천안시 동남구 청수6로 106-3'
        },
        {
            title: '성정 건강생활지원센터', address: '충청남도 천안시 서북구 서부8길 29'
        },
        {
            title: '금산군 건강생활지원센터', address: '충청남도 금산군 금산읍 건삼전3길 14'
        },
        {
            title: '홍성군 건강생활지원센터', address: '충남 홍성군 홍북읍 신경리 1197'
        },
        // 충북
        {
            title: '서원 보건소', address: '충청북도 청주시 서원구 사직대로 227'
        },
        {
            title: '흥덕 보건소', address: '충청북도 청주시 상당구 대성로172번길 21'
        },
        {
            title: '상당 보건소', address: '충청북도 청주시 상당구 남일면 단재로 480'
        },
        {
            title: '청원 보건소', address: '충청북도 청주시 청원구 오창읍 과학산업3로 238'
        },
        {
            title: '충주시 보건소', address: '충청북도 충주시 사직산21길 34 충주시건강복지타운'
        },
        {
            title: '진천군 보건소', address: '충청북도 진천군 진천읍 중앙북1길 11-8'
        },
        {
            title: '음성군 보건소', address: '충청북도 음성군 음성읍 중앙로 49'
        },
        {
            title: '제천시 보건소', address: '충청북도 제천시 의림대로 242'
        },
        {
            title: '단양군 보건소', address: '충청북도 단양군 단양읍 삼봉로 53'
        },
        {
            title: '옥천군 보건소', address: '충청북도 옥천군 옥천읍 삼양로8길 10'
        },
        {
            title: '영동군 보건소', address: '충청북도 영동군 영동읍 반곡동길 7'
        },
        {
            title: '증평군 보건소', address: '충청북도 증평군 증평읍 보건복지로 64-1'
        },
        {
            title: '보은군 보건소', address: '충청북도 보은군 보은읍 동광길 50'
        },
        {
            title: '괴산군 보건소', address: '충청북도 괴산군 괴산읍 동진천길 43'
        },
        // 대구
        {
            title: '대구광역시 북구보건소', address: '대구광역시 북구 성북로 49'
        },
        {
            title: '수성구 보건소', address: '대구광역시 수성구 수성로 213'
        },
        {
            title: '달서구 보건소', address: '대구광역시 달서구 학산로 45'
        },
        {
            title: '대구광역시 중구보건소', address: '대구광역시 중구 태평로 45'
        },
        {
            title: '대구광역시 남구보건소', address: '대구광역시 남구 영선길 34'
        },
        {
            title: '달성군 보건소', address: '대구광역시 달성군 현풍읍 현풍중앙로 27'
        },
        {
            title: '대구광역시 서구보건소', address: '대구광역시 서구 국채보상로 257'
        },
        {
            title: '구암 건강생활지원센터', address: '대구광역시 북구 구암서로 30'
        },
        {
            title: '고산 건강생활지원센터', address: '대구광역시 수성구 욱수천로 99'
        },
        {
            title: '서구 건강생활지원센터', address: '대구광역시 서구 서대구로7길 46'
        },
        // 세종
        {
            title: '세종특별자치시 보건소', address: '세종특별자치시 조치원읍 대첩로 32'
        },
        // 
        {
            title: '고운건강생활지원센터', address: '세종특별자치시 마음로 64'
        },
        // 인천
        {
            title: '미추홀구 보건소', address: '인천광역시 미추홀구 주안서로 25'
        },
        {
            title: '인천광역시 서구보건소', address: '인천광역시 서구 탁옥로 39'
        },
        {
            title: '연수구보건소', address: '인천광역시 연수구 함박뫼로 13'
        },
        {
            title: '부평구보건소', address: '인천광역시 부평구 부흥로 291'
        },
        {
            title: '남동구보건소', address: '인천광역시 남동구 소래로 633'
        },
        {
            title: '인천광역시 중구보건소', address: '인천광역시 중구 참외전로72번길21'
        },
        {
            title: '인천광역시 동구보건소', address: '인천광역시 동구 석수로 90'
        },
        {
            title: '계양구보건소', address: '인천광역시 계양구 계양문화로 63'
        },
        {
            title: '옹진군보건소', address: '인천광역시 미추홀구 매소홀로 120'
        },
        {
            title: '강화군보건소', address: '인천광역시 강화군 강화읍 충렬사로 26-1'
        },
        {
            title: '완정건강생활지원센터', address: '인천광역시 서구 청마로167번길 19'
        },
        {
            title: '석남건강생활지원센터', address: '인천광역시 서구 길주로 79'
        },
        {
            title: '송도건강생활지원센터', address: '인천광역시 연수구 인천타워대로54번길 19'
        },
        {
            title: '가좌건강생활지원센터', address: '인천광역시 서구 건지로284번길 60'
        },
        {
            title: '검단건강생활지원센터', address: '인천광역시 서구 완정로 214'
        },
        {
            title: '열우물건강생활지원센터', address: '인천광역시 부평구 열우물로 103'
        },
        // 강원
        {
            title: '원주시보건소', address: '강원도 원주시 원일로 139'
        },
        {
            title: '강릉시보건소', address: '강원도 강릉시 남부로17번길 38'
        },
        {
            title: '춘천시보건소', address: '강원도 춘천시 중앙로 135'
        },
        {
            title: '속초시보건소', address: '강원도 속초시 수복로 36'
        },
        {
            title: '삼척시보건소', address: '강원도 삼척시 척주로 76'
        },
        {
            title: '고성군보건소', address: '강원도 고성군 간성읍 수성로 30'
        },
        {
            title: '동해시보건소', address: '강원도 동해시 천곡로 100-2'
        },
        {
            title: '홍천군보건소', address: '강원도 홍천군 홍천읍 신장대로 5'
        },
        {
            title: '철원군보건소', address: '강원도 철원군 갈말읍 군탄로 16'
        },
        {
            title: '태백시보건소', address: '강원도 태백시 태백로 905'
        },
        {
            title: '정선군보건소', address: '강원 정선군 정선읍 녹송로 33'
        },
        {
            title: '횡성군보건소', address: '강원도 횡성군 횡성읍 횡성로 379'
        },
        {
            title: '영월군보건소', address: '강원도 영월군 영월읍 하송로 44'
        },
        {
            title: '양양군보건소', address: '강원도 양양군 양양읍 양양로 9-5'
        },
        {
            title: '인제군보건소', address: '강원도 인제군 인제읍 인제로140번길 34'
        },
        {
            title: '양구군보건소', address: '강원도 양구군 양구읍 관공서로 42'
        },
        {
            title: '남부건강생활지원센터', address: '강원도 강릉시 성덕포남로 80-22'
        },
        {
            title: '춘천시 건강생활지원센터', address: '강원도 춘천시 우두하리길 21'
        },
        {
            title: '북삼건강생활지원센터', address: '강원도 동해시 청운로 96'
        },
        {
            title: '서원주 건강생활지원센터', address: '강원도 원주시 지정면 가곡로 75-2'
        },
        {
            title: '남원주 건강생활지원센터', address: '강원도 원주시 단관공원길 86'
        },
        {
            title: '평창군 건강생활지원센터', address: '강원도 평창군 진부면 석두산2길 13'
        },
        {
            title: '고성군 건강생활지원센터', address: '강원도 고성군 거진읍 행랑골길 24-1'
        },
        {
            title: '북방면 건강생활지원센터', address: '강원도 홍천군 북방면 상화계2길 17'
        },
        {
            title: '서면 건강생활지원센터', address: '강원도 철원군 서면 무금로48번길 15'
        },
        {
            title: '태백시 건강생활지원센터', address: '강원도 태백시 장성동 159-1'
        },
        {
            title: '홍천보건소 건강생활지원센터', address: '강원도 홍천군 홍천읍 신장대로 5'
        },
        // 경기
        {
            title: '광주시보건소', address: '경기도 광주시 파발로 194'
        },
        {
            title: '화성시보건소', address: '경기도 화성시 향남읍 3.1만세로 1055'
        },
        {
            title: '부천시보건소', address: '경기도 부천시 옥산로10번길 16'
        },
        {
            title: '팔달구보건소', address: '경기도 수원시 팔달구 팔달산로 6'
        },
        {
            title: '수정구보건소', address: '경기도 성남시 수정구 수정로 218'
        },
        {
            title: '단원보건소', address: '경기도 안산시 단원구 화랑로 250'
        },
        {
            title: '김포시보건소', address: '경기도 김포시 사우중로 108'
        },
        {
            title: '영통구보건소', address: '경기도 수원시 영통구 영통로 396'
        },
        {
            title: '이천시보건소', address: '경기도 이천시 증신로153번길 13'
        },
        {
            title: '고양시 덕양구보건소', address: '경기도 고양시 덕양구 원당로33번길 28'
        },
        {
            title: '시흥시보건소', address: '경기도 시흥시 호현로 55'
        },
        {
            title: '파주시보건소', address: '경기도 파주시 후곡로 13'
        },
        {
            title: '화성시동탄보건소', address: '경기도 화성시 노작로 226-9'
        },
        {
            title: '일산서구보건소', address: '경기도 고양시 일산서구 일중로 54'
        },
        {
            title: '상록수보건소', address: '경기도 안산시 상록구 차돌배기로1길 5'
        },
        {
            title: '의정부보건소', address: '경기도 의정부시 범골로 131'
        },
        {
            title: '분당구보건소', address: '경기도 성남시 분당구 양현로 306'
        },
        {
            title: '평택보건소', address: '경기도 평택시 평택5로 56'
        },
        {
            title: '기흥구보건소', address: '경기도 용인시 기흥구 신갈로58번길 11'
        },
        {
            title: '장안구보건소', address: '경기도 수원시 장안구 송원로 101'
        },
        {
            title: '일산동구보건소', address: '경기도 고양시 일산동구 중앙로 1228'
        },
        {
            title: '남양주시보건소', address: '경기도 남양주시 경준로 522'
        },
        {
            title: '광명시보건소', address: '경기도 광명시 오리로 613'
        },
        {
            title: '권선구보건소', address: '경기도 수원시 권선구 호매실로 22-50'
        },
        {
            title: '오산시보건소', address: '경기도 오산시 경기동로 59'
        },
        {
            title: '화성시동부보건소', address: '경기도 화성시 떡전골로 72-3'
        },
        {
            title: '군포시보건소', address: '경기도 군포시 군포로 221'
        },
        {
            title: '소사보건소', address: '경기도 부천시 경인옛로 73'
        },
        {
            title: '중원구보건소', address: '경기도 성남시 중원구 금상로 137'
        },
        {
            title: '수지구보건소', address: '경기도 용인시 수지구 포은대로 435'
        },
        {
            title: '안양시 만안구보건소', address: '경기도 안양시 만안구 문예로 48'
        },
        {
            title: '송탄보건소', address: '경기도 평택시 서정로 295'
        },
        {
            title: '안성시보건소', address: '경기도 안성시 강변로74번길 18'
        },
        {
            title: '동안구보건소', address: '경기도 안양시 동안구 평촌대로253번길 41'
        },
        {
            title: '처인구보건소', address: '경기도 용인시 처인구 중부대로 1199'
        },
        {
            title: '오정보건소', address: '경기도 부천시 성오로 172'
        },
        {
            title: '의왕시보건소', address: '경기도 의왕시 오봉로 34'
        },
        {
            title: '포천시보건소', address: '경기도 포천시 포천로 1612'
        },
        {
            title: '구리보건소', address: '경기도 구리시 건원대로34번길 84'
        },
        {
            title: '양주시보건소', address: '경기도 양주시 부흥로 1533'
        },
        {
            title: '남양주풍양보건소', address: '경기도 남양주시 진접읍 해밀예당1로 30-39'
        },
        {
            title: '하남시보건소', address: '경기도 하남시 대청로 10'
        },
        {
            title: '여주시보건소', address: '경기도 여주시 여흥로160번길 14'
        },
        {
            title: '양평군보건소', address: '경기도 양평군 양평읍 마유산로 17'
        },
        {
            title: '동두천시보건소', address: '경기도 동두천시 중앙로 167'
        },
        {
            title: '과천보건소', address: '경기도 과천시 관문로 69'
        },
        {
            title: '가평군보건소', address: '경기도 가평군 가평읍 가화로 155-18'
        },
        {
            title: '별내건강생활지원센터', address: '경기도 남양주시 별내3로 64-21'
        },
        {
            title: '공도건강생활지원센터', address: '경기도 안성시 공도읍 공도로 51-11'
        },
        {
            title: '오포건강생활지원센터', address: '경기도 광주시 오포로 884-1'
        },
        {
            title: '안산서부건강생활지원센터', address: '경기도 안산시 단원구 신길중앙로 15'
        },
        {
            title: '중부건강생활지원센터', address: '경기도 시흥시 목감우회로 23'
        },
        {
            title: '고양건강생활지원센터', address: '경기도 고양시 덕양구 혜음로 19-11'
        },
        {
            title: '진건퇴계원건강생활지원센터', address: '경기도 남양주시 진건읍 사릉로 406-1'
        },
        {
            title: '반월건강생활지원센터', address: '경기도 안산시 상록구 건건로 119-4'
        },
        {
            title: '와부조안건강생활지원센터', address: '경기도 남양주시 와부읍 월문천로 35'
        },
        {
            title: '마장건강생활지원센터', address: '경기도 이천시 마장면 중앙로 81'
        },
        {
            title: '와부건강생활지원센터', address: '경기도 남양주시 와부읍 덕소로71번길 5'
        },
        {
            title: '양주시건강생활지원센터', address: '경기도 양주시 화합로1426번길 90'
        },
        {
            title: '호평평내건강생활지원센터', address: '경기도 남양주시 호평로68번길 21'
        },
        {
            title: '오남건강생활지원센터', address: '경기도 남양주시 오남읍 진건오남로 806-34'
        },
        {
            title: '다산건강생활지원센터', address: '경기도 남양주시 다산중앙로 7 다산행정복지센터 2층'
        },
        {
            title: '양주시서부 건강생활지원센터', address: '경기도 양주시 광적면 부흥로618번길 303 2층'
        },
        {
            title: '화도건강생활지원센터', address: '경기도 남양주시 화도읍 비룡로 59'
        },
        {
            title: '광명시100세건강생활지원센터', address: '경기도 광명시 오리로 1018 3층'
        },
        {
            title: '양평건강생활지원 건강관리동부센터', address: '경기도 양평군 용문면 용문로 393'
        },
        {
            title: '남양주보건소 와부조안건강생활지원센터', address: '경기 남양주시 와부읍 월문천로 35'
        },
        {
            title: '안중보건지소 포승건강생활지원센터', address: '경기 평택시 포승읍 여술로 47'
        },
        {
            title: '안산서부건강생활지원센터', address: '경기 안산시 단원구 신길중앙로 15 1층'
        },
        // 서울
        {
            title: '구로구보건소', address: '서울 구로구 구로중앙로28길 66'
        },
        {
            title: '강서구보건소', address: '서울 강서구 공항대로 561'
        },
        {
            title: '성북구보건소', address: '서울 성북구 화랑로 63'
        },
        {
            title: '강남구보건소', address: '서울 강남구 선릉로 668'
        },
        {
            title: '중구보건소', address: '서울 중구 다산로39길 16'
        },
        {
            title: '종로구보건소', address: '서울 종로구 자하문로19길 36'
        },
        {
            title: '성동구보건소', address: '서울 성동구 마장로23길 10'
        },
        {
            title: '도봉구보건소', address: '서울 도봉구 방학로3길 117'
        },
        {
            title: '동작구보건소', address: '서울 동작구 장승배기로10길 42'
        },
        {
            title: '강북구보건소', address: '서울 강북구 한천로 897'
        },
        {
            title: '송파구보건소', address: '서울 송파구 올림픽로 326 송파구청 내'
        },
        {
            title: '마포구보건소', address: '서울 마포구 월드컵로 212'
        },
        {
            title: '동대문구보건소', address: '서울 동대문구 천호대로 145'
        },
        {
            title: '서초구보건소', address: '서울 서초구 남부순환로 2584'
        },
        {
            title: '강동구보건소', address: '서울 강동구 성내로 45'
        },
        {
            title: '서대문구보건소', address: '서울 서대문구 연희로 242'
        },
        {
            title: '양천구보건소', address: '서울 양천구 목동서로 339'
        },
        {
            title: '용산구보건소', address: '서울 용산구 녹사평대로 150'
        },
        {
            title: '광진구보건소', address: '서울 광진구 자양로 117'
        },
        {
            title: '노원구보건소', address: '서울 노원구 노해로 437'
        },
        {
            title: '관악구보건소', address: '서울 관악구 관악로 145'
        },
        {
            title: '중랑구보건소', address: '서울 중랑구 봉화산로 179'
        },
        {
            title: '영등포구보건소', address: '서울 영등포구 당산로 123'
        },
        {
            title: '은평구보건소', address: '서울 은평구 은평로 195'
        },
        {
            title: '금천구보건소', address: '서울 금천구 시흥대로73길 70'
        },
        
      ];
    
        // 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
        var bounds = new kakao.maps.LatLngBounds(); //추가한 코드
    
        positions.forEach(function (position) {
        // 주소로 좌표를 검색합니다
        geocoder.addressSearch(position.address, function(result, status) {
    
        // 정상적으로 검색이 완료됐으면
        if (status === kakao.maps.services.Status.OK) {
    
            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
    
            // 결과값으로 받은 위치를 마커로 표시합니다
            var marker = new kakao.maps.Marker({
                map: map, // 마커를 표시할 지도
                position: coords
            });
            marker.setMap(map); //추가한 코드
    
            // LatLngBounds 객체에 좌표를 추가합니다
            bounds.extend(coords); //추가한 코드, 현재 코드에서 좌표정보는 point[i]가 아닌 coords이다.
    
            // 인포윈도우로 장소에 대한 설명을 표시합니다
            var infowindow = new kakao.maps.InfoWindow({
                content: '<div style="width:150px;text-align:center;padding:5px 0;">' + position.title + '</div>'
            });

            // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                infowindow.open(map, marker);
            });

            // 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            // 마커에 click 이벤트를 등록하고 클릭 시 인포윈도우를 닫습니다
            kakao.maps.event.addListener(marker,'click', function() {
                // 중심 위치를 클릭된 마커의 위치로 변경
                map.setCenter(this.getPosition());
                // 마커 클릭 시의 인포윈도우 닫기
                infowindow.close(marker);
            });

        // 아래와 같이 할 수 있습니다.
        // if (marker) {
        //         marker.addListener('click', function() {
        //             //중심 위치를 클릭된 마커의 위치로 변경
        //             map.setCenter(this.getPosition());
        //             //마커 클릭 시의 줌 변화
        //             // map.setZoom(14);
        //              map.panTo(moveLatLon);
        //         });
        //     }

            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
            // map.setCenter(coords); // 제거한 코드
            setBounds(); // 추가한 코드
          }
        });
      });
        function setBounds() { // 추가한 함수
        // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
        // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
    }
        
        
       	
        
    </script>
</body>
</html>