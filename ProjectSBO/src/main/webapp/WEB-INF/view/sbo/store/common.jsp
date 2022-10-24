<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<!-- Basic Page Info -->
<meta charset="utf-8" />
<title></title>


<!-- CSS -->
<link rel="stylesheet" type="text/css"
	href="/sbo/main/vendors/styles/core.css" />
<link rel="stylesheet" type="text/css"
	href="/sbo/main/vendors/styles/icon-font.min.css" />
<link rel="stylesheet" type="text/css"
	href="/sbo/main/src/plugins/jquery-steps/jquery.steps.css" />
<link rel="stylesheet" type="text/css"
	href="/sbo/main/vendors/styles/style.css" />

<!-- 내부 스타일 따로 적용 -->
<style>
.btn-toolbar>.btn, .btn-toolbar>.btn-group, .btn-toolbar>.input-group {
	margin-left: 5px;
}

.list-group {
	box-shadow: 0px 11px 23px 5px rgba(0, 0, 0, 0.13);
}

.list-group-item {
	background-color: rgba(255, 255, 255, 0.7);
	border: soild #000 1px;
}

.btn-toolbar {
	margin-top: 10px;
}

/* ==== SOME BOOTSTRAP MODS/STYLING ==== */
.btn-default {
	background-color: rgba(255, 255, 255, 0.3);
	border-color: rgba(0, 0, 0, 0.2);
}

.btn {
	padding: 6px 18px;
}

.subject * {
	font-size: 13px;
}

.subject {
	padding-top: 18px;
}

.subject div {
	clear: both;
	border-top: 1px solid #e3e3e3;
	border-bottom: 1px solid #e3e3e3;
	padding: 4px 0;
}

.subject dl {
	clear: both;
}

.subject dt {
	float: left;
	color: #666;
	line-height: 24px;
	background: url(/sbo/main/vendors/images/layout/bu_list_txt_dep2.gif)
		no-repeat left 10px;
	padding-left: 5px;
	letter-spacing: -1px;
}

.subject dd {
	margin-left: 110px;
	line-height: 24px;
	letter-spacing: -1px;
}

.subject dt {
	font-weight: 900;
}

/* 상품설명 부분 */
.po-detail-info {
	clear: both;
	margin-left: 29px;
	overflow: hidden;
}

dl {
	font-size: 12px;
}

#tab-cont-1.tab-cont-1 dl.po-detail-info dt {
	padding-left: 0;
	background: transparent;
	font-weight: bold;
	padding-right: 10px;
}

.po-detail-info dt {
	clear: both;
	float: left;
	width: 140px;
	color: #333;
	font-size: 14px;
	padding-left: 10px;
	padding-top: 14px;
}

.po-detail-info dd {
	float: left;
	width: 744px;
	font-size: 14px;
	padding-top: 14px;
}

.color-1 {
	color: red;
}

.blue {
	color: blue;
}

