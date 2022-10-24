<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/sbo/main/vendors/styles/style.css" />
<link rel="stylesheet" href="/css/modal.css" >
<link rel="stylesheet" type="text/css" href="/sbo/css/market.css" />
<link rel="stylesheet" type="text/css" href="/sbo/css/jquery.mCustomScrollbar.min.css">
<script src="/sbo/js/jquery-ui.min.js"></script>
<script src="/sbo/js/jquery.mCustomScrollbar.concat.min.js"></script>

<script src="/sbo/js/script.js"></script>

<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.0/dist/chart.min.js"></script>

<meta charset="UTF-8">
<title></title>		
<style>
.cell{
	width:10px;
	height: 10px;
	background-color: #ffff00;
	border-radius: 20px;
	color:#000;
	text-align: center;
	font-weight: bold;
	line-height: 61px;
	font-size:10px;
}
#map_box {
    position: relative;
    width: 100%;
    height: 100%;
    margin-bottom: 10px;
}

#map_box #position_box {
    position: absolute;
    bottom: 10px;
    right: 10px;
    z-index: 2;
}
#map_box #position_box button {
    border-radius: 50px;
    border: 1px solid #999999;
    background: #fff;
    padding: 5px 10px;
    font-size: 1.0rem;
}
 
#my-spinner { width: 100%; height: 100%; top: 0; left: 0; display: none; opacity: .6; background: silver; position: absolute; z-index: 2; }
#my-spinner div { width: 100%; height: 100%; display: table; }
#my-spinner span { display: table-cell; text-align: center; vertical-align: middle; }
#my-spinner img { background: transparent; padding: 1em; border-radius: .7em; }


.title {font-weight:bold;display:block;}
.hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:2;padding:5px;}
#centerAddr {display:block;margin-top:2px;font-weight: normal;}
.bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
.analysis{display: none;}
.info-title{
	display: block;
	background: #50627F;
	color: #fff;
	text-align: center;
	height: 24px;
	line-height: 22px;
	border-radius: 4px;
	padding: 0px 10px;
}
</style>

<script type="text/javascript">


	function tabmove(reportName, areaName, event) {
		if(!!event) {
			event.preventDefault();
		}
		var report = $('.rightReport.' + reportName);
		var areaPos = report.find('.tabcnt_common2.tabcnt_' + areaName).position().top;
		areaPos = Number.isInteger(areaPos) ? areaPos : parseInt(areaPos);
		report.find('.scroll_y').mCustomScrollbar('scrollTo', areaPos);
		
		
	}
	
	$(document).ready(function(){
		
		// 그래프 호출
		//document.addEventListener('DOMContentLoaded', function() {
		//new Chart(document.getElementById("QselngChart"), v_config);
		//});
		
		// 업종분석, 매출분석, 인구분석, 지역분석
		$("#tab01").click(function(){
			$("#tab01").addClass('active');
			$("#tab02").removeClass('active');
			$("#tab03").removeClass('active');
			$("#tab04").removeClass('active');
		});
		
		$("#tab02").click(function(){
			$("#tab02").addClass('active');
			$("#tab01").removeClass('active');
			$("#tab03").removeClass('active');
			$("#tab04").removeClass('active');
		});
		
		$("#tab03").click(function(){
			$("#tab03").addClass('active');
			$("#tab01").removeClass('active');
			$("#tab02").removeClass('active');
			$("#tab04").removeClass('active');
		});
		
		$("#tab04").click(function(){
			$("#tab04").addClass('active');
			$("#tab01").removeClass('active');
			$("#tab02").removeClass('active');
			$("#tab03").removeClass('active');
		});
		
	});

</script>

