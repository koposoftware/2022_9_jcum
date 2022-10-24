<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>알림</title>
    <style>
		body {margin:0}
		.wrap {width:800px;margin:0 auto;}
		ul {margin:0;padding:0;}
		ul > li {padding-bottom:10px;list-style:none;/* font-size:0; */}
		ul > li > img {display:inline-block;vertical-align:top;width:49.5%;margin-right:0.5%;}
		ul > li > img:nth-child(2n) {margin:0;}
		#loader {display:none;z-index:999;width:100%;height:100%;position:fixed;top:0;left:0;background:#000;opacity:.5;}
		#loader span {position: absolute;top: 50%;left: 50%;transform: translate(-50%, -50%);display: inline-block;color:#fff;font-weight:bold;}
		button {display:block;width:100px;margin:20px auto 10px;}
	</style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bluebird/3.7.2/bluebird.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
    <script src="https://unpkg.com/html2canvas@1.0.0-rc.5/dist/html2canvas.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
    <script>
    
    $(document).ready(function(){
    	var renderedImg = new Array;
    	var binary ;

    	var contWidth = 200, // 너비(mm) (a4에 맞춤)
    		 padding = 5; //상하좌우 여백(mm)

    	//이미지를 pdf로 만들기
    		//document.getElementById("loader").style.display = "block"; //로딩 시작

    		var lists = document.querySelectorAll("ul.pdfArea > li"),
    		//var lists = document.querySelectorAll(".wrap"),
    			 deferreds = [],
    			 doc = new jsPDF("p", "mm", "a4"),
    			 listsLeng = lists.length;

    		for (var i = 0; i < listsLeng; i++) { // li 개수만큼 이미지 생성
    			var deferred = $.Deferred();
    			deferreds.push(deferred.promise());
    			generateCanvas(i, doc, deferred, lists[i]);
    		}

    		$.when.apply($, deferreds).then(function () { // 이미지 렌더링이 끝난 후
    			var sorted = renderedImg.sort(function(a,b){return a.num < b.num ? -1 : 1;}), // 순서대로 정렬
    				 curHeight = padding, //위 여백 (이미지가 들어가기 시작할 y축)
    				 sortedLeng = sorted.length;
    			for (var i = 0; i < sortedLeng; i++) {
    				var sortedHeight = sorted[i].height, //이미지 높이
    					 sortedImage = sorted[i].image; //이미지

    				if( curHeight + sortedHeight > 297 - padding * 2 ){ // a4 높이에 맞게 남은 공간이 이미지높이보다 작을 경우 페이지 추가
    					doc.addPage(); // 페이지를 추가함
    					curHeight = padding; // 이미지가 들어갈 y축을 초기 여백값으로 초기화
    					doc.addImage(sortedImage, 'jpeg', padding , curHeight, contWidth, sortedHeight); //이미지 넣기
    					curHeight += sortedHeight; // y축 = 여백 + 새로 들어간 이미지 높이
    				} else { // 페이지에 남은 공간보다 이미지가 작으면 페이지 추가하지 않음
    					doc.addImage(sortedImage, 'jpeg', padding , curHeight, contWidth, sortedHeight); //이미지 넣기
    					curHeight += sortedHeight; // y축 = 기존y축 + 새로들어간 이미지 높이
    				}
    			}
    			//doc.save('pdf_test.pdf'); //pdf 저장
    			//doc.text("jsPDF to Mail", 40, 30);    
    			binary = doc.output();
    			binary = binary ? btoa(binary) : "";
    			
    			pdfToMail(binary);
    			
    			//document.getElementById("loader").style.display = "none"; //로딩 끝
    			curHeight = padding; //y축 초기화
    			renderedImg = new Array; //이미지 배열 초기화
    			
    			// 팝업창 닫기
    			//window.open('', '_self', '');
    			//window.close();
    			//return false;
    			
    		});

    	function generateCanvas(i, doc, deferred, curList){ //페이지를 이미지로 만들기
    		var pdfWidth = $(curList).outerWidth() * 0.2645, //px -> mm로 변환
    			 pdfHeight = $(curList).outerHeight() * 0.2645,
    			 heightCalc = contWidth * pdfHeight / pdfWidth; //비율에 맞게 높이 조절
    		html2canvas( curList ).then(
    			function (canvas) {
    				var img = canvas.toDataURL('image/jpeg', 1.0); //이미지 형식 지정
    				renderedImg.push({num:i, image:img, height:heightCalc}); //renderedImg 배열에 이미지 데이터 저장(뒤죽박죽 방지)     
    				deferred.resolve(); //결과 보내기
    			 }
    		);
    	}
	
    	
    });
	var renderedImg = new Array;
	var binary ;

	var contWidth = 200, // 너비(mm) (a4에 맞춤)
		 padding = 5; //상하좌우 여백(mm)

	function createPdf() { //이미지를 pdf로 만들기
		//document.getElementById("loader").style.display = "block"; //로딩 시작

		var lists = document.querySelectorAll("ul.pdfArea > li"),
		//var lists = document.querySelectorAll(".wrap"),
			 deferreds = [],
			 doc = new jsPDF("p", "mm", "a4"),
			 listsLeng = lists.length;

		for (var i = 0; i < listsLeng; i++) { // li 개수만큼 이미지 생성
			var deferred = $.Deferred();
			deferreds.push(deferred.promise());
			generateCanvas(i, doc, deferred, lists[i]);
		}

		$.when.apply($, deferreds).then(function () { // 이미지 렌더링이 끝난 후
			var sorted = renderedImg.sort(function(a,b){return a.num < b.num ? -1 : 1;}), // 순서대로 정렬
				 curHeight = padding, //위 여백 (이미지가 들어가기 시작할 y축)
				 sortedLeng = sorted.length;
			for (var i = 0; i < sortedLeng; i++) {
				var sortedHeight = sorted[i].height, //이미지 높이
					 sortedImage = sorted[i].image; //이미지

				if( curHeight + sortedHeight > 297 - padding * 2 ){ // a4 높이에 맞게 남은 공간이 이미지높이보다 작을 경우 페이지 추가
					doc.addPage(); // 페이지를 추가함
					curHeight = padding; // 이미지가 들어갈 y축을 초기 여백값으로 초기화
					doc.addImage(sortedImage, 'jpeg', padding , curHeight, contWidth, sortedHeight); //이미지 넣기
					curHeight += sortedHeight; // y축 = 여백 + 새로 들어간 이미지 높이
				} else { // 페이지에 남은 공간보다 이미지가 작으면 페이지 추가하지 않음
					doc.addImage(sortedImage, 'jpeg', padding , curHeight, contWidth, sortedHeight); //이미지 넣기
					curHeight += sortedHeight; // y축 = 기존y축 + 새로들어간 이미지 높이
				}
			}
			//doc.save('pdf_test.pdf'); //pdf 저장
			//doc.text("jsPDF to Mail", 40, 30);    
			//binary = doc.output();
			//binary = binary ? btoa(binary) : "";
			
			//pdfToMail(binary);
			
			//document.getElementById("loader").style.display = "none"; //로딩 끝
			curHeight = padding; //y축 초기화
			renderedImg = new Array; //이미지 배열 초기화
			
		});
	}

	function generateCanvas(i, doc, deferred, curList){ //페이지를 이미지로 만들기
		var pdfWidth = $(curList).outerWidth() * 0.2645, //px -> mm로 변환
			 pdfHeight = $(curList).outerHeight() * 0.2645,
			 heightCalc = contWidth * pdfHeight / pdfWidth; //비율에 맞게 높이 조절
		html2canvas( curList ).then(
			function (canvas) {
				var img = canvas.toDataURL('image/jpeg', 1.0); //이미지 형식 지정
				renderedImg.push({num:i, image:img, height:heightCalc}); //renderedImg 배열에 이미지 데이터 저장(뒤죽박죽 방지)     
				deferred.resolve(); //결과 보내기
			 }
		);
	}
    </script>
