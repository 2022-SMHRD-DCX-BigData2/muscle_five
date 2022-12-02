    		
	$(document).ready(function(){
		var mCity="";
		var city="";
		$("#add1").change(function(){
			
			mCity = $("#add1 option:selected").val();
			console.log(mCity);
			var cityList = getCity(mCity);
			
			$("select#add2 option").remove();
			
			$("select#add2").append("<option>선택해주세요</option>");
			cityList.forEach(function(city) {
				$("select#add2").append("<option value='"+city+"'>"+ city +"</option>");	
			});
			
		});
		$("#add2").change(function(){
			
			city = $("#add2 option:selected").val();
			console.log(city);
			
			let getAddressData = [];
			
			getAddressData.push({
				'loc_add1' : mCity,
				'loc_add2' : city
			}); // push 끝
			
			console.log(getAddressData);
			var addressList = getAddress(getAddressData);
			var addressTable = "<table border='1'>"
			addressTable += "<tr>";
			addressTable += "<th>측정장소</th>";
			addressTable += "<th>주소</th>";
			addressTable += "<th>전화번호</th>";
			addressTable += "<th>위치</th>";
			addressTable += "</tr>";
			addressList.forEach(function(address) {
					addressTable += "<tr>";
					addressTable +=  "<td>" + address.loc_name + "</td>";
					
					var end = address.loc_address.indexOf('(');
					if (end > 0) {
						var locAddress = address.loc_address.substr(0, end);
					} else {
						locAddress = address.loc_address;
					}
					
					addressTable +=  "<td>" + locAddress + "</td>";
					addressTable +=  "<td>" + address.loc_phone + "</td>";
					addressTable +=  "<td><a href=#>" + "위치"  + "</a></td>";
					addressTable += "</tr>";
			});
			addressTable += "</table>";
			$("div#locationList").html(addressTable);
			
		});
		
	});
				
	function getCity(mCity){
		console.log("getEvents 실행");
		var result;
    	  		// ajax 처리로 데이터를 로딩 시킨다.
    	  		$.ajax({
    		  
    		 		url: "LocationCityListCon",
    		 		type: "get",
    		 		async: false,
    		 		dataType: "json",
    		 		data : {
    					"json" : mCity
    				},
    		 		success: function(res) {
    			 		console.log(res);
    			 		result = res;
			 		},
			 		error : function(){
				 		alert("Ajax 통신 실패");
			 		}
    	  		});
    	  		
    	console.log(result);
    	return result;
    	
     } // getCity 끝
     
     
     function getAddress(getAddressData){
			console.log("getAddress 실행");
		
			var result;
	    	  		// ajax 처리로 데이터를 로딩 시킨다.
	    	  		$.ajax({
	    		  
	    		 		url: "LocationAddressListCon",
	    		 		type: "get",
	    		 		async: false,
	    		 		dataType: "json",
	    		 		data : {
	    		 			"json" : JSON.stringify(getAddressData)
	    				},
	    		 		success: function(res) {
	    			 		console.log(res);
	    			 		result = res;
				 		},
				 		error : function(){
					 		alert("Ajax 통신 실패");
				 		}
	    	  		});
	    	  		
	    	console.log(result);
	    	return result;
	 } // getAddress 끝
