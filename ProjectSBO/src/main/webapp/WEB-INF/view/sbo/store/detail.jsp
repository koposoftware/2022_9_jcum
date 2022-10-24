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
	href="/bootmodal/vendors/styles/core.css" />
<link rel="stylesheet" type="text/css"
	href="/sbo/main/vendors/styles/icon-font.min.css" />
<link rel="stylesheet" type="text/css"
	href="/sbo/main/src/plugins/datatables/css/dataTables.bootstrap4.min.css" />
<link rel="stylesheet" type="text/css"
	href="/sbo/main/src/plugins/datatables/css/responsive.bootstrap4.min.css" />
<link rel="stylesheet" type="text/css"
	href="/bootmodal/vendors/styles/style.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	
<style type="text/css">

.custom-control-label::before {
    width: 20px;
    height: 20px;
    top: 2px;
    left: -30px;
    background-color: transparent;
    border: 2px solid #000000;
}
.custom-radio .custom-control-input:checked~.custom-control-label::before {
    background-color: #173641;
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
						<div class="col-md-12 col-sm-12">
							<div class="title">
								<h4>내 가게</h4>
							</div>
							<nav aria-label="breadcrumb" role="navigation">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.html">가게정보</a>
									</li>
									<li class="breadcrumb-item active" aria-current="page">
										가게정보 및 통합조회설정</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 mb-30">
						<div class="pd-20 card-box height-100-p">
							<div class="profile-info">
								<h5 class="mb-20 h5" style="font-size: 30px;">내 가게 정보</h5>
								<ul>
									<li><b>이메일 주소</b> <span
										style="color: #019591; font-size: 17px;">abctmxk@naver.com</span>
									</li>
									<li><b>휴대폰 번호</b> <span
										style="color: #019591; font-size: 17px;">010-4544-2412</span>
									</li>
									<li><b>영업정보</b> <br>
									<br> <span style="color: #000; display: inline-block;">상호명</span>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span
										style="color: #019591; display: inline-block; font-size: 17px;">하나피자홀릭
											</span> <br> <span
										style="color: #000; display: inline-block;">영업시간</span>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span
										style="color: #019591; display: inline-block; font-size: 17px;">14시
											~ 22시</span></li>
									<li><b>가계통계</b> <br>
									<br> <span style="color: #000; display: inline-block;">최근
											주문수</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span
										style="color: #019591; display: inline-block; font-size: 17px;">32</span>
										<br> <span style="color: #000; display: inline-block;">전체
											리뷰 수</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span
										style="color: #019591; display: inline-block; font-size: 17px;">50</span>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-xl-8 col-lg-8 col-md-8 col-sm-12 mb-30">
						<div class="card-box height-100-p overflow-hidden">
							<div class="profile-tab height-100-p">
								<div class="tab height-100-p">
									<ul class="nav nav-tabs customtab" role="tablist">
										<li class="nav-item"><a class="nav-link active"
											data-toggle="tab" href="#tasks" role="tab">가입대출정보</a></li>
										<li class="nav-item"><a class="nav-link"
											data-toggle="tab" href="#setting" role="tab">설정</a></li>
									</ul>
									<div class="tab-content">
										<!-- Tasks Tab start -->
										<div class="tab-pane fade show active" id="tasks"
											role="tabpanel">
											<div class="pd-20 profile-task-wrap">
												<div class="container pd-0">
													<!-- Open Task start -->
													<div class="task-title row align-items-center">
														<div class="col-md-8 col-sm-12">
															<h5>가입된 대출 상품은 2개입니다.</h5>
														</div>
													</div>
													<div class="profile-task-list pb-30">
														<ul>
															<li>
																<div class="task-type">서울신용보증대출</div> 원큐 보증재단 대출
																<div class="task-assign">
																	금리 3.837 %
																	<div class="due-date">
																		대출금액 <span>30,000,000원</span>
																	</div>
																</div>
															</li>
															<li>
																<div class="task-type">소상공인대출</div> 우리사장님 맘편한 대출
																<div class="task-assign">
																	금리 4.837 %
																	<div class="due-date">
																		대출금액 <span>35,000,000원</span>
																	</div>
																</div>
															</li>
														</ul>
													</div>
													<!-- Open Task End -->
												</div>
											</div>
										</div>
										<!-- Setting Tab start -->
										<div class="tab-pane fade height-100-p" id="setting"
											role="tabpanel">
											<div class="profile-setting">
												<!-- <form> -->
													<ul class="profile-edit-list row">
														<li class="weight-500 col-md-6">
															<h4 class="h5 mb-20">매출연동관리</h4>
															<div>
																<div class="custom-control custom-radio mb-5">
																	<input type="radio" id="customRadio1"
																		name="customRadio" class="custom-control-input">
																	<label class="custom-control-label" for="customRadio1">
																		카드매출내역(여신협회)</label>
																</div>
																<div class="custom-control custom-radio mb-5">
																	<input type="radio" id="customRadio2"
																		name="customRadio" class="custom-control-input">
																	<label class="custom-control-label radio-primary"
																		for="customRadio2"> 현금영수증내역(홈텍스)</label>
																</div>
																<div class="custom-control custom-radio mb-5">
																	<input type="radio" id="customRadio3"
																		name="customRadio" class="custom-control-input">
																	<label class="custom-control-label" for="customRadio3">
																		원큐페이 매출내역</label>
																</div>
																<div class="form-group mb-0">
																	<a href="#" class="btn btn-outline-success"
																		data-toggle="modal" data-target="#Medium-modal"
																		type="button" id="connect">연동하기 </a>
																</div>
																<div class="modal fade" id="Medium-modal" tabindex="-1"
																	role="dialog" aria-labelledby="myLargeModalLabel"
																	aria-hidden="true" style="display: none;">
																	<div class="modal-dialog modal-dialog-centered">
																		<div class="modal-content">
																			<div class="modal-header">
																				<h4 class="modal-title" id="myLargeModalLabel">
																					가맹점 정보</h4>
																				<button type="button" class="close"
																					data-dismiss="modal" aria-hidden="true">×
																				</button>
																			</div>
																			<div class="modal-body">
																				<div class="form-group row">
																					<label class="col-sm-12 col-md-3 col-form-label">사업자번호</label>
																					<div class="col-sm-6 col-md-9">
																						<input class="form-control" id="business_no"
																							type="text" value="200-02-88000">
																					</div>
																				</div>
																				<div class="form-group row">
																					<label class="col-sm-12 col-md-3 col-form-label">가맹점명</label>
																					<div class="col-sm-12 col-md-9">
																						<input class="form-control" id="store_name"
																							type="text" value="하나피자홀릭">
																					</div>
																				</div>
																				<div class="form-group row">
																					<label class="col-sm-12 col-md-3 col-form-label">대표자명</label>
																					<div class="col-sm-12 col-md-9">
																						<input class="form-control" id="store_repre"
																							type="text" value="김대성">
																					</div>
																				</div>
																				<div class="form-group row">
																					<label class="col-sm-12 col-md-4 col-form-label">대표자
																						생년월일</label>
																					<div class="col-sm-12 col-md-8">
																						<input class="form-control" id="store_birth"
																							type="text" value="931123">
																					</div>
																				</div>
																				<div class="form-group row">
																					<label class="col-sm-12 col-md-3 col-form-label">입금은행</label>
																					<div class="col-sm-12 col-md-9">
																						<input class="form-control" id="store_bank"
																							type="text" value="하나은행">
																					</div>
																				</div>
																				<div class="form-group row">
																					<label class="col-sm-12 col-md-3 col-form-label">입금계좌번호</label>
																					<div class="col-sm-12 col-md-9">
																						<input class="form-control" id="store_acctnumber"
																							type="text" value="240-910633-33107">
																					</div>
																				</div>
																			</div>
																			<div class="modal-footer">
																				<button type="button" class="btn btn-secondary"
																					data-dismiss="modal"
																					style="border: 1px solid #d6d6d6; color: #fff;">취소</button>
																				<button type="button" class="btn btn-primary"
																					data-dismiss="modal" id="crefiaLink"
																					style="background-color: #008485; border: 1px solid #008485; color: #fff;">
																					확인</button>
																			</div>


																		</div>
																	</div>
																</div>
															</div>
														</li>
													</ul>
													
													
													<ul class="profile-edit-list row" style="display: none;">
														<li class="weight-500 col-md-6">
															<h4 class="h5 mb-20">매출 분석/통계 자료</h4>
															<div>
															<form action="/mail" method="post">
																<div class="custom-control mb-5">
																	<input name="address" placeholder="이메일 주소"> <br>
															        <input name="title" placeholder="제목"> <br>
															        <textarea name="message" placeholder="메일 내용을 입력해주세요." cols="60" rows="20"></textarea>
															        <button>발송</button>
																</div>
																<div class="custom-control custom-radio mb-5">
																	<input type="radio" id="customRadio2"
																		name="customRadio" class="custom-control-input">
																	<label class="custom-control-label radio-primary"
																		for="customRadio2"> 현금영수증내역(홈텍스)</label>
																</div>
																<div class="custom-control custom-radio mb-5">
																	<input type="radio" id="customRadio3"
																		name="customRadio" class="custom-control-input">
																	<label class="custom-control-label" for="customRadio3">
																		원큐페이 매출내역</label>
																</div>
																<div class="form-group mb-0">
																	<button class="btn btn-outline-success"
																		type="button" id="MailSend">발송하기 </button>
																</div>
															</form>
															</div>
														</li>
													</ul>
												<!-- </form> -->
											</div>
										</div>
										<!-- Setting Tab End -->
									</div>
								</div>
							</div>
						</div>
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
			
			<div class="modal fade" id="testModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-body">연동이 완료되었습니다</div>
						<div class="modal-footer justify-content-center">
							<button type="button" class="btn btn-primary"
								data-dismiss="modal"
								style="background-color: #008485; border: 1px solid #008485; color: #fff;"
								>확인</button>
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
	<script type="text/javascript">
	

		$(document).ready(function() {
			
			$("#crefiaLink").click(function(e){
				let data ={
					business_no : $("#business_no").val(),
					store_name : $("#store_name").val(),
					store_repre : $("#store_repre").val(),
					store_birth : $("#store_birth").val(),
					store_bank : $("#store_bank").val(),
					store_acctnumber : $("#store_acctnumber").val()
				};
				e.preventDefault();
				$('#testModal').modal("show");

				
/* 				 $.ajax({
					 url : "/crefiaUpdate",
					 data : data,
					 type : "POST",
					 dataType : "json",

					 success : function(resp) {
					 console.log(resp);
					 },
					 error : function(request, status, error) {
					 console.log(request.status);
					 //console.log(request.responseText);
					 //console.log(request.error);
					 }
				});  */ 
				
			});
			
			
			$("#MailSend").click(function(e){
				
				
				
			});

			//$("#connect").click(function() {
			//	alert('aa');
			/*  				let dataavg = {
			 startDt : "22/09/18",
			 endDt : "22/09/24",
			 type : "daysAvgPay"
			 }
			 $.ajax({
			 url : "http://localhost:2000/cardinfo",
			 data : dataavg,
			 type : "POST",
			 dataType : "json",
			 //async : false,

			 success : function(resp) {
			 console.log(resp);
			 },
			 error : function(request, status, error) {
			 console.log(request.status);
			 //console.log(request.responseText);
			 //console.log(request.error);
			 }
			 });  */
			//});
		});
	</script>
	
</body>
</html>