</head>
<body style="background-color: #f8f1f1;">
	<img src="/sbo/팝업이미지.jpg" width="383" height="361">
	<div class="wrap">
		<ul class="pdfArea" style="text-align: center;background-color: #fff;">
			  <li style="text-align: center;">
			  	<div style="font-size:2rem;padding-bottom: 30px;padding-top: 30px;">
			  	하나피자홀릭<small>(월간매출 보고서)</small></div>
			  	<!-- 주중매출현황 -->
			  	<div style="width: 700px; height: 300px; display: inline-block;border:solid #d9d2d2 1px;">
					<canvas id="myChart1" width="700" height="300"></canvas>
				</div>
			  </li>
			  <br><br><br>
			  
			  <li style="text-align: center;">
			  	<div style="font-size:2rem;padding-bottom: 30px;padding-top: 30px;">
			  	<div style="width: 700px; height: 300px; display: inline-block;border:solid #d9d2d2 1px;">
					<canvas id="myChart2" width="700" height="300"></canvas>
				</div>
			  </li>
			  
			  <li style="text-align: center;">
			  	<div style="font-size:2rem;padding-bottom: 30px;padding-top: 30px;">
			  	<div style="width: 700px; height: 300px; display: inline-block;border:solid #d9d2d2 1px;">
					<canvas id="myChart3" width="700" height="300"></canvas>
				</div>
			  </li>
			  
			  <li style="text-align: center;">
			  	<div style="font-size:2rem;padding-bottom: 30px;padding-top: 30px;">
			  	<div style="width: 700px; height: 300px; display: inline-block;border:solid #d9d2d2 1px;">
					<canvas id="myChart4" width="700" height="300"></canvas>
				</div>
			  </li>
			  
			  <li style="text-align: center;">
			  	<div style="font-size:2rem;padding-bottom: 30px;padding-top: 30px;">
			  	<div style="width: 700px; height: 300px; display: inline-block;border:solid #d9d2d2 1px;">
					<canvas id="myChart5" width="700" height="300"></canvas>
				</div>
			  </li>
