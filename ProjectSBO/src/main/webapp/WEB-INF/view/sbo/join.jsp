<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=2.0, minimum-scale=1.0, user-scalable=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>하나 상생 플랫폼 가입</title>
    <!-- alte -->
    <link rel="stylesheet" href="/sbo/join/alte/plugins/all.min.css">
    <link rel="stylesheet" href="/sbo/join/alte/css/adminlte.min.css">
    <!-- alte end -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=78dda96aa5d04a5a3967ffc71767a03e"></script>

    <link rel="stylesheet" type="text/css" href="/sbo/join/css/reset.css" />
    <link rel="stylesheet" type="text/css" href="/sbo/join/css/style.css" />
    <link rel="stylesheet" type="text/css" href="/sbo/join/css/jquery-ui.css">
	<script type="text/javascript" language="javascript" src="/sbo/join/js/common.js"></script>
    <script src="/sbo/join/js/jquery-1.11.3.min.js"></script>
    <script src="/sbo/join/js/jquery-ui.js"></script>
    <script src="/sbo/join/js/jquery-ui.touch.js"></script>
    <script src="/sbo/join/js/ui.js"></script>
</head>
<body>

<div id="header" class="header-new">
    <h1>하나 상생 플랫폼 가입</h1>
</div>


<div id="container">
    <div class="caution caution2">
			<span>별도의 의무 가입비나 약정비, 의무 가입기간은 없으며,</span><br />
			<span>가맹점 가입 신청 후, 영업일 기준 1~2일 이내로 승인처리됩니다.</span><br class="mobile" />
			<span class="mmt-10 block">가입 문의는 1522-4040(365일/24시간)으로 문의 부탁드립니다.</span>
    </div>
	<div class="gray-area2 mb-4 text-left">
		<ul>
			<li>ㆍ 고객이 배달앱에서 주문/PG결제를 하면, POS 앱에서 상점이 직접 주문건을 확인/처리할 수 있습니다.</li>
			<li>
				ㆍ 주문직후/ 주문처리중/ 주문완료/ 주문취소 상태마다 배달앱으로 고객에게 푸시가 자동 발송 됩니다.
			</li>
<!-- 			<li class="txt-red">
				ㆍ 주문(판매)를 위한 PG연결을 위해서는 사업자 등록이 필요합니다.
			</li> -->
		</ul>
	</div>
    <div class="join-step">
        <ul>
            <li class="step1 on" style='width:50%'><em>1</em><br />약관동의</li>
            <li class="step2 on" style='width:50%'><em>2</em><span></span><br />개인정보/상점정보 입력</li>
        </ul>
    </div>

	<form id="form1" enctype="multipart/form-data" action="/sbo/actionJoin"
	 accept-charset="UTF-8" method="post">
		<input type="hidden" name='auth_code' id="auth_code"/>
		<input type="hidden" name="extra" value="">
		<input type="hidden" name="region" value="1">
		<input type="hidden" name="type" value="save">
		<input type="hidden" name="use_alert_order" value="1">
		<input type="hidden" name="biz_num" value="">
	
		<div class="terms-wrap first">
			<p class="tit txt-red">필수 입력 *</p>
			<h2>아이디</h2>
			<ul class="frm">
				<li>
					<input type="text" autocomplete="username" placeholder="한글/영어/숫자, 2자~12자" id="login_id" name="login_id" maxlength='20' oninput="maxLengthCheck(this);" tabindex='1' />
					<p></p>
				</li>
			</ul>
			<h2>비밀번호</h2>
			<ul class="frm">
				<li>
					<input type="password" autocomplete="new-password" placeholder="영문 / 숫자 / 특문 중에서 2가지 이상 조합, 8자 이상" id="pw" maxlength='20' oninput="maxLengthCheck(this);" name="pw" tabindex='2'/>
				</li>
				<li>
					<input type="password" autocomplete="new-password" placeholder="비밀번호 재입력" id="pw_confirm" name="pw_confirm" maxlength='20' oninput="maxLengthCheck(this);" tabindex='3'/>
					<p></p>
				</li>
			</ul>
			<h2>성명</h2>
			<ul class="frm">
				<li>
					<input type="text" placeholder="이름 또는 담당자명" id="owner_name" name="owner_name" maxlength='20' oninput="maxLengthCheck(this);" tabindex='4' />
				</li>
			</ul>

			<h2>업종 / 상점명</h2>
			<ul class="frm">
				<li>
					<select id="category" name="category" tabindex='6'>
						<option value=''>업종 선택</option>
								<option value="36">카페/디저트</option>
								<option value="37">한식</option>
								<option value="38">분식</option>
								<option value="39">일식/회</option>
								<option value="40">양식/돈까스</option>
								<option value="41">중식</option>
								<option value="100">피자</option>
								<option value="101">치킨</option>
								<option value="43">족발/보쌈</option>
								<option value="45">찜/탕</option>
								<option value="46">도시락</option>
					</select>
				</li>
				<li>
					<input type="text" id="storeName" name="storeName" placeholder="운영하는 상점명 입력" maxlength='20' oninput="maxLengthCheck(this);" tabindex='7' />
				</li>
			</ul>

			<h2>상점 주소</h2>
			<ul class="frm">
				<li class="term-right">
