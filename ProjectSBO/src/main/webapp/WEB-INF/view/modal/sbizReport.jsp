<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 리뷰 쓰기 모달 -->
<div id="modal_bg"></div>

<div id="pdf_wrap">
	<div class="sbizReport_modal modal">
		<!-- 	<div id="modal_header">
		<h1>분석 결과</h1>
	</div> -->

		<div class="modal_box" id="content">
			<!-- class="rightReport analysis_report active"> -->
			<aside class="rightReport analysis_report active">
				<dl>
					<dt>
						<strong>분석리포트</strong> <!-- <span class="subs" id="subs"
							style="cursor: pointer;">pdf 내려받기</span> -->
					</dt>
					<dd>
						<div class="wrapTab">
							<ul class="tab_common2 tab_report">
								<li style="width: 100%;"><button class="active" id="tab01"
										onclick="tabmove('analysis_report', 'district');">업종분석</button></li>
								<li><button id="tab02"
										onclick="tabmove('analysis_report', 'sales');">매출분석</button></li>
								<!-- <li><button id="tab03" style="display: none;"
										onclick="tabmove('analysis_report', 'population');">인구분석</button></li> -->
								<li><button id="tab04"
										onclick="tabmove('analysis_report', 'area');">지역분석</button></li>
							</ul>
							<div>
								<dl>
									<dt>위치</dt>
									<dd id="place"></dd>
								</dl>

								<dl>
									<dt>업종</dt>
									<dd id="upjong">음식업</dd>
								</dl>

								<dl>
									<dt>기준분기</dt>
									<dd id="storQuTitle">2022년 1분기</dd>
								</dl>
							</div>
						</div>
						<div class="scroll_y mCustomScrollbar _mCS_12"
							style="height: 500px;">
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
											<dt class="active">책임의 한계 안내</dt>

											<dd class="info_limit active">
												본 보고서는 서울특별시에서 선택상권분석을 돕기 위해 제공하는 정보입니다.<br> 서울특별시에서
												보유하거나 외부기관으로부터 수집된 신뢰할만한 자료 및 정보로부터 얻어진 것이나 통계적으로 추정된 정보를
												이용하여 작성되었기에 리포트 내용에 대한 정확성이나 완전성을 보장할 수 없습니다.<br> 따라서
												자신의 판단과 책임하에 보고서를 활용하시기 바랍니다.<br> 또한 서울시는 본 보고서를 활용하여
												판단한 결과에 대한 어떠한 법적 책임도 없으며 전적으로 사용자 자신에게 있음을 알려드립니다.
											</dd>
										</dl>
										<dl>
											<dt>점포수</dt>

											<dd>
												<ul class="list_reportItem">
													<li class="summary">점포수는 <strong id="storCo"></strong>
														개 입니다.
													</li>

													<li class="contrast">
														<p>
															<span>전년 동분기 대비</span> <strong id="storYearDiff"
																class="decrease"></strong>
														</p>

														<p>
															<span>전분기 대비</span> <strong id="storQuDiff"
																class="increase"></strong>
														</p>
													</li>

													<li class="detail"><strong>업종전체</strong>의 점포수가 전분기대비 <strong>증가</strong>하고
														있습니다. 상권이 발달하는 시기인 경우 입지선정에 신중하셔야 합니다.</li>

													<li class="graph">
														<div class="chartArea">
															<p class="title">점포수 추이</p>
															<span class="unit" id="storQuSub">단위 : 개 / 2022년
																1분기 기준</span>
															<div class="area" id="BusinessCnt" style="width: 100%;">
																<canvas id="BusinessChart"></canvas>
															</div>
														</div>
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
														id="trdarSelngStorAmt"></strong> 만원 입니다.
													</li>

													<li class="contrast">
														<p>
															<span>전년 동분기 대비</span> <strong
																id="trdarSelngStorAmtYearDiff"></strong>
														</p>

														<p>
															<span>전분기 대비</span> <strong id="trdarSelngStorAmtQuDiff"></strong>

														</p>
													</li>

													<li id="selngAmtDetail" class="detail">선택상권 매출액이 전년대비
														증가 추세입니다.</li>

													<li class="graph">
														<div class="chartArea" style="padding-bottom: 10px;">
															<p class="title">매출액 추이</p>
															<span class="unit" id="">단위 : 만원 / 분기당 평균 월 매출</span>

															<div class="area" id="selngAmt" style="width: 100%;">
																<canvas id="QselngChart"></canvas>
															</div>
														</div>

													</li>
												</ul>
											</dd>
										</dl>

										<dl>
											<dt>매출건수</dt>

											<dd>
												<ul class="list_reportItem">
													<li class="summary">월평균 매출건수는 <strong
														id="trdarSelngStorCo"></strong>건 입니다.
													</li>

													<li class="contrast">
														<p>
															<span>전년 동분기 대비</span> <strong
																id="trdarSelngStorCoYearDiff"> </strong>건
														</p>

														<p>
															<span>전분기 대비</span> <strong id="trdarSelngStorCoQuDiff"></strong>건
														</p>
													</li>
													<li class="graph">
														<div class="chartArea" style="padding-bottom: 10px;">
															<p class="title">매출건수 추이</p>
															<span class="unit" id="">단위 : 건 / 월평균 매출건수</span>

															<div class="area" id="selngCo" style="width: 100%;">
																<canvas id="QCntselngChart"></canvas>
															</div>

														</div>
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

													<li id="selngWeekDetail" class="detail"><strong
														id="placeDong">상계10동</strong>은 <strong id="dayWeek">월요일</strong>에
														가장 매출이 높습니다. 주중(월화수목금토일) 고객이 중요한 상권이므로 고정 고객확보에 유의하세요.</li>

													<li class="graph">
														<div class="chartArea">
															<p class="title">요일별 매출 현황</p>
															<span class="unit" id="">단위 : % / 음식상권에 대한 주중 총
																매출액</span>

															<div class="area" id="selngWeek" style="width: 100%;">
																<canvas id="selngWeekChart"></canvas>
															</div>
														</div>
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

													<li id="selngHourDetail" class="detail"><strong
														id="selngHourTop1_">17 ~ 21시</strong>매출이 가장 높습니다. 오후와
														저녁시간대가 활발한 상권입니다.</li>

													<li class="graph">
														<div class="chartArea">
															<p class="title">시간대별 매출 현황</p>
															<span class="unit" id="">단위 : 점포당 평균 비율(%)</span>

															<div class="area" id="selngHour" style="width: 100%;">
																<canvas id="selngHourChart"></canvas>
															</div>
														</div>
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


													<li id="selngSexTop1Detail" class="detail">선택상권은 <strong
														id="selngSexTop1_">여성(54.7%)</strong> 고객이 많은 상권입니다. 고객의
														방문에 도움이되는 요소에 보다 많은 투자를 고려하세요.
													</li>

													<li class="graph">
														<div class="chartArea">
															<p class="title">성별 매출 현황</p>
															<span class="unit" id="">단위 : %</span>

															<div class="area" id="selngSex" style="width: 100%;">
																<canvas id="selngSexChart"></canvas>
															</div>
														</div>
													</li>
												</ul>
											</dd>
										</dl>

										<dl>
											<dt>연령대별 매출</dt>

											<dd>
												<ul class="list_reportItem">
													<li class="summary"><strong id="selngAgeTop1">음식업의
															20대(27.9%)</strong> 매출이 높아요.</li>


													<li class="detail">선택상권은 <strong id="selngAgeTop1_">20대(27.9%)</strong>가
														가장 활발한 소비를 보입니다. 장년층 이상이 관심을 가질 만한 구매요소에 보다 많은 투자를 고려하세요.
													</li>

													<li class="graph">
														<div class="chartArea">
															<p class="title" id="selngAgeTitleTop1">연령대별 음식업 매출
																현황</p>
															<span class="unit">단위 : % / 점포당 평균비율</span>

															<div class="area" id="selngAge" style="width: 100%;">
																<canvas id="selngAgeChart"></canvas>
															</div>
														</div>
													</li>
												</ul>
											</dd>
										</dl>
									</div>

									<div class="tabcnt_common2 tabcnt_population">
										<dl class="flpopCo">
											<dt class="relative">유동인구 수</dt>

											<dd>
												<ul class="list_reportItem">
													<li class="summary">유동인구 수는 일평균 <strong
														id="flpopCo_co">20,771명</strong> 이고 밀도는 <strong
														id="flpopCo_dnst">23,549명/㏊</strong> 입니다.
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
																				<canvas class="rMateChartH5__Line2DSeries"
																					width="766" height="219"
																					style="position: absolute; left: 50px; top: 5px; width: 511px; height: 146px;"></canvas>
																				<canvas class="rMateChartH5__Line2DSeries"
																					width="766" height="219"
																					style="position: absolute; left: 50px; top: 5px; width: 511px; height: 146px;"></canvas>
																				<canvas class="rMateChartH5__Line2DSeries"
																					width="766" height="219"
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
																				<canvas class="rMateChartH5__UIElementEx"
																					width="849" height="286"
																					style="position: absolute; left: 0px; top: 0px; width: 566px; height: 191px;"></canvas>
																			</div>
																			<div class="rMateChartH5__LegendBox"
																				style="box-sizing: content-box; position: relative; overflow: hidden; float: none; width: 199.173px; height: 27px; left: 183.413px; top: 0px;">
																				<canvas class="rMateChartH5__LegendCanvas"
																					height="0" width="0"
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
																				<canvas class="rMateChartH5__UIElementEx"
																					width="849" height="268"
																					style="position: absolute; left: 0px; top: 0px; width: 566px; height: 179px;"></canvas>
																			</div>
																			<div class="rMateChartH5__LegendBox"
																				style="box-sizing: content-box; position: relative; overflow: hidden; float: none; width: 107.2px; height: 27px; left: 229.4px; top: 0px;">
																				<canvas class="rMateChartH5__LegendCanvas"
																					height="0" width="0"
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

													<li class="detail">선택상권은 <strong>토요일 (
															14.89%)</strong>에 가장 유동인구가 많습니다. 주말(토일) 고객과 원거리 고객을 위한 마케팅이 중요합니다.
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
																			<canvas class="rMateChartH5__Area2DSeries"
																				width="787" height="229"
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
																</div>
															</div>
														</div> 
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
														<div class="chartArea">
															<p class="title">성별, 연령별 주거인구 현황</p>
															<span class="unit">단위 : %</span>
															<div class="area" id="repopSexAge"
																style="width: 100%; height: 228px; position: static;">
														
															</div>
														</div> <!-- [M 2021-12-15] div 추가 E -->
													</li>
												</ul>
											</dd>
										</dl>
									</div>

									<div class="tabcnt_common2 tabcnt_area">
										<dl>
											<dt>소비트렌드</dt>
											<dd>
												<ul class="list_reportItem">
													<li class="summary">선택한 음식업에서는 <strong
														id="expndtrTop1"> </strong> 비율이 가장 많습니다.
													</li>

													<li class="detail"><strong id="expndtrTop1_">음식</strong>에
														대한 경쟁업소를 파악하시기 바랍니다.</li>

													<li class="graph">
														<div class="chartArea">
															<p class="title">소비트렌드 현황</p>
															<span class="unit">단위 : %</span>

															<div class="area" id="expndtr">
																<canvas id="expndtrChart"></canvas>
															</div>
														</div>
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
																	<th id="trend1" scope="row"></th>
																	<td id="expnd1"></td>
																	<th id="trend2" scope="row"></th>
																	<td id="expnd2"></td>
																</tr>
																<tr>
																	<th id="trend3" scope="row"></th>
																	<td id="expnd3"></td>
																	<th id="trend4" scope="row"></th>
																	<td id="expnd4"></td>
																</tr>
															</tbody>
														</table>
													</li>
												</ul>
											</dd>
										</dl>
									</div>
								</div>
								<div id="mCSB_12_scrollbar_vertical"
									class="mCSB_scrollTools mCSB_12_scrollbar mCS-light mCSB_scrollTools_vertical"
									style="display: block;"></div>
							</div>
						</div>
					</dd>
				</dl>
			</aside>
		</div>
	</div>
