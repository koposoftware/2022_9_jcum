<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=1000">
<title>H.S With 사장님 사이트</title>
<link rel="shortcut icon" href="/media/images/owners/favicon.ico">
<link rel="apple-touch-icon-precomposed"
	href="/sbo/images/owners/ygyshop_ios_57x57.png">
<link rel="apple-touch-icon-precomposed"
	href="/sbo/images/owners/ygyshop_ios_72x72.png" sizes="72x72">
<link rel="apple-touch-icon-precomposed"
	href="/sbo/images/owners/ygyshop_ios_114x114.png" sizes="114x114">
<link rel="apple-touch-icon-precomposed"
	href="/sbo/images/owners/ygyshop_ios_144x144.png" sizes="144x144">
<link rel="stylesheet" type="text/css"
	href="/sbo/css/owners_new.css" />

<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript"
	src="/sbo/js/bootstrap-2.3.2.min.js"></script>
<script type="text/javascript"
	src="/sbo/js/jquery.validate.min.js"></script>
<script type="text/javascript">
        

        function redirectLogin(next_url) {
            alert('로그인 후 이용하실 수 있습니다.');
            //window.location.href = '/owner/login/?next_url=' + next_url;
        }

        function redirectCeoLogin(next_url) {
                openSignUpOneIdPage();
        }

        function openCeoBasicInfoMenu() {
            openSignUpOneIdPage();
        }

        $(document).ready(function() {
            // sms
            var phone = {};

            function inputChange(evt) {
                var elem = evt.target;
                var name = elem.name;
                if(elem.type == 'text') {
                    phone[name] = !(elem.value.length < elem.maxLength);
                }
                if (elem.name == 'num2') {
                    phone[name] = !(elem.value.length < elem.maxLength-1);
                }
                $('#sendbtn').attr('disabled', !(phone.num1 && phone.num2 && phone.num3));
            }

            $('.sms input[type="text"]').on('keypress keyup', function(evt) {
                if (evt.type == 'keypress' && !/^\d*$/.test(evt.key)){
                    evt.preventDefault();
                    return;
                }
                inputChange(evt);
            });

            $('#sendbtn').click(function() {
                if (!$('#chk').prop('checked')) {
                    alert('SMS 발송을 위한 휴대폰번호 수집에 동의해주세요.');
                    return;
                }

                var num1 = $('#owner-sms-num1').val();
                var num2 = $('#owner-sms-num2').val();
                var num3 = $('#owner-sms-num3').val();

                if (!/010|011|016|017|019/.test(num1) || !/\d{3,4}/.test(num2) || !/\d{4}/.test(num3)) {
                    alert('입력하신 전화번호를 다시 한번 확인해주시기 바랍니다.');
                    return;
                }

                var phone = num1 + num2 + num3;
                $.ajax({
                    method: 'post',
                    url: '/owner/ajax/send-sms-owner-app-download/',
                    data: {'phone': phone}
                }).done(function (callback) {
                    if (callback.success) {
                        alert('전송되었습니다.');
                    } else {
                        alert(callback.error_message);
                    }
                }).fail(function () {
                    alert('요청에 실패했습니다. 다시 한번 시도해 주시기 바랍니다.');
                });
            });
        });
    </script>
</head>
<body>
	<div id="nav" class="own-header">
		<div class="clearfix">
			<h1>
				<a href="/sbo/owner/">사장님 사이트</a>
				<span style="font-size: 20px;margin-left: -30px;">H & S With&nbsp;<span style="font-size:10px;">[하나 상생 플랫폼]</span></span>
				
			</h1>
			<ul class="nav" style="margin-top:15px;">
				<li class="n1 "><a 
					onclick="javascript:alert('로그인 후 이용하실 수 있습니다.');"
					style="cursor: pointer">내 가게 관리</a></li>
				<li class="n3 ">
				<a href="#"
					onclick="">입점
						안내</a></li>
			</ul>

			<ul class="ext">

				<li class="outlink">
					<a href="#" onclick="javascript:alert('로그인 후 이용하실 수 있습니다.');">매출관리</a>
				</li>
<!-- 
				<li class="dropdown"><a href="" class="dropbtn">전체메뉴</a>|

