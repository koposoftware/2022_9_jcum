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
					</span> <span class="user-name"> ????????? ??? ???????????????.</span>
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
				alt="????????????" />
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
							class="mtext">?????? ??? ?????? ??????</span>
					</a>
						<ul class="submenu">
							<li><a href="/store">?????? ??????(????????????)</a></li>
						</ul></li>
					<li class="dropdown">
						<a href="javascript:;" class="dropdown-toggle">
							<span class="micon bi bi-archive"></span>
						 	<span class="mtext">?????? ??????</span>
						</a>
						<ul class="submenu">
							<li><a href="/orders/205">?????? ??????</a></li>
							<li><a href="/sales/205">?????? ??????</a></li>
						</ul>
					</li>
					
					<li>
						<a href="javascript:;" class="dropdown-toggle">
							<span class="micon bi bi-calendar4-week"></span><span
							class="mtext">?????? ??????</span>
						</a>
						<ul class="submenu">
							<li><a href="/purchase">?????? ??????</a></li>
						</ul>
					</li>

					<li class="dropdown"><a href="javascript:;"
						class="dropdown-toggle"> <span class="micon bi bi-archive"></span><span
							class="mtext">?????? ??????</span>
					</a>
						<ul class="submenu">
							<li><a href="/loanstore">?????? ??????</a></li>
							<li><a href="/chat" target='_blank' >1:1 ??????</a></li>
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
								<!-- ?????? ??????????????? ????????? ?????? -->
								<h5 class="text-blue padding-top-10 h5" id="orderCnt"></h5>
								<span class="d-block">????????? (???) ??????</span>
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
								<!-- ?????? ????????? ???????????? ????????? ????????? -->
								<h5 class="text-light-green padding-top-10 h5" id="orderSum"></h5>
								<span class="d-block">????????? (???) ??????</span>
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
								<!-- ????????? ?????? ????????? ???????????? ??????/?????? ?????? ?????? -->
								<h5 class="text-light-orange padding-top-10 h5">
									?????? ??????/?????? ?????? ??????
								</h5>
								<span class="d-block">????????? ??????</span>
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
								<!-- ?????? ???????????? ????????? ?????? ?????? -->
								<h5 class="text-light-purple padding-top-10 h5" id="salesWeekSum"></h5>
								<span class="d-block">????????? ??????</span>
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
							<div class="h5 mb-md-0">??????/?????? - 22??? 10??? 4???(??????)</div>
							<div class="form-group mb-md-0">
								<select id="selEvent" class="form-control form-control-sm selectpicker">
									<option value="week">1??????</option>
									<option value="month">1??????</option>
									<option value="sixmonth">6??????</option>
									<option value="year">12??????</option>
								</select>
							</div>
						</div>
						<div id=activities-chart></div>
					</div>
					<br>
					<div class="card-box height-50-p pd-20">
						<div
							class="d-flex flex-wrap justify-content-between align-items-center pb-0 pb-md-3">
							<div class="h5 mb-md-0">?????? ?????? ?????? ?????? ??????</div>
						</div>
						<div id=Weekchart></div>
					</div>
				</div>
				
				<div class="col-md-4 mb-20" id="graphTestd">

					<div class="card-box pd-10">
						<div class="h5 mb-md-0" style="padding: 10px;">????????? ?????? ????????? ???</div>
						<div id="area-adwords"></div>
					</div>
					<br>
					<!-- ????????? ?????? ?????? -->
					<div class="card-box pd-10">
						<div class="h5 mb-md-0" style="padding: 10px;">????????? ??????????????????</div>
						<div id="chart"></div>
					</div>
					
				</div>
			</div>
			<div class="card-box pb-10">
				<div class="h5 pd-20 mb-0">?????? ?????? ??????</div>
				<table class="data-table table nowrap">
					<thead>
						<tr>
							<th class="table-plus">????????????</th>
							<th>????????????</th>
							<th>????????????</th>
							<th>????????????</th>
							<th>????????????</th>
							<th>????????????</th>
							<th class="datatable-nosort">????????? ??????</th>
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
							<td style="cursor: pointer;">??????????????? ??? 1???</td>
							<td>48000</td>
							<td>????????????</td>
							<td>
							???????????? ?????? ???
							</td>
							<td>
							???????????? ??????
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
							<td>???????????? ??? 1???</td>
							<td>57000</td>
							<td>????????????</td>
							<td>
							?????? ??????
							</td>
							<td>
							???????????? ??????
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
							<td>??????????????? ??? 1???</td>
							<td>37000</td>
							<td>????????????</td>
							<td>
							???????????? ?????? ???
							</td>
							<td>
							???????????? ??????
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
							<td>??????????????? ??? 1???</td>
							<td>48000</td>
							<td>????????????</td>
							<td>
							???????????? ?????? ???
							</td>
							<td>
							???????????? ??????
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
							<td>??????????????? ??? 1???</td>
							<td>48000</td>
							<td>????????????</td>
							<td>
							???????????? ?????? ???
							</td>
							<td>
							???????????? ??????
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
							<td>??????????????? ??? 1???</td>
							<td>48000</td>
							<td>????????????</td>
							<td>
							???????????? ?????? ???
							</td>
							<td>
							???????????? ??????
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
							<td>??????????????? ??? 1???</td>
							<td>48000</td>
							<td>????????????</td>
							<td>
							???????????? ?????? ???
							</td>
							<td>
							???????????? ??????
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
							<td>??????????????? ??? 1???</td>
							<td>48000</td>
							<td>????????????</td>
							<td>
							???????????? ?????? ???
							</td>
							<td>
							???????????? ??????
							</td>
						</tr>
					</tbody>
				</table>
			</div>

			<div class="title pb-20 pt-20">
				<h2 class="h3 mb-0">????????????</h2>
			</div>

			<div class="row">
				<div class="col-md-4 mb-20">
					<a href="/sales/205" class="card-box d-block mx-auto pd-20 text-secondary">
						<div class="img pb-30" style="text-align: center;">
							<img src="/sbo/main/vendors/images/ico_ms_01.png" alt="" />
						</div>
						<div class="content">
							<h3 class="h4">????????????</h3>
							<p class="max-width-200">???????????? ????????? ?????? ?????? ?????? ???
								???????????? ??????</p>
						</div>
					</a>
				</div>
				<div class="col-md-4 mb-20">
					<a href="/commercial" class="card-box d-block mx-auto pd-20 text-secondary">
						<div class="img pb-30" style="text-align: center;">
							<img src="/sbo/main/vendors/images/ico_ms_02.png" alt="" />
						</div>
						<div class="content">
							<h3 class="h4">????????????</h3>
							<p class="max-width-210">????????? ?????? ??????????????? 
							???????????? ??????, ????????? ???, ???????????? ?????? ?????? ??????</p>
						</div>
					</a>
				</div>
				<div class="col-md-4 mb-20">
					<a href="#" class="card-box d-block mx-auto pd-20 text-secondary">
						<div class="img pb-30" style="text-align: center;">
							<img src="/sbo/main/vendors/images/3233514.png" alt="" width="128" height="128" />
						</div>
						<div class="content">
							<h3 class="h4">???????????? ??? ?????????</h3>
							<p class="max-width-200">???????????? ????????? ?????????????????? ??????</p>
						</div>
					</a>
				</div>
			</div>

			<div class="footer-wrap pd-20 mb-20 card-box">
				<div class="Footer__GlobalFooter-owh5jd-7 fKrPjG">
					<a href="/" class="Footer__Logo-owh5jd-8 eoMxtc"> <img
						src="/sbo/main/src/images/logo.jpg" alt="?????? ?????? ?????????"></a>
					<div class="Footer__FooterInfo-owh5jd-9 ptTZd">
						<div class="Footer__GlobalLinks-owh5jd-11 ewsZOv">
							<a href="#" style="text-decoration: none; color: #494f54;">????????????</a>
							<span>|</span> <a href="#"
								style="text-decoration: none; color: #494f54;">?????? ?????? ?????????</a> <span>|</span>
							<a href="#" style="text-decoration: none; color: #494f54;">????????????</a>
							<span>|</span> <a href="#"
								style="text-decoration: none; color: #494f54;">?????????????????????</a> <span>|</span>
							<a href="#" style="text-decoration: none; color: #494f54;">??????????????????????????????</a>
							<span>|</span> <a href="#"
								style="text-decoration: none; color: #494f54;">????????????????????????</a>
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
	
	
	
	<!-- ????????? ?????? ?????? -->
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