</div>
<!-- 리뷰 쓰기 모달 -->
<script type="text/javascript">
	$(function() {	
		fn_scroll_plugin();

		$("#subs").click(function() {
			var currentPosition = document.getElementById("content").scrollTop;
		      var w;
		      var h;
		     document.getElementById("content").style.height="auto";
		var doc = new jsPDF('p', 'pt', 'letter');

				$("#content").find("p").each(function(){
		     w = $(this).width();
		     h = $(this).height();
		    		html2canvas($(this)[0], {
		         
		        dpi: 300, // Set to 300 DPI
		        scale: 3, // Adjusts your resolution
		        onrendered: (canvas)=> {
		          let img = canvas.toDataURL("image/jpeg", 1);
		        console.log(img);
		          doc.addImage(img,  'PNG', 20, 40, w, h);
		    	  			doc.addPage();
		        }
		      });
		    });
		          setTimeout(function(){ doc.save('sample-file.pdf')}, 500);
		     document.getElementById("content").style.height="500px";
		     document.getElementById("content").scrollTop = currentPosition;

			
			
		});

	});
	
	
/* 	var renderedImg = new Array;

	var contWidth = 200, // 너비(mm) (a4에 맞춤)
	    padding = 5; //상하좌우 여백(mm) */
	
	    