</head>
<body style="height:100%">
	<div id="map_box">
		<div id="position_box">
			<button class="storePosition">
				<i class="far fa-dot-circle"></i> 가게 위치로
			</button>								
			<button class="analysis">
				<i class="far fa-dot-circle"></i> 상권분석
			</button>
			<button class="radius500">
				<i class="far fa-dot-circle"></i> 상권확인
			</button>
			<button class="userPosition" style="display: inline;">
				<i class="far fa-dot-circle"></i> 내 위치로
			</button>
		</div>

		<div id='my-spinner'>
			<div>
				<span> <img src='/sbo/images/owners/1494.gif'></span>
			</div>
		</div>	 

	    <div class="hAddr">
	        <span class="title">지도중심기준 행정동 주소정보</span>
	        <span id="centerAddr"></span>
	    </div>
			<!-- 지도를 표시할 div 입니다 -->
		<div id="map" style="width: 100%; height: 100%;"></div>

		<script type="text/javascript" 
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=78dda96aa5d04a5a3967ffc71767a03e&libraries=services,clusterer,drawing"></script>
	
	
		<script>
			const authKey = "Sc6DIOJG8mK8fs5ME9KRZnWivhWM74R9ALjIiW%2Bd21bMxAxgpPy3lTFmVgWOVaI9XjcCqYzJSJkSKnQO2YXdtA%3D%3D";
		
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(37.575408, 126.965944), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};
			
			// 내 가게 주소
			// 퇴계로188
			// 구로구 경인로27길 7
			// 마장로219
			// 오류동 24-17
			var storeAddress = "오류동 24-17";
			
			// 지도를 생성합니다
			var map = new kakao.maps.Map(mapContainer, mapOption);
	
			// 주소-좌표 변환 객체를 생성합니다	
			var geocoder = new kakao.maps.services.Geocoder();
			// 주소로 좌표를 검색합니다
			
			let dong = "";
		
			var doungPolygon; // 선택 동 범위
	
			geocoder.addressSearch(storeAddress, function(result, status) {
	
				// 정상적으로 검색이 완료됐으면 
				if (status === kakao.maps.services.Status.OK) {
					var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					
					console.log(result[0].y, result[0].x);
					// 결과값으로 받은 위치를 마커로 표시합니다
					var marker = new kakao.maps.Marker({map : map, position : coords});
	
					// 인포윈도우로 장소에 대한 설명을 표시합니다
					var infowindow = new kakao.maps.InfoWindow({
						content : '<span class="info-title">'
						+ '내 가게' + '</span>'
					});
					
					infowindow.open(map, marker);
	
					// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
					map.setCenter(coords);
				}
				
				var infoTitle = document.querySelectorAll(".info-title");
				infoTitle.forEach(function(e){
					var w = e.offsetWidth + 10;
					var m1 = w/2;
					e.parentElement.style.top = "82px";
					e.parentElement.style.left = "50%";
					e.parentElement.style.marginLeft = -m1+"px";
					e.parentElement.style.width = w+"px";
					e.parentElement.previousSibling.style.top ="none" ;
					e.parentElement.parentElement.style.border = "0px";
					e.parentElement.parentElement.style.background = "unset";
					
				})
				
			
				function searchAddrFromCoords(coords, callback) {
					//console.log(coords);
				    // 좌표로 행정동 주소 정보를 요청합니다
				    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
				}
				// 법정동과 행정동이 존재 result 법정동은 'B'
				function displayCenterInfo(result, status) {
				    if (status === kakao.maps.services.Status.OK) {
				        var infoDiv = document.getElementById('centerAddr');
						//console.log(result);			        
				        for(var i = 0; i < result.length; i++) {
				            // 행정동의 region_type 값은 'H' 이므로
				            if (result[i].region_type === 'H') {
				                infoDiv.innerHTML = result[i].region_3depth_name;
				                break;
				            }
				        }
				    }    
				}
				
				// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
				searchAddrFromCoords(map.getCenter(), displayCenterInfo);
				
				// 내 가게 위치로 이동
				$(".storePosition").click(function() {
					map.panTo(coords);
				});
				
			})
		
			// 주소정보 찍기
				
			
			// 가게 주변 폴리곤으로 그리기
			$(".radius500").click(function(){
				var dongName = $("#centerAddr").text();
				var dongCode = "";
						
				//var jsonLocation = "/sbo/json/dong_coords.json";
				var jsonLocation = "/sbo/json/dongCodeV1.json";
				$.getJSON(jsonLocation, function(data) {
					for (var idx in data) {
						if(data[idx].dong === dongName){
							dongCode = data[idx].code;
							//getDongCode(dongCode);
							test(dongCode);
							break;
							
						}
					}
				});
			});  // click
			
			function test(code){
				$("#dongCodeHidden").attr("value",code);
				var jsonLocation = "/sbo/json/Dong.json";
				var areaPath = [];
				$.getJSON(jsonLocation, function(data) {
					for(let i = 0; i < data.features.length; i++){
						if(data.features[i].properties.adm_cd2 === code){
							for(let j = 0; j < data.features[i].geometry.coordinates[0][0].length; j++){
								let lat = data.features[i].geometry.coordinates[0][0][j][0];
								let lon = data.features[i].geometry.coordinates[0][0][j][1];								

								areaPath.push(new kakao.maps.LatLng(lon, lat));
							}
							//console.log(data.features[i].properties.adm_nm);
							//console.log(data.features[i].properties.adm_cd2);
						}
					}// for문
					
					doungPolygon = new kakao.maps.Polygon({
						map : map,
						path : areaPath, // 그려질 다각형의 좌표 배열입니다
						strokeWeight : 2, // 선의 두께입니다
						strokeColor : '#000000', // 선의 색깔입니다
						strokeOpacity : 0.8, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
						strokeStyle : 'solid', // 선의 스타일입니다
						fillOpacity : 0.1
					});
					
				    var level = map.getLevel(); 
				    map.setLevel(5);
				    $(".analysis").css("display","inline");
					
				}); // getJson
				
			}
			
			/*
			function getDongCode(code){
				var cx = "126.842880683621";
				var cy = "37.4971927362948";
				var data = {
 						"radius":"500",
						"cx":cx,
						"cy":cy,
						"type":"json"
				}
				
				$.ajax({
					//url : "http://apis.data.go.kr/B553077/api/open/sdsc2/storeZoneInAdmi?serviceKey="
					//	+ authKey,
					url : "http://apis.data.go.kr/B553077/api/open/sdsc2/storeZoneInRadius?serviceKey="
						+ authKey,
					type : 'GET',
					data : data,
					datatype : 'json',
					success: function(data){
						console.log(data);
						
						// 정상조회 시 length 가 0이 아니다.
						if(data.body.items.length != 0){
							$(".analysis").css("display","inline");
						}
						
						resetDoungPolygon();
						
						for(let geomp = 0; geomp < data.body.items.length; geomp++){
							
							var geom = data.body.items[geomp].coords;
							geom = geom.replace('MULTIPOLYGON (((', '').replace(')))', '');
							geom = geom.split(', ');
							
							console.log(geom);
									
							//console.log(geom);
							var areaPath = [];
							var color = "#A4F46B";
		
							var dPolygonPath = [];
		
							var polyCnt = [];
							polyCnt.push(0);
							for (var i = 0; i < geom.length; i++) {
								geom[i] = geom[i].replace('((', '').replace('(', '');
								var test = /\d\)/;
								//console.log("geom:"+geom[i]+" - "+test.test(geom[i]));
								if (test.test(geom[i]))
									polyCnt.push(i);
							}
							polyCnt.push(geom.length);
							//console.log(geom.length);
									
							var kakaoPathString = [];
							for (var cnt = 0; cnt < polyCnt.length - 1; cnt++) {
							var path = [];
							var cut = cnt == 0 ? polyCnt[cnt]: polyCnt[cnt] + 1;
							var mCut = cnt == polyCnt.length - 1 ? polyCnt[polyCnt.length - 1]: polyCnt[cnt + 1] + 1;
								for (var i = 0; i < geom.length; i++) {
									if (cut <= i && i < mCut) {
										var geom1 = geom[i].split(' ');
										var parse = parseInt(geom1[1]);
										//var latlng = parseInt(geom1[0]), parseInt(geom1[1]);
										var lat = geom1[0];
										var lon = geom1[1];
										//path.push(new kakao.maps.LatLng(latlng.lat,latlng.lon));
	
										path.push(new kakao.maps.LatLng(lon, lat));
												
									} else {
										if (i > cut) {
											cut = mCut + 1;
											break;
										}
									}
									}
								dPolygonPath.push(path);
							}
									
									
							doungPolygon = new kakao.maps.Polygon({
								map : map,
								path : dPolygonPath, // 그려질 다각형의 좌표 배열입니다
								strokeWeight : 3, // 선의 두께입니다
								strokeColor : '#000000', // 선의 색깔입니다
								strokeOpacity : 0.8, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
								strokeStyle : 'shortdashdot', // 선의 스타일입니다
								fillOpacity : 0.1
									// 채우기 불투명도 입니다
							});
									
							
						}// 전체 for문
						
					}, // success	
					error: function (xhr, ajaxOptions, thrownError) {
						alert('실패');
					},
					beforeSend: function( xhr ) {
						$("#my-spinner").show();
					},
					complete: function () {
						$("#my-spinner").hide();
					},
				}); // ajax
				
			} // getCode function
			*/
		
			// reset polygon
			/*
			function resetDoungPolygon() {
				if (doungPolygon) {
					doungPolygon.setMap(null);
					doungPolygon = null;
				}
			}
			*/
			