<div class="dropdown-content">
    <div>
        <ul>
            <li><a href="/owner/orders/"><strong>내 가게 관리</strong></a></li>
            <li><a href="/owner/orders/">주문확인</a></li>
            <li><a href="/owner/stats/">통계</a></li>
            <li><a href="/owner/profile/">내 정보관리</a></li>
            <li><a href="https://ceo.yogiyo.co.kr/soldout">메뉴 품절 관리</a></li>
            <li><a href="/owner/oe/">영업일 관리</a></li>
            <li><a href="/owner/restaurant_introduction/">사장님알림 관리</a></li>
            <li><a href="/owner/review_management/">리뷰 관리</a></li>
            <li><a href="/owner/menu_liquor/">주류메뉴 등록요청</a></li>
            <li><a href="/owner/delivery/">배달지역/배달요금 관리</a></li>
            <li><a href="/owner/discounts/">할인관리</a></li>
            <li><a href="https://partner.yogiyo.co.kr/question">단골질문</a></li>
            <li><a href="https://partner.yogiyo.co.kr/notice">공지사항</a></li>
        </ul>
    </div>
    <div>
        <ul>
            <li><a href="/owner/join/intro/"><strong>입점 안내</strong></a></li>
            <li><a href="/owner/join/intro/">요기요 소개</a></li>
            <li><a href="/owner/join/product/">입점상품 소개</a></li>
            <li><a href="/owner/join/process/">입점절차</a></li>
            <li><a href="/owner/join/request/">온라인 입점신청</a></li>
            <li><a href="/owner/join/order_terminal/">주문전달방식 안내</a></li>
            <li><a href="/owner/join/pc_account/manage/">PC 주문접수 계정관리</a></li>
            <li><a href="/owner/join/payment/">결제와 정산</a></li>
            <li><a href="https://partner.yogiyo.co.kr" target="_blank">요기요 활용 Tip</a></li>
        </ul>
    </div>
    <div>
        <ul>
            <li><a href="https://bizcenter.yogiyo.co.kr" target="bizcenter"><strong>우리가게 비즈센터</strong></a></li>
            <li><a href="https://bizcenter.yogiyo.co.kr/adcenter/about/" target="bizcenter">우리동네 플러스</a></li>
            <li><a href="https://bizcenter.yogiyo.co.kr/adcenter/bidding/" target="bizcenter">입찰등록</a></li>
            <li><a href="https://bizcenter.yogiyo.co.kr/adcenter/bidding/ad_list/" target="bizcenter">광고현황</a></li>
            <li><a href="https://bizcenter.yogiyo.co.kr/adcenter/bidding/bid_history/" target="bizcenter">입찰이력</a></li>
            <li><a href="https://bizcenter.yogiyo.co.kr/adcenter/admoney" target="bizcenter">비즈머니 관리</a></li>
        </ul>
        <ul>
            <li><a href="/owner/mall/sso_url/redirect/" target="mall"><strong>알뜰쇼핑</strong></a></li>
        </ul>
    </div>
</div>
</li> -->
				<li><a href="#">로그인</a></li>

			</ul>
		</div>
	</div>

	<script>
    function openSignUpOneIdPage() {
        
    }

    function ownerLogout() {
        if (confirm("로그아웃하시겠습니까?")) {
            
            var redirectURL = "/owner/logout/";
            
            window.location.href = redirectURL;
        }
    }
