<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/sbo/css/market.css" />

<!-- <link rel="stylesheet" type="text/css" href="/sbo/css/rMateChartH5Sample.css"> -->
<!-- rMateChartH5 라이센스 -->
<!-- <script src="/sbo/js/rMateChartH5License.js"></script> -->
<!-- rMateChartH5 라이브러리 -->
<!-- <script src="/sbo/js/rMateChartH5.js"></script> -->
<!-- rMateChartH5 에서 사용하는 스타일(범례, 프리로더, 스크롤 차트, 히스토리 차트, 데이터 에디터 닫기 버튼에 한함) -->
<!-- <link rel="stylesheet" type="text/css" href="/sbo/css/rMateChartH5.css">
<script src="/sbo/js/rMateGaugeChartH5.js"></script>
<script src="/sbo/js/theme.js"></script>
<script src="/sbo/js/rMateImageChartH5.js"></script>
 -->
<!-- 여기서부터 퍼블리싱 js -->
<!-- <script src="https://www.seoul.go.kr/seoulgnb/gnb.js"></script>
<script src="//www.seoul.go.kr/seoulgnb/jquery-1.11.1.min.js"></script> -->
<script src="/sbo/js/jquery-1.12.4.min.js"></script>
<script src="/sbo/js/jquery-ui.min.js"></script>
<!-- <script src="/sbo/js/jquery.ui.touch-punch.min.js"></script> -->

<!-- <script src="/sbo/js/iframeResizer.min.js"></script>
<script src="/sbo/js/jquery.treetable.js"></script>
<script src="/sbo/js/jquery.easing.js"></script>
<script src="/sbo/js/owl.carousel.min.js"></script>
<script src="/sbo/js/jquery.switcher.min.js"></script>
<script src="/sbo/js/common.js"></script> -->

<!-- <link rel="stylesheet" href="/sbo/css/swiper.min.css">
<link rel="stylesheet" href="/sbo/css/rangeslider.css">
<link rel="stylesheet" href="/sbo/css/roundslider.min.css">

<script src="/sbo/js/swiper.min.js"></script>
<script src="/sbo/js/rangeslider.min.js"></script>
<script src="/sbo/js/roundslider.min.js"></script>	 -->

<!-- <link rel="stylesheet" type="text/css" href="/sbo/css/jquery.mCustomScrollbar.min.css">
<script src="/sbo/js/jquery.mCustomScrollbar.concat.min.js"></script> -->

 <script src="/sbo/js/script.js"></script>
<!-- <script src="/sbo/js/report.js"></script>  -->

<script type="text/javascript">
/* function tabmove(reportName, areaName, event) {
	if(!!event) {
		event.preventDefault();
	}
	var report = $('.rightReport.' + reportName);
	var areaPos = report.find('.tabcnt_common2.tabcnt_' + areaName).position().top;
	areaPos = Number.isInteger(areaPos) ? areaPos : parseInt(areaPos);
	report.find('.scroll_y').mCustomScrollbar('scrollTo', areaPos);
	
	
}

$(document).ready(function(){
	// 업종분석, 매출분석, 인구분석, 지역분석
	$("#tab01").click(function(){
		$("#tab01").addClass('active');
		$("#tab02").removeClass('active');
		$("#tab03").removeClass('active');
		$("#tab04").removeClass('active');
	});
	
	$("#tab02").click(function(){
		$("#tab02").addClass('active');
		$("#tab01").removeClass('active');
		$("#tab03").removeClass('active');
		$("#tab04").removeClass('active');
	});
	
	$("#tab03").click(function(){
		$("#tab03").addClass('active');
		$("#tab01").removeClass('active');
		$("#tab02").removeClass('active');
		$("#tab04").removeClass('active');
	});
	
	$("#tab04").click(function(){
		$("#tab04").addClass('active');
		$("#tab01").removeClass('active');
		$("#tab02").removeClass('active');
		$("#tab03").removeClass('active');
	});
	
});
 */


</script>



