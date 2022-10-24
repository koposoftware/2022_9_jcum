<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 제이쿼리 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- 스윗얼럿 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<link rel="stylesheet" href="/css/modal.css" >
<link rel="stylesheet" href="/css/admin/sales.css" >

<meta charset="UTF-8">
<title>Insert title here</title>

		<!-- Basic Page Info -->
		<meta charset="utf-8" />
		<title>/</title>

		<link
			rel="icon"
			type="image/png"
			sizes="32x32"
			href="/sbo/main/vendors/images/favicon-32x32.png"
		/>
		<link
			rel="icon"
			type="image/png"
			sizes="16x16"
			href="/sbo/main/vendors/images/favicon-16x16.png"
		/>

		<!-- Mobile Specific Metas -->
		<meta
			name="viewport"
			content="width=device-width, initial-scale=1, maximum-scale=1"
		/>

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
				<div class="dashboard-setting user-notification">
					<div class="dropdown">
						<a
							class="dropdown-toggle no-arrow"
							href="javascript:;"
							data-toggle="right-sidebar"
						>
							<i class="dw dw-settings2"></i>
						</a>
					</div>
				</div>
				<div class="user-info-dropdown">
					<div class="dropdown">
						<a
							class="dropdown-toggle"
							href="#"
							role="button"
							data-toggle="dropdown"
						>
							<span class="user-icon">
								<!-- <img src="/sbo/main/vendors/images/photo1.jpg" alt="" /> -->
							</span>
							<span class="user-name"> 0 0 0 님</span>
						</a>
						<div
							class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list"
						>
							<a class="dropdown-item" href="profile.html"
								><i class="dw dw-user1"></i> Profile(내 정보)</a
							>
							<a class="dropdown-item" href="profile.html"
								><i class="dw dw-settings2"></i> Setting(화면 재구성)</a
							>
							<a class="dropdown-item" href="faq.html"
								><i class="dw dw-help"></i> Help(컨시어지)</a
							>
						</div>
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
								<li><a href="/">상품 추천(대출)</a></li>
								<li><a href="ui-cards.html">매출 통계</a></li>
							</ul>
						</li>
						
						<li class="dropdown">
							<a href="javascript:;" class="dropdown-toggle">
								<span class="micon bi bi-archive"></span
								><span class="mtext">대출 관리</span>
							</a>
							<ul class="submenu">
								<li><a href="/loan">대출 정보</a></li>
								<li><a href="ui-cards.html">1:1 상담</a></li>
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
							<h4>대출 정보</h4>
						</div>
					</div>
				</div>
				<!-- </div> -->
			</div>
		</div>

		<div class="clearfix">
			<div class="col-md-6 col-sm-12 mb-30">
				<div class="pd-20 card-box height-100-p">
					<h4 class="mb-15 h4">대출명 : 혁신형 소상공인자금</h4>
					<p>대출금액 : 1000000000 원 (3.877%)</p>
					<div class="btn-list">
						<button type="button" class="btn btn-info">상품확인</button>
						<button type="button" class="btn btn-info review regi">상품가입</button>
					</div>
				</div>
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
		
		</div>

		<!-- js -->
		<script src="/sbo/main/vendors/scripts/core.js"></script>
		<script src="/sbo/main/vendors/scripts/script.min.js"></script>
		<script src="/sbo/main/vendors/scripts/process.js"></script>
		<script src="/sbo/main/vendors/scripts/layout-settings.js"></script>
		<script src="/sbo/main/src/plugins/datatables/js/jquery.dataTables.min.js"></script>
		<script src="/sbo/main/src/plugins/datatables/js/dataTables.bootstrap4.min.js"></script>
		<script src="/sbo/main/src/plugins/datatables/js/dataTables.responsive.min.js"></script>
		<script src="/sbo/main/src/plugins/datatables/js/responsive.bootstrap4.min.js"></script> 
		
		<%@ include file="/WEB-INF/view/modal/modal_review.jsp" %>
		<script type="text/javascript" src="/js/util/util.js" ></script>
		<script type="text/javascript" src="/js/order/orderList.js" ></script>

	</body>


</html>