</script>



	<div class="own-container">
		<div class="own-main">
			<ul class="nav clearfix">
				<li class="n1"><a href="#"
					onclick="redirectLogin('/owner/orders/')" style="cursor: pointer">주문확인</a></li>

				<li class="n2"><a href="#" onclick="openCeoBasicInfoMenu()"
					style="cursor: pointer">기본 정보</a></li>

				<li class="n3"><a href="#"
					onclick="redirectCeoLogin('/owner/menu/')" style="cursor: pointer">품절
						메뉴 관리</a></li>
				<li class="n4"><a href="#"
					onclick="redirectLogin('/owner/oe/')" style="cursor: pointer">휴무일</a></li>
				<li class="n5"><a href="#"
					onclick="redirectLogin('/owner/delivery/')" style="cursor: pointer">배달지역/배달요금</a></li>
				<li class="n6"><a href="#"
					onclick="redirectLogin('/owner/discounts/')"
					style="cursor: pointer">할인관리</a></li>
			</ul>

			<!-- 			<div class="mid clearfix" style='border:1px solid red;display: none;'>
				<div id="carousel-img" class="own-slide carousel slide"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carousel-img" data-slide-to="0" class="active"></li>
						<li data-target="#carousel-img" data-slide-to="1"></li>
						<li data-target="#carousel-img" data-slide-to="2"></li>
						<li data-target="#carousel-img" data-slide-to="3"></li>
						<li data-target="#carousel-img" data-slide-to="4"></li>
					</ol>

					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<a href="http://pf.kakao.com/_pirxou/friend" target="_blank"
								rel="noopener noreferrer">
								<img src="/sbo/images/owners/slide-banner7.png"
								alt="요기요사장님 카카오톡 플러스 배너">
							</a>
						</div>
						<div class="item">
							<a href="/owner/join/order_terminal/"> <img
								src="/sbo/images/owners/slide-banner5.gif"
								alt="사장님 주문접수 안내 배너">
							</a>
						</div>
						<div class="item">
							<a href="/owner/join/tip/#tabs-1"> <img
								src="/sbo/images/owners/slide-banner1.png"
								alt="우리동네 플러스 안내 배너">
							</a>
						</div>
						<div class="item">
							<a href="https://bit.ly/334Ma7O" target="_blank"
								rel="noopener noreferrer"> <img
								src="/sbo/images/owners/slide-banner6.png" alt="요기요 사장님 포털 배너">
							</a>
						</div>
						<div class="item">
							<a href="https://bit.ly/2Daj4c9" target="_blank"
								rel="noopener noreferrer"> <img
								src="/sbo/images/owners/slide-banner4.png" alt="원산지 표시 안내 배너">
							</a>
						</div>
					</div>
					<a class="carousel-left carousel-control" href="#carousel-img"
						role="button" data-slide="prev">&lt;</a> <a
						class="carousel-right carousel-control" href="#carousel-img"
						role="button" data-slide="next">&gt;</a>
				</div>
			</div> -->

			<div style='text-align: center;'>
				<div class="own-login" style="width:400px;  display: inline-block;">
					<div class="status-logout">
						<div class="login">
							<div class="one-id">
								<a href="/sbo/login"><button
										type="button" class="btn-own-login">로그인</button></a>
								<a
									href="/sbo/agree"><button
										type="button" class="btn-own-login signup">
										회원가입</button></a>
								<div class="id_pw_opt">
									<a href="https://ceo.yogiyo.co.kr/forgot-id">아이디 찾기</a> <a
										href="https://ceo.yogiyo.co.kr/forgot-password">비밀번호 찾기</a>
								</div>
							</div>
							<!-- 실제 가게 입점한 소상공인 -->
							<div class="old-id" style="display: none;">
								<a href="#"><button type="button"
										class="btn-own-login">기존 계정 로그인</button></a>
								<div class="id_pw_opt">
									<a class="non-after" href="#">아이디/비밀번호
										찾기</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="carousel-img" class="own-slide carousel slide"	data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carousel-img" data-slide-to="0" class="active"></li>
						<li data-target="#carousel-img" data-slide-to="1"></li>
						<li data-target="#carousel-img" data-slide-to="2"></li>
						<li data-target="#carousel-img" data-slide-to="3"></li>
						<li data-target="#carousel-img" data-slide-to="4"></li>
					</ol>

					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<a href="#"	rel="noopener noreferrer">
								<img src="/sbo/images/owners/slide1.png" width="566px;" height="300px;"
								alt="">
							</a>
						</div>
						<div class="item">
							<a href="#"> 
								<img src="/sbo/images/owners/slide2.png" width="566px;" height="300px;">
							</a>
						</div>
						<div class="item">
							<a href="#"> <img
								src="/sbo/images/owners/slide3.png" width="566px;" height="300px;">
							</a>
						</div>
					</div>
					<a class="carousel-left carousel-control" href="#carousel-img"
						role="button" data-slide="prev">&lt;</a> <a
						class="carousel-right carousel-control" href="#carousel-img"
						role="button" data-slide="next">&gt;</a>
				</div>
		</div>
	</div>




	<link rel="stylesheet" type="text/css"
		href="/sbo/css/common_base/footer.css" />

	<script>
    function handleOnClickCollapseHeader (event) {
        var parent = event.currentTarget.parentElement;
        var isOpened = parent.className.includes('opened');

        if (isOpened) {
            parent.className = parent.className.replace('opened', '').trim();
        } else {
            parent.className = [parent.className, 'opened'].join(' ');
        }
    }

    function handleOnClickServiceIntroduceButton (event) {
        var list = document.querySelector('.footer-container .footer-row .service-download-container .service-download-list');
        var isOpened = list.className.includes('opened');

        if (isOpened) {
            list.className = list.className.replace('opened', '').trim();
        } else {
            list.className = [list.className, 'opened'].join(' ');
        }
    }

    function handleOnLoad() {
        var headers = document.querySelectorAll('.footer-container .collapse .header');

        headers.forEach(function(element) {
            element.addEventListener('click', handleOnClickCollapseHeader);
        });

        var serviceDownloadButton = document.querySelector('.footer-container .footer-row .service-download-button');
        serviceDownloadButton.addEventListener('click', handleOnClickServiceIntroduceButton);
    }

    (function () {
        window.addEventListener('load', handleOnLoad);
    })();
