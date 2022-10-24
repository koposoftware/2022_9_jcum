<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Basic Page Info -->
<meta charset="utf-8" />
<title></title>

<!-- Mobile Specific Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />

<!-- CSS -->
<link rel="stylesheet" type="text/css"
	href="/sbo/main/vendors/styles/core.css" />
<link rel="stylesheet" type="text/css"
	href="/sbo/main/vendors/styles/icon-font.min.css" />
<link rel="stylesheet" type="text/css"
	href="/sbo/main/src/plugins/datatables/css/dataTables.bootstrap4.min.css" />
<link rel="stylesheet" type="text/css"
	href="/sbo/main/src/plugins/datatables/css/responsive.bootstrap4.min.css" />
<link rel="stylesheet" type="text/css"
	href="/sbo/main/vendors/styles/style.css" />
	
<style>
.increase {
	background-image: url(/sbo/images/owners/i_increase.svg);
	color: #e02171;
	background-repeat: no-repeat;
	width: 16px;
	height: 16px;
	display: inline-block;
	margin-right: 4.5rem;
	background-size: 13px 13px;
	background-position: center bottom;
	padding-left: 17px;
}
.decrease{
    background-image: url(/sbo/images/owners/i_decrease.svg);
    color: #0676dd;
	background-repeat: no-repeat;
	width: 16px;
	height: 16px;
	display: inline-block;
	margin-right: 4.5rem;
	background-size: 13px 13px;
	background-position: center bottom;
	padding-left: 17px;
}

.noselect {
  -webkit-touch-callout: none;
  -webkit-user-select: none;
  -khtml-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}


