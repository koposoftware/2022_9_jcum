$(document).ready(function() {
	
	$('div').remove('.mCSB_draggerRail');
	//$(".mCSB_draggerRail").css("display","none");

	// 리뷰 쓰기 버튼
	$(".analysis").click(function() {
		let modal;

		if ($(this).hasClass("analysis")) {
			modal = $(".sbizReport_modal");
		}
		openModal(modal);
	});
	
	
	$(".review_submit_btn").click(function(){
		$(".regi").attr("value",$("#b_no").text()).attr("disabled", true);
		closeModal();
	});
	
	$(".img_close").click(function(){
		imgClose();
	});

}); // ready
