<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<div id="modal_bg"></div>

<div class="order_accept_modal modal">

	<div id="modal_header">
		<button type="button" class="closeA">
			<i class="fa fa-times"></i>
		</button>
		<h3>주문내역</h3>
	</div>

	<div class="modal_box">
	<div style="padding:10px;">
		<span class="menu_name"
		style="font-size: 1.5rem;">메뉴 정보</span>
		
		<div class="menu">
			<ul class="listd" style="margin-left: 10px;">
			</ul>
		</div>
	</div>
		<div class="menu_dec"></div>
		<div class="price">
			<!-- <span>가격</span><span class="menu_price">0</span> -->
		</div>
		
		<span class="menu_name"
		style="font-size: 1.5rem;padding:10px;">주문자 정보</span>
		<br>
		
<!-- 		<div id="option">
			<h2>옵션 선택</h2>
		</div> -->
		<div class="delevery_address" style="display: inline-block;padding: 10px;margin-left: 10px;"></div>
		
		<br><br><br><br>
		

		
		<div id="btn_box">
			<div>
				<button class=closeB type="button">취소</button>
				<button class="accept" style="background: #008485;" type="button">접수하기</button>
			</div>
		</div>
	</div>

</div>