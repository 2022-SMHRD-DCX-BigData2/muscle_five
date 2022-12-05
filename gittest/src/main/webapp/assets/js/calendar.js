		 
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
						
						// console.log("새로운이벤트 id : " + createEventId());
	            		
	            		// 달력에 보여줄 이벤트 생성
	            		var eventView = calendar.addEvent({
							
							id: createEventId(),
	            			title: title,
	            			start: arg.start,
	            			end: arg.end,
	            			allDay: arg.allDay,
	            			backgroundColor: "",	// 일정 텍스트박스 배경색(없으면 기본색)
	            			textColor: "",			// 일정 텍스트박스 글자색(없으면 기본색)
	            			borderColor: ""			// 일정 텍스트박스 라인색(없으면 기본색)
	          			})
	        			
	          			// 저장할 데이터 변수
	          			var saveData = [];
	          			saveData.push({
							'id': eventView.id,
	        	 			'title': title,
	        	 			'start': arg.start,
	             			'end': arg.end,
	             			'startStr': arg.startStr,
	             			'endStr': arg.endStr,
	             			'allDay': arg.allDay,
	             			'backgroundColor': eventView.backgroundColor,
	             			'textColor': eventView.textColor,
	             			'borderColor': eventView.borderColor
	             			  
						}); // push 끝       
						
						// 데이터 저장 함수
	          			save(saveData);
	        		}
	        		calendar.unselect()
	      		},
	      		
	     		// 일정 있는 곳을 클릭했을 때
	      		eventClick: function(arg) {
	      			
	    			console.log("#등록된 일정 클릭#");
	    	
	        		if (confirm("일정을 삭제 하시겠습니까?")) {
	          			arg.event.remove();
	          			// console.log(arg.event.id);
	          			del(arg.event.id);
	        		}
	      		},
	   
	      		// 일정을 변경 했을 때
	      		eventResize: function(arg) {
	      			
	    	 		if (confirm("일정을 수정 하시겠습니까?")) {
	    	 			console.log(arg);
	    	 			// 수정데이터 변수
	    	 			var updateData = [];
	            		updateData.push({
	            			'id': arg.event.id,
	          	 			'start': arg.event.start,
	                		'end': arg.event.end,
	                		'startStr': arg.event.startStr,
	            			'endStr': arg.event.endStr
	  					}); // push 끝
	  					
	  					// 데이터 업데이트 함수
	  					update(updateData);
	    	 		} else {
	    	 			arg.revert();
	    	 		}
	    	 	
	      		},
	      		
	      		// 일정을 이동 했을 때
	      		eventDrop: function(arg) {

	      		    if (confirm("일정을 이동 하시겠습니까?")) {
	      		   		// 수정데이터 변수
	    	 			var updateData = [];
	            		updateData.push({
	            			'id': arg.event.id,
	          	 			'start': arg.event.start,
	                		'end': arg.event.end,
	                		'startStr': arg.event.startStr,
	            			'endStr': arg.event.endStr
	  					}); // push 끝
	  					
	  					// 데이터 업데이트 함수
	  					update(updateData);

	      		    } else {
	      		    	arg.revert();
	      		    }
	      		},
	      		
	      		// 캘린더에 뿌려줄 데이터 함수로 가져오기
	      		events: getEvents()
	      		
	    	});
	    	
	    	calendar.render();

	  	});
	  
	  	// 저장할 일정을 보냄
		function save(saveData){
			$.ajax({
		
				// 데이터를 servlet으로 보낸다면 URL Mapping값을
				url : "CalendarInsertCon",
				async: false, 
				type : "get",
				data : {
					"json" : JSON.stringify(saveData)
				},
				success : function(res){
					console.log("saveData 저장");
					
				},
				error : function(){
					alert("Ajax 통신 실패");
				}
			}); // ajax 끝
			
			// 데이터 다시 불러오기
			getEvents();
					
		} // save()함수 끝!!
		
		// 수정할 일정을 보냄
		function update(updateData){
			$.ajax({
				
				// 데이터를 servlet으로 보낸다면 URL Mapping값을
				url : "CalendarUpdateCon",
				type : "get",
				data : {
					"json" : JSON.stringify(updateData)
				},
				success : function(res){
					console.log("update()")
					
				},
				error : function(){
					alert("Ajax 통신 실패");
					
				}
			}); // ajax 끝
			
		} // update()함수 끝!!
		
		// 삭제할 일정을 보냄
		function del(delData){
			$.ajax({
				
				// 데이터를 servlet으로 보낸다면 URL Mapping값을
				url : "CalendarDeleteCon",
				type : "get",
				data : {
					"json" : delData
				},
				success : function(res){
					console.log("del()")
					
				},
				error : function(){
					alert("Ajax 통신 실패");
					
				}
			}); // ajax 끝
			
		} // delete()함수 끝!!
		
		// 새로운 일정 아이디 생성
		function createEventId(){
			var result;
			$.ajax({
		  
		 		url: "CalendarLastIdCon",
		 		type: "get",
		 		async: false, 
		 		dataType: "json",
		 		success: function(res) {
			 		console.log("createEventId()");
			 		if (res == null) {
						result = 1;
					} else {
						result = parseInt(res) + 1;
					}
			 			 		
		 		},
		 		error : function(){
			 		alert("Ajax 통신 실패");
		 		}
	  		});
	  		return result;
	  		
		} // createEventId 함수 끝!!
		
		// DB로 부터 일정 데이터를 받아오기
		function getEvents(){
			console.log("getEvents 실행");
			var result;
	  		// ajax 처리로 데이터를 로딩 시킨다.
	  		$.ajax({
		  
		 		url: "CalendarViewCon",
		 		type: "get",
		 		async: false, 
		 		dataType: "json",
		 		success: function(res) {
					
					console.log("getEvent()");			 					 		
			 		result = res;
		 		},
		 		error : function(){
			 		alert("Ajax 통신 실패");
		 		}
	  		});
	    	
	    	return result;
	    	
	     } // getEvents 끝