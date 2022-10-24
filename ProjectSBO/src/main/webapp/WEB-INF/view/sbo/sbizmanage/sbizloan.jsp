<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 스윗얼럿 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- sock js -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.2/sockjs.min.js"></script>
<!-- STOMP -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<!-- 날짜 포맷 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<!-- 제이쿼리 -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>

<link rel="stylesheet" href="/css/modal.css">

<link rel="stylesheet" href="/css/admin/sales.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"
	integrity="sha512-qTXRIMyZIFb8iQcfjXWCO8+M5Tbc38Qi5WzdPOYZHIlZpzBHG3L3by84BBBOiRGiEb7KKtAOAs5qYdUiZiQNNQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<meta charset="utf-8" />
<title></title>

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
			<div class="page-header">
				<div class="row">
					<div class="col-md-12 col-sm-12">
						<div class="title">
							<h4>경영관리</h4>
						</div>
						<nav aria-label="breadcrumb" role="navigation">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.html">매출관리</a></li>
								<li class="breadcrumb-item active" aria-current="page">경영성장</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>

			<div class="row clearfix">
				<div class="col-lg-6 col-md-6 col-sm-12 mb-30">
					<div class="pd-20 card-box height-50-p">
						<div class="card-box mb-30">
							<table class="table">
								<thead>
									<tr align="center">
										<th scope="col">상위 Top 5</th>
										<th scope="col">합계</th>
									</tr>
								</thead>
								<tbody>
									<tr align="center">
										<td>불고기 피자</td>
										<td>234,000</td>
									</tr>
									<tr align="center">
										<td>고구마 피자</td>
										<td>100,000</td>
									</tr>
									<tr align="center">
										<td>갈릭 고구마 피자</td>
										<td>95,000</td>
									</tr>
									<tr align="center">
										<td>갈릭 고구마 피자</td>
										<td>95,000</td>
									</tr>
									<tr align="center">
										<td>갈릭 고구마 피자</td>
										<td>95,000</td>
									</tr>
									<tr align="center">
										<td></td>
										<td></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-12 mb-30">
					<div class="pd-20 card-box height-50-p">

						<div class="btn-list">
							<table class="table">
								<tbody>
									<tr>
										<td>이번달 주문 금액</td>
										<td>234,000</td>
									</tr>
									<tr>
										<td>이번달 총 판매 수량</td>
										<td>213</td>
									</tr>
									<tr>
										<td>지난달 총 매출 금액</td>
										<td>450,000</td>
									</tr>
									<tr>
										<td>지난달 총 판매 수량</td>
										<td>355</td>
									</tr>
									<tr>
										<td>지난 달 대비 매출 증감율</td>
										<td>2.1%</td>
									</tr>
									<tr>
										<td>지난 달 대비 판매 수량 증감율</td>
										<td>10.8%</td>
									</tr>
									<tr>
										<td>지난 달 대비 매출 증감율</td>
										<td>2.1%</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<div class="wrap" style="margin-left: 16px;">
					<main>
						<section>
							<div class="today">
								<span> <span>오늘 매출</span> <span id="today"></span>
								</span>

								<button>상세보기</button>

							</div>

						</section>

						<section class="detail today_detail">
							<div>
								<h3 class="sales_today_detail_title" style="font-size: 1rem;">
									<span>매출 상세</span> <span>
										<button class="sort_name reverse">이름순</button>
										<button class="sort_price reverse">가격순</button>
									</span>
								</h3>

								<div class="sales_today_detail">
									<div>메뉴</div>
									<div>수량</div>
									<div>가격</div>
								</div>
							</div>
						</section>


						<section class="graph_section" onselectstart="return false;">
							<div class="box">
								<button class="year_btn">연 매출</button>
								<button class="month_btn">이번 달 매출</button>
								<button class="week_btn">이번 주 매출</button>
								<input type="month" name="date" id="date">
								<button class="other_month_search">검색</button>

								<h1 style="font-size: 1rem;">1월 총 합계</h1>

								<div>(단위 : 만원)</div>
								<div class="graph_box">
									<ul>
										<!-- 												 
						<li>
							<span class="sales">d</span>
							<div class="graph">d</div>
							<span class="graph_date">d</span>
						</li> -->

									</ul>

									<div class="graph_background">
										<div></div>
										<div></div>
										<div></div>
										<div></div>
										<div></div>
									</div>
								</div>

							</div>
						</section>

						<section class="detail other_detail">
							<div>
								<h3 class="sales_today_detail_title">
									<span id="other_detail_date"></span> <span>
										<button class="sort_name reverse">이름순</button>
										<button class="sort_price reverse">가격순</button>
									</span>
								</h3>
								<div class="sales_today_detail">
									<!-- <div>메뉴</div>
  					<div>수량</div>
  					<div>가격</div> -->
								</div>
							</div>
						</section>
					</main>
				</div>
				<!-- 매출 및 상위5 음식 -->
				<!-- 매출 분석 및 대출 부분 -->
			</div>
		</div>
	</div>

	<!-- js -->
	<script src="/sbo/main/vendors/scripts/core.js"></script>
	<script src="/sbo/main/vendors/scripts/script.min.js"></script>
	<script src="/sbo/main/vendors/scripts/process.js"></script>
	<script src="/sbo/main/vendors/scripts/layout-settings.js"></script>
	<script
		src="/sbo/main/src/plugins/datatables/js/jquery.dataTables.min.js"></script>
	<script
		src="/sbo/main/src/plugins/datatables/js/dataTables.bootstrap4.min.js"></script>
	<script
		src="/sbo/main/src/plugins/datatables/js/dataTables.responsive.min.js"></script>
	<script
		src="/sbo/main/src/plugins/datatables/js/responsive.bootstrap4.min.js"></script>
	<!-- buttons for Export datatable -->
	<script
		src="/sbo/main/src/plugins/datatables/js/dataTables.buttons.min.js"></script>
	<script
		src="/sbo/main/src/plugins/datatables/js/buttons.bootstrap4.min.js"></script>
	<script src="/sbo/main/src/plugins/datatables/js/buttons.print.min.js"></script>
	<script src="/sbo/main/src/plugins/datatables/js/buttons.html5.min.js"></script>
	<script src="/sbo/main/src/plugins/datatables/js/buttons.flash.min.js"></script>
	<script src="/sbo/main/src/plugins/datatables/js/pdfmake.min.js"></script>
	<script src="/sbo/main/src/plugins/datatables/js/vfs_fonts.js"></script>
	<!-- Datatable Setting js -->
	<script src="/sbo/main/vendors/scripts/datatable-setting.js"></script>


	<%@ include file="/WEB-INF/view/admin/modal_adminMain.jsp"%>
	<script src="/js/util/util.js"></script>
	<script src="/js/admin/sales.js"></script>
</body>

</html>