/* 	    function createPdf() { //이미지를 pdf로 만들기

	    	  var lists = document.querySelectorAll(".modal_box"),
	    	      deferreds = [],
	    	      doc = new jsPDF("p", "mm", "a4"),
	    	      listsLeng = lists.length;

	    	  for (var i = 0; i < listsLeng; i++) { // pdf_page 적용된 태그 개수만큼 이미지 생성
	    	    var deferred = $.Deferred();
	    	    deferreds.push(deferred.promise());
	    	    generateCanvas(i, doc, deferred, lists[i]);
	    	  }

	    	  $.when.apply($, deferreds).then(function () { // 이미지 렌더링이 끝난 후
	    	    var sorted = renderedImg.sort(function(a,b){return a.num < b.num ? -1 : 1;}), // 순서대로 정렬
	    	        curHeight = padding, //위 여백 (이미지가 들어가기 시작할 y축)
	    	        sortedLeng = sorted.length;

	    	    for (var i = 0; i < sortedLeng; i++) {
	    	      var sortedHeight = sorted[i].height, //이미지 높이
	    	          sortedImage = sorted[i].image; //이미지

	    	      if( curHeight + sortedHeight > 297 - padding * 2 ){ // a4 높이에 맞게 남은 공간이 이미지높이보다 작을 경우 페이지 추가
	    	        doc.addPage(); // 페이지를 추가함
	    	        curHeight = padding; // 이미지가 들어갈 y축을 초기 여백값으로 초기화
	    	        doc.addImage(sortedImage, 'jpeg', padding , curHeight, contWidth, sortedHeight); //이미지 넣기
	    	        curHeight += sortedHeight; // y축 = 여백 + 새로 들어간 이미지 높이
	    	      } else { // 페이지에 남은 공간보다 이미지가 작으면 페이지 추가하지 않음
	    	        doc.addImage(sortedImage, 'jpeg', padding , curHeight, contWidth, sortedHeight); //이미지 넣기
	    	        curHeight += sortedHeight; // y축 = 기존y축 + 새로들어간 이미지 높이
	    	      }
	    	    }
	    	    doc.save('resultReport.pdf'); //pdf 저장

	    	    curHeight = padding; //y축 초기화
	    	    renderedImg = new Array; //이미지 배열 초기화

	    	  });
	    	} */
	    
	    
