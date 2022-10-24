<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 스윗얼럿 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- sock js -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.2/sockjs.min.js"></script>
<!-- STOMP -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<!-- 날짜 포맷 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js" ></script>
<!-- 제이쿼리 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

<link rel="stylesheet" href="/css/modal.css" >

<link rel="stylesheet" href="/css/admin/sales.css" >
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js" 
integrity="sha512-qTXRIMyZIFb8iQcfjXWCO8+M5Tbc38Qi5WzdPOYZHIlZpzBHG3L3by84BBBOiRGiEb7KKtAOAs5qYdUiZiQNNQ=="
 crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<meta charset="UTF-8">
<title>Insert title here</title>

		<!-- Basic Page Info -->
		<meta charset="utf-8" />
		<title></title>

		<!-- CSS -->
 		<link rel="stylesheet" type="text/css" href="/sbo/main/vendors/styles/core.css" />
		<link
			rel="stylesheet"
			type="text/css"
			href="/sbo/main/vendors/styles/icon-font.min.css"
		/>
		<link
			rel="stylesheet"
			type="text/css"
			href="/sbo/main/src/plugins/datatables/css/dataTables.bootstrap4.min.css"
		/>
		<link
			rel="stylesheet"
			type="text/css"
			href="/sbo/main/src/plugins/datatables/css/responsive.bootstrap4.min.css"
		/> 
		<link rel="stylesheet" type="text/css" href="/sbo/main/vendors/styles/style.css" />