</head>
<body>
<aside class="rightReport analysis_report active">
	<button class="reduce" onclick="toggle_reduce(this);"></button>
	<dl>
		<dt>
			<strong>분석리포트</strong>
			<span class="subs">2022년 09월 19일</span>
			<button class="qna img" onclick="document.location.href='tel:07086807144'"></button>
			<button class="print hasTooltip" onclick="printReport();">
				출력하기
				<p class="tooltip tooltip2 top right">출력하기</p>
			</button>
			<button class="close hasTooltip" onclick="report_toggle_view('analysis_report');">
				닫기
				<p class="tooltip tooltip2 top right">닫기</p>
			</button>
		</dt>

		<dd>
			<div class="wrapTab">
				<ul class="tab_common2 tab_report">
					<li><button class="active" id="tab01" onclick="tabmove('analysis_report', 'district');">업종분석</button></li>
					<li><button id="tab02" onclick="tabmove('analysis_report', 'sales');">매출분석</button></li>
					<li><button id="tab03" onclick="tabmove('analysis_report', 'population');">인구분석</button></li>
					<li><button id="tab04" onclick="tabmove('analysis_report', 'area');">지역()분석</button></li>
				</ul>


				<div>
					<dl>
						<dt>위치</dt>
						<dd id="place">상계10동</dd>
					</dl>

					<dl>
						<dt>업종</dt>
						<dd id="upjong">업종전체</dd>
					</dl>

					<dl>
						<dt>기준분기</dt>
						<dd id="storQuTitle">2022년 2분기</dd>
					</dl>
				</div>
			</div>

				<div class="scroll_y mCustomScrollbar _mCS_12"
					style="height: 396px;">
					<div id="mCSB_12"
						class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside"
						tabindex="0" style="max-height: none;">
						<div id="mCSB_12_container" class="mCSB_container"
							style="position: relative; top: 0; left: 0;" dir="ltr">
							<div class="tabcnt_common2 tabcnt_district">
								<div class="explain">
									<div class="warning">
										본 보고서에 제공하는 내용은 <strong>추정정보</strong>이므로 <strong>실제와
											다를 수</strong> 있기에, <strong>사용자의 책임 하에 활용</strong>하시기 바랍니다.
									</div>
								</div>
								<dl class="toggle_view">
									<dt onclick="toggle_view('info_limit', this);" class="active">책임의
										한계 안내</dt>

									<dd class="info_limit active">
										본 보고서는 서울특별시에서 선택상권분석을 돕기 위해 제공하는 정보입니다.<br> 서울특별시에서
										보유하거나 외부기관으로부터 수집된 신뢰할만한 자료 및 정보로부터 얻어진 것이나 통계적으로 추정된 정보를 이용하여
										작성되었기에 리포트 내용에 대한 정확성이나 완전성을 보장할 수 없습니다.<br> 따라서 자신의 판단과
										책임하에 보고서를 활용하시기 바랍니다.<br> 또한 서울시는 본 보고서를 활용하여 판단한 결과에 대한
										어떠한 법적 책임도 없으며 전적으로 사용자 자신에게 있음을 알려드립니다.
									</dd>
								</dl>
								<dl>
									<dt>점포수</dt>

									<dd>
										<ul class="list_reportItem">
											<li class="summary">점포수는 <strong id="storCo">289개</strong>
												입니다.
											</li>

											<li class="contrast">
												<p>
													<span>전년 동분기 대비</span> <strong id="storYearDiff"
														class="increase">15개</strong>
												</p>

												<p>
													<span>전분기 대비</span> <strong id="storQuDiff"
														class="increase">8개</strong>
												</p>
											</li>

											<li class="detail"><strong>업종전체</strong>의 점포수가 전분기대비 <strong>증가</strong>하고
												있습니다. 상권이 발달하는 시기인 경우 입지선정에 신중하셔야 합니다. 점포수는 각 제공기관의 업종분류체계가
												통일 되지 않아 약간의 오차가 있을 수 있습니다.</li>

											<li class="graph">
												<div class="chartArea">
													<p class="title">점포수 추이</p>
													<span class="unit" id="storQuSub">단위 : 개 / 2022년 2분기
														기준</span>
													<div class="area" id="store"
														style="height: 228px; width: 100%; position: static;">
														<div class="rMateChartH5__Root" id="chart_store"
															style="box-sizing: content-box; position: static; overflow: visible; width: 566px; height: 206px; padding: 15px 10px 5px; border-width: 1px; border-color: rgb(170, 179, 179); border-radius: 12px; border-style: none;">
															<div class="rMateChartH5__Main"
																style="box-sizing: content-box; position: static; width: 566px; height: 206px;">
																<div class="rMateChartH5__Chart"
																	style="box-sizing: content-box; float: left; position: relative; width: 566px; height: 206px;">
																	<canvas class="rMateChartH5__GridLines" width="786"
																		height="234"
																		style="position: absolute; left: 37px; top: 10px; width: 524px; height: 156px;"></canvas>
																	<canvas class="rMateChartH5__Axis2DRenderer"
																		width="834" height="294"
																		style="position: absolute; left: 5px; top: 5px; width: 556px; height: 196px;"></canvas>
																	<canvas class="rMateChartH5__Axis2DRenderer"
																		width="834" height="294"
																		style="position: absolute; left: 5px; top: 5px; width: 556px; height: 196px;"></canvas>
																	<canvas class="rMateChartH5__Column2DSeries"
																		width="786" height="234"
																		style="position: absolute; left: 37px; top: 10px; width: 524px; height: 156px;"></canvas>
																	<canvas class="rMateChartH5__LabelLayer" width="786"
																		height="234"
																		style="position: absolute; left: 37px; top: 10px; width: 524px; height: 156px;"></canvas>
																	<canvas class="rMateChartH5__UIElementEx" width="849"
																		height="309"
																		style="position: absolute; left: 0px; top: 0px; width: 566px; height: 206px;"></canvas>
																</div>
															</div>
														</div>
													</div>
												</div>
											</li>
											<li class="graph">
												<!-- [M 2021-10-18] 추가 S -->
												<div class="area col col2">
													<!-- [M 2021-12-15] div 추가 S -->
													<div class="chartArea">
														<!-- [M 2021-12-15] 타이틀 추가 -->
														<p class="title">점포수 현황</p>
														<!-- [M 2021-11-02] class 추가 -->
														<div id="store2" class="selectDistrict">
															<!-- [M 2021-11-02] 추가 S -->
															<ul class="legend">
																<li><span id="siBtn" class="siBtnColor"></span>서울시</li>
																<li><span id="guBtn" class="guBtnColor"></span><label
																	id="signguNm">노원구</label></li>
																<li><span id="dongBtn" class="dongBtnColor"></span><label
																	id="adstrdNm">상계10동</label></li>
																<!-- 												<li><span style="background:#7de412;"></span>선택상권</li> -->
															</ul>
															<div class="chart">
																<div class="si" id="megaStorCo">577194</div>
																<div class="gu" id="signguStorCo">18388</div>
																<div class="dong" id="adstrdStorCo">289</div>
																<!-- 													<div class="select" id="selectStorCo">0</div> -->
																<!-- 												<div class="select">82</div> -->
															</div>
															<!-- [M 2021-11-02] 추가 E -->
														</div>
													</div>
													<!-- [M 2021-10-18] 추가 E -->
													<!-- [M 2021-12-15] div 추가 S -->
													<div class="chartArea">
														<!-- [M 2021-12-15] 타이틀 추가 -->
														<p class="title">프랜차이즈와 일반점포 비율</p>
														<!-- [M 2021-10-18] 추가 E -->
														<div id="store3"
															style="height: 228px; width: 100%; position: static;">
															<div class="rMateChartH5__Root" id="chart_store3"
																style="box-sizing: content-box; position: static; overflow: visible; width: 246px; height: 206px; padding: 15px 10px 5px; border-width: 1px; border-color: rgb(170, 179, 179); border-radius: 12px; border-style: none;">
																<div class="rMateChartH5__Main"
																	style="box-sizing: content-box; width: 246px; height: 206px; position: static;">
																	<div class="rMateChartH5__Box"
																		style="position: relative; float: left; overflow: visible; width: 246px; height: 206px; border-style: none; border-color: rgb(183, 186, 188); border-width: 1px;">
																		<div class="rMateChartH5__Chart"
																			style="box-sizing: content-box; float: none; position: relative; width: 246px; height: 179px; left: 0px; top: 0px;">
																			<canvas class="rMateChartH5__AngularAxisRenderer"
																				width="354" height="253"
																				style="position: absolute; left: 5px; top: 5px; width: 236px; height: 169px;"></canvas>
																			<canvas class="rMateChartH5__Pie2DSeries" width="354"
																				height="253"
																				style="position: absolute; left: 5px; top: 5px; width: 236px; height: 169px;"></canvas>
																			<canvas class="rMateChartH5__LabelLayer" width="354"
																				height="253"
																				style="position: absolute; left: 5px; top: 5px; width: 236px; height: 169px;"></canvas>
																			<canvas class="rMateChartH5__UIElementEx" width="369"
																				height="268"
																				style="position: absolute; left: 0px; top: 0px; width: 246px; height: 179px;"></canvas>
																		</div>
																		<div class="rMateChartH5__LegendBox"
																			style="box-sizing: content-box; position: relative; overflow: hidden; float: none; width: 154.95px; height: 27px; left: 45.525px; top: 0px;">
																			<canvas class="rMateChartH5__LegendCanvas" height="0"
																				width="0"
																				style="position: absolute; visibility: hidden;"></canvas>
																			<div class="rMateChartH5__Legend"
																				style="box-sizing: content-box; position: absolute; left: 0px; top: 0px; width: 152px; height: 25px; border: 1px solid rgb(224, 224, 224); border-radius: 0px; background-color: rgb(247, 247, 247);">
																				<canvas class="rMateChartH5__Legend"
																					id="rMateChartH5__chart_store3_Legend_0"
																					height="16" width="16"
																					style="position: absolute; width: 11px; height: 11px; left: 8px; top: 8.5px;"></canvas>
																				<div
																					class="rMateChartH5__chart_store3_LegendLabelDiv"
																					id="LegendLabel_chart_store3_0"
																					style="box-sizing: content-box; cursor: default; position: absolute; left: 27px; top: 7.5px; color: rgb(118, 118, 118); font: bold 10px arial; text-align: left; text-decoration: none;">일반점포</div>
																				<canvas class="rMateChartH5__Legend"
																					id="rMateChartH5__chart_store3_Legend_1"
																					height="16" width="16"
																					style="position: absolute; width: 11px; height: 11px; left: 80.2px; top: 8.5px;"></canvas>
																				<div
																					class="rMateChartH5__chart_store3_LegendLabelDiv"
																					id="LegendLabel_chart_store3_1"
																					style="box-sizing: content-box; cursor: default; position: absolute; left: 99.2px; top: 7.5px; color: rgb(118, 118, 118); font: bold 10px arial; text-align: left; text-decoration: none;">프랜차이즈</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
														<!-- [M 2021-12-15] 로딩바 추가 S -->
														<div class="popup_bg">
															<div class="lds-spinner">
																<div id="floatingCirclesG">
																	<div class="f_circleG" id="frotateG_01"></div>
																	<div class="f_circleG" id="frotateG_02"></div>
																	<div class="f_circleG" id="frotateG_03"></div>
																	<div class="f_circleG" id="frotateG_04"></div>
																	<div class="f_circleG" id="frotateG_05"></div>
																	<div class="f_circleG" id="frotateG_06"></div>
																	<div class="f_circleG" id="frotateG_07"></div>
																	<div class="f_circleG" id="frotateG_08"></div>
																</div>
															</div>
														</div>
														<!-- [M 2021-12-15] 로딩바 추가 E -->
													</div>
													<!-- [M 2021-12-15] div 추가 E -->
												</div>
											</li>
										</ul>
									</dd>
								</dl>

								<dl>
									<dt>신생기업 생존율(3년)</dt>

									<dd>
										<ul class="list_reportItem">
											<li class="summary">신생기업 생존율은 <strong id="stdrBeingRt">75%</strong>
												입니다.
											</li>

											<li class="contrast">
												<p>
													<span>전년 동분기 대비</span> <strong class="increase"
														id="stdrBeingYearDiff">9.48%</strong>
												</p>

												<p>
													<span>전분기 대비</span> <strong class="increase"
														id="stdrBeingQuDiff">7.14%</strong>
												</p>
											</li>

											<li class="detail">년간 생존율이 높을 수록 안정적인 상권이라고 할 수 있습니다.
												선택업종의 3년생존율은 전년대비 <strong>증가</strong>했습니다. 상권내 해당업종의 경쟁력이
												양호한 편입니다.
											</li>

											<li class="graph">
												<!-- [M 2021-12-15] div 추가 S -->
												<div class="chartArea" style="padding-bottom: 10px;">
													<!-- [M 2021-12-15] 타이틀 추가 -->
													<p class="title">신생기업 생존율 추이</p>
													<span class="unit" id="stdrBeingQuSub">단위 : % /
														2022년 2분기 기준</span>

													<div class="area rptcht"
														style="width: 100%; height: 240px; position: static;"
														id="being">
														<div class="rMateChartH5__Root" id="chart_being"
															style="box-sizing: content-box; position: static; overflow: visible; width: 566px; height: 218px; padding: 15px 10px 5px; border-width: 1px; border-color: rgb(170, 179, 179); border-radius: 12px; border-style: none;">
															<div class="rMateChartH5__Main"
																style="box-sizing: content-box; position: static; width: 566px; height: 218px;">
																<div class="rMateChartH5__Chart"
																	style="box-sizing: content-box; float: left; position: relative; width: 566px; height: 218px;">
																	<canvas class="rMateChartH5__GridLines" width="795"
																		height="259"
																		style="position: absolute; left: 31px; top: 5px; width: 530px; height: 173px;"></canvas>
																	<canvas class="rMateChartH5__Axis2DRenderer"
																		width="834" height="319"
																		style="position: absolute; left: 5px; top: 0px; width: 556px; height: 213px;"></canvas>
																	<canvas class="rMateChartH5__Axis2DRenderer"
																		width="834" height="319"
																		style="position: absolute; left: 5px; top: 0px; width: 556px; height: 213px;"></canvas>
																	<canvas class="rMateChartH5__Line2DSeries" width="795"
																		height="259"
																		style="position: absolute; left: 31px; top: 5px; width: 530px; height: 173px;"></canvas>
																	<canvas class="rMateChartH5__LabelLayer" width="795"
																		height="259"
																		style="position: absolute; left: 31px; top: 5px; width: 530px; height: 173px;"></canvas>
																	<canvas class="rMateChartH5__UIElementEx" width="849"
																		height="327"
																		style="position: absolute; left: 0px; top: 0px; width: 566px; height: 218px;"></canvas>
																</div>
															</div>
														</div>
													</div>
												</div> <!-- [M 2021-12-15] div 추가 E -->
											</li>
										</ul>
									</dd>
								</dl>

								<dl>
									<dt>평균영업기간</dt>

									<dd>
										<ul class="list_reportItem">
											<li class="summary">평균 영업기간은 <strong id="trdarSaleMtAvg">3.2년</strong>
												입니다.
											</li>

											<li class="contrast">
												<p>
													<span>자치구 대비</span> <strong class="increase"
														id="mtDiffSigngu">0.1년</strong>
												</p>
												<p>
													<span>서울시 대비</span> <strong class="" id="mtDiffMega">0년</strong>
												</p>
											</li>

											<li class="detail">선택업종의 평균영업기간(최근10년 기준)이 서울시 평균과 비교하 여
												높습니다. 해당상권은 서울의 다른 상권보다 영업기간이 긴 상권입니다.</li>

											<li class="graph">
												<!-- [M 2021-12-15] div 추가 S -->
												<div class="chartArea">
													<!-- [M 2021-12-15] 타이틀 추가 -->
													<p class="title">평균 영업기간 추이</p>
													<span class="unit" id="trdarSaleMtQuSub">단위 : 년 /
														2022년 2분기 기준</span>

													<div class="area" id="opening"
														style="width: 100%; height: 228px; position: static;">
														<div class="rMateChartH5__Root" id="chart_opening"
															style="box-sizing: content-box; position: static; overflow: visible; width: 566px; height: 206px; padding: 15px 10px 5px; border-width: 1px; border-color: rgb(170, 179, 179); border-radius: 12px; border-style: none;">
															<div class="rMateChartH5__Main"
																style="box-sizing: content-box; position: static; width: 566px; height: 206px;">
																<div class="rMateChartH5__Chart"
																	style="box-sizing: content-box; float: left; position: relative; width: 566px; height: 206px;">
																	<canvas class="rMateChartH5__GridLines" width="792"
																		height="234"
																		style="position: absolute; left: 33px; top: 10px; width: 528px; height: 156px;"></canvas>
																	<canvas class="rMateChartH5__Axis2DRenderer"
																		width="834" height="294"
																		style="position: absolute; left: 5px; top: 5px; width: 556px; height: 196px;"></canvas>
																	<canvas class="rMateChartH5__Axis2DRenderer"
																		width="834" height="294"
																		style="position: absolute; left: 5px; top: 5px; width: 556px; height: 196px;"></canvas>
																	<canvas class="rMateChartH5__Column2DSeries"
																		width="792" height="234"
																		style="position: absolute; left: 33px; top: 10px; width: 528px; height: 156px;"></canvas>
																	<canvas class="rMateChartH5__LabelLayer" width="792"
																		height="234"
																		style="position: absolute; left: 33px; top: 10px; width: 528px; height: 156px;"></canvas>
																	<canvas class="rMateChartH5__UIElementEx" width="849"
																		height="309"
																		style="position: absolute; left: 0px; top: 0px; width: 566px; height: 206px;"></canvas>
																</div>
															</div>
														</div>
													</div>
												</div> <!-- [M 2021-12-15] div 추가 E -->
											</li>
										</ul>
									</dd>
								</dl>

								<dl>
									<dt>개업현황</dt>

									<dd>
										<ul class="list_reportItem">
											<li class="summary">개업수는 <strong id="opbizStorCo">12개</strong>
												입니다.
											</li>

											<li class="contrast">
												<p>
													<span>전년 동분기 대비</span> <strong class="increase"
														id="opbizStorYearDiff">5개</strong>
												</p>

												<p>
													<span>전분기 대비</span> <strong class="increase"
														id="opbizStorQuDiff">4개</strong>
												</p>
											</li>

											<li class="detail">개업은 <strong>증가추세</strong>이며, 폐업은 <strong>감소추세</strong>인
												상권입니다. 상권이 확장되고 있습니다. 경쟁관계 변화에 유의하세요.
											</li>

											<li class="graph">
												<!-- [M 2021-12-15] div 추가 S -->
												<div class="chartArea">
													<!-- [M 2021-12-15] 타이틀 추가 -->
													<p class="title">개업수 추이</p>
													<span class="unit" id="opbizStorQuSub">단위 : 개 /
														2022년 2분기 기준</span>

													<div class="area " id="opbiz"
														style="width: 100%; height: 228px; position: static;">
														<div class="rMateChartH5__Root" id="chart_opbiz"
															style="box-sizing: content-box; position: static; overflow: visible; width: 566px; height: 206px; padding: 15px 10px 5px; border-width: 1px; border-color: rgb(170, 179, 179); border-radius: 12px; border-style: none;">
															<div class="rMateChartH5__Main"
																style="box-sizing: content-box; position: static; width: 566px; height: 206px;">
																<div class="rMateChartH5__Chart"
																	style="box-sizing: content-box; float: left; position: relative; width: 566px; height: 206px;">
																	<canvas class="rMateChartH5__GridLines" width="795"
																		height="234"
																		style="position: absolute; left: 31px; top: 10px; width: 530px; height: 156px;"></canvas>
																	<canvas class="rMateChartH5__Axis2DRenderer"
																		width="834" height="294"
																		style="position: absolute; left: 5px; top: 5px; width: 556px; height: 196px;"></canvas>
																	<canvas class="rMateChartH5__Axis2DRenderer"
																		width="834" height="294"
																		style="position: absolute; left: 5px; top: 5px; width: 556px; height: 196px;"></canvas>
																	<canvas class="rMateChartH5__Column2DSeries"
																		width="795" height="234"
																		style="position: absolute; left: 31px; top: 10px; width: 530px; height: 156px;"></canvas>
																	<canvas class="rMateChartH5__LabelLayer" width="795"
																		height="234"
																		style="position: absolute; left: 31px; top: 10px; width: 530px; height: 156px;"></canvas>
																	<canvas class="rMateChartH5__UIElementEx" width="849"
																		height="309"
																		style="position: absolute; left: 0px; top: 0px; width: 566px; height: 206px;"></canvas>
																</div>
															</div>
														</div>
													</div>
												</div> <!-- [M 2021-12-15] div 추가 E -->
											</li>
										</ul>
									</dd>
								</dl>

								<dl>
									<dt>폐업현황</dt>

									<dd>
										<ul class="list_reportItem">
											<li class="summary">폐업수는 <strong id="clsbizStorCo">3개</strong>
												입니다.
											</li>

											<li class="contrast">
												<p>
													<span>전년 동분기 대비</span> <strong class="decrease"
														id="clsbizStorYearDiff">1개</strong>
												</p>

												<p>
													<span>전분기 대비</span> <strong class="decrease"
														id="clsbizStorQuDiff">1개</strong>
												</p>
											</li>

											<li class="detail">개업은 <strong>증가추세</strong>이며, 폐업은 <strong>감소추세</strong>인
												상권입니다. 상권이 확장되고 있습니다. 경쟁관계 변화에 유의하세요.
											</li>

											<li class="graph">
												<!-- [M 2021-12-15] div 추가 S -->
												<div class="chartArea">
													<!-- [M 2021-12-15] 타이틀 추가 -->
													<p class="title">폐업수 추이</p>
													<span class="unit" id="clsbizStorQuSub">단위 : 개 /
														2022년 2분기 기준</span>

													<div class="area" id="clsbiz"
														style="width: 100%; height: 228px; position: static;">
														<div class="rMateChartH5__Root" id="chart_clsbiz"
															style="box-sizing: content-box; position: static; overflow: visible; width: 566px; height: 206px; padding: 15px 10px 5px; border-width: 1px; border-color: rgb(170, 179, 179); border-radius: 12px; border-style: none;">
															<div class="rMateChartH5__Main"
																style="box-sizing: content-box; position: static; width: 566px; height: 206px;">
																<div class="rMateChartH5__Chart"
																	style="box-sizing: content-box; float: left; position: relative; width: 566px; height: 206px;">
																	<canvas class="rMateChartH5__GridLines" width="804"
																		height="234"
																		style="position: absolute; left: 25px; top: 10px; width: 536px; height: 156px;"></canvas>
																	<canvas class="rMateChartH5__Axis2DRenderer"
																		width="834" height="294"
																		style="position: absolute; left: 5px; top: 5px; width: 556px; height: 196px;"></canvas>
																	<canvas class="rMateChartH5__Axis2DRenderer"
																		width="834" height="294"
																		style="position: absolute; left: 5px; top: 5px; width: 556px; height: 196px;"></canvas>
																	<canvas class="rMateChartH5__Column2DSeries"
																		width="804" height="234"
																		style="position: absolute; left: 25px; top: 10px; width: 536px; height: 156px;"></canvas>
																	<canvas class="rMateChartH5__LabelLayer" width="804"
																		height="234"
																		style="position: absolute; left: 25px; top: 10px; width: 536px; height: 156px;"></canvas>
																	<canvas class="rMateChartH5__UIElementEx" width="849"
																		height="309"
																		style="position: absolute; left: 0px; top: 0px; width: 566px; height: 206px;"></canvas>
																</div>
															</div>
														</div>
													</div>
												</div> <!-- [M 2021-12-15] div 추가 E -->
											</li>
										</ul>
									</dd>
								</dl>

								<dl>
									<dt>업종분포</dt>

									<dd>
										<ul class="list_reportItem">
											<li class="summary"><strong id="topInduty">서비스업</strong>이
												가장 많고 <strong id="increaseInduty">외식업</strong>이 증가 추세입니다.</li>

											<li class="detail">선택상권은 <strong>서비스업(이)</strong>가 가장 많은
												상권입니다. 외식업종 세분류의 증감추세를 보다 세심히 분석하세요. 선택업종이 밀집된 경우 유리한 업종인지,
												불리한 업종인지 파악이 필요합니다.
											</li>

											<li class="graph">
												<!-- [M 2021-12-15] div 추가 S -->
												<div class="chartArea">
													<!-- [M 2021-12-15] 타이틀 추가 -->
													<p class="title">업종분포 비율</p>
													<span class="unit" id="indutyQuSub">단위 : 개 / 2022년
														2분기 기준</span>

													<div class="area" id="induty"
														style="width: 100%; height: 228px; position: static;">
														<div class="rMateChartH5__Root" id="chart_induty"
															style="box-sizing: content-box; position: static; overflow: visible; width: 566px; height: 206px; padding: 15px 10px 5px; border-width: 1px; border-color: rgb(170, 179, 179); border-radius: 12px; border-style: none;">
															<div class="rMateChartH5__Main"
																style="box-sizing: content-box; width: 566px; height: 206px; position: static;">
																<div class="rMateChartH5__Box"
																	style="position: relative; float: left; overflow: visible; width: 566px; height: 206px; border-style: none; border-color: rgb(183, 186, 188); border-width: 1px;">
																	<div class="rMateChartH5__Chart"
																		style="box-sizing: content-box; float: none; position: relative; width: 566px; height: 179px; left: 0px; top: 0px;">
																		<canvas class="rMateChartH5__AngularAxisRenderer"
																			width="834" height="253"
																			style="position: absolute; left: 5px; top: 5px; width: 556px; height: 169px;"></canvas>
																		<canvas class="rMateChartH5__Pie2DSeries" width="834"
																			height="253"
																			style="position: absolute; left: 5px; top: 5px; width: 556px; height: 169px;"></canvas>
																		<canvas class="rMateChartH5__LabelLayer" width="834"
																			height="253"
																			style="position: absolute; left: 5px; top: 5px; width: 556px; height: 169px;"></canvas>
																		<canvas class="rMateChartH5__UIElementEx" width="849"
																			height="268"
																			style="position: absolute; left: 0px; top: 0px; width: 566px; height: 179px;"></canvas>
																	</div>
																	<div class="rMateChartH5__LegendBox"
																		style="box-sizing: content-box; position: relative; overflow: hidden; float: none; width: 198.5px; height: 27px; left: 183.75px; top: 0px;">
																		<canvas class="rMateChartH5__LegendCanvas" height="0"
																			width="0"
																			style="position: absolute; visibility: hidden;"></canvas>
																		<div class="rMateChartH5__Legend"
																			style="box-sizing: content-box; position: absolute; left: 0px; top: 0px; width: 196px; height: 25px; border: 1px solid rgb(224, 224, 224); border-radius: 0px; background-color: rgb(247, 247, 247);">
																			<canvas class="rMateChartH5__Legend"
																				id="rMateChartH5__chart_induty_Legend_0" height="16"
																				width="16"
																				style="position: absolute; width: 11px; height: 11px; left: 8px; top: 8.5px;"></canvas>
																			<div
																				class="rMateChartH5__chart_induty_LegendLabelDiv"
																				id="LegendLabel_chart_induty_0"
																				style="box-sizing: content-box; cursor: default; position: absolute; left: 27px; top: 7.5px; color: rgb(118, 118, 118); font: bold 10px arial; text-align: left; text-decoration: none;">외식업</div>
																			<canvas class="rMateChartH5__Legend"
																				id="rMateChartH5__chart_induty_Legend_1" height="16"
																				width="16"
																				style="position: absolute; width: 11px; height: 11px; left: 70.65px; top: 8.5px;"></canvas>
																			<div
																				class="rMateChartH5__chart_induty_LegendLabelDiv"
																				id="LegendLabel_chart_induty_1"
																				style="box-sizing: content-box; cursor: default; position: absolute; left: 89.65px; top: 7.5px; color: rgb(118, 118, 118); font: bold 10px arial; text-align: left; text-decoration: none;">서비스업</div>
																			<canvas class="rMateChartH5__Legend"
																				id="rMateChartH5__chart_induty_Legend_2" height="16"
																				width="16"
																				style="position: absolute; width: 11px; height: 11px; left: 142.85px; top: 8.5px;"></canvas>
																			<div
																				class="rMateChartH5__chart_induty_LegendLabelDiv"
																				id="LegendLabel_chart_induty_2"
																				style="box-sizing: content-box; cursor: default; position: absolute; left: 161.85px; top: 7.5px; color: rgb(118, 118, 118); font: bold 10px arial; text-align: left; text-decoration: none;">소매업</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div> <!-- [M 2021-12-15] div 추가 E -->
											</li>

											<li class="graph">
												<!-- [M 2021-12-15] div 추가 S -->
												<div class="chartArea" style="padding-bottom: 10px;">
													<!-- [M 2021-12-15] 타이틀 추가 -->
													<p class="title">업종분포 추이</p>
													<span class="unit" id="indutyQuSub2">단위 : % / 2022년
														2분기 기준</span>

													<div class="area" id="induty2"
														style="width: 100%; height: 240px; position: static;">
														<div class="rMateChartH5__Root" id="chart_induty2"
															style="box-sizing: content-box; position: static; overflow: visible; width: 566px; height: 218px; padding: 15px 10px 5px; border-width: 1px; border-color: rgb(170, 179, 179); border-radius: 12px; border-style: none;">
															<div class="rMateChartH5__Main"
																style="box-sizing: content-box; width: 566px; height: 218px; position: static;">
																<div class="rMateChartH5__Box"
																	style="position: relative; float: left; overflow: visible; width: 566px; height: 218px; border-style: none; border-color: rgb(183, 186, 188); border-width: 1px;">
																	<div class="rMateChartH5__Chart"
																		style="box-sizing: content-box; float: none; position: relative; width: 566px; height: 191px; left: 0px; top: 0px;">
																		<canvas class="rMateChartH5__GridLines" width="799"
																			height="211"
																			style="position: absolute; left: 28px; top: 10px; width: 533px; height: 141px;"></canvas>
																		<canvas class="rMateChartH5__Axis2DRenderer"
																			width="834" height="271"
																			style="position: absolute; left: 5px; top: 5px; width: 556px; height: 181px;"></canvas>
																		<canvas class="rMateChartH5__Axis2DRenderer"
																			width="834" height="271"
																			style="position: absolute; left: 5px; top: 5px; width: 556px; height: 181px;"></canvas>
																		<canvas class="rMateChartH5__Column2DSeries"
																			width="799" height="211"
																			style="position: absolute; left: 28px; top: 10px; width: 533px; height: 141px;"></canvas>
																		<canvas class="rMateChartH5__Column2DSeries"
																			width="799" height="211"
																			style="position: absolute; left: 28px; top: 10px; width: 533px; height: 141px;"></canvas>
																		<canvas class="rMateChartH5__Column2DSeries"
																			width="799" height="211"
																			style="position: absolute; left: 28px; top: 10px; width: 533px; height: 141px;"></canvas>
																		<canvas class="rMateChartH5__LabelLayer" width="799"
																			height="211"
																			style="position: absolute; left: 28px; top: 10px; width: 533px; height: 141px;"></canvas>
																		<canvas class="rMateChartH5__LabelLayer" width="799"
																			height="211"
																			style="position: absolute; left: 28px; top: 10px; width: 533px; height: 141px;"></canvas>
																		<canvas class="rMateChartH5__LabelLayer" width="799"
																			height="211"
																			style="position: absolute; left: 28px; top: 10px; width: 533px; height: 141px;"></canvas>
																		<canvas class="rMateChartH5__UIElementEx" width="849"
																			height="286"
																			style="position: absolute; left: 0px; top: 0px; width: 566px; height: 191px;"></canvas>
																	</div>
																	<div class="rMateChartH5__LegendBox"
																		style="box-sizing: content-box; position: relative; overflow: hidden; float: none; width: 198.5px; height: 27px; left: 183.75px; top: 0px;">
																		<canvas class="rMateChartH5__LegendCanvas" height="0"
																			width="0"
																			style="position: absolute; visibility: hidden;"></canvas>
																		<div class="rMateChartH5__Legend"
																			style="box-sizing: content-box; position: absolute; left: 0px; top: 0px; width: 196px; height: 25px; border: 1px solid rgb(224, 224, 224); border-radius: 0px; background-color: rgb(247, 247, 247);">
																			<canvas class="rMateChartH5__Legend"
																				id="rMateChartH5__chart_induty2_Legend_0"
																				height="16" width="16"
																				style="position: absolute; width: 11px; height: 11px; left: 8px; top: 8.5px;"></canvas>
																			<div
																				class="rMateChartH5__chart_induty2_LegendLabelDiv"
																				id="LegendLabel_chart_induty2_0"
																				style="box-sizing: content-box; cursor: default; position: absolute; left: 27px; top: 7.5px; color: rgb(118, 118, 118); font: bold 10px arial; text-align: left; text-decoration: none;">외식업</div>
																			<canvas class="rMateChartH5__Legend"
																				id="rMateChartH5__chart_induty2_Legend_1"
																				height="16" width="16"
																				style="position: absolute; width: 11px; height: 11px; left: 70.65px; top: 8.5px;"></canvas>
																			<div
																				class="rMateChartH5__chart_induty2_LegendLabelDiv"
																				id="LegendLabel_chart_induty2_1"
																				style="box-sizing: content-box; cursor: default; position: absolute; left: 89.65px; top: 7.5px; color: rgb(118, 118, 118); font: bold 10px arial; text-align: left; text-decoration: none;">서비스업</div>
																			<canvas class="rMateChartH5__Legend"
																				id="rMateChartH5__chart_induty2_Legend_2"
																				height="16" width="16"
																				style="position: absolute; width: 11px; height: 11px; left: 142.85px; top: 8.5px;"></canvas>
																			<div
																				class="rMateChartH5__chart_induty2_LegendLabelDiv"
																				id="LegendLabel_chart_induty2_2"
																				style="box-sizing: content-box; cursor: default; position: absolute; left: 161.85px; top: 7.5px; color: rgb(118, 118, 118); font: bold 10px arial; text-align: left; text-decoration: none;">소매업</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div> <!-- [M 2021-12-15] div 추가 E -->
											</li>
										</ul>
									</dd>
								</dl>
							</div>

							<div class="tabcnt_common2 tabcnt_sales">
								<dl>
									<dt>매출액</dt>

									<dd>
										<ul class="list_reportItem">
											<li class="summary">점포당 월평균 매출액은 <strong
												id="trdarSelngStorAmt">698만원</strong> 입니다.
											</li>

											<li class="contrast">
												<p>
													<span>전년 동분기 대비</span> <strong
														id="trdarSelngStorAmtYearDiff" class="decrease">11만원</strong>
												</p>

												<p>
													<span>전분기 대비</span> <strong id="trdarSelngStorAmtQuDiff"
														class="increase">91만원</strong>
												</p>
											</li>

											<li id="selngAmtDetail" class="detail">선택상권 매출액이 전년대비 감소
												추세입니다. 매출감소 원인을 파악하시기 바랍니다. 창업전이라면 창업을 재검토하시고 창업자이시면 자신의 점포에
												영향이 있는지 파악하세요.</li>

											<li class="graph">
												<!-- [M 2021-12-15] div 추가 S -->
												<div class="chartArea" style="padding-bottom: 10px;">
													<!-- [M 2021-12-15] 타이틀 추가 -->
													<p class="title">매출액 추이</p>
													<span class="unit" id="">단위 : 만원 / 점포당 평균 월 매출</span>

													<div class="area" id="selngAmt"
														style="width: 100%; height: 240px; position: static;">
														<div class="rMateChartH5__Root" id="chart_selngAmt"
															style="box-sizing: content-box; position: static; overflow: visible; width: 566px; height: 218px; padding: 15px 10px 5px; border-width: 1px; border-color: rgb(170, 179, 179); border-radius: 12px; border-style: none;">
															<div class="rMateChartH5__Main"
																style="box-sizing: content-box; width: 566px; height: 218px; position: static;">
																<div class="rMateChartH5__Box"
																	style="position: relative; float: left; overflow: visible; width: 566px; height: 218px; border-style: none; border-color: rgb(183, 186, 188); border-width: 1px;">
																	<div class="rMateChartH5__Chart"
																		style="box-sizing: content-box; float: none; position: relative; width: 566px; height: 191px; left: 0px; top: 0px;">
																		<canvas class="rMateChartH5__GridLines" width="774"
																			height="219"
																			style="position: absolute; left: 45px; top: 5px; width: 516px; height: 146px;"></canvas>
																		<canvas class="rMateChartH5__Axis2DRenderer"
																			width="834" height="279"
																			style="position: absolute; left: 5px; top: 0px; width: 556px; height: 186px;"></canvas>
																		<canvas class="rMateChartH5__Axis2DRenderer"
																			width="834" height="279"
																			style="position: absolute; left: 5px; top: 0px; width: 556px; height: 186px;"></canvas>
																		<canvas class="rMateChartH5__Line2DSeries" width="774"
																			height="219"
																			style="position: absolute; left: 45px; top: 5px; width: 516px; height: 146px;"></canvas>
																		<canvas class="rMateChartH5__Line2DSeries" width="774"
																			height="219"
																			style="position: absolute; left: 45px; top: 5px; width: 516px; height: 146px;"></canvas>
																		<canvas class="rMateChartH5__Line2DSeries" width="774"
																			height="219"
																			style="position: absolute; left: 45px; top: 5px; width: 516px; height: 146px;"></canvas>
																		<canvas class="rMateChartH5__LabelLayer" width="774"
																			height="219"
																			style="position: absolute; left: 45px; top: 5px; width: 516px; height: 146px;"></canvas>
																		<canvas class="rMateChartH5__LabelLayer" width="774"
																			height="219"
																			style="position: absolute; left: 45px; top: 5px; width: 516px; height: 146px;"></canvas>
																		<canvas class="rMateChartH5__LabelLayer" width="774"
																			height="219"
																			style="position: absolute; left: 45px; top: 5px; width: 516px; height: 146px;"></canvas>
																		<canvas class="rMateChartH5__UIElementEx" width="849"
																			height="286"
																			style="position: absolute; left: 0px; top: 0px; width: 566px; height: 191px;"></canvas>
																	</div>
																	<div class="rMateChartH5__LegendBox"
																		style="box-sizing: content-box; position: relative; overflow: hidden; float: none; width: 198.5px; height: 27px; left: 183.75px; top: 0px;">
																		<canvas class="rMateChartH5__LegendCanvas" height="0"
																			width="0"
																			style="position: absolute; visibility: hidden;"></canvas>
																		<div class="rMateChartH5__Legend"
																			style="box-sizing: content-box; position: absolute; left: 0px; top: 0px; width: 196px; height: 25px; border: 1px solid rgb(224, 224, 224); border-radius: 0px; background-color: rgb(247, 247, 247);">
																			<canvas class="rMateChartH5__Legend"
																				id="rMateChartH5__chart_selngAmt_Legend_0"
																				height="16" width="16"
																				style="position: absolute; width: 11px; height: 11px; left: 8px; top: 8.5px;"></canvas>
																			<div
																				class="rMateChartH5__chart_selngAmt_LegendLabelDiv"
																				id="LegendLabel_chart_selngAmt_0"
																				style="box-sizing: content-box; cursor: default; position: absolute; left: 27px; top: 7.5px; color: rgb(118, 118, 118); font: bold 10px arial; text-align: left; text-decoration: none;">선택상권</div>
																			<canvas class="rMateChartH5__Legend"
																				id="rMateChartH5__chart_selngAmt_Legend_1"
																				height="16" width="16"
																				style="position: absolute; width: 11px; height: 11px; left: 80.2px; top: 8.5px;"></canvas>
																			<div
																				class="rMateChartH5__chart_selngAmt_LegendLabelDiv"
																				id="LegendLabel_chart_selngAmt_1"
																				style="box-sizing: content-box; cursor: default; position: absolute; left: 99.2px; top: 7.5px; color: rgb(118, 118, 118); font: bold 10px arial; text-align: left; text-decoration: none;">자치구</div>
																			<canvas class="rMateChartH5__Legend"
																				id="rMateChartH5__chart_selngAmt_Legend_2"
																				height="16" width="16"
																				style="position: absolute; width: 11px; height: 11px; left: 142.85px; top: 8.5px;"></canvas>
																			<div
																				class="rMateChartH5__chart_selngAmt_LegendLabelDiv"
																				id="LegendLabel_chart_selngAmt_2"
																				style="box-sizing: content-box; cursor: default; position: absolute; left: 161.85px; top: 7.5px; color: rgb(118, 118, 118); font: bold 10px arial; text-align: left; text-decoration: none;">서울시</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div> <!-- [M 2021-12-15] div 추가 E -->

											</li>
										</ul>
									</dd>
								</dl>

								<dl>
									<dt>매출건수</dt>

									<dd>
										<ul class="list_reportItem">
											<li class="summary">월평균 매출건수는 <strong
												id="trdarSelngStorCo">400건</strong> 입니다.
											</li>

											<li class="contrast">
												<p>
													<span>전년 동분기 대비</span> <strong
														id="trdarSelngStorCoYearDiff" class="decrease">3건</strong>
												</p>

												<p>
													<span>전분기 대비</span> <strong id="trdarSelngStorCoQuDiff"
														class="increase">98건</strong>
												</p>
											</li>
											<li class="graph">
												<!-- [M 2021-12-15] div 추가 S -->
												<div class="chartArea" style="padding-bottom: 10px;">
													<!-- [M 2021-12-15] 타이틀 추가 -->
													<p class="title">매출건수 추이</p>
													<span class="unit" id="">단위 : 건 / 월평균 매출건수</span>

													<div class="area" id="selngCo"
														style="width: 100%; height: 240px; position: static;">
														<div class="rMateChartH5__Root" id="chart_selngCo"
															style="box-sizing: content-box; position: static; overflow: visible; width: 566px; height: 218px; padding: 15px 10px 5px; border-width: 1px; border-color: rgb(170, 179, 179); border-radius: 12px; border-style: none;">
															<div class="rMateChartH5__Main"
																style="box-sizing: content-box; width: 566px; height: 218px; position: static;">
																<div class="rMateChartH5__Box"
																	style="position: relative; float: left; overflow: visible; width: 566px; height: 218px; border-style: none; border-color: rgb(183, 186, 188); border-width: 1px;">
																	<div class="rMateChartH5__Chart"
																		style="box-sizing: content-box; float: none; position: relative; width: 566px; height: 191px; left: 0px; top: 0px;">
																		<canvas class="rMateChartH5__GridLines" width="786"
																			height="219"
																			style="position: absolute; left: 37px; top: 5px; width: 524px; height: 146px;"></canvas>
																		<canvas class="rMateChartH5__Axis2DRenderer"
																			width="834" height="279"
																			style="position: absolute; left: 5px; top: 0px; width: 556px; height: 186px;"></canvas>
																		<canvas class="rMateChartH5__Axis2DRenderer"
																			width="834" height="279"
																			style="position: absolute; left: 5px; top: 0px; width: 556px; height: 186px;"></canvas>
																		<canvas class="rMateChartH5__Line2DSeries" width="786"
																			height="219"
																			style="position: absolute; left: 37px; top: 5px; width: 524px; height: 146px;"></canvas>
																		<canvas class="rMateChartH5__Line2DSeries" width="786"
																			height="219"
																			style="position: absolute; left: 37px; top: 5px; width: 524px; height: 146px;"></canvas>
																		<canvas class="rMateChartH5__Line2DSeries" width="786"
																			height="219"
																			style="position: absolute; left: 37px; top: 5px; width: 524px; height: 146px;"></canvas>
																		<canvas class="rMateChartH5__LabelLayer" width="786"
																			height="219"
																			style="position: absolute; left: 37px; top: 5px; width: 524px; height: 146px;"></canvas>
																		<canvas class="rMateChartH5__LabelLayer" width="786"
																			height="219"
																			style="position: absolute; left: 37px; top: 5px; width: 524px; height: 146px;"></canvas>
																		<canvas class="rMateChartH5__LabelLayer" width="786"
																			height="219"
																			style="position: absolute; left: 37px; top: 5px; width: 524px; height: 146px;"></canvas>
																		<canvas class="rMateChartH5__UIElementEx" width="849"
																			height="286"
																			style="position: absolute; left: 0px; top: 0px; width: 566px; height: 191px;"></canvas>
																	</div>
																	<div class="rMateChartH5__LegendBox"
																		style="box-sizing: content-box; position: relative; overflow: hidden; float: none; width: 198.5px; height: 27px; left: 183.75px; top: 0px;">
																		<canvas class="rMateChartH5__LegendCanvas" height="0"
																			width="0"
																			style="position: absolute; visibility: hidden;"></canvas>
																		<div class="rMateChartH5__Legend"
																			style="box-sizing: content-box; position: absolute; left: 0px; top: 0px; width: 196px; height: 25px; border: 1px solid rgb(224, 224, 224); border-radius: 0px; background-color: rgb(247, 247, 247);">
																			<canvas class="rMateChartH5__Legend"
																				id="rMateChartH5__chart_selngCo_Legend_0"
																				height="16" width="16"
																				style="position: absolute; width: 11px; height: 11px; left: 8px; top: 8.5px;"></canvas>
																			<div
																				class="rMateChartH5__chart_selngCo_LegendLabelDiv"
																				id="LegendLabel_chart_selngCo_0"
																				style="box-sizing: content-box; cursor: default; position: absolute; left: 27px; top: 7.5px; color: rgb(118, 118, 118); font: bold 10px arial; text-align: left; text-decoration: none;">선택상권</div>
																			<canvas class="rMateChartH5__Legend"
																				id="rMateChartH5__chart_selngCo_Legend_1"
																				height="16" width="16"
																				style="position: absolute; width: 11px; height: 11px; left: 80.2px; top: 8.5px;"></canvas>
																			<div
																				class="rMateChartH5__chart_selngCo_LegendLabelDiv"
																				id="LegendLabel_chart_selngCo_1"
																				style="box-sizing: content-box; cursor: default; position: absolute; left: 99.2px; top: 7.5px; color: rgb(118, 118, 118); font: bold 10px arial; text-align: left; text-decoration: none;">자치구</div>
																			<canvas class="rMateChartH5__Legend"
																				id="rMateChartH5__chart_selngCo_Legend_2"
																				height="16" width="16"
																				style="position: absolute; width: 11px; height: 11px; left: 142.85px; top: 8.5px;"></canvas>
																			<div
																				class="rMateChartH5__chart_selngCo_LegendLabelDiv"
																				id="LegendLabel_chart_selngCo_2"
																				style="box-sizing: content-box; cursor: default; position: absolute; left: 161.85px; top: 7.5px; color: rgb(118, 118, 118); font: bold 10px arial; text-align: left; text-decoration: none;">서울시</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>

												</div> <!-- [M 2021-12-15] div 추가 E -->
											</li>
										</ul>
									</dd>
								</dl>

								<dl>
									<dt>요일별 매출</dt>

									<dd>
										<ul class="list_reportItem">
											<li class="summary"><strong id="selngWeekTop1">월요일(18.2%)</strong>
												매출이 가장 높아요.</li>

											<li id="selngWeekDetail" class="detail"><strong>상계10동</strong>은
												<strong>월요일</strong>에 가장 매출이 높습니다. 평일(월화수목금) 고객이 중요한 상권이므로
												고정 고객확보에 유의하세요.</li>

											<li class="graph">
												<!-- [M 2021-12-15] div 추가 S -->
												<div class="chartArea">
													<!-- [M 2021-12-15] 타이틀 추가 -->
													<p class="title">요일별 매출 현황</p>
													<span class="unit" id="">단위 : % / 3개월간 점포당 평균</span>

													<div class="area" id="selngWeek"
														style="width: 100%; height: 228px; position: static;">
														<div class="rMateChartH5__Root" id="chart_selngWeek"
															style="box-sizing: content-box; position: static; overflow: visible; width: 566px; height: 206px; padding: 15px 10px 5px; border-width: 1px; border-color: rgb(170, 179, 179); border-radius: 12px; border-style: none;">
															<div class="rMateChartH5__Main"
																style="box-sizing: content-box; position: static; width: 566px; height: 206px;">
																<div class="rMateChartH5__Chart"
																	style="box-sizing: content-box; float: left; position: relative; width: 566px; height: 206px;">
																	<canvas class="rMateChartH5__GridLines" width="795"
																		height="234"
																		style="position: absolute; left: 31px; top: 10px; width: 530px; height: 156px;"></canvas>
																	<canvas class="rMateChartH5__Axis2DRenderer"
																		width="834" height="294"
																		style="position: absolute; left: 5px; top: 5px; width: 556px; height: 196px;"></canvas>
																	<canvas class="rMateChartH5__Axis2DRenderer"
																		width="834" height="294"
																		style="position: absolute; left: 5px; top: 5px; width: 556px; height: 196px;"></canvas>
																	<canvas class="rMateChartH5__Column2DSeries"
																		width="795" height="234"
																		style="position: absolute; left: 31px; top: 10px; width: 530px; height: 156px;"></canvas>
																	<canvas class="rMateChartH5__LabelLayer" width="795"
																		height="234"
																		style="position: absolute; left: 31px; top: 10px; width: 530px; height: 156px;"></canvas>
																	<canvas class="rMateChartH5__UIElementEx" width="849"
																		height="309"
																		style="position: absolute; left: 0px; top: 0px; width: 566px; height: 206px;"></canvas>
																</div>
															</div>
														</div>
													</div>
												</div> <!-- [M 2021-12-15] div 추가 E -->
											</li>
										</ul>
									</dd>
								</dl>

								<dl>
									<dt>시간대별 매출</dt>

									<dd>
										<ul class="list_reportItem">
											<li class="summary"><strong id="selngHourTop1">17
													~ 21시</strong> 매출이 가장 높아요.</li>

											<li id="selngHourDetail" class="detail"><strong>17
													~ 21시</strong>매출이 가장 높습니다. 오후와 저녁시간대가 활발한 상권입니다.</li>

											<li class="graph">
												<!-- [M 2021-12-15] div 추가 S -->
												<div class="chartArea">
													<!-- [M 2021-12-15] 타이틀 추가 -->
													<p class="title">시간대별 매출 현황</p>
													<span class="unit" id="">단위 : 점포당 평균 비율(%)</span>

													<div class="area" id="selngHour"
														style="width: 100%; height: 228px; position: static;">
														<div class="rMateChartH5__Root" id="chart_selngHour"
															style="box-sizing: content-box; position: static; overflow: visible; width: 566px; height: 206px; padding: 15px 10px 5px; border-width: 1px; border-color: rgb(170, 179, 179); border-radius: 12px; border-style: none;">
															<div class="rMateChartH5__Main"
																style="box-sizing: content-box; position: static; width: 566px; height: 206px;">
																<div class="rMateChartH5__Chart"
																	style="box-sizing: content-box; float: left; position: relative; width: 566px; height: 206px;">
																	<canvas class="rMateChartH5__GridLines" width="787"
																		height="229"
																		style="position: absolute; left: 36px; top: 11px; width: 525px; height: 153px;"></canvas>
																	<canvas class="rMateChartH5__Axis2DRenderer"
																		width="834" height="294"
																		style="position: absolute; left: 5px; top: 5px; width: 556px; height: 196px;"></canvas>
																	<canvas class="rMateChartH5__Axis2DRenderer"
																		width="834" height="294"
																		style="position: absolute; left: 5px; top: 5px; width: 556px; height: 196px;"></canvas>
																	<canvas class="rMateChartH5__Area2DSeries" width="787"
																		height="229"
																		style="position: absolute; left: 36px; top: 11px; width: 525px; height: 153px;"></canvas>
																	<canvas class="rMateChartH5__LabelLayer" width="787"
																		height="229"
																		style="position: absolute; left: 36px; top: 11px; width: 525px; height: 153px;"></canvas>
																	<canvas class="rMateChartH5__UIElementEx" width="849"
																		height="309"
																		style="position: absolute; left: 0px; top: 0px; width: 566px; height: 206px;"></canvas>
																</div>
															</div>
														</div>
													</div>
												</div> <!-- [M 2021-12-15] div 추가 E -->
											</li>
										</ul>
									</dd>
								</dl>

								<dl>
									<dt>성별 매출</dt>

									<dd>
										<ul class="list_reportItem">
											<li class="summary"><strong id="selngSexTop1">여성(54.7%)</strong>
												매출이 높아요.</li>


											<li id="selngSexTop1Detail" class="detail">선택상권은 <strong>여성(54.7%)</strong>
												고객이 많은 상권입니다. 여성 고객의 방문에 도움이되는 요소에 보다 많은 투자를 고려하세요.
											</li>

											<li class="graph">
												<!-- [M 2021-12-15] div 추가 S -->
												<div class="chartArea">
													<!-- [M 2021-12-15] 타이틀 추가 -->
													<p class="title">성별 매출 현황</p>
													<span class="unit" id="">단위 : %</span>

													<div class="area" id="selngSex"
														style="width: 100%; height: 228px; position: static;">
														<div class="rMateChartH5__Root" id="chart_selngSex"
															style="box-sizing: content-box; position: static; overflow: visible; width: 566px; height: 206px; padding: 15px 10px 5px; border-width: 1px; border-color: rgb(170, 179, 179); border-radius: 12px; border-style: none;">
															<div class="rMateChartH5__Main"
																style="box-sizing: content-box; width: 566px; height: 206px; position: static;">
																<div class="rMateChartH5__Box"
																	style="position: relative; float: left; overflow: visible; width: 566px; height: 206px; border-style: none; border-color: rgb(183, 186, 188); border-width: 1px;">
																	<div class="rMateChartH5__Chart"
																		style="box-sizing: content-box; float: left; position: relative; width: 458.8px; height: 206px; left: 0px; top: 0px;">
																		<canvas class="rMateChartH5__AngularAxisRenderer"
																			width="672" height="294"
																			style="position: absolute; left: 5px; top: 5px; width: 448px; height: 196px;"></canvas>
																		<canvas class="rMateChartH5__Pie2DSeries" width="672"
																			height="294"
																			style="position: absolute; left: 5px; top: 5px; width: 448px; height: 196px;"></canvas>
																		<canvas class="rMateChartH5__LabelLayer" width="672"
																			height="294"
																			style="position: absolute; left: 5px; top: 5px; width: 448px; height: 196px;"></canvas>
																		<canvas class="rMateChartH5__UIElementEx" width="687"
																			height="309"
																			style="position: absolute; left: 0px; top: 0px; width: 458px; height: 206px;"></canvas>
																	</div>
																	<div class="rMateChartH5__LegendBox"
																		style="box-sizing: content-box; position: relative; overflow: hidden; float: left; width: 107.2px; height: 27px; left: 0px; top: 89.5px;">
																		<canvas class="rMateChartH5__LegendCanvas" height="0"
																			width="0"
																			style="position: absolute; visibility: hidden;"></canvas>
																		<div class="rMateChartH5__Legend"
																			style="box-sizing: content-box; position: absolute; left: 0px; top: 0px; width: 105px; height: 25px; border: 1px solid rgb(224, 224, 224); border-radius: 0px; background-color: rgb(247, 247, 247);">
																			<canvas class="rMateChartH5__Legend"
																				id="rMateChartH5__chart_selngSex_Legend_0"
																				height="16" width="16"
																				style="position: absolute; width: 11px; height: 11px; left: 8px; top: 8.5px;"></canvas>
																			<div
																				class="rMateChartH5__chart_selngSex_LegendLabelDiv"
																				id="LegendLabel_chart_selngSex_0"
																				style="box-sizing: content-box; cursor: default; position: absolute; left: 27px; top: 7.5px; color: rgb(118, 118, 118); font: bold 10px arial; text-align: left; text-decoration: none;">남성</div>
																			<canvas class="rMateChartH5__Legend"
																				id="rMateChartH5__chart_selngSex_Legend_1"
																				height="16" width="16"
																				style="position: absolute; width: 11px; height: 11px; left: 61.1px; top: 8.5px;"></canvas>
																			<div
																				class="rMateChartH5__chart_selngSex_LegendLabelDiv"
																				id="LegendLabel_chart_selngSex_1"
																				style="box-sizing: content-box; cursor: default; position: absolute; left: 80.1px; top: 7.5px; color: rgb(118, 118, 118); font: bold 10px arial; text-align: left; text-decoration: none;">여성</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div> <!-- [M 2021-12-15] div 추가 E -->
											</li>
											<li class="graph">
												<div class="area col col3">
													<!-- [M 2021-12-15] div 추가 S -->
													<div class="chartArea">
														<p class="title">외식업</p>
														<div id="selngSexInduty"
															style="height: 228px; width: 100%; position: static;">
															<div class="rMateChartH5__Root" id="chart_selngSexInduty"
																style="box-sizing: content-box; position: static; overflow: visible; width: 139px; height: 206px; padding: 15px 10px 5px; border-width: 1px; border-color: rgb(170, 179, 179); border-radius: 12px; border-style: none;">
																<div class="rMateChartH5__Main"
																	style="box-sizing: content-box; position: static; width: 139px; height: 206px;">
																	<div class="rMateChartH5__Chart"
																		style="box-sizing: content-box; float: left; position: relative; width: 139px; height: 206px;">
																		<canvas class="rMateChartH5__AngularAxisRenderer"
																			width="193" height="294"
																			style="position: absolute; left: 5px; top: 5px; width: 129px; height: 196px;"></canvas>
																		<canvas class="rMateChartH5__Pie2DSeries" width="193"
																			height="294"
																			style="position: absolute; left: 5px; top: 5px; width: 129px; height: 196px;"></canvas>
																		<canvas class="rMateChartH5__LabelLayer" width="193"
																			height="294"
																			style="position: absolute; left: 5px; top: 5px; width: 129px; height: 196px;"></canvas>
																		<canvas class="rMateChartH5__UIElementEx" width="208"
																			height="309"
																			style="position: absolute; left: 0px; top: 0px; width: 139px; height: 206px;"></canvas>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="chartArea">
														<p class="title">서비스업</p>
														<div id="selngSexInduty2"
															style="height: 228px; width: 100%; position: static;">
															<div class="rMateChartH5__Root"
																id="chart_selngSexInduty2"
																style="box-sizing: content-box; position: static; overflow: visible; width: 139px; height: 206px; padding: 15px 10px 5px; border-width: 1px; border-color: rgb(170, 179, 179); border-radius: 12px; border-style: none;">
																<div class="rMateChartH5__Main"
																	style="box-sizing: content-box; position: static; width: 139px; height: 206px;">
																	<div class="rMateChartH5__Chart"
																		style="box-sizing: content-box; float: left; position: relative; width: 139px; height: 206px;">
																		<canvas class="rMateChartH5__AngularAxisRenderer"
																			width="193" height="294"
																			style="position: absolute; left: 5px; top: 5px; width: 129px; height: 196px;"></canvas>
																		<canvas class="rMateChartH5__Pie2DSeries" width="193"
																			height="294"
																			style="position: absolute; left: 5px; top: 5px; width: 129px; height: 196px;"></canvas>
																		<canvas class="rMateChartH5__LabelLayer" width="193"
																			height="294"
																			style="position: absolute; left: 5px; top: 5px; width: 129px; height: 196px;"></canvas>
																		<canvas class="rMateChartH5__UIElementEx" width="208"
																			height="309"
																			style="position: absolute; left: 0px; top: 0px; width: 139px; height: 206px;"></canvas>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="chartArea">
														<p class="title">소매업</p>
														<div id="selngSexInduty3"
															style="height: 228px; width: 100%; position: static;">
															<div class="rMateChartH5__Root"
																id="chart_selngSexInduty3"
																style="box-sizing: content-box; position: static; overflow: visible; width: 139px; height: 206px; padding: 15px 10px 5px; border-width: 1px; border-color: rgb(170, 179, 179); border-radius: 12px; border-style: none;">
																<div class="rMateChartH5__Main"
																	style="box-sizing: content-box; position: static; width: 139px; height: 206px;">
																	<div class="rMateChartH5__Chart"
																		style="box-sizing: content-box; float: left; position: relative; width: 139px; height: 206px;">
																		<canvas class="rMateChartH5__AngularAxisRenderer"
																			width="193" height="294"
																			style="position: absolute; left: 5px; top: 5px; width: 129px; height: 196px;"></canvas>
																		<canvas class="rMateChartH5__Pie2DSeries" width="193"
																			height="294"
																			style="position: absolute; left: 5px; top: 5px; width: 129px; height: 196px;"></canvas>
																		<canvas class="rMateChartH5__LabelLayer" width="193"
																			height="294"
																			style="position: absolute; left: 5px; top: 5px; width: 129px; height: 196px;"></canvas>
																		<canvas class="rMateChartH5__UIElementEx" width="208"
																			height="309"
																			style="position: absolute; left: 0px; top: 0px; width: 139px; height: 206px;"></canvas>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<!-- [M 2021-12-15] div 추가 E -->
												</div>
											</li>
										</ul>
									</dd>
								</dl>
								<dl>
									<dt>연령대별 매출</dt>

									<dd>
										<ul class="list_reportItem">
											<li class="summary"><strong id="selngAgeTop1">외식업의
													20대(27.9%)</strong> 매출이 높아요.</li>


											<li class="detail">선택상권의 <strong>외식업</strong>은 <strong>20대(27.9%)</strong>가
												가장 활발한 소비를 보입니다. 장년층 이상이 관심을 가질 만한 구매요소에 보다 많은 투자를 고려하세요.
											</li>

											<li class="graph">
												<!-- [M 2021-12-15] div 추가 S -->
												<div class="chartArea">
													<!-- [M 2021-12-15] 타이틀 추가 -->
													<p class="title" id="selngAgeTitleTop1">연령대별 외식업 매출 현황</p>
													<!-- [M 2021-12-15] div 추가 E -->
													<span class="unit">단위 : % / 점포당 평균비율</span>

													<div class="area" id="selngAge"
														style="width: 100%; height: 228px; position: static;">
														<div class="rMateChartH5__Root" id="chart_selngAge"
															style="box-sizing: content-box; position: static; overflow: visible; width: 566px; height: 206px; padding: 15px 10px 5px; border-width: 1px; border-color: rgb(170, 179, 179); border-radius: 12px; border-style: none;">
															<div class="rMateChartH5__Main"
																style="box-sizing: content-box; position: static; width: 566px; height: 206px;">
																<div class="rMateChartH5__Chart"
																	style="box-sizing: content-box; float: left; position: relative; width: 566px; height: 206px;">
																	<canvas class="rMateChartH5__GridLines" width="795"
																		height="234"
																		style="position: absolute; left: 31px; top: 10px; width: 530px; height: 156px;"></canvas>
																	<canvas class="rMateChartH5__Axis2DRenderer"
																		width="834" height="294"
																		style="position: absolute; left: 5px; top: 5px; width: 556px; height: 196px;"></canvas>
																	<canvas class="rMateChartH5__Axis2DRenderer"
																		width="834" height="294"
																		style="position: absolute; left: 5px; top: 5px; width: 556px; height: 196px;"></canvas>
																	<canvas class="rMateChartH5__Column2DSeries"
																		width="795" height="234"
																		style="position: absolute; left: 31px; top: 10px; width: 530px; height: 156px;"></canvas>
																	<canvas class="rMateChartH5__LabelLayer" width="795"
																		height="234"
																		style="position: absolute; left: 31px; top: 10px; width: 530px; height: 156px;"></canvas>
																	<canvas class="rMateChartH5__UIElementEx" width="849"
																		height="309"
																		style="position: absolute; left: 0px; top: 0px; width: 566px; height: 206px;"></canvas>
																</div>
															</div>
														</div>
													</div>
												</div> <!-- [M 2021-12-15] div 추가 E -->
											</li>
											<li class="graph">
												<!-- [M 2021-12-15] div 추가 E -->
												<div class="area col col2">
													<!-- [M 2021-12-15] div 추가 S -->
													<div class="chartArea">
														<p class="title" id="selngAgeTitleSub1">연령대별 서비스업 매출
															현황</p>
														<div id="selngAgeSub1"
															style="height: 228px; width: 100%; position: static;">
															<div class="rMateChartH5__Root" id="chart_selngAgeSub1"
																style="box-sizing: content-box; position: static; overflow: visible; width: 246px; height: 206px; padding: 15px 10px 5px; border-width: 1px; border-color: rgb(170, 179, 179); border-radius: 12px; border-style: none;">
																<div class="rMateChartH5__Main"
																	style="box-sizing: content-box; position: static; width: 246px; height: 206px;">
																	<div class="rMateChartH5__Chart"
																		style="box-sizing: content-box; float: left; position: relative; width: 246px; height: 206px;">
																		<canvas class="rMateChartH5__GridLines" width="315"
																			height="234"
																			style="position: absolute; left: 31px; top: 10px; width: 210px; height: 156px;"></canvas>
																		<canvas class="rMateChartH5__Axis2DRenderer"
																			width="354" height="294"
																			style="position: absolute; left: 5px; top: 5px; width: 236px; height: 196px;"></canvas>
																		<canvas class="rMateChartH5__Axis2DRenderer"
																			width="354" height="294"
																			style="position: absolute; left: 5px; top: 5px; width: 236px; height: 196px;"></canvas>
																		<canvas class="rMateChartH5__Column2DSeries"
																			width="315" height="234"
																			style="position: absolute; left: 31px; top: 10px; width: 210px; height: 156px;"></canvas>
																		<canvas class="rMateChartH5__LabelLayer" width="315"
																			height="234"
																			style="position: absolute; left: 31px; top: 10px; width: 210px; height: 156px;"></canvas>
																		<canvas class="rMateChartH5__UIElementEx" width="369"
																			height="309"
																			style="position: absolute; left: 0px; top: 0px; width: 246px; height: 206px;"></canvas>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="chartArea">
														<p class="title" id="selngAgeTitleSub2">연령대별 소매업 매출 현황</p>
														<div id="selngAgeSub2"
															style="height: 228px; width: 100%; position: static;">
															<div class="rMateChartH5__Root" id="chart_selngAgeSub2"
																style="box-sizing: content-box; position: static; overflow: visible; width: 246px; height: 206px; padding: 15px 10px 5px; border-width: 1px; border-color: rgb(170, 179, 179); border-radius: 12px; border-style: none;">
																<div class="rMateChartH5__Main"
																	style="box-sizing: content-box; position: static; width: 246px; height: 206px;">
																	<div class="rMateChartH5__Chart"
																		style="box-sizing: content-box; float: left; position: relative; width: 246px; height: 206px;">
																		<canvas class="rMateChartH5__GridLines" width="315"
																			height="234"
																			style="position: absolute; left: 31px; top: 10px; width: 210px; height: 156px;"></canvas>
																		<canvas class="rMateChartH5__Axis2DRenderer"
																			width="354" height="294"
																			style="position: absolute; left: 5px; top: 5px; width: 236px; height: 196px;"></canvas>
																		<canvas class="rMateChartH5__Axis2DRenderer"
																			width="354" height="294"
																			style="position: absolute; left: 5px; top: 5px; width: 236px; height: 196px;"></canvas>
																		<canvas class="rMateChartH5__Column2DSeries"
																			width="315" height="234"
																			style="position: absolute; left: 31px; top: 10px; width: 210px; height: 156px;"></canvas>
																		<canvas class="rMateChartH5__LabelLayer" width="315"
																			height="234"
																			style="position: absolute; left: 31px; top: 10px; width: 210px; height: 156px;"></canvas>
																		<canvas class="rMateChartH5__UIElementEx" width="369"
																			height="309"
																			style="position: absolute; left: 0px; top: 0px; width: 246px; height: 206px;"></canvas>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</li>
										</ul>
									</dd>
								</dl>
							</div>

							<div class="tabcnt_common2 tabcnt_population">
								<dl class="flpopCo">
									<dt class="relative">
										유동인구 수
										<!--
							<span class="subs">※ KT통신사 기반 데이터</span>
							-->
									</dt>

									<dd>
										<ul class="list_reportItem">
											<li class="summary">유동인구 수는 일평균 <strong id="flpopCo_co">20,771명</strong>
												이고 밀도는 <strong id="flpopCo_dnst">23,549명/㏊</strong> 입니다.
											</li>

											<li class="contrast">
												<p>
													<span>전년 동분기 대비</span> <strong class="null decrease"
														id="trdarTotFlpopCoYearDiff">5,148명</strong>
												</p>

												<p>
													<span>전분기 대비</span> <strong class="null decrease"
														id="trdarTotFlpopCoQuDiff">296명</strong>
												</p>
											</li>

											<li class="detail">선택상권은 전년 동분기에 비해 유동인구가 <strong>감소</strong>하고있는
												지역입니다. 마케팅이 중요한 상권입니다.
											</li>

											<li class="graph">
												<!-- [M 2021-12-15] div 추가 S -->
												<div class="chartArea" style="padding-bottom: 10px;">
													<!-- [M 2021-12-15] 타이틀 추가 -->
													<p class="title">유동인구 추이</p>
													<!-- [M 2021-12-15] div 추가 E -->
													<span class="unit">단위 : 1 ha당 명 / 3개월간 유동인구</span>

													<div class="area" id="flpopCo"
														style="width: 100%; height: 240px; position: static;">
														<div class="rMateChartH5__Root" id="chart_flpopCo"
															style="box-sizing: content-box; position: static; overflow: visible; width: 566px; height: 218px; padding: 15px 10px 5px; border-width: 1px; border-color: rgb(170, 179, 179); border-style: none; border-radius: 12px;">
															<div class="rMateChartH5__Main"
																style="box-sizing: content-box; width: 566px; height: 218px; position: static;">
																<div class="rMateChartH5__Box"
																	style="position: relative; float: left; overflow: visible; width: 566px; height: 218px; border-style: none; border-color: rgb(183, 186, 188); border-width: 1px;">
																	<div class="rMateChartH5__Chart"
																		style="box-sizing: content-box; float: none; position: relative; width: 566px; height: 191px; left: 0px; top: 0px;">
																		<canvas class="rMateChartH5__GridLines" width="766"
																			height="219"
																			style="position: absolute; left: 50px; top: 5px; width: 511px; height: 146px;"></canvas>
																		<canvas class="rMateChartH5__Axis2DRenderer"
																			width="834" height="279"
																			style="position: absolute; left: 5px; top: 0px; width: 556px; height: 186px;"></canvas>
																		<canvas class="rMateChartH5__Axis2DRenderer"
																			width="834" height="279"
																			style="position: absolute; left: 5px; top: 0px; width: 556px; height: 186px;"></canvas>
																		<canvas class="rMateChartH5__Line2DSeries" width="766"
																			height="219"
																			style="position: absolute; left: 50px; top: 5px; width: 511px; height: 146px;"></canvas>
																		<canvas class="rMateChartH5__Line2DSeries" width="766"
																			height="219"
																			style="position: absolute; left: 50px; top: 5px; width: 511px; height: 146px;"></canvas>
																		<canvas class="rMateChartH5__Line2DSeries" width="766"
																			height="219"
																			style="position: absolute; left: 50px; top: 5px; width: 511px; height: 146px;"></canvas>
																		<canvas class="rMateChartH5__LabelLayer" width="766"
																			height="219"
																			style="position: absolute; left: 50px; top: 5px; width: 511px; height: 146px;"></canvas>
																		<canvas class="rMateChartH5__LabelLayer" width="766"
																			height="219"
																			style="position: absolute; left: 50px; top: 5px; width: 511px; height: 146px;"></canvas>
																		<canvas class="rMateChartH5__LabelLayer" width="766"
																			height="219"
																			style="position: absolute; left: 50px; top: 5px; width: 511px; height: 146px;"></canvas>
																		<canvas class="rMateChartH5__UIElementEx" width="849"
																			height="286"
																			style="position: absolute; left: 0px; top: 0px; width: 566px; height: 191px;"></canvas>
																	</div>
																	<div class="rMateChartH5__LegendBox"
																		style="box-sizing: content-box; position: relative; overflow: hidden; float: none; width: 199.173px; height: 27px; left: 183.413px; top: 0px;">
																		<canvas class="rMateChartH5__LegendCanvas" height="0"
																			width="0"
																			style="position: absolute; visibility: hidden;"></canvas>
																		<div class="rMateChartH5__Legend"
																			style="box-sizing: content-box; position: absolute; left: 0px; top: 0px; width: 197px; height: 25px; border: 1px solid rgb(224, 224, 224); border-radius: 0px; background-color: rgb(247, 247, 247);">
																			<canvas class="rMateChartH5__Legend"
																				id="rMateChartH5__chart_flpopCo_Legend_0"
																				height="16" width="16"
																				style="position: absolute; width: 11px; height: 11px; left: 8px; top: 8.5px;"></canvas>
																			<div
																				class="rMateChartH5__chart_flpopCo_LegendLabelDiv"
																				id="LegendLabel_chart_flpopCo_0"
																				style="box-sizing: content-box; cursor: default; position: absolute; left: 27px; top: 7.5px; color: rgb(118, 118, 118); font: bold 10px arial; text-align: left; text-decoration: none;">상계10동</div>
																			<canvas class="rMateChartH5__Legend"
																				id="rMateChartH5__chart_flpopCo_Legend_1"
																				height="16" width="16"
																				style="position: absolute; width: 11px; height: 11px; left: 80.873px; top: 8.5px;"></canvas>
																			<div
																				class="rMateChartH5__chart_flpopCo_LegendLabelDiv"
																				id="LegendLabel_chart_flpopCo_1"
																				style="box-sizing: content-box; cursor: default; position: absolute; left: 99.873px; top: 7.5px; color: rgb(118, 118, 118); font: bold 10px arial; text-align: left; text-decoration: none;">자치구</div>
																			<canvas class="rMateChartH5__Legend"
																				id="rMateChartH5__chart_flpopCo_Legend_2"
																				height="16" width="16"
																				style="position: absolute; width: 11px; height: 11px; left: 143.523px; top: 8.5px;"></canvas>
																			<div
																				class="rMateChartH5__chart_flpopCo_LegendLabelDiv"
																				id="LegendLabel_chart_flpopCo_2"
																				style="box-sizing: content-box; cursor: default; position: absolute; left: 162.523px; top: 7.5px; color: rgb(118, 118, 118); font: bold 10px arial; text-align: left; text-decoration: none;">서울시</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div> <!-- [M 2021-12-15] div 추가 E -->
											</li>
										</ul>
									</dd>
								</dl>

								<dl>
									<dt>성별, 연령별 유동인구</dt>

									<dd>
										<ul class="list_reportItem">
											<li class="summary"><strong id="flpopSexAgeTop">여성,
													60대 이상 ( 23.6%)</strong> 유동인구가 가장 많아요.</li>

											<li class="graph">
												<!-- [M 2021-12-15] div 추가 S -->
												<div class="chartArea">
													<!-- [M 2021-12-15] 타이틀 추가 -->
													<p class="title">성별, 연령별 유동인구 현황</p>
													<!-- [M 2021-12-15] div 추가 E -->
													<span class="unit">단위 : % / 연령별 유동인구 비율</span>

													<div class="area" id="flpopSexAge"
														style="width: 100%; height: 228px; position: static;">
														<div class="rMateChartH5__Root" id="chart_flpopSexAge"
															style="box-sizing: content-box; position: static; overflow: visible; width: 566px; height: 206px; padding: 15px 10px 5px; border-width: 1px; border-color: rgb(170, 179, 179); border-radius: 12px; border-style: none;">
															<div class="rMateChartH5__Main"
																style="box-sizing: content-box; width: 566px; height: 206px; position: static;">
																<div class="rMateChartH5__Box"
																	style="position: relative; float: left; overflow: visible; width: 566px; height: 206px; border-style: none; border-color: rgb(183, 186, 188); border-width: 1px;">
																	<div class="rMateChartH5__Chart"
																		style="box-sizing: content-box; float: none; position: relative; width: 566px; height: 179px; left: 0px; top: 0px;">
																		<canvas class="rMateChartH5__GridLines" width="795"
																			height="193"
																			style="position: absolute; left: 31px; top: 10px; width: 530px; height: 129px;"></canvas>
																		<canvas class="rMateChartH5__Axis2DRenderer"
																			width="834" height="253"
																			style="position: absolute; left: 5px; top: 5px; width: 556px; height: 169px;"></canvas>
																		<canvas class="rMateChartH5__Axis2DRenderer"
																			width="834" height="253"
																			style="position: absolute; left: 5px; top: 5px; width: 556px; height: 169px;"></canvas>
																		<canvas class="rMateChartH5__Column2DSeries"
																			width="795" height="193"
																			style="position: absolute; left: 31px; top: 10px; width: 530px; height: 129px;"></canvas>
																		<canvas class="rMateChartH5__Column2DSeries"
																			width="795" height="193"
																			style="position: absolute; left: 31px; top: 10px; width: 530px; height: 129px;"></canvas>
																		<canvas class="rMateChartH5__LabelLayer" width="795"
																			height="193"
																			style="position: absolute; left: 31px; top: 10px; width: 530px; height: 129px;"></canvas>
																		<canvas class="rMateChartH5__LabelLayer" width="795"
																			height="193"
																			style="position: absolute; left: 31px; top: 10px; width: 530px; height: 129px;"></canvas>
																		<canvas class="rMateChartH5__UIElementEx" width="849"
																			height="268"
																			style="position: absolute; left: 0px; top: 0px; width: 566px; height: 179px;"></canvas>
																	</div>
																	<div class="rMateChartH5__LegendBox"
																		style="box-sizing: content-box; position: relative; overflow: hidden; float: none; width: 107.2px; height: 27px; left: 229.4px; top: 0px;">
																		<canvas class="rMateChartH5__LegendCanvas" height="0"
																			width="0"
																			style="position: absolute; visibility: hidden;"></canvas>
																		<div class="rMateChartH5__Legend"
																			style="box-sizing: content-box; position: absolute; left: 0px; top: 0px; width: 105px; height: 25px; border: 1px solid rgb(224, 224, 224); border-radius: 0px; background-color: rgb(247, 247, 247);">
																			<canvas class="rMateChartH5__Legend"
																				id="rMateChartH5__chart_flpopSexAge_Legend_0"
																				height="16" width="16"
																				style="position: absolute; width: 11px; height: 11px; left: 8px; top: 8.5px;"></canvas>
																			<div
																				class="rMateChartH5__chart_flpopSexAge_LegendLabelDiv"
																				id="LegendLabel_chart_flpopSexAge_0"
																				style="box-sizing: content-box; cursor: default; position: absolute; left: 27px; top: 7.5px; color: rgb(118, 118, 118); font: bold 10px arial; text-align: left; text-decoration: none;">남성</div>
																			<canvas class="rMateChartH5__Legend"
																				id="rMateChartH5__chart_flpopSexAge_Legend_1"
																				height="16" width="16"
																				style="position: absolute; width: 11px; height: 11px; left: 61.1px; top: 8.5px;"></canvas>
																			<div
																				class="rMateChartH5__chart_flpopSexAge_LegendLabelDiv"
																				id="LegendLabel_chart_flpopSexAge_1"
																				style="box-sizing: content-box; cursor: default; position: absolute; left: 80.1px; top: 7.5px; color: rgb(118, 118, 118); font: bold 10px arial; text-align: left; text-decoration: none;">여성</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div> <!-- [M 2021-12-15] div 추가 E -->
											</li>
										</ul>
									</dd>
								</dl>

								<dl>
									<dt>요일별 유동인구</dt>

									<dd>
										<ul class="list_reportItem">
											<li class="summary"><strong id="flpopWeekCoTop1">토요일(
													14.89%)</strong> 유동인구가 가장 높아요.</li>

											<li class="detail">선택상권은 <strong>토요일 ( 14.89%)</strong>에
												가장 유동인구가 많습니다. 주말(토일) 고객과 원거리 고객을 위한 마케팅이 중요합니다.
											</li>

											<li class="graph">
												<!-- [M 2021-12-15] div 추가 S -->
												<div class="chartArea">
													<!-- [M 2021-12-15] 타이틀 추가 -->
													<p class="title">요일별 유동인구 현황</p>
													<!-- [M 2021-12-15] div 추가 E -->
													<span class="unit" id="">단위 : % / 요일별 유동인구 비율</span>

													<div class="area" id="flpopWeekCo"
														style="width: 100%; height: 228px; position: static;">
														<div class="rMateChartH5__Root" id="chart_flpopWeekCo"
															style="box-sizing: content-box; position: static; overflow: visible; width: 566px; height: 206px; padding: 15px 10px 5px; border-width: 1px; border-color: rgb(170, 179, 179); border-radius: 12px; border-style: none;">
															<div class="rMateChartH5__Main"
																style="box-sizing: content-box; position: static; width: 566px; height: 206px;">
																<div class="rMateChartH5__Chart"
																	style="box-sizing: content-box; float: left; position: relative; width: 566px; height: 206px;">
																	<canvas class="rMateChartH5__GridLines" width="795"
																		height="234"
																		style="position: absolute; left: 31px; top: 10px; width: 530px; height: 156px;"></canvas>
																	<canvas class="rMateChartH5__Axis2DRenderer"
																		width="834" height="294"
																		style="position: absolute; left: 5px; top: 5px; width: 556px; height: 196px;"></canvas>
																	<canvas class="rMateChartH5__Axis2DRenderer"
																		width="834" height="294"
																		style="position: absolute; left: 5px; top: 5px; width: 556px; height: 196px;"></canvas>
																	<canvas class="rMateChartH5__Column2DSeries"
																		width="795" height="234"
																		style="position: absolute; left: 31px; top: 10px; width: 530px; height: 156px;"></canvas>
																	<canvas class="rMateChartH5__LabelLayer" width="795"
																		height="234"
																		style="position: absolute; left: 31px; top: 10px; width: 530px; height: 156px;"></canvas>
																	<canvas class="rMateChartH5__UIElementEx" width="849"
																		height="309"
																		style="position: absolute; left: 0px; top: 0px; width: 566px; height: 206px;"></canvas>
																</div>
															</div>
														</div>
													</div>
												</div> <!-- [M 2021-12-15] div 추가 E -->

											</li>
										</ul>
									</dd>
								</dl>

								<dl>
									<dt>시간대별 유동인구</dt>

									<dd>
										<ul class="list_reportItem">
											<li class="summary"><strong id="flpopHourCoTop1">00
													~ 06시</strong> 유동인구가 가장 높아요.</li>

											<li class="detail">선택상권의 유동인구가 높은 시간대는 <strong>00
													~ 06시</strong>입니다.
											</li>

											<li class="graph">
												<!-- [M 2021-12-15] div 추가 S -->
												<div class="chartArea">
													<!-- [M 2021-12-15] 타이틀 추가 -->
													<p class="title">시간대별 유동인구 현황</p>
													<!-- [M 2021-12-15] div 추가 E -->
													<span class="unit" id="">단위 : 점포당 평균 비율(%)</span>

													<div class="area" id="flpopHourCo"
														style="width: 100%; height: 228px; position: static;">
														<div class="rMateChartH5__Root" id="chart_flpopHourCo"
															style="box-sizing: content-box; position: static; overflow: visible; width: 566px; height: 206px; padding: 15px 10px 5px; border-width: 1px; border-color: rgb(170, 179, 179); border-radius: 12px; border-style: none;">
															<div class="rMateChartH5__Main"
																style="box-sizing: content-box; position: static; width: 566px; height: 206px;">
																<div class="rMateChartH5__Chart"
																	style="box-sizing: content-box; float: left; position: relative; width: 566px; height: 206px;">
																	<canvas class="rMateChartH5__GridLines" width="787"
																		height="229"
																		style="position: absolute; left: 36px; top: 11px; width: 525px; height: 153px;"></canvas>
																	<canvas class="rMateChartH5__Axis2DRenderer"
																		width="834" height="294"
																		style="position: absolute; left: 5px; top: 5px; width: 556px; height: 196px;"></canvas>
																	<canvas class="rMateChartH5__Axis2DRenderer"
																		width="834" height="294"
																		style="position: absolute; left: 5px; top: 5px; width: 556px; height: 196px;"></canvas>
																	<canvas class="rMateChartH5__Area2DSeries" width="787"
																		height="229"
																		style="position: absolute; left: 36px; top: 11px; width: 525px; height: 153px;"></canvas>
																	<canvas class="rMateChartH5__LabelLayer" width="787"
																		height="229"
																		style="position: absolute; left: 36px; top: 11px; width: 525px; height: 153px;"></canvas>
																	<canvas class="rMateChartH5__UIElementEx" width="849"
																		height="309"
																		style="position: absolute; left: 0px; top: 0px; width: 566px; height: 206px;"></canvas>
																</div>
															</div>
														</div>
													</div>
												</div> <!-- [M 2021-12-15] div 추가 E -->

											</li>
										</ul>
									</dd>
								</dl>

								<dl>
									<dt>주거인구 수</dt>

									<dd>
										<ul class="list_reportItem">
											<li class="summary">주거인구는 <strong id="repopDnstCo_co">19,473명</strong>이고
												밀도는 <strong id="repopDnstCo_dnst">243명/㏊</strong> 입니다.
											</li>

											<li class="contrast">
												<p>
													<span>전년 동분기 대비</span> <strong class=""
														id="trdarTotRepopDnstCoYearDiff">0명</strong>
												</p>

												<p>
													<span>전분기 대비</span> <strong class=""
														id="trdarTotRepopDnstCoQuDiff">0명</strong>
												</p>
											</li>

											<li class="detail">선택상권은 전년에 비해 주거인구가 증가하고 있습니다. 경쟁
												업소출현을 경계하세요.</li>

											<li class="graph">
												<!-- [M 2021-12-15] div 추가 S -->
												<div class="chartArea" style="padding-bottom: 10px;">
													<!-- [M 2021-12-15] 타이틀 추가 -->
													<p class="title">주거인구 추이</p>
													<!-- [M 2021-12-15] div 추가 E -->
													<span class="unit">단위 : 1 ha당 명</span>

													<div class="area" id="repopDnstCo"
														style="width: 100%; height: 240px; position: static;">
														<div class="rMateChartH5__Root" id="chart_repopDnstCo"
															style="box-sizing: content-box; position: static; overflow: visible; width: 566px; height: 218px; padding: 15px 10px 5px; border-width: 1px; border-color: rgb(170, 179, 179); border-radius: 12px; border-style: none;">
															<div class="rMateChartH5__Main"
																style="box-sizing: content-box; width: 566px; height: 218px; position: static;">
																<div class="rMateChartH5__Box"
																	style="position: relative; float: left; overflow: visible; width: 566px; height: 218px; border-style: none; border-color: rgb(183, 186, 188); border-width: 1px;">
																	<div class="rMateChartH5__Chart"
																		style="box-sizing: content-box; float: none; position: relative; width: 566px; height: 191px; left: 0px; top: 0px;">
																		<canvas class="rMateChartH5__GridLines" width="786"
																			height="219"
																			style="position: absolute; left: 37px; top: 5px; width: 524px; height: 146px;"></canvas>
																		<canvas class="rMateChartH5__Axis2DRenderer"
																			width="834" height="279"
																			style="position: absolute; left: 5px; top: 0px; width: 556px; height: 186px;"></canvas>
																		<canvas class="rMateChartH5__Axis2DRenderer"
																			width="834" height="279"
																			style="position: absolute; left: 5px; top: 0px; width: 556px; height: 186px;"></canvas>
																		<canvas class="rMateChartH5__Line2DSeries" width="786"
																			height="219"
																			style="position: absolute; left: 37px; top: 5px; width: 524px; height: 146px;"></canvas>
																		<canvas class="rMateChartH5__Line2DSeries" width="786"
																			height="219"
																			style="position: absolute; left: 37px; top: 5px; width: 524px; height: 146px;"></canvas>
																		<canvas class="rMateChartH5__Line2DSeries" width="786"
																			height="219"
																			style="position: absolute; left: 37px; top: 5px; width: 524px; height: 146px;"></canvas>
																		<canvas class="rMateChartH5__LabelLayer" width="786"
																			height="219"
																			style="position: absolute; left: 37px; top: 5px; width: 524px; height: 146px;"></canvas>
																		<canvas class="rMateChartH5__LabelLayer" width="786"
																			height="219"
																			style="position: absolute; left: 37px; top: 5px; width: 524px; height: 146px;"></canvas>
																		<canvas class="rMateChartH5__LabelLayer" width="786"
																			height="219"
																			style="position: absolute; left: 37px; top: 5px; width: 524px; height: 146px;"></canvas>
																		<canvas class="rMateChartH5__UIElementEx" width="849"
																			height="286"
																			style="position: absolute; left: 0px; top: 0px; width: 566px; height: 191px;"></canvas>
																	</div>
																	<div class="rMateChartH5__LegendBox"
																		style="box-sizing: content-box; position: relative; overflow: hidden; float: none; width: 198.5px; height: 27px; left: 183.75px; top: 0px;">
																		<canvas class="rMateChartH5__LegendCanvas" height="0"
																			width="0"
																			style="position: absolute; visibility: hidden;"></canvas>
																		<div class="rMateChartH5__Legend"
																			style="box-sizing: content-box; position: absolute; left: 0px; top: 0px; width: 196px; height: 25px; border: 1px solid rgb(224, 224, 224); border-radius: 0px; background-color: rgb(247, 247, 247);">
																			<canvas class="rMateChartH5__Legend"
																				id="rMateChartH5__chart_repopDnstCo_Legend_0"
																				height="16" width="16"
																				style="position: absolute; width: 11px; height: 11px; left: 8px; top: 8.5px;"></canvas>
																			<div
																				class="rMateChartH5__chart_repopDnstCo_LegendLabelDiv"
																				id="LegendLabel_chart_repopDnstCo_0"
																				style="box-sizing: content-box; cursor: default; position: absolute; left: 27px; top: 7.5px; color: rgb(118, 118, 118); font: bold 10px arial; text-align: left; text-decoration: none;">선택상권</div>
																			<canvas class="rMateChartH5__Legend"
																				id="rMateChartH5__chart_repopDnstCo_Legend_1"
																				height="16" width="16"
																				style="position: absolute; width: 11px; height: 11px; left: 80.2px; top: 8.5px;"></canvas>
																			<div
																				class="rMateChartH5__chart_repopDnstCo_LegendLabelDiv"
																				id="LegendLabel_chart_repopDnstCo_1"
																				style="box-sizing: content-box; cursor: default; position: absolute; left: 99.2px; top: 7.5px; color: rgb(118, 118, 118); font: bold 10px arial; text-align: left; text-decoration: none;">자치구</div>
																			<canvas class="rMateChartH5__Legend"
																				id="rMateChartH5__chart_repopDnstCo_Legend_2"
																				height="16" width="16"
																				style="position: absolute; width: 11px; height: 11px; left: 142.85px; top: 8.5px;"></canvas>
																			<div
																				class="rMateChartH5__chart_repopDnstCo_LegendLabelDiv"
																				id="LegendLabel_chart_repopDnstCo_2"
																				style="box-sizing: content-box; cursor: default; position: absolute; left: 161.85px; top: 7.5px; color: rgb(118, 118, 118); font: bold 10px arial; text-align: left; text-decoration: none;">서울시</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div> <!-- [M 2021-12-15] div 추가 E -->
											</li>
										</ul>
									</dd>
								</dl>

								<dl>
									<dt>성별, 연령별 주거인구</dt>

									<dd>
										<ul class="list_reportItem">
											<li class="summary"><strong id="repopSexAgeTop">남성,
													60대 이상(17.2%)</strong> 주거인구가 가장 많아요.</li>

											<li class="graph">
												<!-- [M 2021-12-15] div 추가 S -->
												<div class="chartArea">
													<!-- [M 2021-12-15] 타이틀 추가 -->
													<p class="title">성별, 연령별 주거인구 현황</p>
													<!-- [M 2021-12-15] div 추가 E -->
													<span class="unit">단위 : %</span>

													<div class="area" id="repopSexAge"
														style="width: 100%; height: 228px; position: static;">
														<div class="rMateChartH5__Root" id="chart_repopSexAge"
															style="box-sizing: content-box; position: static; overflow: visible; width: 566px; height: 206px; padding: 15px 10px 5px; border-width: 1px; border-color: rgb(170, 179, 179); border-radius: 12px; border-style: none;">
															<div class="rMateChartH5__Main"
																style="box-sizing: content-box; width: 566px; height: 206px; position: static;">
																<div class="rMateChartH5__Box"
																	style="position: relative; float: left; overflow: visible; width: 566px; height: 206px; border-style: none; border-color: rgb(183, 186, 188); border-width: 1px;">
																	<div class="rMateChartH5__Chart"
																		style="box-sizing: content-box; float: none; position: relative; width: 566px; height: 179px; left: 0px; top: 0px;">
																		<canvas class="rMateChartH5__GridLines" width="795"
																			height="193"
																			style="position: absolute; left: 31px; top: 10px; width: 530px; height: 129px;"></canvas>
																		<canvas class="rMateChartH5__Axis2DRenderer"
																			width="834" height="253"
																			style="position: absolute; left: 5px; top: 5px; width: 556px; height: 169px;"></canvas>
																		<canvas class="rMateChartH5__Axis2DRenderer"
																			width="834" height="253"
																			style="position: absolute; left: 5px; top: 5px; width: 556px; height: 169px;"></canvas>
																		<canvas class="rMateChartH5__Column2DSeries"
																			width="795" height="193"
																			style="position: absolute; left: 31px; top: 10px; width: 530px; height: 129px;"></canvas>
																		<canvas class="rMateChartH5__Column2DSeries"
																			width="795" height="193"
																			style="position: absolute; left: 31px; top: 10px; width: 530px; height: 129px;"></canvas>
																		<canvas class="rMateChartH5__LabelLayer" width="795"
																			height="193"
																			style="position: absolute; left: 31px; top: 10px; width: 530px; height: 129px;"></canvas>
																		<canvas class="rMateChartH5__LabelLayer" width="795"
																			height="193"
																			style="position: absolute; left: 31px; top: 10px; width: 530px; height: 129px;"></canvas>
																		<canvas class="rMateChartH5__UIElementEx" width="849"
																			height="268"
																			style="position: absolute; left: 0px; top: 0px; width: 566px; height: 179px;"></canvas>
																	</div>
																	<div class="rMateChartH5__LegendBox"
																		style="box-sizing: content-box; position: relative; overflow: hidden; float: none; width: 107.2px; height: 27px; left: 229.4px; top: 0px;">
																		<canvas class="rMateChartH5__LegendCanvas" height="0"
																			width="0"
																			style="position: absolute; visibility: hidden;"></canvas>
																		<div class="rMateChartH5__Legend"
																			style="box-sizing: content-box; position: absolute; left: 0px; top: 0px; width: 105px; height: 25px; border: 1px solid rgb(224, 224, 224); border-radius: 0px; background-color: rgb(247, 247, 247);">
																			<canvas class="rMateChartH5__Legend"
																				id="rMateChartH5__chart_repopSexAge_Legend_0"
																				height="16" width="16"
																				style="position: absolute; width: 11px; height: 11px; left: 8px; top: 8.5px;"></canvas>
																			<div
																				class="rMateChartH5__chart_repopSexAge_LegendLabelDiv"
																				id="LegendLabel_chart_repopSexAge_0"
																				style="box-sizing: content-box; cursor: default; position: absolute; left: 27px; top: 7.5px; color: rgb(118, 118, 118); font: bold 10px arial; text-align: left; text-decoration: none;">남성</div>
																			<canvas class="rMateChartH5__Legend"
																				id="rMateChartH5__chart_repopSexAge_Legend_1"
																				height="16" width="16"
																				style="position: absolute; width: 11px; height: 11px; left: 61.1px; top: 8.5px;"></canvas>
																			<div
																				class="rMateChartH5__chart_repopSexAge_LegendLabelDiv"
																				id="LegendLabel_chart_repopSexAge_1"
																				style="box-sizing: content-box; cursor: default; position: absolute; left: 80.1px; top: 7.5px; color: rgb(118, 118, 118); font: bold 10px arial; text-align: left; text-decoration: none;">여성</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div> <!-- [M 2021-12-15] div 추가 E -->
											</li>
										</ul>
									</dd>
								</dl>

								<dl>
									<dt>직장인구 수</dt>

									<dd>
										<ul class="list_reportItem">
											<li class="summary">직장인구 수는 <strong id="wrcPopltnHa_co">1,064명</strong>이고
												밀도는 <strong id="wrcPopltnHa_dnst">13명/㏊</strong> 입니다.
											</li>

											<li class="contrast">
												<p>
													<span>전년 동분기 대비</span> <strong class=""
														id="trdarTotWrcPopltnHaYearDiff">0명</strong>
												</p>

												<p>
													<span>전분기 대비</span> <strong class=""
														id="trdarTotWrcPopltnHaQuDiff">0명</strong>
												</p>
											</li>

											<li class="detail"><strong>상계10동</strong>은 직장인구가 <strong>동일</strong>한
												지역입니다. 마케팅이 중요한 상권입니다.</li>

											<li class="graph">
												<!-- [M 2021-12-15] div 추가 S -->
												<div class="chartArea" style="padding-bottom: 10px;">
													<!-- [M 2021-12-15] 타이틀 추가 -->
													<p class="title">직장인구 추이</p>
													<!-- [M 2021-12-15] div 추가 E -->
													<span class="unit">단위 : 1 ha당 명</span>

													<div class="area" id="wrcPopltnHa"
														style="width: 100%; height: 240px; position: static;">
														<div class="rMateChartH5__Root" id="chart_wrcPopltnHa"
															style="box-sizing: content-box; position: static; overflow: visible; width: 566px; height: 218px; padding: 15px 10px 5px; border-width: 1px; border-color: rgb(170, 179, 179); border-radius: 12px; border-style: none;">
															<div class="rMateChartH5__Main"
																style="box-sizing: content-box; width: 566px; height: 218px; position: static;">
																<div class="rMateChartH5__Box"
																	style="position: relative; float: left; overflow: visible; width: 566px; height: 218px; border-style: none; border-color: rgb(183, 186, 188); border-width: 1px;">
																	<div class="rMateChartH5__Chart"
																		style="box-sizing: content-box; float: none; position: relative; width: 566px; height: 191px; left: 0px; top: 0px;">
																		<canvas class="rMateChartH5__GridLines" width="795"
																			height="219"
																			style="position: absolute; left: 31px; top: 5px; width: 530px; height: 146px;"></canvas>
																		<canvas class="rMateChartH5__Axis2DRenderer"
																			width="834" height="279"
																			style="position: absolute; left: 5px; top: 0px; width: 556px; height: 186px;"></canvas>
																		<canvas class="rMateChartH5__Axis2DRenderer"
																			width="834" height="279"
																			style="position: absolute; left: 5px; top: 0px; width: 556px; height: 186px;"></canvas>
																		<canvas class="rMateChartH5__Line2DSeries" width="795"
																			height="219"
																			style="position: absolute; left: 31px; top: 5px; width: 530px; height: 146px;"></canvas>
																		<canvas class="rMateChartH5__Line2DSeries" width="795"
																			height="219"
																			style="position: absolute; left: 31px; top: 5px; width: 530px; height: 146px;"></canvas>
																		<canvas class="rMateChartH5__Line2DSeries" width="795"
																			height="219"
																			style="position: absolute; left: 31px; top: 5px; width: 530px; height: 146px;"></canvas>
																		<canvas class="rMateChartH5__LabelLayer" width="795"
																			height="219"
																			style="position: absolute; left: 31px; top: 5px; width: 530px; height: 146px;"></canvas>
																		<canvas class="rMateChartH5__LabelLayer" width="795"
																			height="219"
																			style="position: absolute; left: 31px; top: 5px; width: 530px; height: 146px;"></canvas>
																		<canvas class="rMateChartH5__LabelLayer" width="795"
																			height="219"
																			style="position: absolute; left: 31px; top: 5px; width: 530px; height: 146px;"></canvas>
																		<canvas class="rMateChartH5__UIElementEx" width="849"
																			height="286"
																			style="position: absolute; left: 0px; top: 0px; width: 566px; height: 191px;"></canvas>
																	</div>
																	<div class="rMateChartH5__LegendBox"
																		style="box-sizing: content-box; position: relative; overflow: hidden; float: none; width: 198.5px; height: 27px; left: 183.75px; top: 0px;">
																		<canvas class="rMateChartH5__LegendCanvas" height="0"
																			width="0"
																			style="position: absolute; visibility: hidden;"></canvas>
																		<div class="rMateChartH5__Legend"
																			style="box-sizing: content-box; position: absolute; left: 0px; top: 0px; width: 196px; height: 25px; border: 1px solid rgb(224, 224, 224); border-radius: 0px; background-color: rgb(247, 247, 247);">
																			<canvas class="rMateChartH5__Legend"
																				id="rMateChartH5__chart_wrcPopltnHa_Legend_0"
																				height="16" width="16"
																				style="position: absolute; width: 11px; height: 11px; left: 8px; top: 8.5px;"></canvas>
																			<div
																				class="rMateChartH5__chart_wrcPopltnHa_LegendLabelDiv"
																				id="LegendLabel_chart_wrcPopltnHa_0"
																				style="box-sizing: content-box; cursor: default; position: absolute; left: 27px; top: 7.5px; color: rgb(118, 118, 118); font: bold 10px arial; text-align: left; text-decoration: none;">선택상권</div>
																			<canvas class="rMateChartH5__Legend"
																				id="rMateChartH5__chart_wrcPopltnHa_Legend_1"
																				height="16" width="16"
																				style="position: absolute; width: 11px; height: 11px; left: 80.2px; top: 8.5px;"></canvas>
																			<div
																				class="rMateChartH5__chart_wrcPopltnHa_LegendLabelDiv"
																				id="LegendLabel_chart_wrcPopltnHa_1"
																				style="box-sizing: content-box; cursor: default; position: absolute; left: 99.2px; top: 7.5px; color: rgb(118, 118, 118); font: bold 10px arial; text-align: left; text-decoration: none;">자치구</div>
																			<canvas class="rMateChartH5__Legend"
																				id="rMateChartH5__chart_wrcPopltnHa_Legend_2"
																				height="16" width="16"
																				style="position: absolute; width: 11px; height: 11px; left: 142.85px; top: 8.5px;"></canvas>
																			<div
																				class="rMateChartH5__chart_wrcPopltnHa_LegendLabelDiv"
																				id="LegendLabel_chart_wrcPopltnHa_2"
																				style="box-sizing: content-box; cursor: default; position: absolute; left: 161.85px; top: 7.5px; color: rgb(118, 118, 118); font: bold 10px arial; text-align: left; text-decoration: none;">서울시</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div> <!-- [M 2021-12-15] div 추가 E -->
											</li>
										</ul>
									</dd>
								</dl>

								<dl>
									<dt>성별, 연령별 직장인구</dt>

									<dd>
										<ul class="list_reportItem">
											<li class="summary"><strong id="wrcPopltnSexAgeTop">여성,
													40대(16.3%)</strong> 직장인구가 가장 많아요.</li>

											<li class="graph">
												<!-- [M 2021-12-15] div 추가 S -->
												<div class="chartArea">
													<!-- [M 2021-12-15] 타이틀 추가 -->
													<p class="title">성별, 연령별 직장인구 현황</p>
													<!-- [M 2021-12-15] div 추가 E -->
													<span class="unit">단위 : %</span>

													<div class="area" id="wrcPopltnSexAge"
														style="width: 100%; height: 228px; position: static;">
														<div class="rMateChartH5__Root" id="chart_wrcPopltnSexAge"
															style="box-sizing: content-box; position: static; overflow: visible; width: 566px; height: 206px; padding: 15px 10px 5px; border-width: 1px; border-color: rgb(170, 179, 179); border-radius: 12px; border-style: none;">
															<div class="rMateChartH5__Main"
																style="box-sizing: content-box; width: 566px; height: 206px; position: static;">
																<div class="rMateChartH5__Box"
																	style="position: relative; float: left; overflow: visible; width: 566px; height: 206px; border-style: none; border-color: rgb(183, 186, 188); border-width: 1px;">
																	<div class="rMateChartH5__Chart"
																		style="box-sizing: content-box; float: none; position: relative; width: 566px; height: 179px; left: 0px; top: 0px;">
																		<canvas class="rMateChartH5__GridLines" width="795"
																			height="193"
																			style="position: absolute; left: 31px; top: 10px; width: 530px; height: 129px;"></canvas>
																		<canvas class="rMateChartH5__Axis2DRenderer"
																			width="834" height="253"
																			style="position: absolute; left: 5px; top: 5px; width: 556px; height: 169px;"></canvas>
																		<canvas class="rMateChartH5__Axis2DRenderer"
																			width="834" height="253"
																			style="position: absolute; left: 5px; top: 5px; width: 556px; height: 169px;"></canvas>
																		<canvas class="rMateChartH5__Column2DSeries"
																			width="795" height="193"
																			style="position: absolute; left: 31px; top: 10px; width: 530px; height: 129px;"></canvas>
																		<canvas class="rMateChartH5__Column2DSeries"
																			width="795" height="193"
																			style="position: absolute; left: 31px; top: 10px; width: 530px; height: 129px;"></canvas>
																		<canvas class="rMateChartH5__LabelLayer" width="795"
																			height="193"
																			style="position: absolute; left: 31px; top: 10px; width: 530px; height: 129px;"></canvas>
																		<canvas class="rMateChartH5__LabelLayer" width="795"
																			height="193"
																			style="position: absolute; left: 31px; top: 10px; width: 530px; height: 129px;"></canvas>
																		<canvas class="rMateChartH5__UIElementEx" width="849"
																			height="268"
																			style="position: absolute; left: 0px; top: 0px; width: 566px; height: 179px;"></canvas>
																	</div>
																	<div class="rMateChartH5__LegendBox"
																		style="box-sizing: content-box; position: relative; overflow: hidden; float: none; width: 107.2px; height: 27px; left: 229.4px; top: 0px;">
																		<canvas class="rMateChartH5__LegendCanvas" height="0"
																			width="0"
																			style="position: absolute; visibility: hidden;"></canvas>
																		<div class="rMateChartH5__Legend"
																			style="box-sizing: content-box; position: absolute; left: 0px; top: 0px; width: 105px; height: 25px; border: 1px solid rgb(224, 224, 224); border-radius: 0px; background-color: rgb(247, 247, 247);">
																			<canvas class="rMateChartH5__Legend"
																				id="rMateChartH5__chart_wrcPopltnSexAge_Legend_0"
																				height="16" width="16"
																				style="position: absolute; width: 11px; height: 11px; left: 8px; top: 8.5px;"></canvas>
																			<div
																				class="rMateChartH5__chart_wrcPopltnSexAge_LegendLabelDiv"
																				id="LegendLabel_chart_wrcPopltnSexAge_0"
																				style="box-sizing: content-box; cursor: default; position: absolute; left: 27px; top: 7.5px; color: rgb(118, 118, 118); font: bold 10px arial; text-align: left; text-decoration: none;">남성</div>
																			<canvas class="rMateChartH5__Legend"
																				id="rMateChartH5__chart_wrcPopltnSexAge_Legend_1"
																				height="16" width="16"
																				style="position: absolute; width: 11px; height: 11px; left: 61.1px; top: 8.5px;"></canvas>
																			<div
																				class="rMateChartH5__chart_wrcPopltnSexAge_LegendLabelDiv"
																				id="LegendLabel_chart_wrcPopltnSexAge_1"
																				style="box-sizing: content-box; cursor: default; position: absolute; left: 80.1px; top: 7.5px; color: rgb(118, 118, 118); font: bold 10px arial; text-align: left; text-decoration: none;">여성</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div> <!-- [M 2021-12-15] div 추가 E -->
											</li>
										</ul>
									</dd>
								</dl>
							</div>

							<div class="tabcnt_common2 tabcnt_area">
								<dl>
									<dt>가구세대 수</dt>

									<dd>
										<ul class="list_reportItem">
											<li class="summary">가구세대 수 <strong id="aptHshldCo_co">8,443가구</strong>
												입니다.
											</li>

											<li class="contrast">
												<p>
													<span>전년 동분기 대비</span> <strong class="increase"
														id="trdarTotAptHshldCoYearDiff">1,360가구</strong>
												</p>

												<p>
													<span>전분기 대비</span> <strong class=""
														id="trdarTotAptHshldCoQuDiff">0가구</strong>
												</p>
											</li>

											<li class="detail"><strong>상계10동</strong>은 가구세대가 전년대비 <strong>증가</strong>하고
												있고, 아파트가구가 일반가구보다 (%P3)습니다.</li>

											<li class="graph">
												<!-- [M 2021-12-15] div 추가 S -->
												<div class="chartArea" style="padding-bottom: 10px;">
													<!-- [M 2021-12-15] 타이틀 추가 -->
													<p class="title">가구세대 수 추이</p>
													<!-- [M 2021-12-15] div 추가 E -->
													<span class="unit">단위 : 가구</span>

													<div class="area" id="aptHshldCo"
														style="width: 100%; height: 240px; position: static;">
														<div class="rMateChartH5__Root" id="chart_aptHshldCo"
															style="box-sizing: content-box; position: static; overflow: visible; width: 566px; height: 218px; padding: 15px 10px 5px; border-width: 1px; border-color: rgb(170, 179, 179); border-radius: 12px; border-style: none;">
															<div class="rMateChartH5__Main"
																style="box-sizing: content-box; width: 566px; height: 218px; position: static;">
																<div class="rMateChartH5__Box"
																	style="position: relative; float: left; overflow: visible; width: 566px; height: 218px; border-style: none; border-color: rgb(183, 186, 188); border-width: 1px;">
																	<div class="rMateChartH5__Chart"
																		style="box-sizing: content-box; float: none; position: relative; width: 566px; height: 191px; left: 0px; top: 0px;">
																		<canvas class="rMateChartH5__GridLines" width="757"
																			height="219"
																			style="position: absolute; left: 56px; top: 5px; width: 505px; height: 146px;"></canvas>
																		<canvas class="rMateChartH5__Axis2DRenderer"
																			width="834" height="279"
																			style="position: absolute; left: 5px; top: 0px; width: 556px; height: 186px;"></canvas>
																		<canvas class="rMateChartH5__Axis2DRenderer"
																			width="834" height="279"
																			style="position: absolute; left: 5px; top: 0px; width: 556px; height: 186px;"></canvas>
																		<canvas class="rMateChartH5__Line2DSeries" width="757"
																			height="219"
																			style="position: absolute; left: 56px; top: 5px; width: 505px; height: 146px;"></canvas>
																		<canvas class="rMateChartH5__Line2DSeries" width="757"
																			height="219"
																			style="position: absolute; left: 56px; top: 5px; width: 505px; height: 146px;"></canvas>
																		<canvas class="rMateChartH5__LabelLayer" width="757"
																			height="219"
																			style="position: absolute; left: 56px; top: 5px; width: 505px; height: 146px;"></canvas>
																		<canvas class="rMateChartH5__LabelLayer" width="757"
																			height="219"
																			style="position: absolute; left: 56px; top: 5px; width: 505px; height: 146px;"></canvas>
																		<canvas class="rMateChartH5__UIElementEx" width="849"
																			height="286"
																			style="position: absolute; left: 0px; top: 0px; width: 566px; height: 191px;"></canvas>
																	</div>
																	<div class="rMateChartH5__LegendBox"
																		style="box-sizing: content-box; position: relative; overflow: hidden; float: none; width: 135.85px; height: 27px; left: 215.075px; top: 0px;">
																		<canvas class="rMateChartH5__LegendCanvas" height="0"
																			width="0"
																			style="position: absolute; visibility: hidden;"></canvas>
																		<div class="rMateChartH5__Legend"
																			style="box-sizing: content-box; position: absolute; left: 0px; top: 0px; width: 133px; height: 25px; border: 1px solid rgb(224, 224, 224); border-radius: 0px; background-color: rgb(247, 247, 247);">
																			<canvas class="rMateChartH5__Legend"
																				id="rMateChartH5__chart_aptHshldCo_Legend_0"
																				height="16" width="16"
																				style="position: absolute; width: 11px; height: 11px; left: 8px; top: 8.5px;"></canvas>
																			<div
																				class="rMateChartH5__chart_aptHshldCo_LegendLabelDiv"
																				id="LegendLabel_chart_aptHshldCo_0"
																				style="box-sizing: content-box; cursor: default; position: absolute; left: 27px; top: 7.5px; color: rgb(118, 118, 118); font: bold 10px arial; text-align: left; text-decoration: none;">선택상권</div>
																			<canvas class="rMateChartH5__Legend"
																				id="rMateChartH5__chart_aptHshldCo_Legend_1"
																				height="16" width="16"
																				style="position: absolute; width: 11px; height: 11px; left: 80.2px; top: 8.5px;"></canvas>
																			<div
																				class="rMateChartH5__chart_aptHshldCo_LegendLabelDiv"
																				id="LegendLabel_chart_aptHshldCo_1"
																				style="box-sizing: content-box; cursor: default; position: absolute; left: 99.2px; top: 7.5px; color: rgb(118, 118, 118); font: bold 10px arial; text-align: left; text-decoration: none;">자치구</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div> <!-- [M 2021-12-15] div 추가 E -->
											</li>
										</ul>
									</dd>
								</dl>

								<dl>
									<dt>아파트 현황</dt>
									<dd>
										<ul class="list_reportItem">
											<li class="summary"><strong id="aeSqmt_area">66㎡
													미만</strong> 아파트가 가장 많으며 <strong id="aeSqmt_prc"></strong> 세대가 많습니다.</li>

											<li class="detail"></li>
											<li class="graph">
												<!-- [M 2021-12-15] div 추가 S -->
												<div class="chartArea" style="padding-bottom: 10px;">
													<!-- [M 2021-12-15] 타이틀 추가 -->
													<p class="title">아파트 세대 현황</p>
													<!-- [M 2021-12-15] div 추가 E -->
													<span class="unit">단위 : 가구</span>

													<div class="area" id="aeSqmt"
														style="width: 100%; height: 240px; position: static;">
														<div class="rMateChartH5__Root" id="chart_aeSqmt"
															style="box-sizing: content-box; position: static; overflow: visible; width: 566px; height: 218px; padding: 15px 10px 5px; border-width: 1px; border-color: rgb(170, 179, 179); border-radius: 12px; border-style: none;">
															<div class="rMateChartH5__Main"
																style="box-sizing: content-box; width: 566px; height: 218px; position: static;">
																<div class="rMateChartH5__Box"
																	style="position: relative; float: left; overflow: visible; width: 566px; height: 218px; border-style: none; border-color: rgb(183, 186, 188); border-width: 1px;">
																	<div class="rMateChartH5__Chart"
																		style="box-sizing: content-box; float: none; position: relative; width: 566px; height: 191px; left: 0px; top: 0px;">
																		<canvas class="rMateChartH5__GridLines" width="757"
																			height="211"
																			style="position: absolute; left: 56px; top: 10px; width: 505px; height: 141px;"></canvas>
																		<canvas class="rMateChartH5__Axis2DRenderer"
																			width="834" height="271"
																			style="position: absolute; left: 5px; top: 5px; width: 556px; height: 181px;"></canvas>
																		<canvas class="rMateChartH5__Axis2DRenderer"
																			width="834" height="271"
																			style="position: absolute; left: 5px; top: 5px; width: 556px; height: 181px;"></canvas>
																		<canvas class="rMateChartH5__Column2DSeries"
																			width="757" height="211"
																			style="position: absolute; left: 56px; top: 10px; width: 505px; height: 141px;"></canvas>
																		<canvas class="rMateChartH5__Column2DSeries"
																			width="757" height="211"
																			style="position: absolute; left: 56px; top: 10px; width: 505px; height: 141px;"></canvas>
																		<canvas class="rMateChartH5__LabelLayer" width="757"
																			height="211"
																			style="position: absolute; left: 56px; top: 10px; width: 505px; height: 141px;"></canvas>
																		<canvas class="rMateChartH5__LabelLayer" width="757"
																			height="211"
																			style="position: absolute; left: 56px; top: 10px; width: 505px; height: 141px;"></canvas>
																		<canvas class="rMateChartH5__UIElementEx" width="849"
																			height="286"
																			style="position: absolute; left: 0px; top: 0px; width: 566px; height: 191px;"></canvas>
																	</div>
																	<div class="rMateChartH5__LegendBox"
																		style="box-sizing: content-box; position: relative; overflow: hidden; float: none; width: 135.85px; height: 27px; left: 215.075px; top: 0px;">
																		<canvas class="rMateChartH5__LegendCanvas" height="0"
																			width="0"
																			style="position: absolute; visibility: hidden;"></canvas>
																		<div class="rMateChartH5__Legend"
																			style="box-sizing: content-box; position: absolute; left: 0px; top: 0px; width: 133px; height: 25px; border: 1px solid rgb(224, 224, 224); border-radius: 0px; background-color: rgb(247, 247, 247);">
																			<canvas class="rMateChartH5__Legend"
																				id="rMateChartH5__chart_aeSqmt_Legend_0" height="16"
																				width="16"
																				style="position: absolute; width: 11px; height: 11px; left: 8px; top: 8.5px;"></canvas>
																			<div
																				class="rMateChartH5__chart_aeSqmt_LegendLabelDiv"
																				id="LegendLabel_chart_aeSqmt_0"
																				style="box-sizing: content-box; cursor: default; position: absolute; left: 27px; top: 7.5px; color: rgb(118, 118, 118); font: bold 10px arial; text-align: left; text-decoration: none;">선택상권</div>
																			<canvas class="rMateChartH5__Legend"
																				id="rMateChartH5__chart_aeSqmt_Legend_1" height="16"
																				width="16"
																				style="position: absolute; width: 11px; height: 11px; left: 80.2px; top: 8.5px;"></canvas>
																			<div
																				class="rMateChartH5__chart_aeSqmt_LegendLabelDiv"
																				id="LegendLabel_chart_aeSqmt_1"
																				style="box-sizing: content-box; cursor: default; position: absolute; left: 99.2px; top: 7.5px; color: rgb(118, 118, 118); font: bold 10px arial; text-align: left; text-decoration: none;">노원구</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div> <!-- [M 2021-12-15] div 추가 E -->
											</li>
											<li class="graph">
												<!-- [M 2021-12-15] div 추가 S -->
												<div class="chartArea" style="padding-bottom: 10px;">
													<!-- [M 2021-12-15] 타이틀 추가 -->
													<p class="title">아파트 가격대 현황</p>
													<!-- [M 2021-12-15] div 추가 E -->
													<span class="unit">단위 : %</span>

													<div class="area" id="aptPrc"
														style="width: 100%; height: 240px; position: static;">
														<div class="rMateChartH5__Root" id="chart_aptPrc"
															style="box-sizing: content-box; position: static; overflow: visible; width: 566px; height: 218px; padding: 15px 10px 5px; border-width: 1px; border-color: rgb(170, 179, 179); border-radius: 12px; border-style: none;">
															<div class="rMateChartH5__Main"
																style="box-sizing: content-box; width: 566px; height: 218px; position: static;">
																<div class="rMateChartH5__Box"
																	style="position: relative; float: left; overflow: visible; width: 566px; height: 218px; border-style: none; border-color: rgb(183, 186, 188); border-width: 1px;">
																	<div class="rMateChartH5__Chart"
																		style="box-sizing: content-box; float: none; position: relative; width: 566px; height: 191px; left: 0px; top: 0px;">
																		<canvas class="rMateChartH5__GridLines" width="795"
																			height="211"
																			style="position: absolute; left: 31px; top: 10px; width: 530px; height: 141px;"></canvas>
																		<canvas class="rMateChartH5__Axis2DRenderer"
																			width="834" height="271"
																			style="position: absolute; left: 5px; top: 5px; width: 556px; height: 181px;"></canvas>
																		<canvas class="rMateChartH5__Axis2DRenderer"
																			width="834" height="271"
																			style="position: absolute; left: 5px; top: 5px; width: 556px; height: 181px;"></canvas>
																		<canvas class="rMateChartH5__Column2DSeries"
																			width="795" height="211"
																			style="position: absolute; left: 31px; top: 10px; width: 530px; height: 141px;"></canvas>
																		<canvas class="rMateChartH5__Column2DSeries"
																			width="795" height="211"
																			style="position: absolute; left: 31px; top: 10px; width: 530px; height: 141px;"></canvas>
																		<canvas class="rMateChartH5__LabelLayer" width="795"
																			height="211"
																			style="position: absolute; left: 31px; top: 10px; width: 530px; height: 141px;"></canvas>
																		<canvas class="rMateChartH5__LabelLayer" width="795"
																			height="211"
																			style="position: absolute; left: 31px; top: 10px; width: 530px; height: 141px;"></canvas>
																		<canvas class="rMateChartH5__UIElementEx" width="849"
																			height="286"
																			style="position: absolute; left: 0px; top: 0px; width: 566px; height: 191px;"></canvas>
																	</div>
																	<div class="rMateChartH5__LegendBox"
																		style="box-sizing: content-box; position: relative; overflow: hidden; float: none; width: 135.85px; height: 27px; left: 215.075px; top: 0px;">
																		<canvas class="rMateChartH5__LegendCanvas" height="0"
																			width="0"
																			style="position: absolute; visibility: hidden;"></canvas>
																		<div class="rMateChartH5__Legend"
																			style="box-sizing: content-box; position: absolute; left: 0px; top: 0px; width: 133px; height: 25px; border: 1px solid rgb(224, 224, 224); border-radius: 0px; background-color: rgb(247, 247, 247);">
																			<canvas class="rMateChartH5__Legend"
																				id="rMateChartH5__chart_aptPrc_Legend_0" height="16"
																				width="16"
																				style="position: absolute; width: 11px; height: 11px; left: 8px; top: 8.5px;"></canvas>
																			<div
																				class="rMateChartH5__chart_aptPrc_LegendLabelDiv"
																				id="LegendLabel_chart_aptPrc_0"
																				style="box-sizing: content-box; cursor: default; position: absolute; left: 27px; top: 7.5px; color: rgb(118, 118, 118); font: bold 10px arial; text-align: left; text-decoration: none;">선택상권</div>
																			<canvas class="rMateChartH5__Legend"
																				id="rMateChartH5__chart_aptPrc_Legend_1" height="16"
																				width="16"
																				style="position: absolute; width: 11px; height: 11px; left: 80.2px; top: 8.5px;"></canvas>
																			<div
																				class="rMateChartH5__chart_aptPrc_LegendLabelDiv"
																				id="LegendLabel_chart_aptPrc_1"
																				style="box-sizing: content-box; cursor: default; position: absolute; left: 99.2px; top: 7.5px; color: rgb(118, 118, 118); font: bold 10px arial; text-align: left; text-decoration: none;">노원구</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div> <!-- [M 2021-12-15] div 추가 E -->
											</li>
										</ul>
									</dd>
								</dl>

								<dl>
									<dt>주요 시설, 집객시설 현황</dt>

									<dd>
										<ul class="list_reportItem">
											<li class="summary">선택상권은 <strong id="blckFcltyTop1">관공서</strong>
												비율이 가장 많습니다.
											</li>

											<li class="detail">선택상권은 <strong>관공서</strong>비율이 가장
												높습니다. 주요시설은 관공서(이)가 있습니다.
											</li>

											<li class="graph">
												<!-- [M 2021-12-15] div 추가 S -->
												<div class="chartArea">
													<!-- [M 2021-12-15] 타이틀 추가 -->
													<p class="title">주요 시설, 집객시설 현황</p>
													<!-- [M 2021-12-15] div 추가 E -->
													<span class="unit">단위 : 개</span>

													<div class="area" id="blckFclty"
														style="width: 100%; height: 228px; position: static;">
														<div class="rMateChartH5__Root" id="chart_blckFclty"
															style="box-sizing: content-box; position: static; overflow: visible; width: 566px; height: 206px; padding: 15px 10px 5px; border-width: 1px; border-color: rgb(170, 179, 179); border-radius: 12px; border-style: none;">
															<div class="rMateChartH5__Main"
																style="box-sizing: content-box; position: static; width: 566px; height: 206px;">
																<div class="rMateChartH5__Chart"
																	style="box-sizing: content-box; float: left; position: relative; width: 566px; height: 206px;">
																	<canvas class="rMateChartH5__GridLines" width="792"
																		height="234"
																		style="position: absolute; left: 33px; top: 10px; width: 528px; height: 156px;"></canvas>
																	<canvas class="rMateChartH5__Axis2DRenderer"
																		width="834" height="294"
																		style="position: absolute; left: 5px; top: 5px; width: 556px; height: 196px;"></canvas>
																	<canvas class="rMateChartH5__Axis2DRenderer"
																		width="834" height="294"
																		style="position: absolute; left: 5px; top: 5px; width: 556px; height: 196px;"></canvas>
																	<canvas class="rMateChartH5__Column2DSeries"
																		width="792" height="234"
																		style="position: absolute; left: 33px; top: 10px; width: 528px; height: 156px;"></canvas>
																	<canvas class="rMateChartH5__LabelLayer" width="792"
																		height="234"
																		style="position: absolute; left: 33px; top: 10px; width: 528px; height: 156px;"></canvas>
																	<canvas class="rMateChartH5__UIElementEx" width="849"
																		height="309"
																		style="position: absolute; left: 0px; top: 0px; width: 566px; height: 206px;"></canvas>
																</div>
															</div>
														</div>
													</div>
												</div> <!-- [M 2021-12-15] div 추가 E -->
											</li>

											<li class="table">
												<table>
													<caption>자치구 현황</caption>
													<colgroup>
														<col style="width: 25%;">
														<col style="width: 25%;">
														<col style="width: 25%;">
														<col style="width: 25%;">
													</colgroup>

													<tbody>
														<tr>
															<th scope="row">관공서</th>
															<td id="offices">3</td>

															<th scope="row">유통점</th>
															<td id="distributor">0</td>
														</tr>

														<tr>
															<th scope="row">금융기관</th>
															<td id="financial">0</td>

															<th scope="row">영화/공연</th>
															<td id="theater">0</td>
														</tr>

														<tr>
															<th scope="row">병원</th>
															<td id="hospital">0</td>

															<th scope="row">숙박</th>
															<td id="accommodation">0</td>
														</tr>

														<tr>
															<th scope="row">학교</th>
															<td id="school">0</td>

															<th scope="row">교통시설</th>
															<td id="facilities">0</td>
														</tr>
													</tbody>
												</table>
											</li>
										</ul>
									</dd>
								</dl>

								<dl>
									<dt>소득수준</dt>
									<dd>
										<ul class="list_reportItem">
											<li class="summary">소득수준은 <strong id="trdarIncomeSctnCd">07분위</strong>입니다.
											</li>

											<li class="detail">선택상권 주거인구의 소득수준은 <strong>7분위(2,983,559~3,741,082원)</strong>로
												서울시 평균 <strong>7분위(2,983,559~3,741,082원)</strong>보다 많습니다.
												적절한 상품가격 책정 등에 유의하세요.
											</li>

											<li class="graph">
												<!-- [M 2021-12-15] div 추가 S -->
												<div class="chartArea">
													<!-- [M 2021-12-15] 타이틀 추가 -->
													<p class="title">소득수준 현황</p>
													<!-- [M 2021-12-15] div 추가 E -->
													<span class="unit">단위 : 분위</span>

													<div class="area" id="incomeSctnCd"
														style="width: 100%; height: 228px; position: static;">
														<div class="rMateChartH5__Root" id="chart_incomeSctnCd"
															style="box-sizing: content-box; position: static; overflow: visible; width: 566px; height: 206px; padding: 15px 10px 5px; border-width: 1px; border-color: rgb(170, 179, 179); border-radius: 12px; border-style: none;">
															<div class="rMateChartH5__Main"
																style="box-sizing: content-box; position: static; width: 566px; height: 206px;">
																<div class="rMateChartH5__Chart"
																	style="box-sizing: content-box; float: left; position: relative; width: 566px; height: 206px;">
																	<canvas class="rMateChartH5__GridLines" width="804"
																		height="234"
																		style="position: absolute; left: 25px; top: 10px; width: 536px; height: 156px;"></canvas>
																	<canvas class="rMateChartH5__Axis2DRenderer"
																		width="834" height="294"
																		style="position: absolute; left: 5px; top: 5px; width: 556px; height: 196px;"></canvas>
																	<canvas class="rMateChartH5__Axis2DRenderer"
																		width="834" height="294"
																		style="position: absolute; left: 5px; top: 5px; width: 556px; height: 196px;"></canvas>
																	<canvas class="rMateChartH5__Column2DSeries"
																		width="804" height="234"
																		style="position: absolute; left: 25px; top: 10px; width: 536px; height: 156px;"></canvas>
																	<canvas class="rMateChartH5__LabelLayer" width="804"
																		height="234"
																		style="position: absolute; left: 25px; top: 10px; width: 536px; height: 156px;"></canvas>
																	<canvas class="rMateChartH5__UIElementEx" width="849"
																		height="309"
																		style="position: absolute; left: 0px; top: 0px; width: 566px; height: 206px;"></canvas>
																</div>
															</div>
														</div>
													</div>
												</div> <!-- [M 2021-12-15] div 추가 E -->
											</li>

											<li class="table">
												<table>
													<caption>서울시 현황</caption>
													<colgroup>
														<col style="width: 25%;">
														<col style="width: 75%;">
													</colgroup>

													<tbody>
														<tr>
															<th scope="row">선택상권</th>
															<td id="trdarSctmCdNm">7분위:2,983,559~3,741,082원</td>
														</tr>

														<tr>
															<th scope="row">행정동</th>
															<td id="adstrdSctmCdNm">7분위:2,983,559~3,741,082원</td>
														</tr>

														<tr>
															<th scope="row">자치구</th>
															<td id="signguSctmCdNm">7분위:2,983,559~3,741,082원</td>
														</tr>

														<tr>
															<th scope="row">서울시</th>
															<td id="megaSctmCdNm">7분위:2,983,559~3,741,082원</td>
														</tr>
													</tbody>
												</table>
											</li>
										</ul>
									</dd>
								</dl>

								<dl>
									<dt>소비트렌드</dt>
									<dd>
										<ul class="list_reportItem">
											<li class="summary">선택상권은 <strong id="expndtrTop1">음식</strong>
												비율이 가장 많습니다.
											</li>

											<li class="detail">선택상권은 <strong>음식</strong>소비가 가장 높은
												지역입니다. <strong>음식</strong>에 대한 경쟁업소를 파악하시기 바랍니다.
											</li>

											<li class="graph">
												<!-- [M 2021-12-15] div 추가 S -->
												<div class="chartArea">
													<!-- [M 2021-12-15] 타이틀 추가 -->
													<p class="title">소비트렌드 현황</p>
													<!-- [M 2021-12-15] div 추가 E -->
													<span class="unit">단위 : %</span>

													<div class="area" id="expndtr"
														style="width: 100%; height: 228px; position: static;">
														<div class="rMateChartH5__Root" id="chart_expndtr"
															style="box-sizing: content-box; position: static; overflow: visible; width: 566px; height: 206px; padding: 15px 10px 5px; border-width: 1px; border-color: rgb(170, 179, 179); border-radius: 12px; border-style: none;">
															<div class="rMateChartH5__Main"
																style="box-sizing: content-box; width: 566px; height: 206px; position: static;">
																<div class="rMateChartH5__Box"
																	style="position: relative; float: left; overflow: visible; width: 566px; height: 206px; border-style: none; border-color: rgb(183, 186, 188); border-width: 1px;">
																	<div class="rMateChartH5__Chart"
																		style="box-sizing: content-box; float: none; position: relative; width: 566px; height: 179px; left: 0px; top: 0px;">
																		<canvas class="rMateChartH5__AngularAxisRenderer"
																			width="834" height="253"
																			style="position: absolute; left: 5px; top: 5px; width: 556px; height: 169px;"></canvas>
																		<canvas class="rMateChartH5__Pie2DSeries" width="834"
																			height="253"
																			style="position: absolute; left: 5px; top: 5px; width: 556px; height: 169px;"></canvas>
																		<canvas class="rMateChartH5__LabelLayer" width="834"
																			height="253"
																			style="position: absolute; left: 5px; top: 5px; width: 556px; height: 169px;"></canvas>
																		<canvas class="rMateChartH5__UIElementEx" width="849"
																			height="268"
																			style="position: absolute; left: 0px; top: 0px; width: 566px; height: 179px;"></canvas>
																	</div>
																	<div class="rMateChartH5__LegendBox"
																		style="box-sizing: content-box; position: relative; overflow: hidden; float: none; width: 507.55px; height: 27px; left: 29.225px; top: 0px;">
																		<canvas class="rMateChartH5__LegendCanvas" height="0"
																			width="0"
																			style="position: absolute; visibility: hidden;"></canvas>
																		<div class="rMateChartH5__Legend"
																			style="box-sizing: content-box; position: absolute; left: 0px; top: 0px; width: 505px; height: 25px; border: 1px solid rgb(224, 224, 224); border-radius: 0px; background-color: rgb(247, 247, 247);">
																			<canvas class="rMateChartH5__Legend"
																				id="rMateChartH5__chart_expndtr_Legend_0"
																				height="16" width="16"
																				style="position: absolute; width: 11px; height: 11px; left: 8px; top: 8.5px;"></canvas>
																			<div
																				class="rMateChartH5__chart_expndtr_LegendLabelDiv"
																				id="LegendLabel_chart_expndtr_0"
																				style="box-sizing: content-box; cursor: default; position: absolute; left: 27px; top: 7.5px; color: rgb(118, 118, 118); font: bold 10px arial; text-align: left; text-decoration: none;">음식</div>
																			<canvas class="rMateChartH5__Legend"
																				id="rMateChartH5__chart_expndtr_Legend_1"
																				height="16" width="16"
																				style="position: absolute; width: 11px; height: 11px; left: 61.1px; top: 8.5px;"></canvas>
																			<div
																				class="rMateChartH5__chart_expndtr_LegendLabelDiv"
																				id="LegendLabel_chart_expndtr_1"
																				style="box-sizing: content-box; cursor: default; position: absolute; left: 80.1px; top: 7.5px; color: rgb(118, 118, 118); font: bold 10px arial; text-align: left; text-decoration: none;">의류</div>
																			<canvas class="rMateChartH5__Legend"
																				id="rMateChartH5__chart_expndtr_Legend_2"
																				height="16" width="16"
																				style="position: absolute; width: 11px; height: 11px; left: 114.2px; top: 8.5px;"></canvas>
																			<div
																				class="rMateChartH5__chart_expndtr_LegendLabelDiv"
																				id="LegendLabel_chart_expndtr_2"
																				style="box-sizing: content-box; cursor: default; position: absolute; left: 133.2px; top: 7.5px; color: rgb(118, 118, 118); font: bold 10px arial; text-align: left; text-decoration: none;">생활용품</div>
																			<canvas class="rMateChartH5__Legend"
																				id="rMateChartH5__chart_expndtr_Legend_3"
																				height="16" width="16"
																				style="position: absolute; width: 11px; height: 11px; left: 186.4px; top: 8.5px;"></canvas>
																			<div
																				class="rMateChartH5__chart_expndtr_LegendLabelDiv"
																				id="LegendLabel_chart_expndtr_3"
																				style="box-sizing: content-box; cursor: default; position: absolute; left: 205.4px; top: 7.5px; color: rgb(118, 118, 118); font: bold 10px arial; text-align: left; text-decoration: none;">의료비</div>
																			<canvas class="rMateChartH5__Legend"
																				id="rMateChartH5__chart_expndtr_Legend_4"
																				height="16" width="16"
																				style="position: absolute; width: 11px; height: 11px; left: 249.05px; top: 8.5px;"></canvas>
																			<div
																				class="rMateChartH5__chart_expndtr_LegendLabelDiv"
																				id="LegendLabel_chart_expndtr_4"
																				style="box-sizing: content-box; cursor: default; position: absolute; left: 268.05px; top: 7.5px; color: rgb(118, 118, 118); font: bold 10px arial; text-align: left; text-decoration: none;">교통</div>
																			<canvas class="rMateChartH5__Legend"
																				id="rMateChartH5__chart_expndtr_Legend_5"
																				height="16" width="16"
																				style="position: absolute; width: 11px; height: 11px; left: 302.15px; top: 8.5px;"></canvas>
																			<div
																				class="rMateChartH5__chart_expndtr_LegendLabelDiv"
																				id="LegendLabel_chart_expndtr_5"
																				style="box-sizing: content-box; cursor: default; position: absolute; left: 321.15px; top: 7.5px; color: rgb(118, 118, 118); font: bold 10px arial; text-align: left; text-decoration: none;">여가</div>
																			<canvas class="rMateChartH5__Legend"
																				id="rMateChartH5__chart_expndtr_Legend_6"
																				height="16" width="16"
																				style="position: absolute; width: 11px; height: 11px; left: 355.25px; top: 8.5px;"></canvas>
																			<div
																				class="rMateChartH5__chart_expndtr_LegendLabelDiv"
																				id="LegendLabel_chart_expndtr_6"
																				style="box-sizing: content-box; cursor: default; position: absolute; left: 374.25px; top: 7.5px; color: rgb(118, 118, 118); font: bold 10px arial; text-align: left; text-decoration: none;">문화</div>
																			<canvas class="rMateChartH5__Legend"
																				id="rMateChartH5__chart_expndtr_Legend_7"
																				height="16" width="16"
																				style="position: absolute; width: 11px; height: 11px; left: 408.35px; top: 8.5px;"></canvas>
																			<div
																				class="rMateChartH5__chart_expndtr_LegendLabelDiv"
																				id="LegendLabel_chart_expndtr_7"
																				style="box-sizing: content-box; cursor: default; position: absolute; left: 427.35px; top: 7.5px; color: rgb(118, 118, 118); font: bold 10px arial; text-align: left; text-decoration: none;">교육</div>
																			<canvas class="rMateChartH5__Legend"
																				id="rMateChartH5__chart_expndtr_Legend_8"
																				height="16" width="16"
																				style="position: absolute; width: 11px; height: 11px; left: 461.45px; top: 8.5px;"></canvas>
																			<div
																				class="rMateChartH5__chart_expndtr_LegendLabelDiv"
																				id="LegendLabel_chart_expndtr_8"
																				style="box-sizing: content-box; cursor: default; position: absolute; left: 480.45px; top: 7.5px; color: rgb(118, 118, 118); font: bold 10px arial; text-align: left; text-decoration: none;">유흥</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div> <!-- [M 2021-12-15] div 추가 E -->
											</li>

											<li class="table">
												<table>
													<colgroup>
														<col style="width: 25%;">
														<col style="width: 25%;">
														<col style="width: 25%;">
														<col style="width: 25%;">
													</colgroup>

													<tbody>
														<tr>
															<th scope="row">음식</th>
															<td id="expndtrFood">28.9</td>
															<th scope="row">의류</th>
															<td id="expndtrClothes">11.7</td>
														</tr>
														<tr>
															<th scope="row">생활용품</th>
															<td id="expndtrHouseHoldGoos">6.4</td>
															<th scope="row">의료비</th>
															<td id="expndtrMedicalExpenses">13.6</td>
														</tr>

														<tr>
															<th scope="row">교통</th>
															<td id="expndtrTraffic">14.7</td>
															<th scope="row">여가</th>
															<td id="expndtrLeisure">3.1</td>
														</tr>

														<tr>
															<th scope="row">문화</th>
															<td id="expndtrCulture">3.1</td>
															<th scope="row">교육</th>
															<td id="expndtrEducation">14.3</td>
														</tr>

														<tr>
															<th scope="row">유통</th>
															<td id="expndtrPleasure">4.1</td>
														</tr>
													</tbody>
												</table>
											</li>

										</ul>
									</dd>
								</dl>

								<dl>
									<dt>임대시세</dt>

									<dd>
										<ul class="list_reportItem">
											<li class="summary">1층 임대료가 3.3㎡당 <strong
												id="cnvrsnRntchrg_co">47,264원</strong>입니다.
											</li>

											<li class="detail">선택상권 행정동 1층 임대료가 3.3㎡당 <strong>47,264</strong>원이며,
												자치구 임대료에 비해 <strong>84,976</strong> 원 낮고, 서울시 임대료에 비해 <strong>63,109</strong>
												원 낮습니다. 주변시세와 꼼꼼히 비교해 보세요.
											</li>

											<li class="graph">
												<!-- [M 2021-12-15] div 추가 S -->
												<div class="chartArea" style="padding-bottom: 10px;">
													<!-- [M 2021-12-15] 타이틀 추가 -->
													<p class="title">임대시세 추이</p>
													<!-- [M 2021-12-15] div 추가 E -->
													<span class="unit">단위 : 원 / 3.3㎡당 환산 임대료</span>

													<div class="area" id="cnvrsnRntchrg"
														style="width: 100%; height: 240px; position: static;">
														<div class="rMateChartH5__Root" id="chart_cnvrsnRntchrg"
															style="box-sizing: content-box; position: static; overflow: visible; width: 566px; height: 218px; padding: 15px 10px 5px; border-width: 1px; border-color: rgb(170, 179, 179); border-radius: 12px; border-style: none;">
															<div class="rMateChartH5__Main"
																style="box-sizing: content-box; width: 566px; height: 218px; position: static;">
																<div class="rMateChartH5__Box"
																	style="position: relative; float: left; overflow: visible; width: 566px; height: 218px; border-style: none; border-color: rgb(183, 186, 188); border-width: 1px;">
																	<div class="rMateChartH5__Chart"
																		style="box-sizing: content-box; float: none; position: relative; width: 566px; height: 191px; left: 0px; top: 0px;">
																		<canvas class="rMateChartH5__GridLines" width="757"
																			height="219"
																			style="position: absolute; left: 56px; top: 5px; width: 505px; height: 146px;"></canvas>
																		<canvas class="rMateChartH5__Axis2DRenderer"
																			width="834" height="279"
																			style="position: absolute; left: 5px; top: 0px; width: 556px; height: 186px;"></canvas>
																		<canvas class="rMateChartH5__Axis2DRenderer"
																			width="834" height="279"
																			style="position: absolute; left: 5px; top: 0px; width: 556px; height: 186px;"></canvas>
																		<canvas class="rMateChartH5__Line2DSeries" width="757"
																			height="219"
																			style="position: absolute; left: 56px; top: 5px; width: 505px; height: 146px;"></canvas>
																		<canvas class="rMateChartH5__Line2DSeries" width="757"
																			height="219"
																			style="position: absolute; left: 56px; top: 5px; width: 505px; height: 146px;"></canvas>
																		<canvas class="rMateChartH5__Line2DSeries" width="757"
																			height="219"
																			style="position: absolute; left: 56px; top: 5px; width: 505px; height: 146px;"></canvas>
																		<canvas class="rMateChartH5__LabelLayer" width="757"
																			height="219"
																			style="position: absolute; left: 56px; top: 5px; width: 505px; height: 146px;"></canvas>
																		<canvas class="rMateChartH5__LabelLayer" width="757"
																			height="219"
																			style="position: absolute; left: 56px; top: 5px; width: 505px; height: 146px;"></canvas>
																		<canvas class="rMateChartH5__LabelLayer" width="757"
																			height="219"
																			style="position: absolute; left: 56px; top: 5px; width: 505px; height: 146px;"></canvas>
																		<canvas class="rMateChartH5__UIElementEx" width="849"
																			height="286"
																			style="position: absolute; left: 0px; top: 0px; width: 566px; height: 191px;"></canvas>
																	</div>
																	<div class="rMateChartH5__LegendBox"
																		style="box-sizing: content-box; position: relative; overflow: hidden; float: none; width: 198.5px; height: 27px; left: 183.75px; top: 0px;">
																		<canvas class="rMateChartH5__LegendCanvas" height="0"
																			width="0"
																			style="position: absolute; visibility: hidden;"></canvas>
																		<div class="rMateChartH5__Legend"
																			style="box-sizing: content-box; position: absolute; left: 0px; top: 0px; width: 196px; height: 25px; border: 1px solid rgb(224, 224, 224); border-radius: 0px; background-color: rgb(247, 247, 247);">
																			<canvas class="rMateChartH5__Legend"
																				id="rMateChartH5__chart_cnvrsnRntchrg_Legend_0"
																				height="16" width="16"
																				style="position: absolute; width: 11px; height: 11px; left: 8px; top: 8.5px;"></canvas>
																			<div
																				class="rMateChartH5__chart_cnvrsnRntchrg_LegendLabelDiv"
																				id="LegendLabel_chart_cnvrsnRntchrg_0"
																				style="box-sizing: content-box; cursor: default; position: absolute; left: 27px; top: 7.5px; color: rgb(118, 118, 118); font: bold 10px arial; text-align: left; text-decoration: none;">선택상권</div>
																			<canvas class="rMateChartH5__Legend"
																				id="rMateChartH5__chart_cnvrsnRntchrg_Legend_1"
																				height="16" width="16"
																				style="position: absolute; width: 11px; height: 11px; left: 80.2px; top: 8.5px;"></canvas>
																			<div
																				class="rMateChartH5__chart_cnvrsnRntchrg_LegendLabelDiv"
																				id="LegendLabel_chart_cnvrsnRntchrg_1"
																				style="box-sizing: content-box; cursor: default; position: absolute; left: 99.2px; top: 7.5px; color: rgb(118, 118, 118); font: bold 10px arial; text-align: left; text-decoration: none;">자치구</div>
																			<canvas class="rMateChartH5__Legend"
																				id="rMateChartH5__chart_cnvrsnRntchrg_Legend_2"
																				height="16" width="16"
																				style="position: absolute; width: 11px; height: 11px; left: 142.85px; top: 8.5px;"></canvas>
																			<div
																				class="rMateChartH5__chart_cnvrsnRntchrg_LegendLabelDiv"
																				id="LegendLabel_chart_cnvrsnRntchrg_2"
																				style="box-sizing: content-box; cursor: default; position: absolute; left: 161.85px; top: 7.5px; color: rgb(118, 118, 118); font: bold 10px arial; text-align: left; text-decoration: none;">서울시</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div> <!-- [M 2021-12-15] div 추가 E -->
											</li>
										</ul>
									</dd>
								</dl>
								<dl>
									<dt>· 상권분석</dt>
								</dl>
							</div>
						</div>
						<div id="mCSB_12_scrollbar_vertical"
							class="mCSB_scrollTools mCSB_12_scrollbar mCS-light mCSB_scrollTools_vertical"
							style="display: block;">