</script>

	<div class="footer-container">
		<div class="footer-row">
			<div class="terms">
				<a href="#"
					class="term">서비스 이용약관</a>
				<div class="vertical"></div>
				<a href="#"
					class="term">사이트 이용약관</a>
				<div class="vertical"></div>
				<a href="#" class="term"> <strong>개인정보
						처리방침</strong>
				</a>
				<div class="vertical"></div>
				<a  href="#"
					class="term">전자금융거래 이용약관</a>
			</div>
			<div class="service-download-container">
				<button class="service-download-button">서비스 소개 다운로드</button>
				<ul class="service-download-list">
					<li class="service-download-item"><a
						href="https://rev-static.yogiyo.co.kr/owners/YGY_INFO_(VD)OL.pdf"
						target="_blank">요기요 서비스 소개 다운로드</a></li>
					<li class="service-download-item"><a
						href="https://rev-static.yogiyo.co.kr/owners/YGY_INFO_(OD)OL.pdf"
						target="_blank">요기요 익스프레스 서비스 소개 다운로드</a></li>
				</ul>
			</div>
		</div>
	</div>

	<script type="text/javascript">
    $(document).ready(function() {
        var regexS = "[\\?&]login=([^&#]*)";
        var regex = new RegExp( regexS );
        var results = regex.exec(window.location.href);
        if (results) {
            $('.popup-pwd-notice').modal('show');
        }
    });
</script>


	<script type="text/javascript" src="/sbo/js/jquery.cookie.js"></script>
	<script src="https://unpkg.com/js-cookie@3.0.1/dist/js.cookie.min.js"></script>
	<script type="text/javascript" src="/sbo/js/owner_for_vms.js"></script>
	<script type="text/javascript">
    function setCookie(cookieName, day) {
        $.cookie(cookieName, 'hidden', {expires: day});
    }

    $(document).ready(function() {
    	
        $('.carousel-control').hide();
        $('.own-slide').hover(
            function() {
                $('.carousel-control').fadeIn();
            }, function() {
                $('.carousel-control').fadeOut();
            }
        );
        $('.carousel').carousel('cycle');
        
        var remId = $.cookie("rem_me");

        var username = $("#username");
        var saveId = $("#save_id");
        var password = $("#password");
        username.val(remId);
        if (remId != undefined && remId != null && remId != '') {
            saveId.prop("checked", "checked");
            password.focus();
        } else {
            username.focus();
        }
        saveId.click(function() {
            if($(this).prop('checked')) {
                $.cookie("rem_me", $('#username').val(), { expires:365, path: '/' });
            } else {
                $.cookie('rem_me', '', { expires: -1, path: '/' });
            }
        });

        function getCookieValueByRegEx(a) {
            var b = document.cookie.match('(^|;)\\s*' + a + '\\s*=\\s*([^;]+)');
            return b ? b.pop() : '';
        }

/*         var $pop_close = $modal_notice.attr('data-dismiss', 'modal');
        $pop_close.click(function() {
            modalNoticeOrder();
        }); */

        $('.form-signin').on('submit', function(evt){
            $(this).find('input').each(function(idx, elem){
                $(elem).val($.trim(elem.value));
            });
        });

        /* if (now <= end_time_pwd && !getCookieValueByRegEx('popup_shown')) {
            $('#modal-pwd').modal('show');
            if ($('.popup-pwd-notice').css('display') === 'block') {
                $('.popup-pwd-notice').modal('hide');
            }
        } */
        $("#no-show-modal-pwd").click(function(){
            $('#modal-pwd').modal('hide');
            $.cookie('popup_shown', 'hidden', {expires: 13});
        });
        $("#modal-pwd .btn1").click(function(){
            $.cookie('popup_shown', 'hidden', {expires: 13});
        });

        if (!window.YGY_VMS.getSelectedVendorFromCookie().company_number) {
          $.ajax("/owner/restaurants/").then(function(data) {
            if (data.restaurants) {
              originVendorList = data.restaurants.slice();
              var selectedVendor = $.extend(originVendorList[0], {});
              window.YGY_VMS.setSelectedVendorOnCookie(selectedVendor);
            }
          });
        }

    });

    $('.popup-pwd-notice').addClass('modal1');

    function gotoMall() {
        window.open('http://ownermall.co.kr/', '_blank')
    }
</script>
</body>
</html>