/* 		function generateCanvas(i, doc, deferred, curList){ //페이지를 이미지로 만들기
			  var pdfWidth = $(curList).outerWidth() * 0.2645, //px -> mm로 변환
			      pdfHeight = $(curList).outerHeight() * 0.2645,
			      heightCalc = contWidth * pdfHeight / pdfWidth; //비율에 맞게 높이 조절
			  html2canvas( curList ).then(
			    function (canvas) {
			      var img = canvas.toDataURL('image/jpeg', 1.0); //이미지 형식 지정
			      renderedImg.push({num:i, image:img, height:heightCalc}); //renderedImg 배열에 이미지 데이터 저장(뒤죽박죽 방지)     
			      deferred.resolve(); //결과 보내기
			    }
			  );
			} */
	
	

	// jQuery Scroll Plugin 적용
	function fn_scroll_plugin() {
		$(".scroll_y").mCustomScrollbar({
			mouseWheelPixels : 150
		// 마우스휠 속도
		});
	}

	/* 	var today = new Date();

	 var year = today.getFullYear();
	 var month = ('0' + (today.getMonth() + 1)).slice(-2);
	 var day = ('0' + today.getDate()).slice(-2);

	 var dateString = year + "년" + month  + "월" + day + "일";
	 document.getElementById("subs").innerHTML = dateString; */
</script>
<script type = "text/javascript" src = "https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<script type = "text/javascript" src = "https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>