<!-- 							<div class="mCSB_draggerContainer">
								<div id="mCSB_12_dragger_vertical" class="mCSB_dragger"
									style="position: absolute; min-height: 30px; display: block; height: 9px; max-height: 386px; top: 0px;">
									<div class="mCSB_dragger_bar" style="line-height: 30px;"></div>
								</div>
								<div class="mCSB_draggerRail"></div>
							</div> -->
						</div>
					</div>
				</div>
			</dd>
	</dl>
	<!-- [M 2021-12-15] 로딩바 추가 S -->
	<div class="popup_bg reportLodingBar" style="display: none;">
		<div class="lds-spinner">
			<div id="floatingCirclesG">
				<div class="f_circleG" id="frotateG_01"></div>
				<div class="f_circleG" id="frotateG_02"></div>
				<div class="f_circleG" id="frotateG_03"></div>
				<div class="f_circleG" id="frotateG_04"></div>
				<div class="f_circleG" id="frotateG_05"></div>
				<div class="f_circleG" id="frotateG_06"></div>
				<div class="f_circleG" id="frotateG_07"></div>
				<div class="f_circleG" id="frotateG_08"></div>
			</div>
		</div>
	</div>
	<!-- [M 2021-12-15] 로딩바 추가 E -->
</aside>
<script type="text/javascript">

/* function tabmove(reportName, areaName, event) {
	if(!!event) {
		event.preventDefault();
	}
	var report = $('.rightReport.' + reportName);
	var areaPos = report.find('.tabcnt_common2.tabcnt_' + areaName).position().top;
	areaPos = Number.isInteger(areaPos) ? areaPos : parseInt(areaPos);
	report.find('.scroll_y').mCustomScrollbar('scrollTo', areaPos);
} */

</script>
</body>
</html>