<!-- 					<input type="text" id="addr1" name="addr1" placeholder="찾기 버튼으로 주소 등록" tabindex="9" readonly>
					<a href="#" class="btn btn-cpink p-0 btn-red"
					 onclick="modifyAddress()"
					 data-toggle="modal" data-target="#addrLayer" >찾기</a> --> <!--  addrLayer  btn-layer-open-->
					 
					<div>
							
							
							<input class="address1" type="text" id="addr1" name="addr1" placeholder="찾기 버튼으로 주소 등록" tabindex="9" readonly>
							<button type="button" class="btn btn-cpink p-0 btn-red"
								onclick="modifyAddress()" id="delevery_modify">찾기</button>


							<input type="hidden" id="sample2_extraAddress" placeholder="참고항목"
								readonly>


							<!-- iOS에서는 position:fixed 버그가 있음, 
							적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
							<div id="layer"
								style="display: none; position: fixed; overflow: hidden;
								z-index: 2; -webkit-overflow-scrolling: touch;">
								<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
									id="btnCloseLayer"
									style="cursor: pointer; position: absolute; right: -3px;
									 top: -3px; z-index: 1"
									onclick="closeDaumPostcode()" alt="닫기 버튼">
							</div>

							<script
								src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

							<script>
								// 우편번호 찾기 화면을 넣을 element
								var element_layer = document.getElementById('layer');

								function closeDaumPostcode() {
									// iframe을 넣은 element를 안보이게 한다.
									element_layer.style.display = 'none';
								}

								function modifyAddress() {
									new daum.Postcode(
											{
												oncomplete : function(data) {
													// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

													// 각 주소의 노출 규칙에 따라 주소를 조합한다.
													// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
													var addr = ''; // 주소 변수
													var extraAddr = ''; // 참고항목 변수

													//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
													if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
														addr = data.roadAddress;
													} else { // 사용자가 지번 주소를 선택했을 경우(J)
														addr = data.jibunAddress;
													}

													// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
													if (data.userSelectedType === 'R') {
														// 법정동명이 있을 경우 추가한다. (법정리는 제외)
														// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
														if (data.bname !== ''
																&& /[동|로|가]$/g
																		.test(data.bname)) {
															extraAddr += data.bname;
														}
														// 건물명이 있고, 공동주택일 경우 추가한다.
														if (data.buildingName !== ''
																&& data.apartment === 'Y') {
															extraAddr += (extraAddr !== '' ? ', '
																	+ data.buildingName
																	: data.buildingName);
														}
														// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
														if (extraAddr !== '') {
															extraAddr = ' ('
																	+ extraAddr
																	+ ')';
														}
														// 조합된 참고항목을 해당 필드에 넣는다.
														document
																.getElementById("sample2_extraAddress").value = extraAddr;

													} else {
														document
																.getElementById("sample2_extraAddress").value = '';
													}

													// 우편번호와 주소 정보를 해당 필드에 넣는다.
													$("#storeAddress1").val(
															data.zonecode);
													$("#storeAddress2").val(
															addr);

													// 추가
													console
															.log("data.zonecode = "
																	+ data.zonecode);
													console.log("addr = "
															+ addr);

													$.ajax({
														url : "/addressModify",
														data : {
																address1 : data.zonecode,
																address2 : addr
														},
														type : "post",
														success : function() {
														//$(".address1").text(addr);
														$(".address1").val(addr);
														address1 = data.zonecode;
														},
														fail : function() {
															alert("실패");
														}
													})
													// 추가

													// 커서를 상세주소 필드로 이동한다.
													/* document.getElementById("deleveryAddress3").focus(); */

													$("#deleveryAddress3").focus();
													// iframe을 넣은 element를 안보이게 한다.
													// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
													element_layer.style.display = 'none';

												},
												width : '100%',
												height : '100%',
												maxSuggestItems : 5
											}).embed(element_layer);

									// iframe을 넣은 element를 보이게 한다.
									element_layer.style.display = 'block';

									// iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
									initLayerPosition();
								}

								// 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
								// resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
								// 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
								function initLayerPosition() {
									var width = 300; //우편번호서비스가 들어갈 element의 width
									var height = 400; //우편번호서비스가 들어갈 element의 height
									var borderWidth = 1; //샘플에서 사용하는 border의 두께

									// 위에서 선언한 값들을 실제 element에 넣는다.
									element_layer.style.width = width + 'px';
									element_layer.style.height = height + 'px';
									element_layer.style.border = borderWidth
											+ 'px solid';
									// 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계다.
									element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width) / 2 - borderWidth)
											+ 'px';
									element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height) / 2 - borderWidth)
											+ 'px';
								}
							</script>
						</div> 
						
					<!-- deleveryAddress1 -->
				<input type="hidden" id="storeAddress1" value="" name="storeAddress1"> 
				<input type="hidden" id="storeAddress2" value="" name="storeAddress2"> 
				
				</li>
				
				<li>
				<div class="input_area">
					<input type="text" placeholder="나머지 상세 주소 입력" 
					id="storeAddress3" maxlength="100" value=""  name="storeAddress3"> 
				</div>
				
				</li>
			</ul>
