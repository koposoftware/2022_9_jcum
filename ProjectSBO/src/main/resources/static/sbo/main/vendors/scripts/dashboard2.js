let data ={
	noData: "1"
}
//let per;
$.ajax({
	url: "/salesGraph",
	data: data,
	type: "post",
	dataType: "json",
	async: false,

	success: function(resp) {
		let per;
		let sum;
		let salesCntper;
		let salesWeekSum = 0;
		let salesTwoWeekSum = 0;
		let salesWeekper;
		
		console.log(resp);
		if(resp.Date[0].CNT > resp.Date[1].CNT){
			per = resp.Date[0].CNT - resp.Date[1].CNT /100;
		}else{
			per = resp.Date[1].CNT - resp.Date[0].CNT /100;
		}
		if(resp.Date[0].SUM > resp.Date[1].SUM){
			sum = (resp.Date[0].SUM - resp.Date[1].SUM) / resp.Date[1].SUM * 100;
			//sum = (resp.Date[0].SUM - resp.Date[1].SUM) / 
		}else{
			sum = (resp.Date[1].SUM - resp.Date[0].SUM) / resp.Date[0].SUM * 100;
		}
		if(resp.salesCnt[0].CNT + resp.salesCnt[1].CNT > resp.salesCnt[2].CNT + resp.salesCnt[3].CNT){
			salesCntper =((resp.salesCnt[0].CNT + resp.salesCnt[1].CNT) - (resp.salesCnt[2].CNT + resp.salesCnt[3].CNT))/100;
		}else{
			salesCntper =((resp.salesCnt[2].CNT + resp.salesCnt[3].CNT) - (resp.salesCnt[0].CNT + resp.salesCnt[1].CNT))/100;
		}
		
		$("#orderCnt").text("어제 결제건수 "+resp.Date[1].CNT + "건");
		$("#pastCnt").text(per+"%");
		$("#pastCnt").attr("data-perValue",per);
		
		$("#orderSum").text("어제 결제 금액 "+resp.Date[1].SUM + "만");
		$("#pastSum").text(parseInt(sum)+"%");
		$("#pastSum").attr("data-perSumValue",parseInt(sum));
		
		$("#salesCnt").text("오전 "+resp.salesCnt[2].CNT + "건"+" / "+"오후 "+resp.salesCnt[3].CNT + "건");
		$("#salesCnt").text(salesCntper+"%");
		$("#salesCnt").attr("data-perCnt",salesCntper);
		
		for(let i = 0; i < resp.salesWeekSum.length; i++){
			salesWeekSum += parseInt(resp.salesWeekSum[i].SUM);
		}
		for(let i = 0 ; i < resp.salesTwoWeekSum.length; i++){
			salesTwoWeekSum += parseInt(resp.salesTwoWeekSum[i].SUM);
		}
		//console.log(salesWeekSum);
		//console.log(salesTwoWeekSum);
		//(resp.Date[0].SUM - resp.Date[1].SUM) / resp.Date[1].SUM * 100;
		if(salesWeekSum > salesTwoWeekSum){
			salesWeekper = (salesWeekSum - salesTwoWeekSum) / salesTwoWeekSum * 100;
		}else{
			salesWeekper = (salesTwoWeekSum - salesWeekSum) / salesWeekSum * 100;
		}
		$("#salesWeekSum").text("이번주 결제 금액 "+salesWeekSum + "만");
		$("#salesTwoWeekSum").text(salesWeekper.toFixed(1)+"%");
		$("#salesTwoWeekSum").attr("data-WeekSum",salesWeekper.toFixed(1));
		
	},
	error: function(request, status, error) {
		console.log(request.status);
		console.log(request.responseText);
		console.log(request.error);
	}
});
var article = document.getElementById('pastCnt');
var article1 = document.getElementById('pastSum');
var article2 = document.getElementById('salesCnt');
var article3 = document.getElementById('salesTwoWeekSum');

$(".dial1").knob();
var percentVal = article.getAttribute('data-perValue');
$({animatedVal: 0}).animate({animatedVal: percentVal}, {
	duration: 3000,
	easing: "swing",
	step: function() {
		$(".dial1").val(this.animatedVal).trigger("change");
		$(".dial1").val(percentVal+'%');
		$(".dial1").css("width","80px");
	}
});

$(".dial2").knob();
var percentVal1 = article1.getAttribute('data-perSumValue'); 
$({animatedVal: 0}).animate({animatedVal: percentVal1}, {
	duration: 3000,
	easing: "swing",
	step: function() {
		$(".dial2").val(Math.ceil(this.animatedVal)).trigger("change");
		$('.dial2').val(percentVal1+'%');
		$(".dial2").css("width","75px");
	}
});


$(".dial3").knob();
var percentVal2 = article2.getAttribute('data-perCnt'); 
$({animatedVal: 0}).animate({animatedVal: percentVal2 }, {
	duration: 3000,
	easing: "swing",
	step: function() {
		$(".dial3").val(Math.ceil(this.animatedVal)).trigger("change");
		$('.dial3').val(percentVal2+'%');
		$(".dial3").css("width","75px");
	}
});

$(".dial4").knob();
var percentVal3 = article3.getAttribute('data-WeekSum'); 
$({animatedVal: 0}).animate({animatedVal: percentVal3}, {
	duration: 3000,
	easing: "swing",
	step: function() {
		$(".dial4").val(Math.ceil(this.animatedVal)).trigger("change");
		$('.dial4').val(percentVal3+'%');
		$(".dial4").css("width","80px");
	}
});