<!-- 			  <li style="text-align: center;">
			  	<div style="width: 700px; height: 300px; display: inline-block;border:solid #d9d2d2 1px;">
					<canvas id="myChart2" width="700" height="300"></canvas>
				</div>	
			  </li>
 			  <li style="text-align: center;">
			  	  <div style="width: 350px; height: 350px;float:left;margin-left: 30px;">
					 <canvas id="myChart3" width="350" height="350"></canvas>
				  </div>
			  </li>
			  
			  <li style="text-align: center;">
			  	  <div style="width: 350px; height: 350px;float:left;margin-left: 30px;">
					 <canvas id="myChart3" width="350" height="350"></canvas>
				  </div>
			  </li> -->
			  			<!--   	 <div style="width: 700px; margin-top:30px; height: 300px; display: inline-block;border:solid #d9d2d2 1px;">
					 <canvas id="myChart5" width="700" height="300"></canvas>
				 </div> -->
		</ul>
	</div>
</body>
<script type="text/javascript">

	
let ctx1 = document.getElementById('myChart1').getContext('2d');
let myChart1 = new Chart(ctx1, {
    type: 'bar',
    data: {
        labels: ['일', '월', '화', '수', '목', '금', '토'],
        datasets: [{
            label: '주중매출현황',
            data: [130000, 432230, 178900, 280000, 312400, 378000, 507687],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        },
        animation: {
            duration: 0
        }
    }
});


let ctx2 = document.getElementById('myChart2').getContext('2d');
let myChart2 = new Chart(ctx2, {
    type: 'bar',
    data: {
        labels: ['10월1주', '10월2주', '10월3주', '10월4주'],
        datasets: [{
            label: '주간매출현황',
            data: [1307000, 1850000, 1137050, 2316000],
            backgroundColor: [
                'rgba(255, 255, 051, 0.2)',
                'rgba(153, 153, 000, 0.2)',
                'rgba(102, 102, 000, 0.2)',
                'rgba(153, 102, 255, 0.2)',
            ],
            borderColor: [
                'rgba(255, 255, 051, 0.2)',
                'rgba(153, 153, 000, 0.2)',
                'rgba(102, 102, 000, 0.2)',
                'rgba(153, 102, 255, 0.2)',
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        },
        animation: {
            duration: 0
        }
    }
});



new Chart(document.getElementById("myChart3"), {
    type: 'line',
    data: {
        labels: ['22/10/16', '22/10/17', '22/10/18', '22/10/19', '22/10/20', '22/10/21', '22/10/22','22/10/23'],
        datasets: [{
            label: '주중방문자수',
            data: [
                5,
                10,
                7,
                18,
                22,
                26,
                37,
                20
            ],
            borderColor: "rgba(255, 201, 14, 1)",
            backgroundColor: "rgba(255, 201, 14, 0.5)",
            fill: true,
            lineTension: 0
        }]
    },
    options: {
        responsive: true,
        title: {
            display: true,
            text: '라인 차트 테스트'
        },
        animation: {
            duration: 0
        },
        tooltips: {
            mode: 'index',
            intersect: false,
        },
        hover: {
            mode: 'nearest',
            intersect: true
        },
        scales: {
            xAxes: [{
                display: true,
                scaleLabel: {
                    display: true,
                    labelString: 'x축'
                }
            }],
            yAxes: [{
                display: true,
                ticks: {
                    suggestedMin: 0,
                },
                scaleLabel: {
                    display: true,
                    labelString: 'y축'
                }
            }]
        }
    }
});

let ctx4 = document.getElementById('myChart4').getContext('2d');
let myChart4 = new Chart(ctx4, {
    type: 'bar',
    data: {
        labels: ['불고기 피자', '포테이토 피자', '고구마 피자', '페퍼로니 피자'],
        datasets: [{
            label: '주간 가장 많이 팔린 메뉴',
            data: [20, 37, 14, 22],
            backgroundColor: [
                'rgba(75, 192, 192, 0.2)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderColor: [
                'rgba(75, 192, 192, 0.2)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        },
        animation: {
            duration: 0
        }
    }
});

let ctx5 = document.getElementById('myChart5').getContext('2d');
let myChart5 = new Chart(ctx5, {
    type: 'bar',
    data: {
        labels: ['일', '월', '화', '수', '목', '금', '토'],
        datasets: [{
            label: '요일별 평균결제금액',
            data: [104429, 95000, 114432, 108933, 213392, 347000, 124340],
            backgroundColor: [
                'rgba(153, 102, 000, 0.4)',
                'rgba(255, 204, 000, 0.4)',
                'rgba(255, 204, 153, 0.4)',
                'rgba(102, 051, 051, 0.4)',
                'rgba(153, 102, 102, 0.4)',
                'rgba(204, 102, 102, 0.4)'
            ],
            borderColor: [
                'rgba(153, 102, 000, 0.4)',
                'rgba(255, 204, 000, 0.4)',
                'rgba(255, 204, 153, 0.4)',
                'rgba(102, 051, 051, 0.4)',
                'rgba(153, 102, 102, 0.4)',
                'rgba(204, 102, 102, 0.4)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        },
        animation: {
            duration: 0
        }
    }
});


</script>
<script type="text/javascript">
	function pdfToMail(pdf){
		var formData = new FormData(); 
		formData.append('pdf', pdf); 
		//console.log("1 :   "+aa);
 		$.ajax({
            url:"/aaaaa",
            method: 'POST', 
        	data: formData, 
        	processData: false, 
        	contentType: false, 	
            success:function(result){
            	console.log(result.su);
            }
   		}); 
	}

</script>
</html>