/* 		    $.ajaxSetup({
		    	// 비동기 ㅓ리
		        async: false
		    }); */
		    
			// 상권분석 
			$(".analysis").click(function(){
				var jsonLocation = "/sbo/json/commercial.json";
				var dongName = $("#centerAddr").text();
				let totalAvgAmt = [];
				
				let selng_amt = 0;
				let stor_co = 0;
				let selng_co = 0;
				
				let mon_amt = 0;
				let tues_amt = 0;
				let wed_amt = 0;
				let thur_amt = 0;
				let fri_amt = 0;
				let sat_amt = 0;
				let sun_amt = 0;
				
				let time_amt06 = 0;
				let time_amt11 = 0;
				let time_amt14 = 0;
				let time_amt17 = 0;
				let time_amt21 = 0;
				let time_amt24 = 0;
				
				let ml_amt = 0;
				let fml_amt = 0;
				
				let age_sel10 = 0;
				let age_sel20 = 0;
				let age_sel30 = 0;
				let age_sel40 = 0;
				let age_sel50 = 0;
				let age_sel60 = 0;
				
				let selTrend1 = 0;
				let selTrend2 = 0;
				let selTrend3 = 0;
				let selTrend4 = 0;
				
				let Q4_selng_amt21 = 0;
				let Q4_stor_co21 = 0;
				let Q4_selng_co21 = 0;
				
				let Q3_selng_amt21 = 0;
				let Q3_stor_co21 = 0;
				let Q3_selng_co21 = 0;
				
				let Q2_selng_amt21 = 0;
				let Q2_stor_co21 = 0;
				let Q2_selng_co21 = 0;
				
				let Q1_selng_amt21 = 0;
				let Q1_stor_co21 = 0;
				let Q1_selng_co21 = 0;
				
				let cnt = 0;
				let Q1 = 0;
				let Q2 = 0;
				let Q3 = 0;
				let Q4 = 0;
				$.getJSON(jsonLocation, function(data) {
					
					for (var idx in data) {
						if(data[idx].DONG === dongName){
							if(data[idx].STDR_YY_CD === "2022"){
								if(data[idx].STDR_QU_CD === "1"){
									cnt++;
									selng_amt += parseInt(data[idx].THSMON_SELNG_AMT);
									stor_co += parseInt(data[idx].STOR_CO);
									selng_co += parseInt(data[idx].THSMON_SELNG_CO);
									
									mon_amt += parseInt(data[idx].MON_SELNG_AMT);
									tues_amt += parseInt(data[idx].TUES_SELNG_AMT);
									wed_amt += parseInt(data[idx].WED_SELNG_AMT);
									thur_amt += parseInt(data[idx].THUR_SELNG_AMT);
									fri_amt += parseInt(data[idx].FRI_SELNG_AMT);
									sat_amt += parseInt(data[idx].SAT_SELNG_AMT);
									sun_amt += parseInt(data[idx].SUN_SELNG_AMT);
									
									time_amt06 += parseInt(data[idx].TMZON_00_06_SELNG_AMT);
									time_amt11 += parseInt(data[idx].TMZON_06_11_SELNG_AMT);
									time_amt14 += parseInt(data[idx].TMZON_11_14_SELNG_AMT);
									time_amt17 += parseInt(data[idx].TMZON_14_17_SELNG_AMT);
									time_amt21 += parseInt(data[idx].TMZON_17_21_SELNG_AMT);
									time_amt24 += parseInt(data[idx].TMZON_21_24_SELNG_AMT);
									
									ml_amt += parseInt(data[idx].ML_SELNG_AMT);
									fml_amt += parseInt(data[idx].FML_SELNG_AMT);
									
									age_sel10 += parseInt(data[idx].AGRDE_10_SELNG_AMT);
									age_sel20 += parseInt(data[idx].AGRDE_20_SELNG_AMT);
									age_sel30 += parseInt(data[idx].AGRDE_30_SELNG_AMT);
									age_sel40 += parseInt(data[idx].AGRDE_40_SELNG_AMT);
									age_sel50 += parseInt(data[idx].AGRDE_50_SELNG_AMT);
									age_sel60 += parseInt(data[idx].AGRDE_60_ABOVE_SELNG_AMT);
									
									console.log(data[idx].SVC_INDUTY_CD_NM);
									
									if(data[idx].SVC_INDUTY_CD_NM === "한식음식점"){
										selTrend1++;
									}else if(data[idx].SVC_INDUTY_CD_NM === "분식전문점"){
										selTrend2++;
									}else if(data[idx].SVC_INDUTY_CD_NM === "호프-간이주점"){
										selTrend3++;
									}else if(data[idx].SVC_INDUTY_CD_NM === "커피-음료"){
										selTrend4++;
									}else{
										
									}
/* 									if(data[idx].SVC_INDUTY_CD_NM === "분식전문점"){
										totalAvgAmt.push("분식:"+data[idx].THSMON_SELNG_AMT);
									}else if(data[idx].SVC_INDUTY_CD_NM === "한식음식점"){
										totalAvgAmt.push("한식:"+data[idx].THSMON_SELNG_AMT);
									}else if(data[idx].SVC_INDUTY_CD_NM === "호프-간이주점"){
										totalAvgAmt.push("호프:"+data[idx].THSMON_SELNG_AMT);
									}else if(data[idx].SVC_INDUTY_CD_NM === "커피-음료"){
										totalAvgAmt.push("커피:"+data[idx].THSMON_SELNG_AMT);
									} */
									//arrpush[i] = data[idx];
									//i++;
									                    
								}else if(data[idx].STDR_QU_CD === "2"){
									console.log("ㅌㅌ");
									
								}else if(idata[idx].STDR_QU_CD === "3"){
									
								}else{}
							}else{ // 2021년도
								if(data[idx].STDR_QU_CD === "4"){
									Q4++;
									Q4_selng_amt21 += parseInt(data[idx].THSMON_SELNG_AMT);
									Q4_stor_co21 += parseInt(data[idx].STOR_CO);
									Q4_selng_co21 += parseInt(data[idx].THSMON_SELNG_CO);
								}else if(data[idx].STDR_QU_CD === "3"){
									Q3++;
									Q3_selng_amt21 += parseInt(data[idx].THSMON_SELNG_AMT);
									Q3_stor_co21 += parseInt(data[idx].STOR_CO);
									Q3_selng_co21 += parseInt(data[idx].THSMON_SELNG_CO);
								}else if(data[idx].STDR_QU_CD === "2"){
									Q2++;
									Q2_selng_amt21 += parseInt(data[idx].THSMON_SELNG_AMT);
									Q2_stor_co21 += parseInt(data[idx].STOR_CO);
									Q2_selng_co21 += parseInt(data[idx].THSMON_SELNG_CO);
								}else{
									Q1++;
									Q1_selng_amt21 += parseInt(data[idx].THSMON_SELNG_AMT);
									Q1_stor_co21 += parseInt(data[idx].STOR_CO);
									Q1_selng_co21 += parseInt(data[idx].THSMON_SELNG_CO);
								}
							}
						} // 해당동을 가져왔을때
					} // 전체포문
					////////////////////////////////////////////////
					// 업종분석, 점포수
					///////////////////////////////////////////////
					$("#storCo").text(stor_co);
					// 전년 동분기 대비
					if(stor_co > Q1_stor_co21){
						$("#storYearDiff").text(stor_co-Q1_stor_co21+"개");
						$("#storYearDiff").addClass("increase");
					}else{
						$("#storYearDiff").text(Q1_stor_co21-stor_co+"개");
						$("#storYearDiff").addClass("decrease");
					}
					// 전분기 대비
					if(stor_co > Q4_stor_co21){
						$("#storQuDiff").text(stor_co-Q4_stor_co21+"개");
						$("#storQuDiff").addClass("increase");
					}else{
						$("#storQuDiff").text(Q4_stor_co21-stor_co+"개");
						$("#storQuDiff").addClass("decrease");
					}
					// 점포수 추이 그래프
					BusinessGraph(stor_co,Q1_stor_co21,Q2_stor_co21,Q3_stor_co21,Q4_stor_co21);
					
					// 내 가게
					$("#place").text($("#centerAddr").text());
					// 점포당 월평균 매출
					$("#trdarSelngStorAmt").text(parseInt(selng_amt/stor_co/3));
					// 전분기 대비 => 21년 4분기
					let presentQ = parseInt(selng_amt/stor_co/3);
					let pastQ = parseInt(Q4_selng_amt21/Q4_stor_co21/3);
					//console.log(presentQ, pastQ);
					
					if(presentQ > pastQ){
						$("#trdarSelngStorAmtQuDiff").text(presentQ - pastQ + " 만원");
						$("#trdarSelngStorAmtQuDiff").addClass("increase");
					}else{
						$("#trdarSelngStorAmtQuDiff").text(pastQ - presentQ + " 만원");
						$("#trdarSelngStorAmtQuDiff").addClass("decrease");
					}
					// 전년 동분기 대비 => 21년 1분기
					presentQ = parseInt(selng_amt/stor_co/3);
					pastQ = parseInt(Q1_selng_amt21/Q1_stor_co21/3);
					//console.log(presentQ, pastQ);
					
					if(presentQ > pastQ){
						$("#trdarSelngStorAmtYearDiff").text(presentQ - pastQ + " 만원");
						$("#trdarSelngStorAmtYearDiff").addClass("increase");
					}else{
						$("#trdarSelngStorAmtYearDiff").text(pastQ - presentQ + " 만원");
						$("#trdarSelngStorAmtYearDiff").addClass("decrease");
					}
					
					// 분기별 그래프 그리기 함수
					Qgraph(parseInt(selng_amt/stor_co/3),parseInt(Q1_selng_amt21/Q1_stor_co21/3),
							parseInt(Q2_selng_amt21/Q2_stor_co21/3),parseInt(Q3_selng_amt21/Q3_stor_co21/3),
							parseInt(Q4_selng_amt21/Q4_stor_co21/3)
					);
					
					// 월평균 매출건수
					$("#trdarSelngStorCo").text(parseInt(selng_co/cnt/3));
					
					// 전년 동분기 대비(매출건수) => 21년 1분기
					presentQ = parseInt(selng_co/cnt/3);
					pastQ = parseInt(Q1_selng_co21/Q1/3);
					if(presentQ > pastQ){
						$("#trdarSelngStorCoYearDiff").text(presentQ - pastQ + " 건");
						$("#trdarSelngStorCoYearDiff").addClass("increase");
					}else{
						$("#trdarSelngStorCoYearDiff").text(pastQ - presentQ + " 건");
						$("#trdarSelngStorCoYearDiff").addClass("decrease");
					}
					// 전분기 대비
					presentQ = parseInt(selng_co/cnt/3);
					pastQ = parseInt(Q4_selng_co21/Q4/3);
					if(presentQ > pastQ){
						$("#trdarSelngStorCoQuDiff").text(presentQ - pastQ + " 건");
						$("#trdarSelngStorCoQuDiff").addClass("increase");
					}else{
						$("#trdarSelngStorCoQuDiff").text(pastQ - presentQ + " 건");
						$("#trdarSelngStorCoQuDiff").addClass("decrease");
					}
					
					// 매출건수 그래프 그리기 함수
					QCntgraph(parseInt(selng_co/cnt/3),parseInt(Q1_selng_co21/Q1/3),
							parseInt(Q2_selng_co21/Q2/3),parseInt(Q3_selng_co21/Q3/3),
							parseInt(Q4_selng_co21/Q4/3)
					);
					
					// 요일별 매출 
					const arr = [mon_amt, tues_amt, wed_amt, thur_amt, fri_amt, sat_amt, sun_amt];
					const max = Math.max(...arr);
					const index = arr.indexOf(max);
					const amtSum = arr.reduce(function add(sum, currValue) {
						  return sum + currValue;
					}, 0);
					$("#placeDong").text(dongName);					
					
					if(index === 0){
						$("#dayWeek").text("월요일");
						$("#selngWeekTop1").text("월요일("+((mon_amt/amtSum)*100).toFixed(1)+"%)");;
					}else if(index === 1){
						$("#dayWeek").text("화요일");
						$("#selngWeekTop1").text("화요일("+((tues_amt/amtSum)*100).toFixed(1)+"%)");
					}else if(index === 2){
						$("#dayWeek").text("수요일");
						$("#selngWeekTop1").text("수요일("+((wed_amt/amtSum)*100).toFixed(1)+"%)");
					}else if(index === 3){
						$("#dayWeek").text("목요일");
						$("#selngWeekTop1").text("목요일("+((thur_amt/amtSum)*100).toFixed(1)+"%)");
					}else if(index === 4){
						$("#dayWeek").text("금요일");
						$("#selngWeekTop1").text("금요일("+((fri_amt/amtSum)*100).toFixed(1)+"%)");
					}else if(index === 5){
						$("#dayWeek").text("토요일");
						$("#selngWeekTop1").text("토요일("+((sat_amt/amtSum)*100).toFixed(1)+"%)");
					}else{
						$("#dayWeek").text("일요일");
						$("#selngWeekTop1").text("일요일("+((sun_amt/amtSum)*100).toFixed(1)+"%)");
					}
					selngWeekChart(
					((mon_amt/amtSum)*100).toFixed(1),
					((tues_amt/amtSum)*100).toFixed(1),((wed_amt/amtSum)*100).toFixed(1),
					((thur_amt/amtSum)*100).toFixed(1),((fri_amt/amtSum)*100).toFixed(1),
					((sat_amt/amtSum)*100).toFixed(1),((sun_amt/amtSum)*100).toFixed(1)
					);
					
					// 시간대별 매출
					const arrTime = [time_amt06, time_amt11, time_amt14, time_amt17, time_amt21, time_amt24];
					const maxTime = Math.max(...arrTime);
					const indexTime = arrTime.indexOf(maxTime);
					const timeSum = arrTime.reduce(function add(sum, currValue) {
						  return sum + currValue;
					}, 0);
					
					if(indexTime === 0){
						$("#selngHourTop1").text("00 ~ 06시");
						$("#selngHourTop1_").text("00 ~ 06시");
					}else if(indexTime === 1){
						$("#selngHourTop1").text("06 ~ 11시");
						$("#selngHourTop1_").text("06 ~ 11시");
					}else if(indexTime === 2){
						$("#selngHourTop1").text("11 ~ 14시");
						$("#selngHourTop1_").text("11 ~ 14시");
					}else if(indexTime === 3){
						$("#selngHourTop1").text("14 ~ 17시");
						$("#selngHourTop1_").text("14 ~ 17시");
					}else if(indexTime === 4){
						$("#selngHourTop1").text("17 ~ 21시");
						$("#selngHourTop1_").text("17 ~ 21시");
					}else{
						$("#selngHourTop1").text("21 ~ 24시");
						$("#selngHourTop1_").text("21 ~ 24시");
					}
					
					selngHourChart(
					((time_amt06/timeSum)*100).toFixed(1),
					((time_amt11/timeSum)*100).toFixed(1),((time_amt14/timeSum)*100).toFixed(1),
					((time_amt17/timeSum)*100).toFixed(1),((time_amt21/timeSum)*100).toFixed(1),
					((time_amt24/timeSum)*100).toFixed(1)
					);
					
					// 성별매출
					const arrGender = [ml_amt,fml_amt];
					const maxGender = Math.max(...arrGender);
					const indexGender = arrGender.indexOf(maxGender);
					const sumGender = arrGender.reduce(function add(sum, currValue) {
						  return sum + currValue;
					}, 0);
					
					if(indexGender === 0){
						$("#selngSexTop1").text("남성("+((ml_amt/sumGender)*100).toFixed(1)+"%)");
						$("#selngSexTop1_").text("남성("+((ml_amt/sumGender)*100).toFixed(1)+"%)");
					}else{
						$("#selngSexTop1").text("여성("+((fml_amt/sumGender)*100).toFixed(1)+"%)");
						$("#selngSexTop1_").text("여성("+((ml_amt/sumGender)*100).toFixed(1)+"%)");
					}
					
					selngSexChart(((ml_amt/sumGender)*100).toFixed(1),((fml_amt/sumGender)*100).toFixed(1));
					
					// 연령별 매출 비율
					const arrAge = [age_sel10,age_sel20,age_sel30,age_sel40,age_sel50,age_sel60];
					const maxAge = Math.max(...arrAge);
					const indexAge = arrAge.indexOf(maxAge);
					const sumAge = arrAge.reduce(function add(sum, currValue) {
						  return sum + currValue;
					}, 0);
					
					if(indexAge === 0){
						$("#selngAgeTop1").text("음식업의 10대("+((age_sel10/sumAge)*100).toFixed(1)+"%)");
						$("#selngAgeTop1_").text("10대("+((age_sel10/sumAge)*100).toFixed(1)+"%)");
					}else if(indexAge === 1){
						$("#selngAgeTop1").text("음식업의 20대("+((age_sel20/sumAge)*100).toFixed(1)+"%)");
						$("#selngAgeTop1_").text("20대("+((age_sel20/sumAge)*100).toFixed(1)+"%)");
					}else if(indexAge === 2){
						$("#selngAgeTop1").text("음식업의 30대("+((age_sel30/sumAge)*100).toFixed(1)+"%)");
						$("#selngAgeTop1_").text("30대("+((age_sel30/sumAge)*100).toFixed(1)+"%)");
					}else if(indexAge === 3){
						$("#selngAgeTop1").text("음식업의 40대("+((age_sel40/sumAge)*100).toFixed(1)+"%)");
						$("#selngAgeTop1_").text("40대("+((age_sel40/sumAge)*100).toFixed(1)+"%)");
					}else if(indexAge === 4){
						$("#selngAgeTop1").text("음식업의 50대("+((age_sel50/sumAge)*100).toFixed(1)+"%)");
						$("#selngAgeTop1_").text("50대("+((age_sel50/sumAge)*100).toFixed(1)+"%)");
					}else{
						$("#selngAgeTop1").text("음식업의 60대("+((age_sel60/sumAge)*100).toFixed(1)+"%)");
						$("#selngAgeTop1_").text("60대("+((age_sel60/sumAge)*100).toFixed(1)+"%)");
					}
					
					selngAgeChart(
					((age_sel10/sumAge)*100).toFixed(1),
					((age_sel20/sumAge)*100).toFixed(1),((age_sel30/sumAge)*100).toFixed(1),
					((age_sel40/sumAge)*100).toFixed(1),((age_sel50/sumAge)*100).toFixed(1),
					((age_sel60/sumAge)*100).toFixed(1)
					);
					
					// 행정동 단위 유동인구 분석 
					
					DongPopulation("20220301");
					
					
					function DongPopulation(date){
						const START_INDEX = "1";
						const END_INDEX = "24";
						const STDR_DE_ID = date;
						const ADSTRD_CODE_SE = $("#dongCodeHidden").attr("value");
						const codeTrans = ADSTRD_CODE_SE.substr(0,8);

						$.ajax({
							url : "http://openapi.seoul.go.kr:8088/4a777a6a4961626337306a72774f70/json/SPOP_LOCAL_RESD_DONG"+
							"/"+START_INDEX+"/"+END_INDEX+"/"+STDR_DE_ID+"/ /"+codeTrans,
							type : 'GET',
							success: function(data){
								console.log(data);//TMZON_PD_SE
								for (var idx in data) {
									
								}
							
							}, // success	
							error: function (xhr, ajaxOptions, thrownError) {
								alert('실패');
							},
						}); // ajax
						
						
						// 소비트렌드
						const arrSelTrend = [selTrend1,selTrend2,selTrend3,selTrend4];
						const maxSelTrend = Math.max(...arrSelTrend);
						const indexSelTrend = arrSelTrend.indexOf(maxSelTrend);
						const sumSelTrend = arrSelTrend.reduce(function add(sum, currValue) {
							  return sum + currValue;
						}, 0);
						console.log(arrSelTrend);
						
						if(indexSelTrend === 0){
							$("#expndtrTop1").text("한식음식점");
							$("#expndtrTop1_").text("한식음식점");
						}else if(indexSelTrend === 1){
							$("#expndtrTop1").text("분식음식점");
							$("#expndtrTop1_").text("분식음식점");
						}else if(indexSelTrend === 2){
							$("#expndtrTop1").text("호프-간이주점");
							$("#expndtrTop1_").text("호프-간이주점");
						}else if(indexAge === 3){
							$("#expndtrTop1").text("커피-음료");
							$("#expndtrTop1_").text("커피-음료");
						}else{
							
						}
						
						$("#trend1").text("한식음식점");
						$("#expnd1").text(((selTrend1/sumSelTrend)*100).toFixed(1));
						
						$("#trend2").text("분식전문점");
						$("#expnd2").text(((selTrend2/sumSelTrend)*100).toFixed(1));
						
						$("#trend3").text("호프-간이주점");
						$("#expnd3").text(((selTrend3/sumSelTrend)*100).toFixed(1));
						
						$("#trend4").text("커피-음료");
						$("#expnd4").text(((selTrend4/sumSelTrend)*100).toFixed(1));
						
						expndtrChart(
						((selTrend1/sumSelTrend)*100).toFixed(1),((selTrend2/sumSelTrend)*100).toFixed(1),		
						((selTrend3/sumSelTrend)*100).toFixed(1),((selTrend4/sumSelTrend)*100).toFixed(1)
						);
						
						
						
						
						
					}
					
				});
			});
		    
		    /* function getData(...arr){
				console.log(arr);
				//console.log(arr[0][0]);
			} */
			
			
			/////////////////////////////////////////////////////////////
			// 업종분석 그래프
			/////////////////////////////////////////////////////////////
			function BusinessGraph(NowQ,Q1,Q2,Q3,Q4){
				let labels = ["2021년1분기","2021년2분기","2021년3분기","2021년4분기","2022년1분기"];
				let amounts = [NowQ,Q1,Q2,Q3,Q4];
				//let members = ["10","20","30"];

				const v_data = {
					    labels: labels,
					    datasets: [
					       {
					            label: $("#centerAddr").text(),
					            data: amounts,
					            borderColor: '#36a2eb',
					            backgroundColor: '#36a2eb',
					            type: 'bar'
					            //yAxisID: 'y'
					       }
					   ]
				};

				const v_config = {
				    type: 'line',
				    data: v_data,
				    options: {
				        interaction: {
				            intersect: false,
				            mode: 'index',
				        },

				        scales: {
				            y: {
				            	type: 'linear',
				                display: true,
				                position: 'left'
				            }
				        }
				    }
				};
				
				new Chart(document.getElementById("BusinessChart"), v_config);
			}
			
			
			// 매출액 추이 그래프
			function Qgraph(NowQ,Q1,Q2,Q3,Q4){
				let labels = ["2021년1분기","2021년2분기","2021년3분기","2021년4분기","2022년1분기"];
				let amounts = [NowQ,Q1,Q2,Q3,Q4];
				//let members = ["10","20","30"];

				const v_data = {
					    labels: labels,
					    datasets: [
					       {
					            label: $("#centerAddr").text(),
					            data: amounts,
					            borderColor: '#36a2eb',
					            backgroundColor: '#36a2eb'
					            //yAxisID: 'y'
					       }
					   ]
				};

				const v_config = {
				    type: 'line',
				    data: v_data,
				    options: {
				        interaction: {
				            intersect: false,
				            mode: 'index',
				        },

				        scales: {
				            y: {
				                type: 'linear',
				                display: true,
				                position: 'left'
				                //suggestedMin: 0,
				                //suggestedMax: 2000,
				            }
				        }
				    }
				};
				
				new Chart(document.getElementById("QselngChart"), v_config);
			}
			
			// 매출건수 그래프
			function QCntgraph(NowQ,Q1,Q2,Q3,Q4){
				let labels = ["2021년1분기","2021년2분기","2021년3분기","2021년4분기","2022년1분기"];
				let amounts = [NowQ,Q1,Q2,Q3,Q4];
				//let members = ["10","20","30"];

				const v_data = {
					    labels: labels,
					    datasets: [
					       {
					            label: $("#centerAddr").text(),
					            data: amounts,
					            borderColor: '#36a2eb',
					            backgroundColor: '#36a2eb'
					            //yAxisID: 'y'
					       }
					   ]
				};

				const v_config = {
				    type: 'line',
				    data: v_data,
				    options: {
				        interaction: {
				            intersect: false,
				            mode: 'index',
				        },

				        scales: {
				            y: {
				                type: 'linear',
				                display: true,
				                position: 'left'
				                //suggestedMin: 0,
				                //suggestedMax: 2000,
				            }
				        }
				    }
				};
				
				new Chart(document.getElementById("QCntselngChart"), v_config);
			}
			// 요일별 매출
			function selngWeekChart(mon,tues,wed,thur,fri,sat,sun){
				let labels = ["월요일","화요일","수요일","목요일","금요일","토요일","일요일"];
				let amounts = [mon,tues,wed,thur,fri,sat,sun];
				//let members = ["10","20","30"];

				const v_data = {
					    labels: labels,
					    datasets: [
					       {
					            label: $("#centerAddr").text(),
					            data: amounts,
					            borderColor: '#36a2eb',
					            backgroundColor: '#36a2eb',
					            type: 'bar'
					            //yAxisID: 'y'
					       }
					   ]
				};

				const v_config = {
				    type: 'line',
				    data: v_data,
				    options: {
				        interaction: {
				            intersect: false,
				            mode: 'index',
				        },

				        scales: {
				            y: {
				            	type: 'linear',
				                display: true,
				                position: 'left'
				            }
				        }
				    }
				};
				
				new Chart(document.getElementById("selngWeekChart"), v_config);
			}
			
			// 시간대별 매출
			function selngHourChart(amt06,amt11,amt14,amt17,amt21,amt24){
				let labels = ["00~06시","06~11시","11~14시","14~17시","17~21시","21~24시"];
				let amounts = [amt06,amt11,amt14,amt17,amt21,amt24];

				const v_data = {
					    labels: labels,
					    datasets: [
					       {
					            label: $("#centerAddr").text(),
					            data: amounts,
					            borderColor: 'rgb(75, 192, 192)',
					            fill: true,
					            tension: 0.1
					            //yAxisID: 'y'
					       }
					   ]
				};

				const v_config = {
				    type: 'line',
				    data: v_data,
				};
				
				new Chart(document.getElementById("selngHourChart"), v_config);
			}
			
			// 성별 매출
			function selngSexChart(ml_amt,fml_amt){
				let labels = ["남성","여성"];
				let amounts = [ml_amt,fml_amt];
				
				var vpn_pie = document.getElementById('selngSexChart').getContext('2d');
				var vpnPieChart = new Chart(vpn_pie, {
				    type: 'pie',
				    data:{
				        labels: labels,
				        datasets: [{
				            data: amounts,
				            backgroundColor: [
				                "#f7323f",
				                "#673ba7"
				            ],
				            borderWidth: 0
				        }]
				    }
				});
			}
			
			// 연령대별 매출
			function selngAgeChart(sel10,sel20,sel30,sel40,sel50,sel60){
				let labels = ["10대","20대","30대","40대","50대","60대이상"];
				let amounts = [sel10,sel20,sel30,sel40,sel50,sel60];
				//let members = ["10","20","30"];

				const v_data = {
					    labels: labels,
					    datasets: [
					       {
					            label: "연령대별 음식업 현황",
					            data: amounts,
					            borderColor: '#36a2eb',
					            backgroundColor: '#36a2eb',
					            type: 'bar'
					            //yAxisID: 'y'
					       }
					   ]
				};

				const v_config = {
				    type: 'line',
				    data: v_data,
				    options: {
				        interaction: {
				            intersect: false,
				            mode: 'index',
				        },

				        scales: {
				            y: {
				            	type: 'linear',
				                display: true,
				                position: 'left'
				            }
				        }
				    }
				};
				
				new Chart(document.getElementById("selngAgeChart"), v_config);
			}
			
			
			
			
			
			
			
			
			// 트랜드 분석 
			function expndtrChart(selTrend1,selTrend2,selTrend3,selTrend4){
				let labels = ["한식음식점","분식전문점","호프-간이주점","커피-음료"];
				let amounts = [selTrend1,selTrend2,selTrend3,selTrend4];
				
				var vpn_pie = document.getElementById('expndtrChart').getContext('2d');
				var vpnPieChart = new Chart(vpn_pie, {
				    type: 'pie',
				    data:{
				        labels: labels,
				        datasets: [{
				            data: amounts,
				            backgroundColor: [
				                "#ffcd56",
				                "#ff9f40",
				                "#36a2eb",
				                "#4bc0c0"
				            ],
				            borderWidth: 0
				        }]
				    }
				});
			}
			
			
			
			
			
			function amtPopup(...data){
				$.ajax({
					url: "/bizmarket",
					type: "POST",
					traditional: true,	// ajax 배열 넘기기 옵션!
					data: {"arrStr" : data},
					success: function (data) {
						
						
		 		         var url = "/bizmarket";
				         var title = "popup test";
				       	 var option = "width =700, height = 700, top = 100, left = 200, location = no";
				         window.open(url, title, option); 
					},
					error:function(request,status,error){
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			}
			
			
</script>

</div>
<%@ include file="/WEB-INF/view/modal/sbizReport.jsp" %>	
<script type="text/javascript" src="/js/sbo/sbizReport.js" ></script>
<script type="text/javascript" src="/js/util/util.js" ></script>
<input type="hidden" id="dongCodeHidden">
</body>
</html>