<!-- 			<h2>휴대폰번호 인증</h2>
			<ul class="frm">
				<li class="term-right">
					<input type="tel" id='phone' placeholder="휴대폰 번호(숫자로만 입력)" name="phone" tabindex='11' maxlength='13' oninput="maxLengthCheck(this); onlyPhoneAuto(this);" />
					<a href="#" class="btn btn-cpink p-0 btn-red" id='btn_phone_send'>인증번호 발송</a>
				</li>
				<li class="term-right">
					<input type="number" id='phone_auth' placeholder="인증번호(4자리)" tabindex='12' maxlength='4' oninput="maxLengthCheck(this);"/>
					<a href="#" class="btn btn-cpink p-0 btn-red" id="btn_phone_auth">인증 확인</a>
					<p class="txt-blue"></p>
				</li>
			</ul> -->
			<h2>상점 전화번호</h2>
			<ul class="frm">
				<li>
					<input type="tel" id="storePhone" name="storePhone" placeholder="지역번호 포함하여 입력" tabindex='13' maxlength='12' oninput="maxLengthCheck(this); onlyPhone(this);"/>
				</li>
			</ul>
			<h2>대표 이메일</h2>
			<ul class="frm">
				<li>
					<input type="text" id="email" name="email" placeholder="대표 이메일을 입력" tabindex='14' maxlength='30' oninput="maxLengthCheck(this);"/>
					<p></p>
				</li>
			</ul>
			<h2><strong>사업자 등록 번호</strong></h2>
			<ul class="col4 input mmt-10 frm">
				<li class="term-right" style='display: inline-block;'>
					<input type="text" id="biz_num1" name="biz_num1" maxlength="3" tabindex='15' />
					<span>-</span>
					<input type="text" id="biz_num2" name="biz_num2" maxlength="2" tabindex='16'/>
					<span>-</span>
					<input type="text" id="biz_num3" name="biz_num3" maxlength="5" tabindex='17' />
					<a href="#" class="btn btn-cpink p-0 btn-red" id="btn_biz_num">중복확인</a>
				</li>
				<li class='mt-0' style='display: inline-block; display:none'>
					<p  class="txt-blue mt-0"></p>
				</li>
			</ul>
			<h2>사업자등록증 사본 <span>(JPG, JPEG, PNG 이미지 파일 첨부)</span></h2>
			<ul class="frm">
				<li class="term-right">  
					<input type="text" class="biz_num_file_txt" readonly/>
					<span class="btn btn-cpink p-0 btn-red abs-right">
					<input type="file" name="file" id="img" class="img" >
					첨부파일
					</span>
					
					<!-- <input type="file" name="biz_num_file" id="biz_num_file" accept="image/*"/>첨부파일</span> -->
				</li>
			</ul>
		</div>

		<div class="terms-wrap">
			<p class="tit">추가 입력</p>
			<h2>상점 대표 사진 <span>(1200 X 1200 이상 권장, 2M이하 용량)</span></h2>
			<ul class="frm">
				<li class="file-wrap on">
					<img id="preview_img" src="/sbo/join/img/tmp_none.gif" style="display:none">
					<a href="#" class="btn_img_del">삭제</a>
					<input type="hidden" name="del_img" class="delimg">
					
					<!-- <input type="file" name="img" id="upload_img" accept="image/*"/> -->
					<span></span>
				</li>
			</ul>
<!-- 			<h2>상점 한 줄 소개</h2>
			<ul class="frm">
				<li>
					<input type="text" id="intro" name="intro" maxlength="20" placeholder="20자 이내로 입력" />
				</li>
			</ul> -->
			<h2>상점 소개 내용</h2>
			<ul class="frm">
				<li>
					<textarea id="storeDes" name="storeDes" placeholder="200자 이내로 입력" maxlength='200' oninput="maxLengthCheck(this);"></textarea>
				</li>
			</ul>

			<h2>영업시간</h2>
			<ul class="col4 input mmt-10 frm">
				<li class="term-right" style='display: inline-block;'>
				<input type="text" id="openingTime" name="openingTime" maxlength="2" tabindex='15' />
				 	<span>~</span>
				<input type="text" id="closingTime" name="closingTime" maxlength="2" tabindex='16' />
				</li>
				<li class='mt-0' style='display: inline-block; display: none'>
 					<p class="txt-blue mt-0"></p>
				</li>
			</ul>
				<!-- 			<div class="hdr">
				<h2>홈페이지 주소</h2>
			</div>
			<ul class="frm">
				<li>
					<input type="text" id="url" name="url" maxlength="200" placeholder="http://" />
				</li>
			</ul> -->

				<!-- <h2>추천 상점</h2> -->