.po-detail-info li {
	background: url(/sbo/main/vendors/images/layout/bu_list_txt_dep2.gif)
		no-repeat left 9px;
	padding-left: 10px;
	font-size: 14px;
	line-height: 19px;
}
</style>
</head>
<body>
	<div class="header">
		<div class="header-left">
			<div class="menu-icon bi bi-list"></div>
			<div class="search-toggle-icon bi bi-search"
				data-toggle="header_search"></div>
		</div>
		<div class="header-right">
			<div class="user-info-dropdown">
				<div class="dropdown">
					<a class="dropdown-toggle" href="#" role="button"
						data-toggle="dropdown"> <span class="user-icon"
						style="width: 0px;"> <!-- <img src="/sbo/main/vendors/images/photo1.jpg" alt="" /> -->
					</span> <span class="user-name"> 홍길동 님 환영합니다.</span>
					</a>
				</div>
			</div>
		</div>
	</div>

	<div class="right-sidebar">
		<div class="right-sidebar-body customscroll">
			<div class="right-sidebar-body-content">
				<h4 class="weight-600 font-18 pb-10">Header Background</h4>
				<div class="sidebar-btn-group pb-30 mb-10">
					<a href="javascript:void(0);"
						class="btn btn-outline-primary header-white active">White</a>
					<a href="javascript:void(0);"
						class="btn btn-outline-primary header-dark">Dark</a>
				</div>

				<h4 class="weight-600 font-18 pb-10">Sidebar Background</h4>
				<div class="sidebar-btn-group pb-30 mb-10">
					<a href="javascript:void(0);"
						class="btn btn-outline-primary sidebar-light">White</a> <a
						href="javascript:void(0);"
						class="btn btn-outline-primary sidebar-dark active">Dark</a>
				</div>

			</div>
		</div>
	</div>
	
	<div class="right-sidebar">
		<div class="sidebar-title">
			<h3 class="weight-600 font-16 text-blue">
				Layout Settings <span class="btn-block font-weight-400 font-12">User
					Interface Settings</span>
			</h3>
			<div class="close-sidebar" data-toggle="right-sidebar-close">
				<i class="icon-copy ion-close-round"></i>
			</div>
		</div>
		<div class="right-sidebar-body customscroll">
			<div class="right-sidebar-body-content">
				<h4 class="weight-600 font-18 pb-10">Header Background</h4>
				<div class="sidebar-btn-group pb-30 mb-10">
					<a href="javascript:void(0);"
						class="btn btn-outline-primary header-white active">White</a>
					<a href="javascript:void(0);"
						class="btn btn-outline-primary header-dark">Dark</a>
				</div>

				<h4 class="weight-600 font-18 pb-10">Sidebar Background</h4>
				<div class="sidebar-btn-group pb-30 mb-10">
					<a href="javascript:void(0);"
						class="btn btn-outline-primary sidebar-light">White</a> <a
						href="javascript:void(0);"
						class="btn btn-outline-primary sidebar-dark active">Dark</a>
				</div>

				<h4 class="weight-600 font-18 pb-10">Menu Dropdown Icon</h4>
				<div class="sidebar-radio-group pb-10 mb-10">
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" id="sidebaricon-1" name="menu-dropdown-icon"
							class="custom-control-input" value="icon-style-1" checked="" />
						<label class="custom-control-label" for="sidebaricon-1"><i
							class="fa fa-angle-down"></i></label>
					</div>
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" id="sidebaricon-2" name="menu-dropdown-icon"
							class="custom-control-input" value="icon-style-2" /> <label
							class="custom-control-label" for="sidebaricon-2"><i
							class="ion-plus-round"></i></label>
					</div>
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" id="sidebaricon-3" name="menu-dropdown-icon"
							class="custom-control-input" value="icon-style-3" /> <label
							class="custom-control-label" for="sidebaricon-3"><i
							class="fa fa-angle-double-right"></i></label>
					</div>
				</div>

				<h4 class="weight-600 font-18 pb-10">Menu List Icon</h4>
				<div class="sidebar-radio-group pb-30 mb-10">
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" id="sidebariconlist-1" name="menu-list-icon"
							class="custom-control-input" value="icon-list-style-1" checked="" />
						<label class="custom-control-label" for="sidebariconlist-1"><i
							class="ion-minus-round"></i></label>
					</div>
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" id="sidebariconlist-2" name="menu-list-icon"
							class="custom-control-input" value="icon-list-style-2" />
						<label class="custom-control-label" for="sidebariconlist-2"><i
							class="fa fa-circle-o" aria-hidden="true"></i></label>
					</div>
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" id="sidebariconlist-3" name="menu-list-icon"
							class="custom-control-input" value="icon-list-style-3" />
						<label class="custom-control-label" for="sidebariconlist-3"><i
							class="dw dw-check"></i></label>
					</div>
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" id="sidebariconlist-4" name="menu-list-icon"
							class="custom-control-input" value="icon-list-style-4" checked="" />
						<label class="custom-control-label" for="sidebariconlist-4"><i
							class="icon-copy dw dw-next-2"></i></label>
					</div>
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" id="sidebariconlist-5" name="menu-list-icon"
							class="custom-control-input" value="icon-list-style-5" />
						<label class="custom-control-label" for="sidebariconlist-5"><i
							class="dw dw-fast-forward-1"></i></label>
					</div>
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" id="sidebariconlist-6" name="menu-list-icon"
							class="custom-control-input" value="icon-list-style-6" />
						<label class="custom-control-label" for="sidebariconlist-6"><i
							class="dw dw-next"></i></label>
					</div>
				</div>

				<div class="reset-options pt-30 text-center">
					<button class="btn btn-danger" id="reset-settings">Reset
						Settings</button>
				</div>
			</div>
		</div>
	</div>

	<div class="left-side-bar">
		<div class="brand-logo" style="padding-bottom: 10px;">
			<a href="/sbo/login"> <img src="/sbo/main/src/images/logo.jpg"
				alt="메인로고" />
			</a>
			<div class="close-sidebar" data-toggle="left-sidebar-close">
				<i class="ion-close-round"></i>
			</div>
		</div>
		<div class="menu-block customscroll">
			<div class="sidebar-menu">
				<ul id="accordion-menu">
					<li class="dropdown"><a href="javascript:;"
						class="dropdown-toggle"> <span class="micon bi bi-house"></span><span
							class="mtext">가게 및 조회 관리</span>
					</a>
						<ul class="submenu">
							<li><a href="/store">기본 정보(가게정보)</a></li>
						</ul></li>
					<li class="dropdown"><a href="javascript:;"
						class="dropdown-toggle"> <span class="micon bi bi-archive"></span>
							<span class="mtext">매출 관리</span>
					</a>
						<ul class="submenu">
							<li><a href="/orders/205">주문 확인</a></li>
							<li><a href="/sales/205">매출 정보</a></li>
						</ul></li>

					<li><a href="javascript:;" class="dropdown-toggle"> <span
							class="micon bi bi-calendar4-week"></span><span class="mtext">매입
								관리</span>
					</a>
						<ul class="submenu">
							<li><a href="/purchase">매입 등록</a></li>
						</ul></li>

					<li class="dropdown"><a href="javascript:;"
						class="dropdown-toggle"> <span class="micon bi bi-archive"></span><span
							class="mtext">대출 관리</span>
					</a>
						<ul class="submenu">
							<li><a href="/loanstore">대출 상품</a></li>
							<li><a href="/chat" target='_blank'>1:1 상담</a></li>
						</ul></li>
					<li>
						<div class="dropdown-divider"></div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="mobile-menu-overlay"></div>

	<div class="main-container">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px">
				<div class="page-header">
					<div class="row">
						<div class="col-md-6 col-sm-12">
							<div class="title">
								<h4>대출상품</h4>
							</div>
							<nav aria-label="breadcrumb" role="navigation">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.html">대출관리</a>
									</li>
									<li class="breadcrumb-item active" aria-current="page">
										대출상품</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>

				<!-- 메인 컨텐츠 -->
				<div class="pd-20 card-box mb-30">
					<div class="loadcontents">
						<div class="clearfix mb-20">
							<div class="pull-left">
								<h4 class="text-blue h4">전용대출(소상공인)</h4>
							</div>
						</div>
						<!-- 대출 페이지 공통 페이지  -->

						<div class="container">
							<ul class="list-group">
								<li class="list-group-item clearfix">
									<h3 class="list-group-item-heading"
										style="display: inline-block;">하나 H.S With 온라인 사장님 대출</h3>
									<p
										style="font-size: 1rem; margin-left: 10px; margin-top: 10px;"
										class="list-group-item-text lead">
										매출대금입금 개인사업자<br /> 전용 가맹점 대출
									</p>
									<dl>
										<dd class="subject">
											<div>
												<dl>
													<dt>대출종류</dt>
													<dd>개인사업자대출,신용대출,인터넷신용,일반/기타</dd>
												</dl>
												<dl>
													<dt>대출대상</dt>
													<dd>개인사업자(가맹점 매출대금 입금 고객)</dd>
												</dl>
												<dl>
													<dt>대출기간</dt>
													<dd>1년</dd>
												</dl>
												<dl>
													<dt>대출한도</dt>
													<dd>최대 1억원</dd>
												</dl>
											</div>
										</dd>
									</dl>
									<div class="btn-toolbar pull-right" role="toolbar"
										aria-label="">
										<span id="loanjoin" class="btn btn-default">대출신청</span> <span
											id="talkaction" class="btn btn-default">톡상담</span>
									</div>
								</li>
							</ul>
						</div>
						<br>
						<div class="container">
							<ul class="list-group">
								<li class="list-group-item clearfix">
									<h3 class="list-group-item-heading"
										style="display: inline-block;">상품설명</h3>
									<p
										style="font-size: 1rem; margin-left: 10px; margin-top: 10px;"
										class="list-group-item-text lead">
										매출대금입금 개인사업자<br /> 전용 가맹점 대출
									</p>

									<dl class="po-detail-info">
										<dt>개요</dt>
										<dd>
											매출대금입금 개인사업자<br> 전용 가맹점 대출
										</dd>
									</dl>
									<dl class="po-detail-info">
										<dt>특징</dt>
										<dd>
											가맹점 매출대금을 은행으로 이용하는 개인사업자 전용 통장대출<br>
										</dd>
									</dl>
									<dl class="po-detail-info">
										<dt>대출대상</dt>
										<dd>
											<span class="color-1">가맹점 매출대금*</span> 입금계좌를 <span
												class="color-1">하나은행으로 이용</span>하고 아래의 기준을 모두 충족하는 개인사업자<br>
											(1) KCB CB 691점 이상 &amp; NICE CB 751점 이상<br> (2) 우리은행
											내부기준 충족<br> <br> <span class="color-1">*가맹점
												매출대금 : ① 신용카드사로부터 입금된 매출대금 ② 제로페이 매출대금 ③ 배달의민족 매출대금 ④ 쿠팡
												매출대금(쿠팡페이)</span><br> <br> <span class="color-1">※
												신청 기준</span><br> <span class="color-1">- 1일~9일 신청 : 전전월
												입금 실적이 있는 경우</span><br> <span class="color-1">- 10일~말일
												신청 : 전월 입금 실적이 있는 경우</span><br> <br> ※ 온라인 결제대금 또는
											가맹본부로부터 정산받은 매출대금은 "가맹점 매출대금" 으로 인정되지 않습니다.<br> ※ 단,
											불건전업종인 경우 신청 불가합니다.
										</dd>
									</dl>
									<dl class="po-detail-info">
										<dt>대출한도금액</dt>
										<dd>
											사업기간 1년 이상 : 최대 1억원<br> 사업기간 1년 미만 : 최대 3천만원<br> ※
											우리은행 및 다른 금융기관의 신용대출 및 보증채무 금액은 한도에서 차감
										</dd>
									</dl>
									<dl class="po-detail-info">
										<dt>대출기간</dt>
										<dd>1년 (최장 5년까지 기간연장 가능)</dd>
									</dl>
									<dl class="po-detail-info">
										<dt>기본금리</dt>
										<dd>
											<font color="blue">대출금리 : 기준금리 + 가산금리 - 우대금리</font><br>
											기준금리 : 기간별 고정금리, 3개월 KORIBOR금리, 3개월 CD연동금리, 기간별 변동금리 중 선택 가능<br>
											<font color="blue">(단, 3개월 KORIBOR 연동대출의 기준금리는 신규, 증대,
												기간연장, 재약정, 채무인수시 적용할 수 없으며, 기존 대출의 기준금리가 3개월 KORIBOR연동대출
												기준금리인 경우에 한하여 기간연장 또는 조건변경에 적용할 수 있습니다.)</font><br> 가산금리 : 고객의
											신용등급, 상환능력, 대출금액, 거래실적 등을 반영하여 시스템에 의해 결정(관리산업 연 0.5% 가산)<br>
											※ 최저금리(예시) : <br> (2022.04.21. 기준, 우리은행 SOHO 1등급, 신용대출,
											한도대출, 대출금액 1억원, 대출기간 1년, 3개월 CD연동금리, 우대금리 연 1.10%p 적용 시) <br>
											기준금리 : 연 1.72%, 가산금리 : 연 2.76%, 우대금리 연 1.10%, 적용금리 연 3.38% <br>
											※ 최고금리 : 연 14%<br> ※ 연체이자율 : 적용금리 + 연 3% (최고 연 15%)<br>
											※ 자세한 금리정보는 영업점 및 고객센터 등을 통해 문의 부탁드리며, 대출상담/신청을 통해 확인 가능<br>
										</dd>
									</dl>
									<dl class="po-detail-info">
										<dt>우대금리</dt>
										<dd>
											<span class="color-1">최대 연 1.1%p</span><br> 1) 매월 조건 충족
											여부에 따라 1개월 단위로 금리우대<br> ① 대출 약정계좌로 입금된 가맹점 매출대금 입금금액에 따른
											우대 (최대 연 0.6%p)<br> - 월 5백만원 이상 1천만원 이하 : 연 0.1%p<br>
											- 월 1천만원 초과 2천만원 이하 : 연 0.2%p<br> - 월 2천만원 초과 3천만원 이하 :
											연 0.3%p<br> - 월 3천만원 초과 4천만원 이하 : 연 0.4%p<br> - 월
											4천만원 초과 5천만원 이하 : 연 0.5%p<br> - 월 5천만원 초과 : 연 0.6%p<br>
											<br> ② 4대 사회보험료 자동이체 시 (최대 연 0.4%p)<br> - 건강보험료,
											국민연금보험료, 고용보험료, 산재보험료 각각 연 0.1%p<br> ※ "사회보험합산보험료" 항목으로
											자동이체 시, 연 0.4%p<br> ※ 단, 사용자(고용주) 부담분에 한함<br> <br>
											2) 신청 시점 충족 여부에 따라 만기 시까지 우대<br> - 국세청 모범납세자 해당 시 (연
											0.1%p)
										</dd>
									</dl>
									<dl class="po-detail-info">
										<dt>상환방법</dt>
										<dd>
											통장식상환(마이너스통장)<br>
										</dd>
									</dl>
									<dl class="po-detail-info">
										<dt>담보</dt>
										<dd>신용대출</dd>
									</dl>
									<dl class="po-detail-info">
										<dt>고객부담비용</dt>
										<dd>
											1) '인지세법'에 의한 인지세 (은행과 고객 50%씩 부담)<br> - 5천만원 이하 : 비과세 <br>
											- 5천만원 초과~1억원 이하 : 7만원(각각 3만5천원) <br> - 1억원 초과~10억원 이하 :
											15만원(각각 7만5천원) <br> - 10억원 초과 : 35만원(각각 17만5천원) <br>
											<br> 2) 한도대출(마이너스통장)의 경우 아래의 수수료가 부과됩니다.(①, ② 중 택 1)<br>
											① 한도미사용수수료 = (약정한도평잔 - 운용기간중 여신평잔) × 수수료율 × 운용기간/365 (윤년은
											366))<br> ※ 수수료율 : 한도사용율에 따라 0% ~ 0.5% <br> ②
											한도약정수수료 = 한도약정액× 수수료율(0.3%) × 약정기간(일)/365 (윤년은 366)<br>
											※ 약정일 또는 기간 연장일에 전액 납부<br> <br> 3) 중도상환해약금 - 없음<br>
										</dd>
									</dl>
									<dl class="po-detail-info">
										<dt>이자계산방법</dt>
										<dd>
											<ul>
												<li>매일의 적수*에 대하여 이자계산(*매일의 적수 :&nbsp;마감잔액 + (일중 최고잔액 -
													개시잔액 또는 마감잔액 중 큰 금액)<br>
												</li>
											</ul>
											<p>
												<br>
											</p>
										</dd>
										<dt>
											원금 또는 이자의 상환시기 및 방법<br>
										</dt>
										<dd>
											<ul>
												<li>원금은 만기에 일시상환, 이자는 매1개월 단위로 납부(후납)<br> *이자는
													이자계산일(매월 셋째 주 토요일 또는 매월 마지막 주 토요일, 공휴일인 때에는 그 직전영업일)의 익일자로
													대출원금에 가산하고, 잔액이 예금일 때에는 동 예금에서 납부합니다. <br></li>
											</ul>
											<p>
												<br>
											</p>
										</dd>
										<dt>
											이용시간<br>
										</dt>
										<dd>
											<ul>
												<li>이자조회(개인사업자, 법인) : 00:10~24:00(토요일, 휴일 포함)</li>
												<li>이자납입/원금상환/한도해지(개인사업자) : 00:10~24:00(토요일, 휴일 포함)</li>
												<li>이자납입/원금상환(법인) : 00:10~24:00(평일) / 09:00~15:00(토요일)
													/ 휴일불가</li>
												<li>※ 어음성대출, 연체대출, 담보제공여부 등 고객의 상황에 따라 일부 또는 전액상환이 불가 할
													수 있습니다.</li>
												<li>※ 일부상품의 경우 상기내용과 다르게 적용될 수 있으니, 자세한 내용은 가까운 영업점 또는
													고객센터에 문의하시기 바랍니다.</li>
												<li>※ 시스템 상황에 따라 이용시간 변경 및 이용이&nbsp;불가 할 수 있습니다.</li>
												<br>
											</ul>
										</dd>
										<dt>
											계약해지 또는<br> 갱신 방법
										</dt>
										<dd>
											<ul>
												<li>고객이 통장대출 약정에 대한 해지의사를 표시한 때</li>
											</ul>
											<ul>
												<li>계약갱신 : 만기도래 시 당행에서 정한 일정요건을 갖춘 경우 기간연장 가능<br></li>
											</ul>
											<p>
												<br>
											</p>
										</dd>
										<dt>지연배상금 부과 등 처리방법</dt>
										<dd>
											<ul>
												<li>연체이자율 : 대출금리 + 연 3% (최고 연 15%)<br> ① 대출금을 상환하지
													아니한 때<br> - 대출 잔액에 대하여 만기일의 다음날부터 상환일 전일까지 연체이자를 납부하셔야
													합니다.<br> ② 대출금의 기한의 이익이 상실된 때<br> - 대출 잔액에 대하여
													기한의 이익이 상실된 다음날부터 상환일 전일까지 연체이자를 납부하셔야 합니다.<br> ③ 이자를
													납부하기로 약정한 날에 납부하지 아니한 때<br> - 이자를 납부하여야 할 날(토요일 및 공휴일인
													경우 그 다음 영업일)의 다음날부터&nbsp;14일간은 납부하여야 할 이자액에 대하여, 14일간을 초과하는
													날로부터 이자납일 전일까지의 기간에 대하여는 대출원금잔액에 대하여 연체이자를 납부하셔야 합니다. <br></li>
											</ul>
											<p>
												<br>
											</p>
										</dd>
										<dt>만기경과 또는 기한의 이익 상실 시 불이익</dt>
										<dd>
											<ul>
												<li>대출 잔액에 대하여 연체이자를 납부하셔야 합니다.</li>
												<li>연체기간에 따라 「신용정보의 이용 및 보호에 관한 법률」,「신용정보관리규약」에 근거,
													신용도판단정보* 등록자로 등재되어 금융거래 시 불이익을 받을 수 있습니다.&nbsp;(*연체정보,
													대위변제·대지급정보, 부도정보, 금융질서문란정보 등)</li>
												<li>보유 중인 예금과의 상계, 담보목적물 처분, 발견재산에 대한 보전조치 등 법적 절차가 진행될
													수 있습니다.<br>
												</li>
											</ul>
											<p>
												<br>
											</p>
										</dd>
										<dt>고객에게 발생할 수 있는 불이익</dt>
										<dd>
											<ul>
												<li><span class="color-1">대출 약정계좌로 2개월 연속 가맹점
														매출대금 미입금 시, 그 익월부터 통장대출의 마이너스 한도 사용이 중지되며 특약에 따른 기한이익상실
														사유가 됩니다.</span></li>
												<li><span class="color-1">대출 약정계좌로 가맹점 매출대금 미입금
														시, 대출금의 일부 또는 전액을 상환하셔야 할 수도 있습니다.</span></li>
												<li>상기 외 우리은행 거래실적, 신용등급 변동 등에 따라 대출금리가 인상되거나, 대출금의 일부
													또는 전액을 상환하셔야 할 수도 있습니다.<br>
												</li>
											</ul>
											<p>
												<br>
											</p>
										</dd>
										<dt>기타</dt>
										<dd>
											<ul>
												<li><span class="color-1">대출신청 및 실행은 매일(주말, 공휴일
														포함) 08:00~22:00까지 가능합니다.</span></li>
												<li><span class="color-1">대출 약정계좌는&nbsp;가맹점 매출대금
														입금계좌만&nbsp;가능합니다.</span></li>
												<li>대출한도 증액은 기간연장 및 재약정 시점에만 가능합니다.&nbsp;</li>
												<li>상기 상품 내용은 우리은행의 여신정책 변경에 따라 달라질 수 있습니다.</li>
												<li>일반금융소비자는 금융소비자보호법 제19조 제1항에 따라 은행으로부터 충분한 설명을 받을
													권리가 있으며, 본 대출에 관한 계약을 체결하기 전에 상품설명서 및 약관을 읽어보시기 바랍니다.</li>
												<li>상환능력에 비해 대출금 사용액이 과도할 경우 개인신용평점(또는 신용등급)이 하락할 수
													있으며, 개인신용평정(또는 신용등급) 하락으로 금융거래와 관련된 불이익이 발생할 수 있습니다.</li>
												<li>일정기간 납부해야 할 원리금이 연체될 경우에 계약만료 기한이 도래하기 전에 모든 원리금을
													변제해야할 의무가 발생할 수 있습니다.</li>
												<li>금리인하요구권 : 본 상품은 금리인하요구권 신청이 가능합니다. 단, 은행의 심사결과에 따라
													금리인하 요청이 반영되지 않을 수도 있습니다.</li>
												<li><span>대출계약철회권&nbsp;: 본 상품은&nbsp;대출계약
														철회&nbsp;신청 대상입니다.</span></li>
												<li>위법계약해지권 : 판매사가 금융상품에 대해 거짓 또는 왜곡하여 설명한 경우, 금융소비자보호법
													상 불공정영업행위 또는 부당권유행위를 한 경우, 금융소비자는 해당 금융상품에 관한 계약을 체결한 경우에는
													금융소비자보호법 제 47조에 따라 계약체결일로부터 5년 이내 범위에서 위법사실을 안 날로부터 1년 이내에
													서면 등으로 해당계약의 해지를 요구할 수 있습니다. 만약 금융소비자의 요구가 정당한 것으로 판단될 경우
													수수료 및 위약금 등 계약해지와 관련한 추가비용 부담 없이 계약 해지가 가능합니다.</li>
												<li>자료열람요구권 : 본 상품은 자료열람요구권 신청이 가능합니다.</li>
												<li>본 설명은 상품에 대한 이해를 돕고 중요내용을 알려드리기 위한 참고자료이며, 실제 상품의
													계약은 여신거래기본약관, 여신거래약정서(기업용), 기업대출상품설명서를 기준으로 합니다. 기타 추가적인
													세부내용은 해당 서류를 확인하시기 바랍니다.</li>
												<li>대출한도, 대출금리 등 자세한 거래조건은 대출신청 영업점 담당자 또는 우리은행 고객센터
													(1588-5000, 1599-5000)에 문의하시기 바랍니다. <br>
												</li>
											</ul>
										</dd>
									</dl>
									<div class="btn-toolbar pull-right" role="toolbar"
										aria-label="">
										<span id="loanjoin" class="btn btn-default">대출신청</span> 
										<span id="talkaction" class="btn btn-default">톡상담</span> <a
											href="/loanstore" class="btn btn-default">목록</a>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			<div class="footer-wrap pd-20 mb-20 card-box">
				<div class="Footer__GlobalFooter-owh5jd-7 fKrPjG">
					<a href="/" class="Footer__Logo-owh5jd-8 eoMxtc"> <img
						src="/sbo/main/src/images/logo.jpg" alt="하나 상생 플랫폼"></a>
					<div class="Footer__FooterInfo-owh5jd-9 ptTZd">
						<div class="Footer__GlobalLinks-owh5jd-11 ewsZOv">
							<a href="#" style="text-decoration: none; color: #494f54;">회사소개</a>
							<span>|</span> <a href="#"
								style="text-decoration: none; color: #494f54;">하나 상생 플랫폼</a> <span>|</span>
							<a href="#" style="text-decoration: none; color: #494f54;">이용약관</a>
							<span>|</span> <a href="#"
								style="text-decoration: none; color: #494f54;">서비스운영원칙</a> <span>|</span>
							<a href="#" style="text-decoration: none; color: #494f54;">전자금융거래이용약관</a>
							<span>|</span> <a href="#"
								style="text-decoration: none; color: #494f54;">개인정보처리방침</a>
						</div>
					</div>
				</div>
			</div>
			</div>
		</div>
	</div>

	<!-- js -->
	<script src="/sbo/main/vendors/scripts/core.js"></script>
	<script src="/sbo/main/vendors/scripts/script.min.js"></script>
	<script src="/sbo/main/vendors/scripts/process.js"></script>
	<script src="/sbo/main/vendors/scripts/layout-settings.js"></script>
	<script src="/sbo/main/src/plugins/jquery-steps/jquery.steps.js"></script>
	<script src="/sbo/main/vendors/scripts/steps-setting.js"></script>


	<script type="text/javascript">
		$(document).ready(function(){
			$("#loanjoin").click(function(){
				location.href = "/loansignup";
			});
			$("#talkaction").click(function(){
				let popUrl = "/chat";
				let popOption = "width = 650px, height=550px, top=300px, left=300px, scrollbars=yes";
				
				window.open(popUrl,"채팅창",popOption);
			});
		});
		</script>
</body>
</html>