#area-adwords {
  min-height: 330px !important;
  /* margin-right: -20px; */
}
#activities-chart{
  min-height: 280px !important;
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
						data-toggle="dropdown"> <span class="user-icon" style="width:0px;">
							<!-- <img src="/sbo/main/vendors/images/photo1.jpg" alt="" /> -->
					</span> <span class="user-name"> 홍길동 님 환영합니다.</span>
					</a>
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
					<li class="dropdown">
						<a href="javascript:;" class="dropdown-toggle">
							<span class="micon bi bi-archive"></span>
						 	<span class="mtext">매출 관리</span>
						</a>
						<ul class="submenu">
							<li><a href="/orders/205">주문 확인</a></li>
							<li><a href="/sales/205">매출 정보</a></li>
						</ul>
					</li>
					
					<li>
						<a href="javascript:;" class="dropdown-toggle">
							<span class="micon bi bi-calendar4-week"></span><span
							class="mtext">매입 관리</span>
						</a>
						<ul class="submenu">
							<li><a href="/purchase">매입 등록</a></li>
						</ul>
					</li>

					<li class="dropdown"><a href="javascript:;"
						class="dropdown-toggle"> <span class="micon bi bi-archive"></span><span
							class="mtext">대출 관리</span>
					</a>
						<ul class="submenu">
							<li><a href="/loanstore">대출 상품</a></li>
							<li><a href="/chat" target='_blank' >1:1 상담</a></li>
						</ul></li>
					<li>
						<div class="dropdown-divider"></div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="mobile-menu-overlay"></div>

	<div class="main-container" id="content">
		<div class="xs-pd-20-10 pd-ltr-20">
				<div class="row clearfix progress-box">
					<div class="col-lg-3 col-md-6 col-sm-12 mb-30">
						<div class="card-box pd-30 height-50-p">
							<div class="progress-box text-center">
								<input
									type="text"
									class="knob dial1"
									value="80"
									data-width="120"
									data-height="120"
									data-linecap="round"
									data-thickness="0.12"
									data-bgColor="#fff"
									data-fgColor="#1b00ff"
									data-angleOffset="180"
									readonly
								/>
								<!-- 어제 주문횟수와 지난주 비교 -->
								<h5 class="text-blue padding-top-10 h5" id="orderCnt"></h5>
								<span class="d-block">지난주 (화) 대비</span>
								<span class="text-light-orange increase" id="pastCnt"></span>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-6 col-sm-12 mb-30">
						<div class="card-box pd-30 height-100-p">
							<div class="progress-box text-center">
								<input
									type="text"
									class="knob dial2"
									value="70"
									data-width="120"
									data-height="120"
									data-linecap="round"
									data-thickness="0.12"
									data-bgColor="#fff"
									data-fgColor="#00e091"
									data-angleOffset="180"
									readonly
								/>
								<!-- 어제 매출과 비교하여 지난주 증감률 -->
								<h5 class="text-light-green padding-top-10 h5" id="orderSum"></h5>
								<span class="d-block">지난주 (화) 대비</span>
								<span class="text-light-orange increase" id="pastSum"></span>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-6 col-sm-12 mb-30">
						<div class="card-box pd-30 height-100-p">
							<div class="progress-box text-center">
							<input
									type="text"
									class="knob dial3"
									value="90"
									data-width="120"
									data-height="120"
									data-linecap="round"
									data-thickness="0.12"
									data-bgColor="#fff"
									data-fgColor="#f56767"
									data-angleOffset="180"
									readonly
								/>
								<!-- 오늘로 부터 전주와 비교해서 오전/오후 결제 건수 -->
								<h5 class="text-light-orange padding-top-10 h5">
									어제 오전/오후 결제 건수
								</h5>
								<span class="d-block">그저께 대비</span>
								<span class="text-light-orange decrease" id="salesCnt"></span>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-6 col-sm-12 mb-30">
						<div class="card-box pd-30 height-100-p">
							<div class="progress-box text-center">
								<input
									type="text"
									class="knob dial4"
									value="65"
									data-width="120"
									data-height="120"
									data-linecap="round"
									data-thickness="0.12"
									data-bgColor="#fff"
									data-fgColor="#a683eb"
									data-angleOffset="180"
									readonly
								/>
								<!-- 주중 가장많은 매출이 나온 구간 -->
								<h5 class="text-light-purple padding-top-10 h5" id="salesWeekSum"></h5>
								<span class="d-block">지난주 대비</span>
								<span class="text-light-orange increase" id="salesTwoWeekSum"></span>
							</div>
						</div>
					</div>
				</div>

			<div class="row pb-10" id="preTest">
				<div class="col-md-8 mb-20">
					<div class="card-box height-50-p pd-20">
						<div
							class="d-flex flex-wrap justify-content-between align-items-center pb-0 pb-md-3">
							<div class="h5 mb-md-0">매입/매출 - 22년 10월 4주(건수)</div>
							<div class="form-group mb-md-0">
								<select id="selEvent" class="form-control form-control-sm selectpicker">
									<option value="week">1주일</option>
									<option value="month">1개월</option>
									<option value="sixmonth">6개월</option>
									<option value="year">12개월</option>
								</select>
							</div>
						</div>
						<div id=activities-chart></div>
					</div>
					<br>
					<div class="card-box height-50-p pd-20">
						<div
							class="d-flex flex-wrap justify-content-between align-items-center pb-0 pb-md-3">
							<div class="h5 mb-md-0">주간 가장 많이 팔린 메뉴</div>
						</div>
						<div id=Weekchart></div>
					</div>
				</div>
				
				<div class="col-md-4 mb-20" id="graphTestd">

					<div class="card-box pd-10">
						<div class="h5 mb-md-0" style="padding: 10px;">요일별 가게 방문자 수</div>
						<div id="area-adwords"></div>
					</div>
					<br>
					<!-- 요일별 평균 금액 -->
					<div class="card-box pd-10">
						<div class="h5 mb-md-0" style="padding: 10px;">요일별 평균결제금액</div>
						<div id="chart"></div>
					</div>
					
				</div>
			</div>
			<div class="card-box pb-10">
				<div class="h5 pd-20 mb-0">최근 주문 내역</div>
				<table class="data-table table nowrap">
					<thead>
						<tr>
							<th class="table-plus">주문번호</th>
							<th>주문시각</th>
							<th>주문내역</th>
							<th>결제금액</th>
							<th>결제방식</th>
							<th>배달상태</th>
							<th class="datatable-nosort">주문자 정보</th>
						</tr>
					</thead>
					<tbody>
						<tr align="center">
							<td class="table-plus">
								<div class="name-avatar d-flex align-items-center">
									<div class="avatar mr-2 flex-shrink-0">

									</div>
									<div class="txt">
										<div class="weight-600">20228258646648630</div>
									</div>
								</div>
							</td>
							<td>22/10/20 20:19:54</td>
							<td style="cursor: pointer;">불고기피자 외 1개</td>
							<td>48000</td>
							<td>신용카드</td>
							<td>
							주문접수 대기 중
							</td>
							<td>
							상세정보 보기
							</td>
						</tr>
						<tr align="center">
							<td class="table-plus">
								<div class="name-avatar d-flex align-items-center">
									<div class="avatar mr-2 flex-shrink-0">

									</div>
									<div class="txt">
										<div class="weight-600">20228250556711606</div>
									</div>
								</div>
							</td>
							<td>22/10/20 22:20:13</td>
							<td>치즈피자 외 1개</td>
							<td>57000</td>
							<td>현장결제</td>
							<td>
							배달 완료
							</td>
							<td>
							상세정보 보기
							</td>
						</tr>
						<tr align="center">
							<td class="table-plus">
								<div class="name-avatar d-flex align-items-center">
									<div class="avatar mr-2 flex-shrink-0">

									</div>
									<div class="txt">
										<div class="weight-600">20228258646648616</div>
									</div>
								</div>
							</td>
							<td>22/10/21 12:19:54</td>
							<td>불고기피자 외 1개</td>
							<td>37000</td>
							<td>현장결제</td>
							<td>
							주문접수 대기 중
							</td>
							<td>
							상세정보 보기
							</td>
						</tr>
						<tr align="center">
							<td class="table-plus">
								<div class="name-avatar d-flex align-items-center">
									<div class="avatar mr-2 flex-shrink-0">

									</div>
									<div class="txt">
										<div class="weight-600">20228258646648616</div>
									</div>
								</div>
							</td>
							<td>22/10/19 20:19:54</td>
							<td>불고기피자 외 1개</td>
							<td>48000</td>
							<td>신용카드</td>
							<td>
							주문접수 대기 중
							</td>
							<td>
							상세정보 보기
							</td>
						</tr>
							<tr align="center">
							<td class="table-plus">
								<div class="name-avatar d-flex align-items-center">
									<div class="avatar mr-2 flex-shrink-0">

									</div>
									<div class="txt">
										<div class="weight-600">20228258646648616</div>
									</div>
								</div>
							</td>
							<td>22/10/20 20:19:54</td>
							<td>불고기피자 외 1개</td>
							<td>48000</td>
							<td>신용카드</td>
							<td>
							주문접수 대기 중
							</td>
							<td>
							상세정보 보기
							</td>
						</tr>
						<tr align="center">
							<td class="table-plus">
								<div class="name-avatar d-flex align-items-center">
									<div class="avatar mr-2 flex-shrink-0">

									</div>
									<div class="txt">
										<div class="weight-600">20228258646648616</div>
									</div>
								</div>
							</td>
							<td>22/10/19 20:19:54</td>
							<td>불고기피자 외 1개</td>
							<td>48000</td>
							<td>신용카드</td>
							<td>
							주문접수 대기 중
							</td>
							<td>
							상세정보 보기
							</td>
						</tr>
						<tr align="center">
							<td class="table-plus">
								<div class="name-avatar d-flex align-items-center">
									<div class="avatar mr-2 flex-shrink-0">

									</div>
									<div class="txt">
										<div class="weight-600">20228258646648616</div>
									</div>
								</div>
							</td>
							<td>22/10/21 20:19:54</td>
							<td>불고기피자 외 1개</td>
							<td>48000</td>
							<td>신용카드</td>
							<td>
							주문접수 대기 중
							</td>
							<td>
							상세정보 보기
							</td>
						</tr>
							<tr align="center">
							<td class="table-plus">
								<div class="name-avatar d-flex align-items-center">
									<div class="avatar mr-2 flex-shrink-0">

									</div>
									<div class="txt">
										<div class="weight-600">20228258646648616</div>
									</div>
								</div>
							</td>
							<td>22/10/20 20:19:54</td>
							<td>불고기피자 외 1개</td>
							<td>48000</td>
							<td>신용카드</td>
							<td>
							주문접수 대기 중
							</td>
							<td>
							상세정보 보기
							</td>
						</tr>
					</tbody>
				</table>
			</div>

			<div class="title pb-20 pt-20">
				<h2 class="h3 mb-0">경영관리</h2>
			</div>

			<div class="row">
				<div class="col-md-4 mb-20">
					<a href="/sales/205" class="card-box d-block mx-auto pd-20 text-secondary">
						<div class="img pb-30" style="text-align: center;">
							<img src="/sbo/main/vendors/images/ico_ms_01.png" alt="" />
						</div>
						<div class="content">
							<h3 class="h4">경영성장</h3>
							<p class="max-width-200">소상공인 성장을 위한 매출 분석 및
								금융상품 추천</p>
						</div>
					</a>
				</div>
				<div class="col-md-4 mb-20">
					<a href="/commercial" class="card-box d-block mx-auto pd-20 text-secondary">
						<div class="img pb-30" style="text-align: center;">
							<img src="/sbo/main/vendors/images/ico_ms_02.png" alt="" />
						</div>
						<div class="content">
							<h3 class="h4">상권분석</h3>
							<p class="max-width-210">입점한 가게 지역구에서 
							동종업계 매출, 업소의 수, 경쟁분석 등의 정보 제공</p>
						</div>
					</a>
				</div>
				<div class="col-md-4 mb-20">
					<a href="#" class="card-box d-block mx-auto pd-20 text-secondary">
						<div class="img pb-30" style="text-align: center;">
							<img src="/sbo/main/vendors/images/3233514.png" alt="" width="128" height="128" />
						</div>
						<div class="content">
							<h3 class="h4">장사뉴스 및 트랜드</h3>
							<p class="max-width-200">소상공인 정책과 복지혜택정보 제공</p>
						</div>
					</a>
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
			<!-- js -->
	<script src="/sbo/main/vendors/scripts/core.js"></script>
	<script src="/sbo/main/vendors/scripts/script.min.js"></script>
	<script src="/sbo/main/vendors/scripts/process.js"></script>
	<script src="/sbo/main/vendors/scripts/layout-settings.js"></script>
	<script src="/sbo/main/src/plugins/apexcharts/apexcharts.min.js"></script>
	<script
		src="/sbo/main/src/plugins/datatables/js/jquery.dataTables.min.js"></script>
	<script
		src="/sbo/main/src/plugins/datatables/js/dataTables.bootstrap4.min.js"></script>
	<script
		src="/sbo/main/src/plugins/datatables/js/dataTables.responsive.min.js"></script>
	<script
		src="/sbo/main/src/plugins/datatables/js/responsive.bootstrap4.min.js"></script>
		
	<script src="/sbo/main/src/plugins/jQuery-Knob-master/jquery.knob.min.js"></script>	
	<script src="/sbo/main/vendors/scripts/dashboard2.js"></script>
	<script src="/sbo/main/vendors/scripts/dashboard3.js"></script>
	
	
	
	<!-- 리포트 생성 부분 -->
	<script type="text/javascript">
	
		$(document).ready(function() {

	        var dDay = new Date("10/18/2022 19:00:00");
	        var nowDay = new Date();
	        if(nowDay.getTime() > dDay.getTime()){
	        	//createPdf();
	        }
		});

		function createPdf() {
			var url = "/jsonto";
			var title = "popup test";
			
			
	        var screenLeft = window.screenLeft != undefined ? window.screenLeft : screen.left;
	        var screenTop = window.screenTop != undefined ? window.screenTop : screen.top;
	 
	        width = window.innerWidth ? window.innerWidth : document.documentElement.clientWidth ? document.documentElement.clientWidth : screen.width;
	        height = window.innerHeight ? window.innerHeight : document.documentElement.clientHeight ? document.documentElement.clientHeight : screen.height;
	 
	        var left = ((width / 2) - (604 / 2)) + screenLeft;
	        var top = ((height / 2) - (586 / 2)) + screenTop;
			
	        window.open(url, title, 'scrollbars=no,titlebar=no,toolbar=no, width=' + 383 + ', height=' + 361 + ', top=' + top + ', left=' + left);
		}		
	</script>
</body>
</html>