<!-- 				<ul class="frm" style="display: none;">
					<li>
						<div class="recommendCon">
							<strong>해당 정보는 당사 서비스 이용 시까지 보관될 수 있음에 동의합니다.<span class="addTxt">(동의 시 입력 창이 나타납니다.)</span></strong>
							<div class="recommendBox">
								<input type="checkbox" id="recommendCheck" name="recommendCheck" autocomplete="off">
								<label for="recommendCheck">동의</label>
							</div>
						</div>
					</li>
					<li class="mt0">
						<div class="recommendDetail">
							<input type="text" name="recommend_shop" placeholder="추천 상점명 입력(20자 이내)" maxlength="20"/>
							<input type="tel" name="recommend_tel" placeholder="추천 상점 매장대표번호(20자 이내)" maxlength="20" oninput="onlyPhone(this);"/>
							<ul class="detailTxt">
								<li><span>*</span>동일 상호 상점명 추천 시 구분을 위하여 추천하고자 하는 상점의 대표번호를 입력해주세요.</li>
								<li><span>*</span>개인 연락처가 아닌 추천하고자 하는 상점의 대표번호를 입력해주세요.</li>
							</ul>
						</div>
					</li>
				</ul> -->
		</div>
		
		<div class="btn-wrap">
			<a href="#" class="btn-gray radius0 btn_back"><span>이전 단계로</span></a>
			<a href="#" class="btn-orange radius0" id="btn_join"><span>가입하기</span></a>
		</div>
</form></div>


<div class="modal fade clayer-wrap" id="confirm1" tabindex="-1" role="dialog" aria-labelledby="confirm1Label" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered " role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="confirm1Label"><strong>주의</strong></h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
                입력한 모든 정보가 지워집니다.
			</div>
            <div class="modal-footer">
                <a href="#" class="btn btn-secondary btn-block  btn-lg w-25" data-dismiss="modal" aria-label="Close">취소</a>
                <a href="/sbo/agree" style="background-color: #008485;border-color: #008485;" class="btn btn-cpink btn-block btn-lg mt-0">이전 단계로</a>
			</div>
		</div>
	</div>
</div>

