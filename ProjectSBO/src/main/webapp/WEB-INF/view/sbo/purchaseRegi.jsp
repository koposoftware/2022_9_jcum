<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<!-- 스윗얼럿 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- 제이쿼리 -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>

<!-- CSS -->
<link rel="stylesheet" type="text/css"
	href="/bootmodal/vendors/styles/core.css" />
<link rel="stylesheet" type="text/css"
	href="/bootmodal/vendors/styles/icon-font.min.css" />
<link rel="stylesheet" type="text/css"
	href="/bootmodal/src/plugins/datatables/css/dataTables.bootstrap4.min.css" />
<link rel="stylesheet" type="text/css"
	href="/bootmodal/src/plugins/datatables/css/responsive.bootstrap4.min.css" />
<link rel="stylesheet" type="text/css"
	href="/bootmodal/vendors/styles/style.css" />

<style>
.area {
	border: 2px dashed #000;
	width: 550px;
	height: 550px;
	background-image: url("/sbo/images/owners/file.png");
	background-position: center;
	background-repeat: no-repeat;
	background-size: 128px 128px;
	text-align: center;
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
							<li><a href="/chat">1:1 상담</a></li>
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
							<h4>매입관리</h4>
						</div>
						<nav aria-label="breadcrumb" role="navigation">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.html">매입관리</a></li>
								<li class="breadcrumb-item active" aria-current="page">매입등록</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>

			<div class="row clearfix">
				<div class="col-lg-6 col-md-6 col-sm-12 mb-30">
					<div class="pd-20 card-box">
						<form method="post" enctype="multipart/form-data">
							<input type="file" name="file" class="real-upload"
								accept="image/*" required multiple style="display: none;">
							<div class="card-box mb-30 area">
								<img class="preview" style="width: 540px; height: 540px;"
									onload="resize(this)">
							</div>
						</form>
						<!-- 				    			<img class="preview">
		    						<button type="button" class="img_close"><i class="fas fa-times"></i></button>
 -->
						<script>
						    const realUpload = document.querySelector('.real-upload');
						    const upload = document.querySelector('.area');
						    upload.addEventListener('click', () => realUpload.click());
  						</script>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-12 mb-30">
					<div class="pd-20 card-box height-50-p">
						<div class="wrap">
							<form method="post">
								<div class="mb-3">
									<label for="exampleFormControlInput1" class="form-label">증빙구분</label>
									<input type="text" class="form-control" value="영수증"
										name="receipOption" id="regGubun">
								</div>

								<div class="mb-3">
									<label for="exampleFormControlInput1" class="form-label">업체명</label>
									<input type="text" class="form-control" name="storeName"
										id="regName">
								</div>

								<div class="mb-3">
									<label for="exampleFormControlInput1" class="form-label">사업자등록번호</label>
									<input type="text" class="form-control" name="businessNo"
										id="regNumber">
								</div>

								<div class="mb-3">
									<label for="exampleFormControlInput1" class="form-label">영수일시(ex
										20220926)</label> <input type="text" class="form-control"
										name="receiptDate" id="regreceiptDate">
								</div>

								<div class="mb-3">
									<label for="exampleFormControlInput1" class="form-label">영수금액</label>
									<input type="text" class="form-control" name="amount"
										id="regAmt"> <input type="hidden" name="sum"
										id="regSum">
								</div>

								<div class="mb-3">
									<label for="exampleFormControlInput1" class="form-label">부가세</label>
									<input type="text" class="form-control" name="vat" id="regTax">
								</div>

								<div class="mb-3">
									<label for="exampleFormControlInput1" class="form-label">사용
										목적</label> <input type="text" class="form-control" value="재료비"
										name="purposeMemo" id="regPurpose">
								</div>

								<div class="btn-list" style="text-align: center;">
									<button type="button" id="saveData" class="btn btn btn-success"
										style="background-color: #009591;">저장</button>
									<button type="button" class="btn btn btn-success"
										style="background-color: #6c757d; border-color: #ffffff;">취소</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="col-md-12 col-sm-12 mb-30">
					<div class="pd-20 card-box height-100-p">
						<h4 class="mb-15 h4" align="center"
							style="background-color: #ecf0f4; padding: 10px;">매입내역</h4>

						<div class="card-box pb-10">
							<div class="h5 pd-20 mb-0">최근 주문 내역</div>
							<table class="data-table table nowrap" id="tableVal">
								<thead>
									<tr>
										<th class="table-plus">등록일시</th>
										<!-- 영수증 등록 날짜 -->
										<th>영수일시</th>
										<!-- 계산서 내 매입날짜 -->
										<th>구분</th>
										<!-- 간이영수증, 세금계산서.. 등 -->
										<th>업체명</th>
										<th>사업자 등록번호</th>
										<th>합계금액</th>
										<th>사용목적</th>
										<!-- 세금, 식비, 재료비 -->
										<!-- <th class="datatable-nosort">메모</th> -->
										<!-- 직원식비구매, 재료비 구매 등 -->
									</tr>
								</thead>
								<tbody>
									<c:forEach begin="0" end="${fn:length(purchaseList) -1 }"
										var="i">
										<tr align="center">
											<td class="table-plus" data-toggle="modal"
												data-target="#purchaseReceipt">
												<div class="name-avatar d-flex align-items-center">
													<div class="avatar mr-2 flex-shrink-0"></div>
													<div class="txt">
														<div>${purchaseList[i].regDate}</div>
													</div>
												</div>
											</td>
											<td>${purchaseList[i].receiptDate }</td>
											<td>${purchaseList[i].receipOption }</td>
											<td>${purchaseList[i].storeName }</td>
											<td>${purchaseList[i].businessNo}</td>
											<td>${purchaseList[i].sum }</td>
											<td>${purchaseList[i].purposeMemo}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>


			<div class="modal fade purchaseReceipt" id="purchaseReceipt"
				tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
				aria-hidden="true">
				<div class="modal-dialog modal-sm modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">×</button>
						</div>
						<div class="modal-body">
							<img style="width: 540px; height: 540px;"
								src="/bootmodal/image/purchase.jpg">
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">확인</button>
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
	<script type="text/javascript" src="/js/util/util.js"></script>


	<script>
			$(document).ready(function(){
			
				const previewImg = $(".preview").val();
				// 사진첨부가 안되었을땐 이미지 박스 안보이게 처리
				if(previewImg == ""){
					$(".preview").css("display", "none");
				}
								
				$(".real-upload").change(function(e){
					
					const form = $("form")[0];
					const formdata = new FormData(form);
					
					$.ajax({
						url: "/loan/ocr",
						type: "POST",
						data: formdata,
						processData: false,
		            	contentType: false,
					})
					.done(function(result){
						$("#regName").val(result.regName);
						$("#regNumber").val(result.regNumber);
						$("#regreceiptDate").val(result.regDate);
						$("#regAmt").val(result.regAmt);
						$("#regTax").val(result.regTax);
						$("#regSum").val(result.regSum);
						
						//console.log(result.regTax);
						//console.log(result.regNumber);
						//console.log(result.regAmt);
						//console.log(result.regName);
					})
					.fail(function(data){
						alert("실패");
					})
					
					
					const fileReader = new FileReader();
					fileReader.readAsDataURL(e.target.files[0]);
					
					fileReader.onload = function() {
						$(".preview").css("display", "block");
						$(".preview").attr("src", fileReader.result);
						//previewBox.css("display", "block");
					}
				});
				
				
				$("#saveData").click(function(){
					
 				    let data = {
 				    	purposeMemo: $("#regPurpose").val(),
 				    	receipOption: $("#regGubun").val(),
 				    	storeName: $("#regName").val(),
 				    	businessNo: $("#regNumber").val(),
 				    	receiptDate: $("#regreceiptDate").val(),
 				    	amount: $("#regAmt").val(),
 				    	vat : $("#regTax").val(),
 				    	sum : $("#regSum").val()
				    }; 
					//console.log(data);
					$.ajax({
						url: "/ocrSendData",
						data : data,
						type : "post",
						dataType : "json",
						
						success : function(resp) {
							if(resp.msg === "success"){
								alert("정상등록하였습니다");
								location.reload();
							}else{
								alert("insert 실패");
							}
						},
						error : function(request, status, error) {
							console.log(request.status);
							console.log(request.responseText);
							console.log(request.error);
						}
					});
					
				});
				
				
				// 매입 리스트 클릭 시 모달 띄우기, 모달안에는 영수증이 보임
				 $('#tableVal td').bind('click', function() { 
					 // 추후 값 가지고 ajax 쓸지 고민
					 //console.log($(this).text());
					 //console.log($(this).children());
					 
				  });
				
				
				
			});
			
 			 function resize(img){
/* 		    	   // 원본 이미지 사이즈 저장
		    	   var width = img.width;
		    	   var height = img.height;
		    	   
		    	   // 가로, 세로 최대 사이즈 설정
		    	   var maxWidth = width * 0.7;   // 원하는대로 설정. 픽셀로 하려면 maxWidth = 100  이런 식으로 입력
		    	   var maxHeight = height * 0.7;   // 원래 사이즈 * 0.5 = 50%
				   //var maxWidth = 550; 
				   //var maxHeight = 550;
				   
		    	   // 가로나 세로의 길이가 최대 사이즈보다 크면 실행  
		    	   if(width > maxWidth || height > maxHeight){

		    	      // 가로가 세로보다 크면 가로는 최대사이즈로, 세로는 비율 맞춰 리사이즈
		    	      if(width > height){
		    	         resizeWidth = maxWidth;
		    	         resizeHeight = Math.round((height * resizeWidth) / width);

		    	      // 세로가 가로보다 크면 세로는 최대사이즈로, 가로는 비율 맞춰 리사이즈
		    	      }else{
		    	         resizeHeight = maxHeight;
		    	         resizeWidth = Math.round((width * resizeHeight) / height);
		    	      }

		    	   // 최대사이즈보다 작으면 원본 그대로
		    	   }else{
		    	      resizeWidth = width;
		    	      resizeHeight = height;
		    	   }

		    	   // 리사이즈한 크기로 이미지 크기 다시 지정
		    	   img.width = resizeWidth;
		    	   img.height = resizeHeight; */
		    	} 
		
		
		</script>


</body>

</html>