</head>
	<body>
		<div class="header">
			<div class="header-left">
				<div class="menu-icon bi bi-list"></div>
				<div
					class="search-toggle-icon bi bi-search"
					data-toggle="header_search"
				></div>
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
					Layout Settings
					<span class="btn-block font-weight-400 font-12"
						>User Interface Settings</span
					>
				</h3>
				<div class="close-sidebar" data-toggle="right-sidebar-close">
					<i class="icon-copy ion-close-round"></i>
				</div>
			</div>
			<div class="right-sidebar-body customscroll">
				<div class="right-sidebar-body-content">
					<h4 class="weight-600 font-18 pb-10">Header Background</h4>
					<div class="sidebar-btn-group pb-30 mb-10">
						<a
							href="javascript:void(0);"
							class="btn btn-outline-primary header-white active"
							>White</a
						>
						<a
							href="javascript:void(0);"
							class="btn btn-outline-primary header-dark"
							>Dark</a
						>
					</div>

					<h4 class="weight-600 font-18 pb-10">Sidebar Background</h4>
					<div class="sidebar-btn-group pb-30 mb-10">
						<a
							href="javascript:void(0);"
							class="btn btn-outline-primary sidebar-light"
							>White</a
						>
						<a
							href="javascript:void(0);"
							class="btn btn-outline-primary sidebar-dark active"
							>Dark</a
						>
					</div>

					<h4 class="weight-600 font-18 pb-10">Menu Dropdown Icon</h4>
					<div class="sidebar-radio-group pb-10 mb-10">
						<div class="custom-control custom-radio custom-control-inline">
							<input
								type="radio"
								id="sidebaricon-1"
								name="menu-dropdown-icon"
								class="custom-control-input"
								value="icon-style-1"
								checked=""
							/>
							<label class="custom-control-label" for="sidebaricon-1"
								><i class="fa fa-angle-down"></i
							></label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input
								type="radio"
								id="sidebaricon-2"
								name="menu-dropdown-icon"
								class="custom-control-input"
								value="icon-style-2"
							/>
							<label class="custom-control-label" for="sidebaricon-2"
								><i class="ion-plus-round"></i
							></label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input
								type="radio"
								id="sidebaricon-3"
								name="menu-dropdown-icon"
								class="custom-control-input"
								value="icon-style-3"
							/>
							<label class="custom-control-label" for="sidebaricon-3"
								><i class="fa fa-angle-double-right"></i
							></label>
						</div>
					</div>

					<h4 class="weight-600 font-18 pb-10">Menu List Icon</h4>
					<div class="sidebar-radio-group pb-30 mb-10">
						<div class="custom-control custom-radio custom-control-inline">
							<input
								type="radio"
								id="sidebariconlist-1"
								name="menu-list-icon"
								class="custom-control-input"
								value="icon-list-style-1"
								checked=""
							/>
							<label class="custom-control-label" for="sidebariconlist-1"
								><i class="ion-minus-round"></i
							></label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input
								type="radio"
								id="sidebariconlist-2"
								name="menu-list-icon"
								class="custom-control-input"
								value="icon-list-style-2"
							/>
							<label class="custom-control-label" for="sidebariconlist-2"
								><i class="fa fa-circle-o" aria-hidden="true"></i
							></label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input
								type="radio"
								id="sidebariconlist-3"
								name="menu-list-icon"
								class="custom-control-input"
								value="icon-list-style-3"
							/>
							<label class="custom-control-label" for="sidebariconlist-3"
								><i class="dw dw-check"></i
							></label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input
								type="radio"
								id="sidebariconlist-4"
								name="menu-list-icon"
								class="custom-control-input"
								value="icon-list-style-4"
								checked=""
							/>
							<label class="custom-control-label" for="sidebariconlist-4"
								><i class="icon-copy dw dw-next-2"></i
							></label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input
								type="radio"
								id="sidebariconlist-5"
								name="menu-list-icon"
								class="custom-control-input"
								value="icon-list-style-5"
							/>
							<label class="custom-control-label" for="sidebariconlist-5"
								><i class="dw dw-fast-forward-1"></i
							></label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input
								type="radio"
								id="sidebariconlist-6"
								name="menu-list-icon"
								class="custom-control-input"
								value="icon-list-style-6"
							/>
							<label class="custom-control-label" for="sidebariconlist-6"
								><i class="dw dw-next"></i
							></label>
						</div>
					</div>

					<div class="reset-options pt-30 text-center">
						<button class="btn btn-danger" id="reset-settings">
							Reset Settings
						</button>
					</div>
				</div>
			</div>
		</div>

		<div class="left-side-bar">
			<div class="brand-logo" style="padding-bottom: 10px;">
				<a href="/sbo/login">
					<img src="/sbo/main/src/images/logo.jpg" alt="메인로고"/>
				</a>
				<div class="close-sidebar" data-toggle="left-sidebar-close">
					<i class="ion-close-round"></i>
				</div>
			</div>
			<div class="menu-block customscroll">
				<div class="sidebar-menu">
					<ul id="accordion-menu">
						<li class="dropdown">
							<a href="javascript:;" class="dropdown-toggle">
								<span class="micon bi bi-house"></span
								><span class="mtext">가게 및 고객 관리</span>
							</a>
							<ul class="submenu">
								<li><a href="sbo/store">기본 정보(계약정보)</a></li>
								<li><a href="basic-table.html">리뷰 관리</a></li>
							</ul>
						</li>
						<li class="dropdown">
							<a href="javascript:;" class="dropdown-toggle no-arrow">
								<span class="micon bi bi-textarea-resize"></span
								><span class="">메뉴 관리</span>
							</a>
						</li>
						<li>
							<a href="calendar.html" class="dropdown-toggle no-arrow">
								<span class="micon bi bi-calendar4-week"></span
								><span class="mtext">일정 관리</span>
							</a>
						</li>
						<li class="dropdown">
							<a href="javascript:;" class="dropdown-toggle">
								<span class="micon bi bi-archive"></span
								><span class="mtext">매출 관리</span>
							</a>
							<ul class="submenu">
								<li><a href="/order">주문 확인</a></li>
								<li><a href="/sales">매출 정보</a></li>
							</ul>
						</li>
						
						<li class="dropdown">
							<a href="javascript:;" class="dropdown-toggle">
								<span class="micon bi bi-archive"></span
								><span class="mtext">대출 관리</span>
							</a>
							<ul class="submenu">
								<li><a href="/loan">대출 정보</a></li>
								<li><a href="/chat" target='_blank'>1:1 상담</a></li>
							</ul>
						</li>
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
			<!-- 				<div class="min-height-200px">
 -->
			<div class="page-header">
				<div class="row">
					<div class="col-md-6 col-sm-12">
						<div class="title">
							<h4>매출 정보</h4>
						</div>
					</div>
				</div>
				<!-- </div> -->
			</div>
		</div>
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="card-box height-100-p widget-style1">
				<div class="move_top">
					<div></div>
				</div>
				<div class="wrap">
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
								<h3 class="sales_today_detail_title">
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

								<h1>1월 총 합계</h1>

								<div>(단위 : 만원)</div>
								<div class="graph_box">
									<ul>
										<!-- 
						<li>
							<span class="sales"></span>
							<div class="graph"></div>
							<span class="graph_date"></span>
						</li>
						 -->
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
			</div>
		</div>
	</div>
	<div class="col-xl-8 mb-30">
		<div class="card-box height-100-p pd-20">
			<h2 class="h4 mb-20"></h2>
		</div>
	</div>
	<div class="col-xl-4 mb-30">
		<div class="card-box height-100-p pd-20">
			<h2 class="h4 mb-20"></h2>
		</div>
	</div>

	<div class="col-xl-4 mb-30">
		<div class="card-box height-100-p pd-20">
			<h2 class="h4 mb-20"></h2>
		</div>
	</div>


	<div class="footer-wrap pd-20 mb-20 card-box"></div>

	<!-- js -->
		<script src="/sbo/main/vendors/scripts/core.js"></script>
		<script src="/sbo/main/vendors/scripts/script.min.js"></script>
		<script src="/sbo/main/vendors/scripts/process.js"></script>
		<script src="/sbo/main/vendors/scripts/layout-settings.js"></script>
		<script src="/sbo/main/src/plugins/datatables/js/jquery.dataTables.min.js"></script>
		<script src="/sbo/main/src/plugins/datatables/js/dataTables.bootstrap4.min.js"></script>
		<script src="/sbo/main/src/plugins/datatables/js/dataTables.responsive.min.js"></script>
		<script src="/sbo/main/src/plugins/datatables/js/responsive.bootstrap4.min.js"></script> 
<!-- 		<script src="/sbo/main/vendors/scripts/dashboard.js"></script> -->
		
		
		<%@ include file="/WEB-INF/view/admin/modal_adminMain.jsp" %>
		<script src="/js/util/util.js"></script>
		<script src="/js/admin/sales.js"></script> 
	</body>

</html>