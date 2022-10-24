<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
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
			href="/sbo/main/src/plugins/jquery-steps/jquery.steps.css"
		/>
		<link rel="stylesheet" type="text/css" href="/sbo/main/vendors/styles/style.css" />
		
		
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
		</style>
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
				<div class="min-height-200px" >
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
									<li class="breadcrumb-item active" style="color:#009591;" aria-current="page">
										대출상품</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
				
				<!-- 메인 컨텐츠 -->
				<div class="pd-20 card-box mb-30 loandynamic">
					<div class="clearfix mb-20">
						<div class="pull-left">
							<h4 class="h4" style="color:#009591;">전용대출(소상공인)</h4>
						</div>
					</div>

					<div id="loancontain" class="container" >
						<ul class="list-group">
							<li class="list-group-item clearfix">
								<h3 id="loancontent" class="list-group-item-heading" data-toggle="tooltip"
									title="대출신청하기" data-placement="left"
									style="cursor: pointer; display: inline-block;">하나 H.S
									With 온라인 사장님 대출</h3> <span class="label label-danger pull-right">
									추천 </span> <span class="label label-danger pull-right">새상품 | </span>
								<p style="font-size: 1rem; margin-left: 10px; margin-top: 10px;"
									class="list-group-item-text lead">
									하나 상생 플랫폼에 입점된 소상공인 전용상품<br />
								</p>
								<div class="btn-toolbar pull-right" role="toolbar" aria-label="">
									<div class="btn-group">
										<button type="button" class="btn btn-default dropdown-toggle"
											data-toggle="dropdown" aria-haspopup="true"
											aria-expanded="false">
											<i class="fa fa-fw fa-list"></i> <span class="caret"></span>
										</button>
									</div>
									<span class="btn btn-default">최저 5.4%</span> <span
										class="btn btn-default">최대 5천만원</span>
								</div>
							</li>
							<li class="list-group-item clearfix">
								<h3 class="list-group-item-heading" data-toggle="tooltip"
									title="대출신청하기" data-placement="left"
									style="cursor: pointer; display: inline-block;">하나 H.S
									With 우리 사장님 맘편한 대출</h3> 
									<span class="label label-danger pull-right">인기 </span>
									<span class="label label-danger pull-right">추천 | </span>
								<p style="font-size: 1rem; margin-left: 10px; margin-top: 10px;"
									class="list-group-item-text lead">
									하나 상생 플랫폼에 입점된 소상공인 전용상품<br />
								</p>
								<div class="btn-toolbar pull-right" role="toolbar" aria-label="">
									<div class="btn-group">
										<button type="button" class="btn btn-default dropdown-toggle"
											data-toggle="dropdown" aria-haspopup="true"
											aria-expanded="false">
											<i class="fa fa-fw fa-list"></i> <span class="caret"></span>
										</button>
									</div>
									<span class="btn btn-default">최저 3.4%</span> <span
										class="btn btn-default">최대 3천만원</span>
								</div>
							</li>
							<li class="list-group-item clearfix">
								<h3 class="list-group-item-heading" data-toggle="tooltip"
									title="대출신청하기" data-placement="left"
									style="cursor: pointer; display: inline-block;">하나 상생 대출</h3> 
									<span class="label label-danger pull-right">소상공인 </span>
									<span class="label label-danger pull-right">추천 | </span>
								<p style="font-size: 1rem; margin-left: 10px; margin-top: 10px;"
									class="list-group-item-text lead">
									하나 상생 플랫폼에 입점된 소상공인 전용상품<br />
								</p>
								<div class="btn-toolbar pull-right" role="toolbar" aria-label="">
									<div class="btn-group">
										<button type="button" class="btn btn-default dropdown-toggle"
											data-toggle="dropdown" aria-haspopup="true"
											aria-expanded="false">
											<i class="fa fa-fw fa-list"></i> <span class="caret"></span>
										</button>
									</div>
									<span class="btn btn-default">최저 3.4%</span> <span
										class="btn btn-default">최대 5천만원</span>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<div class="pd-20 card-box mb-30 loandynamic">
					<div class="clearfix mb-20">
						<div class="pull-left">
							<h4 class="text h4">나에게 맞는 대출상품 찾기</h4>
							&nbsp;&nbsp;
							<span style="color:red;">연매출에 의한 계산된 상품이므로 실제 대출실행 시 대출정보가 상이할수 있습니다</span>
							<br><br>
							<div class="row" style="width: 1000px;">
								<div class="col-md-4">
									<div class="form-group">
										<label>개업일자</label><br>
										<input type="date" id="bizDate"
											class="form-control">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label>연매출(만원)</label> 
										<input type="text" id="bizAmount"
											class="form-control">
									</div>
								</div>
								<div class="col-md-4">
									<div class="btn-list" style="text-align: left;">
										<button type="button" class="btn" id="bizAmountInfo"
											style="background-color: #009591;margin:23px;color:#fff;">
											연매출정보 조회</button>
									</div>
								</div>
							</div>
							<div class="row" style="width: 1000px;">
								<div class="col-md-4">
									<div class="btn-list" style="text-align: left;">
										<button type="button" class="btn"></button>
									</div>
								</div>
								<div class="col-md-4">
									<div class="btn-list" style="text-align: left;">
										<button type="button" class="btn" id="loanCheck"
											style="background-color: #009591; margin: 23px; color: #fff;">
											조회하기</button>
									</div>
								</div>
								<div class="col-md-4">
									<div class="btn-list" style="text-align: left;">
										<button type="button" class="btn"></button>
									</div>
								</div>
							</div>
							
							
							<div class="row" style="width: 1080px;">
								<div class="col-md-5">
									<div class="btn-list" style="text-align: left;">
										<button type="button" class="btn"></button>
									</div>
								</div>
								<div class="col-md-6">
									<div class="btn-list" style="text-align: left;">
										<button type="button" class="btn" id="loanCheck"></button>
									</div>
								</div>
								<div class="col-md-1">
									<div class="btn-list" style="text-align: left;">
									<button type="button" class="btn" id="loanRateSort" value="Reverse"
											style="background-color: #fff; display:none; border:1px solid #009591; width:150px; margin: 23px;
											 color: #009591;">
											정렬(대출한도)</button>
									</div>
								</div>
							</div>
							
							<div class="row" id="dynamicLoanItem"></div>
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
		<input type="hidden" id="sortDateVal">
		<input type="hidden" id="sortAmountVal">

		<!-- js -->
		<script src="/sbo/main/vendors/scripts/core.js"></script>
		<script src="/sbo/main/vendors/scripts/script.min.js"></script>
		<script src="/sbo/main/vendors/scripts/process.js"></script>
		<script src="/sbo/main/vendors/scripts/layout-settings.js"></script>
		<script src="/sbo/main/src/plugins/jquery-steps/jquery.steps.js"></script>
		<script src="/sbo/main/vendors/scripts/steps-setting.js"></script>
		
		
		<script type="text/javascript">
		$(document).ready(function(){			
			
			$(document).on("click", "#loanjoin", function(){ // on 이벤트로 변경
				location.href = "/loansignup";
			});
			
			
			$(document).on("click","#talkaction",function(){					
				let popUrl = "/chat";
				let popOption = "width = 650px, height=550px, top=300px, left=300px, scrollbars=yes";
				
				window.open(popUrl,"채팅창",popOption);
			});
			
			
			$("#loancontent").click(function(){
				location.href = "/common";
			});
			
			
			
			$("#bizAmountInfo").click(function(){
				alert('현재날짜 기준으로 데이터를 가져옵니다.');
				$.ajax({
					url : "/bizAmountYear",
					type : "post",
					dataType : "json",
					success : function(resp) {
						console.log(resp);
						let total = $.trim(resp.bizAmountYearCheak[0].TOTAL);
						$("#bizAmount").attr("data-manage", $.trim(resp.bizAmountYearCheak[0].SUM_MANAGE));
						$("#bizAmount").attr("value",total);
					},
					error : function(request, status, error) {
						console.log(request.status);
						console.log(request.responseText);
						console.log(request.error);
					}
				});
			
			});
			

			// 대출상품 금리 낮은순으로 정렬
			$("#loanCheck").click(function() {
				
				if($("#bizDate").val() === "" || $("#bizAmount").val() === ""){
					alert("개업일자 또는 연매출을 넣어주세요");
				}else{
					let data = {
						bizDate : $("#bizDate").val(),
						bizAmount : $("#bizAmount").attr("data-manage"),
						sort : "none"
					};
					$("#sortDateVal").attr("value",data.bizDate);
					$("#sortAmountVal").attr("value",data.bizAmount);
					//console.log(data);
					$.ajax({
						url : "/loanSearch",
						data : data,
						type : "post",
						dataType : "json",

						success : function(resp) {
							$("#loanRateSort").css("display","block");
							$("#dynamicLoanItem").empty();
							for(let i = 0; i < resp.loanSearch.length; i++){
								dynamicFuncData(i,$.trim(resp.loanSearch[i].LOAN_ACCID));
								//if($.trim(resp.loanSearch[i].LOAN_ACCID) === $("#LSOHO"+(100+i)).attr("id")){
								//	$("#LSOHO"+(100+i)).css("display","block");
								//}
							}
						},
						error : function(request, status, error) {
							console.log(request.status);
							console.log(request.responseText);
							console.log(request.error);
						}
					});
				}
			}); // Click Function
			
			// 한도별 대출상품 정렬
			$("#loanRateSort").click(function() {
				if($("#loanRateSort").val() === "Reverse"){
					$("#loanRateSort").attr("value","Origin");
					sortVal = $("#loanRateSort").val();
				}else{
					$("#loanRateSort").attr("value","Reverse");
					sortVal = $("#loanRateSort").val();
				}
				
				let data = {
					bizDate : $("#sortDateVal").val(),
					bizAmount : $("#sortAmountVal").val(),
					sort : sortVal
				};
				
				$.ajax({
					url : "/loanSearch",
					data : data,
					type : "post",
					dataType : "json",

					success : function(resp) {
						$("#loanRateSort").css("display","block");
						$("#dynamicLoanItem").empty();
						for(let i = 0; i < resp.loanSearch.length; i++){
							dynamicFuncData(i,$.trim(resp.loanSearch[i].LOAN_ACCID));
						}
					},
					error : function(request, status, error) {
						console.log(request.status);
						console.log(request.responseText);
						console.log(request.error);
					}
				});
			}); // Click Function
			
			function dynamicFuncData(index, LOAN_ACCID){
					var title ="";
					var item = "";
					var html = 
						
					"<div class='col-md-4 mb-30'>"+
					"<div class='card-box pricing-card-style2'"+
						"style='height: 450px;'>"+
						"<div class='pricing-card-header'>"+
							"<div class='left' id='addingTitle"+(100+index)+"'>"+
							"</div>"+
						"</div>"+
						"<div class='pricing-card-body' style='height: 250px;'>"+
							"<div class='pricing-points'>"+
							"	<div style='margin-bottom: 10px';>아래 요건을 모두 충족한 개인사업자</div>"+
							"<ul id='addingItem"+(100+index)+"'>"+
							"</ul>"+
							"</div>"+
						"</div>"+
						"<div class='btn-list' style='text-align: center;'>"+
						"<button type=button id='loanjoin' class='btn btn-outline-success'>신청하기</button>"+
						"<button type=button id='talkaction' class='btn btn-outline-success'>톡상담</button>"+
						"</div>"+
					"</div>"+
				"</div>";
				
				$("#dynamicLoanItem").append(html);
				
				if(LOAN_ACCID === "LSOHO100"){
					item = 
					"<li style='font-size: 13px;'>하나 상생 플랫폼에 입점된 가게</li>"+
					"<li style='font-size: 13px;'>신청일 기준 사업자등록 후 업력 1년 이상 개인사업자</li>";
					$("#addingItem"+(100+index)).append(item);
					
					title = 
					"<h5>온라인 사장님 소호대출</h5>"+
					"<p>최대 2천만원(최저 2.14%)</p>";
					$("#addingTitle"+(100+index)).append(title);
					
				}else if(LOAN_ACCID === "LSOHO101"){
					item =
					"<li style='font-size: 13px;'>연 매출 1천만원 이상인 가게</li>"+
					"<li style='font-size: 13px;'>신청일 기준 사업자등록 후 업력 6개월 이상된 개인사업자</li>";
					$("#addingItem"+(100+index)).append(item);
					
					title = 
					"<h5>우리사장님 맘편한 대출</h5>"+
					"<p>최대 5천만원(최저 3.22%)</p>";
					$("#addingTitle"+(100+index)).append(title);
					
				}else if(LOAN_ACCID === "LSOHO102"){
					item =
					"<li style='font-size: 13px;'>하나 상생 플랫폼 입점된 가게</li>"+
					"<li style='font-size: 13px;'>신청일 기준 사업자등록 후 업력 9개월 이상된 개인사업자</li>";
					$("#addingItem"+(100+index)).append(item);
					
					title = 
					"<h5>하나 상생 대출</h5>"+
					"<p>최대 4천만원(최저 2.88%)</p>";
					$("#addingTitle"+(100+index)).append(title);
					
				}else if(LOAN_ACCID === "LSOHO103"){
					item =
					"<li style='font-size: 13px;'>하나 상생 플랫폼 입점된 가게</li>"+
					"<li style='font-size: 13px;'>신청일 기준 사업자등록 후 업력 6개월 이상된 개인사업자</li>";
					$("#addingItem"+(100+index)).append(item);
					
					title = 
					"<h5>BEST 신용대출</h5>"+
					"<p>최대 2.2천만원(최저 4.53%)</p>";
					$("#addingTitle"+(100+index)).append(title);
					
				}else if(LOAN_ACCID === "LSOHO104"){
					item =
					"<li style='font-size: 13px;'>연 매출 3천만원 이상인 가게</li>"+
					"<li style='font-size: 13px;'>신청일 기준 사업자등록 후 업력 9개월 이상된	개인사업자</li>";
					$("#addingItem"+(100+index)).append(item);
					
					title = 
					"<h5>사업자 우대 신용대출</h5>"+
					"<p>최대 2천만원(최저 4.40%)</p>";
					$("#addingTitle"+(100+index)).append(title);
					
				}else if(LOAN_ACCID === "LSOHO105"){
					item =
					"<li style='font-size: 13px;'>부동산 담보를 제공하는 개인사업자</li>";
					$("#addingItem"+(100+index)).append(item);
					
					title = 
					"<h5>하나 마스터원 소호담보대출</h5>"+
					"<p>최대 6천만원(최저 4.17%)</p>";
					$("#addingTitle"+(100+index)).append(title);
					
				}else if(LOAN_ACCID === "LSOHO106"){
					
				}else{
					
				}
			}// dataFunction
			
			
		});
		</script>
	</body>
</html>
