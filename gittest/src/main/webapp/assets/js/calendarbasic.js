		 
 		document.addEventListener('DOMContentLoaded', function() {
	    	var calendarEl = document.getElementById('calendar');
	    	// new FullCalendar.Calendar(대상 DOM객체, {속성:속성값, 속성2:속성값2..})
			
	    	var calendar = new FullCalendar.Calendar(calendarEl, {
	      		
	      		initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
	      		headerToolbar: {
	        		left: 'prev,next today', // 왼쪽 : 뒤로, 앞으로, 오늘 표시
	        		center: 'title',		// 중간 : 날짜 표시
	        		right: 'dayGridMonth,timeGridWeek,timeGridDay' // 오른쪽 : 월,주,일
	      		},
	      		titleFormat : function(date) {
					return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
	      		},
	      		// initialDate: '2021-04-12', // 초기 로딩 날짜.
	      		navLinks: true, // can click day/week names to navigate views
	      		selectable: true, // 일정추가 가능
	      		selectMirror: true, 
	      		nowIndicator: true, // 현재 시간 마크
	      		locale: 'ko', // 한국어 설정
	      		editable: true, // 일정 편집 기능
	      		dayMaxEvents: true, // allow "more" link when too many events
	   	  
	      		// 이벤트명 : function(){} : 각 날짜에 대한 이벤트를 통해 처리할 내용..
	  			// 달력을 선택 했을때
	      		select: function(arg) {
	    	  
	    			var title = prompt('입력할 일정:'); 
	    			
	    			// title 값이 있을때, 화면에 calendar.addEvent() json형식으로 일정을 추가
	        		if (title) {
	            		calendar.addEvent({
	            			title: title,
	            			start: arg.start,
	            			end: arg.end,
	            			allDay: arg.allDay,
	          			})
	        		
	        		}
	        		calendar.unselect()
	      		},
	     		// 일정 있는 곳을 클릭했을 때
	      		eventClick: function(arg) {
	        		if (confirm("일정을 삭제 하시겠습니까?")) {
	          			arg.event.remove();
	        		}
	      		},
	      		events: [ ]
	   	    });
	    	calendar.render();
	  	});