<div class="modal fade clayer-wrap" id="addrLayer" tabindex="-1" role="dialog" aria-labelledby="addrLayerLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="addrLayerLabel"><strong>주소 찾기</strong></h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="tab">
					<label><input type="radio" name='addr_type' value="old" checked /> <span>지번 검색</span></label>
					<label><input type="radio" name='addr_type' value="" /> <span>도로명 검색</span></label>
				</div>
				<div class="address">
					<div class="search">
						<input type="text" value="" id='search_addr'/>
						<a class="btn" href="#" id="btn_search_addr">검색</a>
					</div>
					<p class="txt"> </p>
					<ul class="result">
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal fade clayer-wrap" id="locationLayer" tabindex="-1" role="dialog" aria-labelledby="locationLayerLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="locationLayer"><strong>위치 지정</strong></h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="lcont">
					<p class="txt-c">원하는 위치로 드래그하여 지정하셔도 됩니다.</p>
					<div class='map' id='map' style='height:292px;'></div>
				</div>
			</div>
			<div class="modal-footer">
				<div class="btns w-100 text-center">
					<a href="#" class="btn btn-secondary p-0 mr-2 btn-gray" data-dismiss="modal" aria-label="Close">취소</a>
					<a href="#" class="btn btn-cpink p-0 btn-orange" id="btn_apply">적용하기</a>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	// 데이터가 있는것만 리턴함(object)
	var getValidFormData = function(e){
		var valid_arr = $("input, textarea").map(function(){
							if ($(this).val()) {
								var obj = {};
								obj[this.id] = $(this).val();
								return obj;
							}
						}).get();
		return valid_arr;
	};

	$(function(e) {
		// 이전 단계로
		$('.btn_back').on('click', function(e) {
			e.preventDefault();

			var region = $("input[name='region']").val();

			var url = "/sbo/agree";
			if (region == "2") {
				url = "/gonggong/kangwon_agree";
			} 
			else if (region == "3") {
				url = "/gonggong/jeonju_agree";
			}

			// 값이 있는경우 체크
			var inputdata = getValidFormData();

			if (inputdata.length < 5) {
				location.href = url;
			} else {
				$("#confirm1").find('.modal-footer a').last().attr('href', url);
				$("#confirm1").modal('show', true);
			}
		});

		// 휴대폰 인증번호 발송
/* 		$("#btn_phone_send").click(function(e) {
			e.preventDefault();

			var phone = $.trim($("#phone").val());

			if(phone.length < 1) {
				alert("휴대폰번호를 입력하세요.");
				$("#phone").val('');
				$("#phone").focus();
				return false;
			}

			$.ajax({
				url: "/shops/auth_sms",
				method: "POST",
				data: { phone: phone }
			}).done(function(res) {
				if (res.result) {
					alert("인증번호가 전송되었습니다.");
					document.is_send = true;
					window.phone = phone;
					$("#phone_auth").focus();
				}
				else {
					alert(res.msg);
				}
			}).fail(function(jqXHR, textStatus, errorThrown) {
				alert("인증번호가 전송 실패");
			});
		});

		$("#phone").on('keyup', function(e) {
			window.phone = $(this).val();
		});

		// 휴대폰 인증번호 확인
		$("#btn_phone_auth").click(function(e) {
			e.preventDefault();

			var _this = $(this);
			var phone = $.trim(window.phone);
			var auth = $.trim($("#phone_auth").val());
			
			if (auth.length < 1) {
				alert("인증번호를 입력하세요.");
				$("#phone_auth").val('');
				$("#phone_auth").focus();
				return false;
			}

			if (document.is_send != true) {
				alert("인증번호를 발송하세요.");
				return false;
			}

			$.ajax({
				url: "/shops/auth_sms_check",
				method: "POST",
				data: { phone: phone, auth: auth }
			}).done(function(res) {
				if (res.result) {
					alert("인증되었습니다.");
					_this.parent().find('.txt-blue').text("휴대폰 번호 인증완료!");
					
					$("#id").val(res.id);
					$("#auth_code").val(res.auth_code);

					document.auth = true;
				}
				else {
					alert(res.msg);
				}
			}).fail(function(jqXHR, textStatus, errorThrown) {
				alert("인증확인 오류");
			});

		}); */

		$("#biz_num1, #biz_num2, #biz_num3").on('keyup', function(e) {
			document.biz_num_auth = false;
			$(this).parent().parent().find('li').last().css('display','none');
			$(this).parent().parent().find('li').last().find('p').text("");
		});

		// 사업자번호 중복체크
		$("#btn_biz_num").click(function(e) {
			e.preventDefault();

			var _this = $(this);
			var biz_num1 = $.trim($("#biz_num1").val());
			var biz_num2 = $.trim($("#biz_num2").val());
			var biz_num3 = $.trim($("#biz_num3").val());
			
			if(biz_num1.length < 3) {
				alert("사업자 등록 번호를 확인하세요.");
				$("#biz_num1").focus();
				return false;
			}
			if(biz_num2.length < 2) {
				alert("사업자 등록 번호를 확인하세요.");
				$("#biz_num2").focus();
				return false;
			}

			if(biz_num3.length < 5) {
				alert("사업자 등록 번호를 확인하세요.");
				$("#biz_num3").focus();
				return false;
			}

			var biz_num = biz_num1 + biz_num2 + biz_num3;
			$.ajax({
				url: "/gonggong/check_biz_num",
				method: "GET",
				data: { biz_num : biz_num }
			}).done(function(res) {
				if (res.result) {
					alert("등록 가능한 사업자번호입니다.");

					document.biz_num_auth = true;
					_this.parent().parent().find('li').last().css('display','');
					_this.parent().parent().find('li').last().find('p').removeClass('txt-red').addClass('txt-blue').text("사용가능 합니다.");
				}
				else {
					document.biz_num_auth = false;
					_this.parent().parent().find('li').last().css('display','');
					_this.parent().parent().find('li').last().find('p').addClass('txt-red').removeClass('txt-blue').text(res.msg);
					alert(res.msg);
				}
			}).fail(function(jqXHR, textStatus, errorThrown) {
				alert("사업자번호 중복 확인 오류");
			});

		});

		//아이디 유효성 체크
		$("#login_id").change(function(e) {
			var _this = $(this);
			var login_id = _this.val();

			var regexp = /^[가-힣a-zA-Z0-9]{2,12}$/;
			if (!regexp.test( login_id )) {
				_this.parent().find('p').removeClass('txt-blue').addClass('txt-red').text("한글/영문/숫자, 2~12자로 입력하세요.");
			}
			else {
				// 중복 체크
				$.ajax({
					url: "/shops/loginid_check",
					method: "POST",
					data: { login_id : login_id }
				}).done(function(res) {
					if (res.result) {
						_this.parent().find('p').removeClass('txt-red').addClass('txt-blue').text("사용 가능합니다.");
					}
					else {
						_this.parent().find('p').removeClass('txt-blue').addClass('txt-red').text(res.msg); //"중복되는 ID입니다."
					}
				});
			}
		});
		
		//비밀번호 유효성 체크
		$("#pw").change(function(e) {
			if (!chkPwd($(this).val())) {
				$(this).parent().parent().find('p').removeClass('txt-blue').addClass('txt-red').text("비밀번호는 영문/숫자/특문 중에서 2가지 이상조합으로 8자 이상 입력하셔야 합니다.");
			} else {
				$(this).parent().parent().find('p').removeClass('txt-red').addClass('txt-blue').text("사용가능 합니다.");
			}
		});

		$("#pw_confirm").change(function(e) {
			if ( $(this).val().length < 1 ) {
				return false; 
			}

			if ($(this).val() != $("#pw").val() ) {
				$(this).parent().find('p').removeClass('txt-blue').addClass('txt-red').text("두 개의 비밀번호가 일치하지 않습니다.");
				return false;
			}

			if (!chkPwd($(this).val()))
			{
				$(this).parent().parent().find('p').removeClass('txt-blue').addClass('txt-red').text("비밀번호는 영문/숫자/특문 중에서 2가지 이상조합으로 8자 이상 입력하셔야 합니다.");
			}
			else
			{
				$(this).parent().parent().find('p').removeClass('txt-red').addClass('txt-blue').text("사용가능 합니다.");
			}
			
		});

		//이메일 유효성 체크
		$("#email").change(function(e) {			
			if (!ck_email($(this).val())) {
				$(this).parent().parent().find('p').removeClass('txt-blue').addClass('txt-red').text("이메일 형식이 올바르지 않습니다.");
			}
			else {
				$(this).parent().parent().find('p').removeClass('txt-red').addClass('txt-blue').text("사용가능 합니다.");
			}
		});

		//글자수 입력제한
		$('#intro').on('change', function() {
			if($(this).val().length > 20) {
				$(this).val($(this).val().substring(0, 20));
			}
		});

		/*
		//주소검색
		var SearchAddr = function() {		
			var addr = $.trim($("#search_addr").val());
			var type = $("#addrLayer").find("input[name='addr_type']:checked").val(); // 'old', ''

			if (addr.length < 1) {
				alert("검색어를 입력하세요.");
				$("#search_addr").focus();
				$(".address").find('.txt').html('');
				return false;
			}

			//주소검색 ajax
			$.ajax({
				url: "/address/find",
				method: "POST",
				data: { type : type, addr : addr },
				beforeSend: function(){
					document.body.style.cursor='wait';
				},
				complete: function(){
					document.body.style.cursor='default';
				}
			})
			.done(function(res) {
				if (!res.result) {
					alert(res.msg);
					return false;
				}

				if (res.count < 1) {
					alert("검색된 결과가 없습니다.");
					return false;
				}

				var txt = "<em>"+addr+"</em>에 대한 검색결과입니다.";
				var html = "";

				for(var i=0; i < res.list.length; i++) {
					html +="<li><a href='#' data-sido='"+res.list[i].si+"' data-gugun='"+res.list[i].si+"' data-dong='"+res.list[i].dong+"'>"+res.list[i].addr1 + res.list[i].addr2+"</a></li>";
				}

				$('.address .txt').html(txt);
				$('.address .result').html(html);

				$('.address .result li a').click(function(){
					$("#addrLayer").modal('hide');
					var set_addr = $(this).text();
					$(document).find("#addr1").val(set_addr);
					$(document).find("#addr1").attr('readonly', true);
					$(document).find("#addr2").focus();
					
					$(document).find("#sido").val( $(this).attr('data-sido') );
					$(document).find("#gugun").val( $(this).attr('data-gugun') );
					$(document).find("#dong").val( $(this).attr('data-dong') );
					
					//지우면 안됨..
					$(document).find("#lat").val('');
					$(document).find("#lng").val('');
					return false;
				});
			});
			return false; //e.preventDefault() 대신
		};
	
		//주소검색 인풋창
		$('#search_addr').keypress(function (e) {
			if (e.which == 13) {
				SearchAddr();
			}
		});
		
		//주소검색 버튼 클릭시
		$("#btn_search_addr").click(function(e) {
			e.preventDefault();
			SearchAddr();
		});

		//위치확인 레이어 열기
		$("#btn_position").click(function(e) {
			e.preventDefault();

			var addr1 = $.trim($("#addr1").val());
			if(addr1.length < 1) {
				alert("찾기 버튼으로 주소를 등록하세요.");
				$("#addr1").focus();
				return false;
			}
				
			var addr2 = $.trim($("#addr2").val());
			if (addr2.length < 1) {
				alert("상세 주소를 입력하세요.");
				$("#addr2").focus();
				return false;
			}
			
			$("#locationLayer").modal('show', true);
		});

		//위치 확인 버튼 클릭
		$("#locationLayer").on('shown.bs.modal', function(e) {
			e.preventDefault();

			var addr1 = $.trim($("#addr1").val());
			var addr2 = $.trim($("#addr2").val());

			var addr = addr1 + " " + addr2;

			$.ajax({
				url: "/addr/geo",
				method: "POST",
				data: { addr : addr },
				beforeSend: function(){
					document.body.style.cursor='wait';
				},
				complete: function(){
					document.body.style.cursor='default';
				}
			})
			.done(function(res){
				if (res.result) {
					if (!res.lat || !res.lng) {
						alert("위치정보를 가져올 수 없습니다.");
						return false;
					}
				}
				else {
					alert("위치정보를 가져올 수 없습니다. 입력한 주소를 확인하세요.");
					return false;
				}

				var lat = $.trim($("#lat").val());
				var lng = $.trim($("#lng").val());
				if (lat == '') {
					lat = res.lat;
				}

				if (lng == '') {
					lng = res.lng;
				}

				$("#lat").val(lat);
				$("#lng").val(lng);

				//위치정보를 잘 검색했을때..
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = { 
					center: new daum.maps.LatLng(lat, lng), // 지도의 중심좌표
					level: 3 // 지도의 확대 레벨
				};

				var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
				
				// 마커가 표시될 위치입니다
				var markerPosition = new daum.maps.LatLng(lat, lng);
				window.lat = lat;
				window.lng = lng;

				// 마커를 생성합니다
				var marker = new daum.maps.Marker({
					position: markerPosition
				});

				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);

				// 마커가 드래그 가능하도록 설정합니다
				marker.setDraggable(true);

				// 마커의 드래그종료 이벤트
				daum.maps.event.addListener(marker, 'dragend', function() {
					window.lat = this.getPosition().getLat();
					window.lng = this.getPosition().getLng();
				});
			});
		});

		//위치 적용하기 버튼
		$("#btn_apply").click(function(e) {
			e.preventDefault();

			if (typeof(window.lat) == "object" || typeof(window.lng) == "object") {
				$(document).find('#lat').val('');
				$(document).find('#lng').val('');
				alert("위치정보가 올바르지 않습니다.");
				return false;
			}
			
			$(document).find('#lat').val(window.lat);
			$(document).find('#lng').val(window.lng);

			$("#locationLayer").modal('hide');
		});

		// 팝업 닫기 (개발자가 추가함 daum지도 때문에)
		$('.layer-close').on('click', function(e) {
			e.preventDefault();
		});
		
		*/

		// 사업자등록증 파일명 세팅
		$("#img").change(function(e) {
			if (!e.target.files[0]) {
				$("."+$(this).attr('id') + "_txt").val('');
				return false;
			}
			var filename = e.target.files[0].name;
			if (filename) {
				switch(filename.substring(filename.lastIndexOf('.') +1).toLowerCase())
				{
					case 'gif':
					case 'png':
					case 'jpg':
					case 'jpeg':
						break;
					default:
						alert("JPG, JPEG, PNG 이미지 파일로 올려주세요.");
						return false;
				}
				$('.biz_num_file_txt').val(filename);
			} else {
				$('.biz_num_file_txt').val('');
			}
		});

		//상점 대표이미지 변경
		$("#upload_img").change(function(e) {
			var res = LogoReadURL( e.currentTarget ,'#preview_img');
			if (!res) {
				alert("허용되지 않은 파일 형식입니다.");
				return false;
			}

			$("#preview_img").parent().find('span').hide();
			$("#preview_img, .btn_img_del").show();
			$("#preview_img").parent().find('input[type=file]').hide();
		});


		//상점 대표 삭제버튼 클릭시
		$(".btn_img_del").click(function(e) {
			e.preventDefault();

			$(this).parent().find('img').attr('src', '/sbo/join/img/tmp_none.gif');
			$(this).parent().find('img').hide();
			$(this).parent().find('span').show();
			$(this).hide();
			
			$(this).parent().find("input[type='file']").css('display','initial').css('opacity', 0);
		});

		//가입하기
		$("#btn_join").click(function(e) {
			e.preventDefault();
			/* 
			
			var login_id = $("#login_id").val();
			var pw = $.trim($("#pw").val());
			var pw_confirm = $.trim($("#pw_confirm").val());
			var phone = $.trim($("#phone").val());
			var owner_name = $.trim($("#owner_name").val());
			var category = $("#category").val();
			var region = $("input[name='region']").val();
			var region_id = $("#region_list").val();
			var name = $.trim($("#name").val());
			var tel = $.trim($("#tel").val());
			var email = $.trim($("#email").val());
			var addr1 = $.trim($("#addr1").val());
			var addr2 = $.trim($("#addr2").val());
			var lat = $.trim($("#lat").val());
			var lng = $.trim($("#lng").val());
			var biz_num1 = $.trim($("#biz_num1").val());
			var biz_num2 = $.trim($("#biz_num2").val());
			var biz_num3 = $.trim($("#biz_num3").val());
			var biz_num_file = $("#biz_num_file").val();

			if (login_id.length < 1) {
				alert("아이디를 입력하세요.");
				$("#login_id").focus();
				return false;
			}
			if (!$("#login_id").parent().find('p').hasClass('txt-blue')) {
				var err_txt = $("#login_id").parent().find('p').text();
				if (err_txt == "") {
					alert("아이디를 확인하세요.");
				} else {
					alert( err_txt );
				}
				
				$("#login_id").focus();
				return false;
			}

			if (pw.length < 1) {
				alert("비밀번호를 입력하세요.");
				$("#pw").focus();
				return false;
			}

			if (pw_confirm.length < 1) {
				alert("비밀번호 재입력을 입력하세요.");
				$("#pw_confirm").focus();
				return false;
			}

			if (pw != pw_confirm) {
				alert("두 개의 비밀번호가 일치하지 않습니다.");
				$("#pw_confirm").focus();
				return false;
			}

			if ( !chkPwd(pw) ) {
				$("#pw").focus();
				$("#pw").parent().find('p').removeClass('txt-blue').addClass('txt-red').text("비밀번호는 영문/숫자/특문 중에서 2가지 이상조합으로 8자 이상 입력하셔야 합니다.");
				return false;
			}

			if (owner_name.length < 1) {
				alert("성명을 입력하세요.");
				$("#owner_name").focus();
				return false;
			}

			if (category.length < 1) {
				alert("업종을 선택하세요.");
				$("#category").focus();
				return false;
			}

			if(name.length < 1) {
				alert("상점명을 입력하세요.");
				$("#name").focus();
				return false;
			}

			if (region == "2" && region_id.length < 1) {
				alert("지역을 선택하세요.");
				$("#region_list").focus();
				return false;
			}

			if(addr1.length < 1) {
				alert("찾기 버튼으로 주소를 등록하세요.");
				$("#addr1").focus();
				return false;
			}

			if(addr2.length < 1) {
				alert("상세 주소를 입력하세요.");
				$("#addr2").focus();
				return false;
			}

			if(lat.length < 1 || lng.length <1) {
				alert("위치 확인을 해주세요.");
				$("#addr2").focus();
				return false;
			}

			if (phone.length < 1) {
				alert("휴대폰 번호를 입력하세요.");
				$("#phone").focus();
				return false;
			}

			if (document.is_send != true) {
				alert("인증번호를 발송하세요.");
				return false;
			}

			if (document.auth != true) {
				alert("인증번호를 확인 받으세요.");
				$("#phone_auth").focus();
				return false;
			}

			if(tel.length < 1) {
				alert("전화번호를 입력하세요.");
				$("#tel").focus();
				return false;
			}

			if(email.length < 1) {
				alert("대표 이메일을 입력하세요.");
				$("#email").focus();
				return false;
			}
			if (!$("#email").parent().find('p').hasClass('txt-blue')) {
				var err_txt = $("#email").parent().find('p').text();
				if (err_txt == "") {
					alert("이메일을 확인하세요.");
				} else {
					alert( err_txt );
				}
				
				$("#email").focus();
				return false;
			}

			if(biz_num1.length < 3) {
				alert("사업자 등록 번호를 확인하세요.");
				$("#biz_num1").focus();
				return false;
			}
			if(biz_num2.length < 2) {
				alert("사업자 등록 번호를 확인하세요.");
				$("#biz_num2").focus();
				return false;
			}

			if(biz_num3.length < 5) {
				alert("사업자 등록 번호를 확인하세요.");
				$("#biz_num3").focus();
				return false;
			}

			if (document.biz_num_auth != true) {
				alert("사업자등록번호 중복확인을 해주세요.");
				return false;
			}

			if(!biz_num_file) {
				alert("사업자등록증 사본을 첨부하세요.");
				$("#biz_num_file").focus();
				return false;
			}

			if ($("#recommendCheck").is(':checked')) {
				if ($.trim($("input[name='recommend_shop']").val()) == "") {
					alert("추천 상점명을 입력하세요.");
					$("input[name='recommend_shop']").focus();
					return false;
				}
				
				if ($.trim($("input[name='recommend_tel']").val()) == "") {
					alert("추천 상점 매장대표번호를 입력하세요.");
					$("input[name='recommend_tel']").focus();
					return false;
				}

				var extra = {'recommend_shop': $("input[name='recommend_shop']").val(),'recommend_tel': $("input[name='recommend_tel']").val() };
				$("input[name='extra']").val(JSON.stringify(extra));
			} else {
				$("input[name='extra']").val("{}");
			}

			
			var biz_num = biz_num1 + biz_num2 + biz_num3;
			$("input[name='biz_num']").val(biz_num); */

			$("#form1").submit();
		});

		/*
		$('.recommendCon').find('#recommendCheck').on('click', function() {
			$('.recommendDetail').toggleClass('check');
			
			// 22.06.23 이현진 모바일에서 '동의' 클릭 시 스크롤바 최하단으로 이동하여 추가 인풋 박스 바로 보이게 추가
			var winW = $(window).width();
			if(winW <= 767){
				var detailCheck = $('.recommendDetail').offset().top;
				$(window).scrollTop(detailCheck);
			}
		});
		*/
		
	})
</script>

<script src="/sbo/join/alte/plugins/bootstrap.bundle.min.js"></script>
<script src="/sbo/join/alte/js/adminlte.min.js"></script>
</body>
</html>