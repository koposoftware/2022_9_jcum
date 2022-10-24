
$(document).ready(function() {

	// 리뷰 쓰기 버튼
	$(".review").click(function() {
		let modal;

		if ($(this).hasClass("regi")) {
			modal = $(".review_modal");
		} else {
			modal = $(".review_modify_modal");
			
			const reviewContent = $(this).siblings(".review_content").val();
			const reviewScore = $(this).siblings(".review_score").val();
			const reviewImg = $(this).siblings(".review_img").val();
			
			$(".review_modify_modal textarea").val(reviewContent);
			$(".review_modify_modal .preview").attr("src", reviewImg);
			// 사진첨부가 안되었을땐 이미지 박스 안보이게 처리
			if(reviewImg != ""){
				$(".review_modify_modal .img_box div").css("display", "block");
			}
		}
		openModal(modal);

		const orderNum = $(this).siblings(".order_num").val();
		const storeId = $(this).siblings(".store_id").val();

		modal.find(".order_num").val(orderNum);
		modal.find(".store_id").val(storeId);
		
		
		
		// 별점주기
		let score = 0;
	
		$(".score_box i").off().click(function() {
			score = $(this).index() + 1;
				
			$(".score_box i").removeClass("fas");
			$(this).addClass("fas").prevAll().addClass("fas");
	
			modal.find(".score").val(score);
	
			inputCheck(modal);
		});
		
		
		
		$(".review_text textarea").off().keyup(function() {
			inputCheck(modal);
		})
		
		$(".img").change(function(e){
		
			var num = inputCheck(modal);
			if(num==="1"){
				const form = $("form")[1];
				const formdata = new FormData(form);
				console.log(form);
				console.log(formdata);
				$.ajax({
					url: "/loan/ocr",
					type: "POST",
					data: formdata,
					processData: false,
	            	contentType: false,
				})
				.done(function(result){
					checkNum(result);
				})
				.fail(function(data){
					alert("실패");
				})
				// OCR 처리
				
				imgPreview(e, $(this));	
			}else{
			
			}
		})
		
		function checkNum(num){
			console.log(num);
			var data = {
				"b_no": [num] // 사업자번호 "xxxxxxx" 로 조회 시,
			};

			$.ajax({
				url: "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=Sc6DIOJG8mK8fs5ME9KRZnWivhWM74R9ALjIiW%2Bd21bMxAxgpPy3lTFmVgWOVaI9XjcCqYzJSJkSKnQO2YXdtA%3D%3D",  
				type: "POST",
				data: JSON.stringify(data), // json 을 string으로 변환하여 전송
				dataType: "JSON",
				contentType: "application/json",
				accept: "application/json",
				success: function(result) {
					let dataSet = result.data[0]; 
					if(result.status_code == 'OK'){
						console.log(dataSet);
						if(dataSet.b_stt_cd == '01'){
							alert('정상조회하였습니다.');
							$("#info").attr('style',"display:inline;");
							$("#info").attr('style',"margin-left:50px;");
							$("#info").append("<br><div id=b_no> 사업자 번호: "+ dataSet.b_no + "</div>");
							$("#info").append("<div> 납세자상태: "+ dataSet.b_stt + "</div>");
							$("#info").append("<div> 과세유형: "+ dataSet.tax_type + "</div><br>");
						}else{
							alert('휴업 또는 페업한 사업자 입니다.');
						}
					}
					/*
					$.each(jsonData, function(key, value) {
						alert(jsonData[key].tax_type);
					});
					*/
					
				},
				error: function(result) {
					//console.log(result.responseText); //responseText의 에러메세지 확인
					alert(result.responseText);
				}
			});
		}
		
			
		
		
		// 리뷰 작성, 별점 체크 했는지 확인
		function inputCheck(modal) {
			//let text = modal.find(".review_text textarea").val();
			//let score = modal.find(".score").val();
    		var fileCheck = document.getElementById("img").value;
    		
    		if(fileCheck){
				//modal.find(".review_submit_btn").attr("disabled", false);
				//modal.find(".review_submit_btn").css("background", "#30DAD9");
				$(".review_submit_btn").attr("disabled", false);
				$(".review_submit_btn").css("background", "#30DAD9");
				
				return "1";
			}else{
				$(".review_submit_btn").css("background", "#ddd");
				$(".review_submit_btn").attr("disabled", true);
				return "0";
			}
			
			/*
			if(text.length == 0 || score == "" || score == null) {
				modal.find(".review_submit_btn").css("background", "#ddd");
				modal.find(".review_submit_btn").attr("disabled", true);
			} else {
				modal.find(".review_submit_btn").attr("disabled", false);
				modal.find(".review_submit_btn").css("background", "#30DAD9");
			}
			*/
		}
	});
	



/*
	$(".img").change(function(e){
		
		var num = inputCheck(modal);
		if(num==="1"){
			imgPreview(e, $(this));								
		}else{
			
		}
	})
	*/
	
	$(".review_submit_btn").click(function(){
		$(".regi").attr("value",$("#b_no").text()).attr("disabled", true);
		closeModal();
	});
	
	$(".img_close").click(function(){
		imgClose();
	})

	$(".order_detail").click(function() {
		const orderNum = $(this).siblings(".order_num").val();
		location.href = "/orderListDetail/" + orderNum;
	});

}); // ready
