//웹 접근성을 위한 이미지를 가져올 폴더 url을 설정합니다.
rMateChartH5.patternImageBaseUrl = "/rMateChartH5/Assets/Patterns/";

// 웹 접근성을 위한 기본 폴더에서의 각 이미지들의 경로를 설정합니다.
rMateChartH5.patternImagesUrl = [
	"diagonal_ltr.png",
	"diagonal_rtl.png",
	"diagonal.png",
	"horizontal.png",
	"vertical.png",
	"both.png",
	"up.png",
	"right.png",
	"horizontal_curve.png",
	"vertical_curve.png",
	"horizontal_pipe.png",
	"vertical_pipe.png",
	"rectangle.png",
	"circle.png",
	"diamond.png",
	"triangle.png",
	"down_triangle.png",
	"cross.png",
	"rectangle2.png",
	"circle.png"
];

var reportInfo = {};
var reportCompareList = [];
var reportContents = $("#mapId").val();
var reportCompareAdd = {};
var staticBlockCd = "";
var startReportCount = 0;
var endReportCount = 0;
var reportPattern = false; // 그래프 패턴용 변수 - 22.05.03
var _svcIndutyCd = "";
var _id = "";

function selectBlockArea(wkt) {
	var result = getSyncAjaxData({ wkt : wkt }, "/analysis/selectBlockArea.json")
	return result.analsAr
}

function rptReadyHandler(chartId) {
	var obj = document.getElementById(chartId);
		//console.log(">>>>> "+chartId+" cht empty:"+!obj);
		//console.log(obj);
		//console.log(obj["setLayout"]);
		//console.log(">>>>rptReadyHandler = "+chartId+":"+(obj != undefined && obj != null && obj["setLayout"] != undefined && obj["setLayout"] != null));
	if(obj != undefined && obj != null &&
		obj["setLayout"] != undefined && obj["setLayout"] != null){
		var id = chartId.replace("chart_", "");
		obj.setLayout(reportInfo[id].layout);
		obj.setData(reportInfo[id].datas);
		setRptChtPosition();
	}
}


/**
 *
 * @param {String} id
 * @param {Object} datas
 * @param {Report} report
 * @returns
 */
function setChartData(id, datas, report) {

	var dataArray = [];
	var array = {};
	var saveDatas = datas;

	if(id == "store" || id == "incomeSctnCd") { // 점포수 & 소득분위(선택영역, 행정동, 자치구, 서울시 소득수준)
		var xUnit, yUnit = "";

		if(id == "store") {

			reportCompareAdd.storCo = datas['STOR_CO']; // 리포트용 추가 - 21.12.07
			// 기준분기 추가
			$(".wrapTab #storQuTitle").text((datas['STOR_QU'] || "0000년 0분기"));

			xUnit = "분기";
			yUnit = "점포수";
			$("#storCo").text(Number((datas['STOR_CO'] || 0)).toLocaleString('en') +'개');
			$("#storQuTitle").text((datas['STOR_QU'] || "0000년 0분기"));
			$("#storQuSub, #storQuSub2, #storQuSub3").text("단위 : 개 / "+(datas['STOR_QU'] || "0000년 0분기")+" 기준");

			if(datas['STOR_YEAR_DIFF'] > 0) {
				$("#storYearDiff").attr("class", "increase");
			} else if(datas['STOR_YEAR_DIFF'] < 0) {
				$("#storYearDiff").attr("class", "decrease");
			} else {
				$("#storYearDiff").attr("class", "");
			}
			$("#storYearDiff").text(Number(Math.abs(datas['STOR_YEAR_DIFF'] || 0)).toLocaleString('en') +'개');

			if(datas['STOR_QU_DIFF'] > 0) {
				$("#storQuDiff").attr("class", "increase");
			} else if(datas['STOR_QU_DIFF'] < 0) {
				$("#storQuDiff").attr("class", "decrease");
			} else {
				$("#storQuDiff").attr("class", "");
			}
			$("#storQuDiff").text(Number(Math.abs(datas['STOR_QU_DIFF'] || 0 )).toLocaleString('en')+'개');
			for(var i=4; i > 0; i-- ) {
				//console.log(i+"="+datas['STOR_QU_BF_'+i]+":"+datas['STOR_CO_BF_'+i]);
				if(!!datas['STOR_QU_BF_'+i] && datas['STOR_CO_BF_'+i] != null) {
					dataArray.push({"xData" : datas['STOR_QU_BF_'+i], "yData" : datas['STOR_CO_BF_'+i]});
				}
			}
			dataArray.push({"xData" : datas['STOR_QU'], "yData" : datas['STOR_CO']});
		} else if (id == "incomeSctnCd") {
			xUnit = "영역";
			yUnit = "분위";
			dataArray.push({"xData" : "선택상권", "yData" : datas['TRDAR_INCOME_SCTN_CD']});
			dataArray.push({"xData" : "행정동", "yData" : datas['ADSTRD_INCOME_SCTN_CD']});
			dataArray.push({"xData" : "자치구", "yData" : datas['SIGNGU_INCOME_SCTN_CD']});
			dataArray.push({"xData" : "서울시", "yData" : datas['MEGA_INCOME_SCTN_CD']});

			$("#trdarIncomeSctnCd").text((datas['TRDAR_INCOME_SCTN_CD']||0) +"분위" );

			$("#trdarSctmCdNm").text(datas['TRDAR_SCTM_CD_NM']);
			$("#adstrdSctmCdNm").text(datas['ADSTRD_SCTM_CD_NM']);
			$("#signguSctmCdNm").text(datas['SIGNGU_SCTM_CD_NM']);
			$("#megaSctmCdNm").text(datas['MEGA_SCTM_CD_NM']);
		}
		datas = dataArray;
		array.layout =  '<rMateChart backgroundAlpha="0.1" cornerRadius="12" borderStyle="none">' //backgroundAlpha="0.1" 배경 투명
			+'	<Options>'
			+'	</Options>'
			+'	<NumberFormatter id="num" useThousandsSeparator="true"/>'
			+'	<NumberFormatter id="numfmt" useThousandsSeparator="true"/>'
			+'	<Column2DChart displayCompleteCallFunction="rptCmpHandler" showDataTips="true">' // showDataTips: false => 마우스 오버시 데이터 표시 제거
			+'		<horizontalAxis>' // x축
			+'			<CategoryAxis id="hAxis" categoryField="xData" displayName="'+xUnit+'" labelJsFunction="axisLabelFunc"  axis="{hAxis}"  labelRotation="45"/>'
			+'		</horizontalAxis>'
			+'		<verticalAxis>' //y축 정의
			+'			<LinearAxis id="vAxis" displayName="" formatter="{num}" title="" fontFamily="맑은 고딕"/>'
			+'		</verticalAxis>'
			+'		<series>'
			+'			<Column2DSeries id="series1" yField="yData" displayName="'+yUnit+'" labelPosition="inside" labelAlign="middle" styleName="labelStyle">'
			+'				<fills>'
			+(id == 'incomeSctnCd' ? '<SolidColor color="#00A0F3"/>' : '')
			+'					<SolidColor color="#C0C0C0"/>'
			+'					<SolidColor color="#C0C0C0"/>'
			+'					<SolidColor color="#C0C0C0"/>'
			+(id != 'incomeSctnCd' ? '<SolidColor color="#C0C0C0"/><SolidColor color="#00A0F3"/>' : '')
			+'				</fills>'
			+'				<showDataEffect>'
			+'					<SeriesInterpolate/>'
			+'				</showDataEffect>'
			+'			</Column2DSeries>'
			+'		</series>'
			+'	</Column2DChart>'
			+'  <Style>'
			+'         .title{color : black ;fontSize : 11;}'
			+'         .labelStyle{paddingTop:6; fontSize:12; color:black;}'
			+'  </Style>'
			+'	</rMateChart>';
	} else if(id == "store2") { // 점포수 버블형
		document.querySelector('#store2').querySelector('#adstrdNm').innerText = report.name
		document.querySelector('#store2').querySelector('#signguNm').innerText = datas['SIGNGU_NM']

		$("#"+id).find("#adstrdStorCo").text(datas['ADSTRD_STOR_CO'] || 0);
		$("#"+id).find("#signguStorCo").text(datas['SIGNGU_STOR_CO'] || 0);
		$("#"+id).find("#megaStorCo").text(datas['MEGA_STOR_CO'] || 0);

		dataArray.push({"name" : "서울시", "data" : datas['MEGA_STOR_CO'] || 0});
		dataArray.push({"name" : datas['SIGNGU_NM'], "data" : datas['SIGNGU_STOR_CO'] || 0});
		dataArray.push({"name" : report.name, "data" : datas['ADSTRD_STOR_CO'] || 0});

		datas = dataArray;
		array.datas = datas;
		array.origin = saveDatas;
		reportInfo[id] = array;

		return false;
	} else if(id == "store3") { // 점포수 파이차트
		dataArray.push({"name" : "일반점포", "data" : datas['STOR_CO']});
		dataArray.push({"name" : "프랜차이즈", "data" : datas['FRC_STOR_CO']});
		datas = dataArray;
		array.layout =  '<rMateChart backgroundAlpha="0.1" cornerRadius="12" borderStyle="none">' //backgroundAlpha="0.1" 배경 투명
			+'	<Options>'
			// direction="vertical" 옵션을 넣으면 그래패턴 안먹어서 삭제 - 22.05.03
			+'		<Legend useVisibleCheck="true" />'
			+'	</Options>'
			+'	<Pie2DChart displayCompleteCallFunction="rptCmpHandler" showDataTips="true">'
			+'		<series>'
			+'			<Pie2DSeries nameField="name" field="data" startAngle="90" labelPosition="insideWithCallout" styleName="labelStyle">'
			+'              <fills>'
				+'					<SolidColor color="#00A0F3" alpha="1"/>' //* color:색깔 alpha:투명도 */
			+'					<SolidColor color="#00CD99" alpha="1"/>' //* color:색깔 alpha:투명도 */
			+'              </fills>'
			+'				<showDataEffect>'
			+'					<SeriesInterpolate duration="1000"/>'
			+'				</showDataEffect>'
			+'			</Pie2DSeries>'
			+'		</series>'
			+'	</Pie2DChart>'
			+'  <Style>'
			+'     .labelStyle{paddingTop:6;fontSize:14;color:black;}'
			+'  </Style>'
			+'</rMateChart>';
	} else if(id == "being") { // 신생기업 생존율
		$("#stdrBeingRt").text((datas['STDR_BEING_RT'] || 0) +'%');
		$("#stdrBeingQuSub").text("단위 : % / "+(datas['STDR_BEING_QU'] || "0000년 0분기")+" 기준");

		if(datas['STDR_BEING_YEAR_DIFF'] > 0) {
			$("#stdrBeingYearDiff").attr("class", "increase");
		} else if(datas['STDR_BEING_YEAR_DIFF'] < 0) {
			$("#stdrBeingYearDiff").attr("class", "decrease");
		} else {
			$("#stdrBeingYearDiff").attr("class", "");
		}
		$("#stdrBeingYearDiff").text(Math.abs(datas['STDR_BEING_YEAR_DIFF'] || 0) +'%');

		if(datas['STDR_BEING_QU_DIFF'] > 0) {
			$("#stdrBeingQuDiff").attr("class", "increase");
		} else if(datas['STDR_BEING_QU_DIFF'] < 0) {
			$("#stdrBeingQuDiff").attr("class", "decrease");
		} else {
			$("#stdrBeingQuDiff").attr("class", "");
		}
		$("#stdrBeingQuDiff").text(Math.abs(datas['STDR_BEING_QU_DIFF'] || 0 )+'%');
		for(var i=4; i > 0; i-- ) {
				//console.log(i+"="+datas['STDR_BEING_QU_BF_'+i]+":"+datas['STDR_BEING_RT_BF_'+i]);
			if(!!datas['STDR_BEING_QU_BF_'+i] && datas['STDR_BEING_RT_BF_'+i] != null) {
				dataArray.push({"xData" : datas['STDR_BEING_QU_BF_'+i], "yData" : datas['STDR_BEING_RT_BF_'+i]});
			}
		}
		dataArray.push({"xData" : datas['STDR_BEING_QU'], "yData" : datas['STDR_BEING_RT']});
		datas = dataArray;
		array.layout = '<rMateChart backgroundAlpha="0.1" cornerRadius="12" borderStyle="none">'
			+'	<Options>'
//				+'		<Legend useVisibleCheck="false" position="bottom"  defaultMouseOverAction="true" />'
			+'	</Options>'
			+'	<NumberFormatter id="num" useThousandsSeparator="true"/>'
			+'	<NumberFormatter id="numfmt" useThousandsSeparator="true" precision="2" />'
			+'	<Line2DChart dataTipDisplayMode="axis" displayCompleteCallFunction="rptCmpHandler" showDataTips="true" paddingTop="0" dataTipFormatter="{numfmt}">'
			+'		<horizontalAxis>'
			+'			<CategoryAxis id="hAxis" categoryField="xData"/>'
			+'		</horizontalAxis>'
			+'		<verticalAxis>'
			+'			<LinearAxis id="vAxis" formatter="{num}"/>'
			+'		</verticalAxis>'
			+'		<series>'
			+'			<Line2DSeries fill="#00A0F3" radius="6" labelPosition="up" yField="yData" form="curve" displayName="생존율" itemRenderer="CircleItemRenderer" styleName="labelStyle">'
			+'				<lineStroke>'
			+'					<Stroke color="#00A0F3" weight="3"/>'
			+'				</lineStroke>'
			+'				<showDataEffect>'
			+'					<SeriesInterpolate/>'
			+'				</showDataEffect>'
			+'			</Line2DSeries>'
			+'		</series>'
			+'	</Line2DChart>'
			+'  <Style>'
			+'         .labelStyle{paddingTop:6; fontSize:12; color:black;}'
			+'  </Style>'
			+'</rMateChart>';
	} else if(id == "opening") { // 평균영업기간
		reportCompareAdd.saleMtAvg = datas['ADSTRD_MT_AVG']; // 리포트용 추가 - 21.12.07

		dataArray.push({"xData" : "선택상권", "yData" : datas['TRDAR_SALE_MT_AVG']});
		$("#trdarSaleMtAvg").text((datas['TRDAR_SALE_MT_AVG'] || 0) +'년');
		$("#trdarSaleMtQuSub").text("단위 : 년 / "+(datas['STDR_YY_CD'] || '0000') +'년 '+(datas['STDR_QU_CD'] || '0') +'분기 기준');

		if(datas['MT_DIFF_SIGNGU'] > 0) {
			$("#mtDiffSigngu").attr("class", "increase");
		} else if(datas['MT_DIFF_SIGNGU'] < 0) {
			$("#mtDiffSigngu").attr("class", "decrease");
		} else {
			$("#mtDiffSigngu").attr("class", "");
		}
		$("#mtDiffSigngu").text(Math.abs(datas['MT_DIFF_SIGNGU'] || 0) +'년');

		if(datas['MT_DIFF_MEGA'] > 0) {
			$("#mtDiffMega").attr("class", "increase");
		} else if(datas['MT_DIFF_MEGA'] < 0) {
			$("#mtDiffMega").attr("class", "decrease");
		} else {
			$("#mtDiffMega").attr("class", "");
		}
		$("#mtDiffMega").text(Math.abs(datas['MT_DIFF_MEGA'] || 0 )+'년');

		if(!!datas['ADSTRD_MT_AVG']) { // 행정동 평균영업기간
			dataArray.push({"xData" : "행정동", "yData" : datas['ADSTRD_MT_AVG']});
		}
		if(!!datas['SIGNGU_MT_AVG']) { // 자치구 평균영업기간
			dataArray.push({"xData" : "자치구", "yData" : datas['SIGNGU_MT_AVG']});
		}
		if(!!datas['MEGA_MT_AVG']) { // 서울시 평균영업기간
			dataArray.push({"xData" : "서울시", "yData" : datas['MEGA_MT_AVG']});
		}
		datas = dataArray;
		array.layout =  '<rMateChart backgroundAlpha="0.1" cornerRadius="12" borderStyle="none">' //backgroundAlpha="0.1" 배경 투명
			+'	<Options>'
			+'	</Options>'
			+'	<NumberFormatter id="num" useThousandsSeparator="true"/>'
			+'	<NumberFormatter id="numfmt" useThousandsSeparator="true" precision="1" />'
			+'	<Column2DChart displayCompleteCallFunction="rptCmpHandler" showDataTips="true" dataTipFormatter="{numfmt}">' // showDataTips: false => 마우스 오버시 데이터 표시 제거
			+'		<horizontalAxis>' // x축
			+'			<CategoryAxis id="hAxis" categoryField="xData" displayName="분기" labelJsFunction="axisLabelFunc"  axis="{hAxis}"  labelRotation="45"/>'
			+'		</horizontalAxis>'
			+'		<verticalAxis>' //y축 정의
			+'			<LinearAxis id="vAxis" displayName="년" formatter="{num}" fontFamily="맑은 고딕"/>'
			+'		</verticalAxis>'
			+'		<series>'
			+'			<Column2DSeries id="series1" yField="yData" displayName="영업기간" labelPosition="inside" labelAlign="middle" styleName="labelStyle">'
			+'				<fills>'
			+'					<SolidColor color="#00A0F3"/>'
			+'					<SolidColor color="#C0C0C0"/>'
			+'					<SolidColor color="#C0C0C0"/>'
			+'					<SolidColor color="#C0C0C0"/>'
			+'				</fills>'
			+'				<showDataEffect>'
			+'					<SeriesInterpolate/>'
			+'				</showDataEffect>'
			+'			</Column2DSeries>'
			+'		</series>'
			+'	</Column2DChart>'
			+'  <Style>'
			+'         .title{color : black ;fontSize : 11;}'
			+'         .labelStyle{paddingTop:6; fontSize:12; color:black;}'
			+'  </Style>'
			+'	</rMateChart>';
	} else if(id == "opbiz") {
		$("#opbizStorCo").text(Number((datas['OPBIZ_STOR_CO'] || 0)).toLocaleString('en') +'개');
		$("#opbizStorQuSub").text("단위 : 개 / "+(datas['OPBIZ_STOR_QU'] || "0000년 0분기")+" 기준");

		if(datas['OPBIZ_STOR_YEAR_DIFF'] > 0) {
			$("#opbizStorYearDiff").attr("class", "increase");
		} else if(datas['OPBIZ_STOR_YEAR_DIFF'] < 0) {
			$("#opbizStorYearDiff").attr("class", "decrease");
		} else {
			$("#opbizStorYearDiff").attr("class", "");
		}
		$("#opbizStorYearDiff").text(Number(Math.abs(datas['OPBIZ_STOR_YEAR_DIFF'] || 0)).toLocaleString('en') +'개');

		if(datas['OPBIZ_STOR_QU_DIFF'] > 0) {
			$("#opbizStorQuDiff").attr("class", "increase");
		} else if(datas['OPBIZ_STOR_QU_DIFF'] < 0) {
			$("#opbizStorQuDiff").attr("class", "decrease");
		} else {
			$("#opbizStorQuDiff").attr("class", "");
		}
		$("#opbizStorQuDiff").text(Number(Math.abs(datas['OPBIZ_STOR_QU_DIFF'] || 0 )).toLocaleString('en')+'개');
		for(var i=4; i > 0; i-- ) {
			//console.log(i+"="+datas['OPBIZ_STOR_QU_BF_'+i]+":"+datas['OPBIZ_STOR_CO_BF_'+i]);
			if(!!datas['OPBIZ_STOR_QU_BF_'+i] && datas['OPBIZ_STOR_CO_BF_'+i] != null) {
				dataArray.push({"xData" : datas['OPBIZ_STOR_QU_BF_'+i], "yData" : datas['OPBIZ_STOR_CO_BF_'+i]});
			}
		}
		dataArray.push({"xData" : datas['OPBIZ_STOR_QU'], "yData" : datas['OPBIZ_STOR_CO']});
		datas = dataArray;
		array.layout =  '<rMateChart backgroundAlpha="0.1" cornerRadius="12" borderStyle="none">' //backgroundAlpha="0.1" 배경 투명
			+'	<Options>'
			+'	</Options>'
			+'	<NumberFormatter id="num" useThousandsSeparator="true"/>'
			+'	<NumberFormatter id="numfmt" useThousandsSeparator="true"/>'
			+'	<Column2DChart displayCompleteCallFunction="rptCmpHandler" showDataTips="true">' // showDataTips: false => 마우스 오버시 데이터 표시 제거
			+'		<horizontalAxis>' // x축
			+'			<CategoryAxis id="hAxis" categoryField="xData" displayName="분기" labelJsFunction="axisLabelFunc"  axis="{hAxis}"  labelRotation="45"/>'
			+'		</horizontalAxis>'
			+'		<verticalAxis>' //y축 정의
			+'			<LinearAxis id="vAxis" displayName="" formatter="{num}" title="" fontFamily="맑은 고딕"/>'
			+'		</verticalAxis>'
			+'		<series>'
			+'			<Column2DSeries id="series1" yField="yData" displayName="점포수" labelPosition="inside" labelAlign="middle" styleName="labelStyle">'
			+'				<fills>'
			+'					<SolidColor color="#C0C0C0"/>'
			+'					<SolidColor color="#C0C0C0"/>'
			+'					<SolidColor color="#C0C0C0"/>'
			+'					<SolidColor color="#C0C0C0"/>'
			+'					<SolidColor color="#00A0F3"/>'
			+'				</fills>'
			+'				<showDataEffect>'
			+'					<SeriesInterpolate/>'
			+'				</showDataEffect>'
			+'			</Column2DSeries>'
			+'		</series>'
			+'	</Column2DChart>'
			+'  <Style>'
			+'         .title{color : black ;fontSize : 11;}'
			+'         .labelStyle{paddingTop:6; fontSize:12; color:black;}'
			+'  </Style>'
			+'	</rMateChart>';
	} else if(id == "clsbiz") { // 폐업수
		$("#clsbizStorCo").text(Number((datas['CLSBIZ_STOR_CO'] || 0)).toLocaleString('en') +'개');
		$("#clsbizStorQuSub").text("단위 : 개 / "+(datas['CLSBIZ_STOR_QU'] || "0000년 0분기")+" 기준");

		if(datas['CLSBIZ_STOR_YEAR_DIFF'] > 0) {
			$("#clsbizStorYearDiff").attr("class", "increase");
		} else if(datas['CLSBIZ_STOR_YEAR_DIFF'] < 0) {
			$("#clsbizStorYearDiff").attr("class", "decrease");
		} else {
			$("#clsbizStorYearDiff").attr("class", "");
		}
		$("#clsbizStorYearDiff").text(Number(Math.abs(datas['CLSBIZ_STOR_YEAR_DIFF'] || 0)).toLocaleString('en') +'개');

		if(datas['CLSBIZ_STOR_QU_DIFF'] > 0) {
			$("#clsbizStorQuDiff").attr("class", "increase");
		} else if(datas['CLSBIZ_STOR_QU_DIFF'] < 0) {
			$("#clsbizStorQuDiff").attr("class", "decrease");
		} else {
			$("#clsbizStorQuDiff").attr("class", "");
		}
		$("#clsbizStorQuDiff").text(Number(Math.abs(datas['CLSBIZ_STOR_QU_DIFF'] || 0 )).toLocaleString('en')+'개');
		for(var i=4; i > 0; i-- ) {
			//console.log(i+"="+datas['CLSBIZ_STOR_QU_BF_'+i]+":"+datas['CLSBIZ_STOR_CO_BF_'+i]);
			if(!!datas['CLSBIZ_STOR_QU_BF_'+i] && datas['CLSBIZ_STOR_CO_BF_'+i] != null) {
				dataArray.push({"xData" : datas['CLSBIZ_STOR_QU_BF_'+i], "yData" : datas['CLSBIZ_STOR_CO_BF_'+i]});
			}
		}
		dataArray.push({"xData" : datas['CLSBIZ_STOR_QU'], "yData" : datas['CLSBIZ_STOR_CO']});
		datas = dataArray;
		array.layout =  '<rMateChart backgroundAlpha="0.1" cornerRadius="12" borderStyle="none">' //backgroundAlpha="0.1" 배경 투명
			+'	<Options>'
			+'	</Options>'
			+'	<NumberFormatter id="numfmt" useThousandsSeparator="true"/>'
			+'	<Column2DChart displayCompleteCallFunction="rptCmpHandler" showDataTips="true">' // showDataTips: false => 마우스 오버시 데이터 표시 제거
			+'		<horizontalAxis>' // x축
			+'			<CategoryAxis id="hAxis" categoryField="xData" displayName="분기" labelJsFunction="axisLabelFunc"  axis="{hAxis}"  labelRotation="45"/>'
			+'		</horizontalAxis>'
			+'		<verticalAxis>' //y축 정의
			+'			<LinearAxis id="vAxis" displayName="" formatter="{numfmt}" title="" fontFamily="맑은 고딕"/>'
			+'		</verticalAxis>'
			+'		<series>'
			+'			<Column2DSeries id="series1" yField="yData" displayName="점포수" labelPosition="inside" labelAlign="middle" styleName="labelStyle">'
			+'				<fills>'
			+'					<SolidColor color="#C0C0C0"/>'
			+'					<SolidColor color="#C0C0C0"/>'
			+'					<SolidColor color="#C0C0C0"/>'
			+'					<SolidColor color="#C0C0C0"/>'
			+'					<SolidColor color="#00A0F3"/>'
			+'				</fills>'
			+'				<showDataEffect>'
			+'					<SeriesInterpolate/>'
			+'				</showDataEffect>'
			+'			</Column2DSeries>'
			+'		</series>'
			+'	</Column2DChart>'
			+'  <Style>'
			+'         .title{color : black ;fontSize : 11;}'
			+'         .labelStyle{paddingTop:6; fontSize:12; color:black;}'
			+'  </Style>'
			+'	</rMateChart>';
	} else if(id == "induty") { // 업종분포 파이 차트
		// CS1_STOR_CO --외식업 ,CS2_STOR_CO --서비스업, CS3_STOR_CO --소매업
		dataArray.push({"name" : "외식업", "data" : datas['CS1_STOR_CO']}); // 외식업
		dataArray.push({"name" : "서비스업", "data" : datas['CS2_STOR_CO']}); // 서비스업
		dataArray.push({"name" : "소매업", "data" : datas['CS3_STOR_CO']}); // 소매업
		var topInduty = (datas['INDUTY_TOP1'] == "CS1_STOR_CO" ? "외식업" : (datas['INDUTY_TOP1'] == "CS2_STOR_CO" ? "서비스업" : (datas['INDUTY_TOP1'] == "CS3_STOR_CO" ? "소매업" : "업종")));
		$("#topInduty").text(topInduty);
		$("#indutyQuSub").text("단위 : 개 / " + (datas['STOR_QU'] || "0000년 0분기") + " 기준");

		datas = dataArray;
		array.layout =  '<rMateChart backgroundAlpha="0.1" cornerRadius="12" borderStyle="none">' //backgroundAlpha="0.1" 배경 투명
			+'	<Options>'
			// direction="vertical" 옵션을 넣으면 그래패턴 안먹어서 삭제  및 모바일 영역문제로 바텀 범례 - 22.05.03
			+'		<Legend useVisibleCheck="true" position="bottom" />'
			+'	</Options>'
			+'	<Pie2DChart displayCompleteCallFunction="rptCmpHandler" showDataTips="true">'
			+'		<series>'
			+'			<Pie2DSeries nameField="name" field="data" startAngle="90" labelPosition="insideWithCallout" styleName="labelStyle">'
			+'              <fills>'
			+'					<SolidColor color="#00A0F3" alpha="1"/>' //* color:색깔 alpha:투명도 */
			+'					<SolidColor color="#00CD99" alpha="1"/>' //* color:색깔 alpha:투명도 */
			+'					<SolidColor color="#FFB83B" alpha="1"/>' //* color:색깔 alpha:투명도 */
			+'              </fills>'
			+'				<showDataEffect>'
			+'					<SeriesInterpolate duration="1000"/>'
			+'				</showDataEffect>'
			+'			</Pie2DSeries>'
			+'		</series>'
			+'	</Pie2DChart>'
			+'  <Style>'
			+'     .labelStyle{paddingTop:6;fontSize:14;color:black;}'
			+'  </Style>'
			+'</rMateChart>';
	} else if(id == "induty2") { // 업종분포 칼럼 차트
		// CS1_STOR_CO --외식업 ,CS2_STOR_CO --서비스업, CS3_STOR_CO --소매업
		$("#increaseInduty").text(datas['INDUTY_TOP1']);// 증가 추세 - 22.03.14

		$("#indutyQuSub2").text("단위 : % / "+(datas['INDUTY_STOR_QU_BF_0'] || "0000년 0분기")+" 기준");
		for(var i=4; i >= 0; i-- ) {
				//console.log(i+"="+datas['INDUTY_STOR_QU_BF_'+i]+":"+datas['CS1_STOR_CO_'+i]+":"+datas['CS2_STOR_CO_'+i]+":"+datas['CS3_STOR_CO_'+i]);
			if(!!datas['INDUTY_STOR_QU_BF_'+i] && datas['CS1_STOR_CO_'+i] != null && datas['CS2_STOR_CO_'+i] != null && datas['CS3_STOR_CO_'+i] != null) {
				dataArray.push({"xData" : datas['INDUTY_STOR_QU_BF_'+i], "yData1" : parseFloat(datas['CS1_STOR_CO_'+i]), "yData2" : parseFloat(datas['CS2_STOR_CO_'+i]), "yData3" : parseFloat(datas['CS3_STOR_CO_'+i])});
			}
		}
		datas = dataArray;
			//* color:색깔 alpha:투명도 */
		array.layout = '<rMateChart backgroundAlpha="0.1" cornerRadius="12" borderStyle="none">' //backgroundAlpha="0.1" 배경 투명
			+'	<Options>'
			+'		<Legend useVisibleCheck="false" position="bottom"  defaultMouseOverAction="true" />'
			+'	</Options>'
			+'	<NumberFormatter id="num" useThousandsSeparator="true"/>'
			+'	<NumberFormatter id="numfmt" useThousandsSeparator="true" precision="1" />'
			+'	<Column2DChart displayCompleteCallFunction="rptCmpHandler" showDataTips="true" dataTipFormatter="{numfmt}">' // showDataTips: false => 마우스 오버시 데이터 표시 제거
			+'		<horizontalAxis>' // x축
			+'			<CategoryAxis id="hAxis" categoryField="xData" displayName="날짜" labelJsFunction="axisLabelFunc"  axis="{hAxis}"  labelRotation="45"/>'
			+'		</horizontalAxis>'
			+'		<verticalAxis>' //y축 정의
			+'			<LinearAxis id="vAxis" displayName="" title="" formatter="{num}" fontFamily="맑은 고딕"/>'
			+'		</verticalAxis>'
			+'		<series>'
			+'			<Column2DSeries id="series1" yField="yData1" displayName="외식업" labelPosition="outside" styleName="seriesStyle">'
			+'				<fill>'
			+'					<SolidColor color="#00A0F3" alpha="1"/>' //* color:색깔 alpha:투명도 */
			+'				</fill>'
			+'				<showDataEffect>'
			+'					<SeriesInterpolate/>'
			+'				</showDataEffect>'
			+'			</Column2DSeries>'
			+'			<Column2DSeries id="series2" yField="yData2" displayName="서비스업" labelPosition="outside" styleName="seriesStyle">'
			+'				<fill>'
			+'					<SolidColor color="#00CD99" alpha="1"/>'
			+'				</fill>'
			+'				<showDataEffect>'
			+'					<SeriesInterpolate/>'
			+'				</showDataEffect>'
			+'			</Column2DSeries>'
			+'			<Column2DSeries id="series3" yField="yData3" displayName="소매업" labelPosition="outside" styleName="seriesStyle">'
			+'				<fill>' //색상변경 시작
			+'					<SolidColor color="#FFB83B" alpha="1"/>'
			+'				</fill>'
			+'				<showDataEffect>'
			+'					<SeriesInterpolate/>'
			+'				</showDataEffect>'
			+'			</Column2DSeries>'
			+'		</series>'
			+'	</Column2DChart>'
			+'	</rMateChart>';
	} else if(id == "selngAmt") { // 매출액
		reportCompareAdd.selngAmtAvg = datas['TRDAR_SELNG_STOR_AMT_BF_0']; // 리포트용 추가 - 21.12.07

		for(var i=4; i >= 0; i-- ) {
				//console.log(i+"="+datas['SELNG_STOR_QU_BF_'+i]+":"+datas['TRDAR_SELNG_STOR_AMT_BF_'+i]+":"+datas['SIGNGU_SELNG_STOR_AMT_BF_'+i]+":"+datas['SIDO_SELNG_STOR_AMT_BF_'+i]);
			if(!!datas['SELNG_STOR_QU_BF_'+i] && datas['TRDAR_SELNG_STOR_AMT_BF_'+i] != null && datas['SIGNGU_SELNG_STOR_AMT_BF_'+i] != null && datas['SIDO_SELNG_STOR_AMT_BF_'+i] != null) {
				dataArray.push({"xData" : datas['SELNG_STOR_QU_BF_'+i], "yData1" : parseFloat(datas['TRDAR_SELNG_STOR_AMT_BF_'+i]), "yData2" : parseFloat(datas['SIGNGU_SELNG_STOR_AMT_BF_'+i]), "yData3" : parseFloat(datas['SIDO_SELNG_STOR_AMT_BF_'+i])});
			}
		}
		$("#trdarSelngStorAmt").text(Number((datas['TRDAR_SELNG_STOR_AMT_BF_0'] || 0)).toLocaleString('en') +'만원');

		if(datas['TRDAR_SELNG_STOR_AMT_YEAR_DIFF'] > 0) {
			$("#trdarSelngStorAmtYearDiff").attr("class", "increase");
		} else if(datas['TRDAR_SELNG_STOR_AMT_YEAR_DIFF'] < 0) {
			$("#trdarSelngStorAmtYearDiff").attr("class", "decrease");
		} else {
			$("#trdarSelngStorAmtYearDiff").attr("class", "");
		}
		$("#trdarSelngStorAmtYearDiff").text(Number(Math.abs(datas['TRDAR_SELNG_STOR_AMT_YEAR_DIFF'] || 0)).toLocaleString('en') +'만원');

		if(datas['TRDAR_SELNG_STOR_AMT_QU_DIFF'] > 0) {
			$("#trdarSelngStorAmtQuDiff").attr("class", "increase");
		} else if(datas['TRDAR_SELNG_STOR_AMT_QU_DIFF'] < 0) {
			$("#trdarSelngStorAmtQuDiff").attr("class", "decrease");
		} else {
			$("#trdarSelngStorAmtQuDiff").attr("class", "");
		}
		$("#trdarSelngStorAmtQuDiff").text(Number(Math.abs(datas['TRDAR_SELNG_STOR_AMT_QU_DIFF'] || 0 )).toLocaleString('en') +'만원');

		datas = dataArray;
		array.layout = '<rMateChart backgroundAlpha="0.1" cornerRadius="12" borderStyle="none">'
			+'	<Options>'
			+'		<Legend useVisibleCheck="false" position="bottom"  defaultMouseOverAction="true" />'
			+'	</Options>'
			+'	<NumberFormatter id="numfmt" useThousandsSeparator="true"/>'
			+'	<Line2DChart dataTipDisplayMode="axis" displayCompleteCallFunction="rptCmpHandler" showDataTips="true" paddingTop="0" dataTipFormatter="{numfmt}">'
			+'		<horizontalAxis>'
			+'			<CategoryAxis id="hAxis" categoryField="xData"/>'
			+'		</horizontalAxis>'
			+'		<verticalAxis>'
			+'			<LinearAxis id="vAxis" formatter="{numfmt}" minimum="0"/>'
			+'		</verticalAxis>'
			+'		<series>'
			+'			<Line2DSeries fill="#00A0F3" radius="6" labelPosition="up" yField="yData1" form="curve" displayName="선택상권" itemRenderer="CircleItemRenderer" styleName="labelStyle">'
			+'				<lineStroke>'
			+'					<Stroke color="#00A0F3" weight="3"/>'
			+'				</lineStroke>'
			+'				<showDataEffect>'
			+'					<SeriesInterpolate/>'
			+'				</showDataEffect>'
			+'			</Line2DSeries>'
			+'			<Line2DSeries fill="#FFB83B" radius="6" labelPosition="up" yField="yData2" form="curve" displayName="자치구" itemRenderer="CircleItemRenderer" styleName="labelStyle">'
			+'				<lineStroke>'
			+'					<Stroke color="#FFB83B" weight="3"/>'
			+'				</lineStroke>'
			+'				<showDataEffect>'
			+'					<SeriesInterpolate/>'
			+'				</showDataEffect>'
			+'			</Line2DSeries>'
			+'			<Line2DSeries fill="#999999" radius="6" labelPosition="up" yField="yData3" form="curve" displayName="서울시" itemRenderer="CircleItemRenderer" styleName="labelStyle">'
			+'				<lineStroke>'
			+'					<Stroke color="#999999" weight="3"/>'
			+'				</lineStroke>'
			+'				<showDataEffect>'
			+'					<SeriesInterpolate/>'
			+'				</showDataEffect>'
			+'			</Line2DSeries>'
			+'		</series>'
			+'	</Line2DChart>'
			+'  <Style>'
			+'         .labelStyle{paddingTop:6; fontSize:12; color:black;}'
			+'  </Style>'
			+'</rMateChart>';
	} else if(id == "selngCo") { // 매출건수
		for(var i=4; i >= 0; i-- ) {
				//console.log(i+"="+datas['SELNG_STOR_QU_BF_'+i]+":"+datas['TRDAR_SELNG_STOR_CO_BF_'+i]+":"+datas['SIGNGU_SELNG_STOR_CO_BF_'+i]+":"+datas['SIDO_SELNG_STOR_CO_BF_'+i]);
			if(!!datas['SELNG_STOR_QU_BF_'+i] && datas['TRDAR_SELNG_STOR_CO_BF_'+i] != null && datas['SIGNGU_SELNG_STOR_CO_BF_'+i] != null && datas['SIDO_SELNG_STOR_CO_BF_'+i] != null) {
				dataArray.push({"xData" : datas['SELNG_STOR_QU_BF_'+i], "yData1" : parseFloat(datas['TRDAR_SELNG_STOR_CO_BF_'+i]), "yData2" : parseFloat(datas['SIGNGU_SELNG_STOR_CO_BF_'+i]), "yData3" : parseFloat(datas['SIDO_SELNG_STOR_CO_BF_'+i])});
			}
		}
		$("#trdarSelngStorCo").text(Number((datas['TRDAR_SELNG_STOR_CO_BF_0'] || 0)).toLocaleString('en') +'건');

		if(datas['TRDAR_SELNG_STOR_CO_YEAR_DIFF'] > 0) {
			$("#trdarSelngStorCoYearDiff").attr("class", "increase");
		} else if(datas['TRDAR_SELNG_STOR_CO_YEAR_DIFF'] < 0) {
			$("#trdarSelngStorCoYearDiff").attr("class", "decrease");
		} else {
			$("#trdarSelngStorCoYearDiff").attr("class", "");
		}
		$("#trdarSelngStorCoYearDiff").text(Number(Math.abs(datas['TRDAR_SELNG_STOR_CO_YEAR_DIFF'] || 0)).toLocaleString('en') +'건');

		if(datas['TRDAR_SELNG_STOR_CO_QU_DIFF'] > 0) {
			$("#trdarSelngStorCoQuDiff").attr("class", "increase");
		} else if(datas['TRDAR_SELNG_STOR_CO_QU_DIFF'] < 0) {
			$("#trdarSelngStorCoQuDiff").attr("class", "decrease");
		} else {
			$("#trdarSelngStorCoQuDiff").attr("class", "");
		}
		$("#trdarSelngStorCoQuDiff").text(Number(Math.abs(datas['TRDAR_SELNG_STOR_CO_QU_DIFF'] || 0 )).toLocaleString('en') +'건');
		datas = dataArray;
		array.layout = '<rMateChart backgroundAlpha="0.1" cornerRadius="12" borderStyle="none">'
			+'	<Options>'
			+'		<Legend useVisibleCheck="false" position="bottom"  defaultMouseOverAction="true" />'
			+'	</Options>'
			+'	<NumberFormatter id="numfmt" useThousandsSeparator="true"/>'
			+'	<Line2DChart dataTipDisplayMode="axis" displayCompleteCallFunction="rptCmpHandler" showDataTips="true" paddingTop="0" dataTipFormatter="{numfmt}">'
			+'		<horizontalAxis>'
			+'			<CategoryAxis id="hAxis" categoryField="xData"/>'
			+'		</horizontalAxis>'
			+'		<verticalAxis>'
			+'			<LinearAxis id="vAxis" formatter="{numfmt}" minimum="0"/>'
			+'		</verticalAxis>'
			+'		<series>'
			+'			<Line2DSeries fill="#00A0F3" radius="6" labelPosition="up" yField="yData1" form="curve" displayName="선택상권" itemRenderer="CircleItemRenderer" styleName="labelStyle">'
			+'				<lineStroke>'
			+'					<Stroke color="#00A0F3" weight="3"/>'
			+'				</lineStroke>'
			+'				<showDataEffect>'
			+'					<SeriesInterpolate/>'
			+'				</showDataEffect>'
			+'			</Line2DSeries>'
			+'			<Line2DSeries fill="#FFB83B" radius="6" labelPosition="up" yField="yData2" form="curve" displayName="자치구" itemRenderer="CircleItemRenderer" styleName="labelStyle">'
			+'				<lineStroke>'
			+'					<Stroke color="#FFB83B" weight="3"/>'
			+'				</lineStroke>'
			+'				<showDataEffect>'
			+'					<SeriesInterpolate/>'
			+'				</showDataEffect>'
			+'			</Line2DSeries>'
			+'			<Line2DSeries fill="#999999" radius="6" labelPosition="up" yField="yData3" form="curve" displayName="서울시" itemRenderer="CircleItemRenderer" styleName="labelStyle">'
			+'				<lineStroke>'
			+'					<Stroke color="#999999" weight="3"/>'
			+'				</lineStroke>'
			+'				<showDataEffect>'
			+'					<SeriesInterpolate/>'
			+'				</showDataEffect>'
			+'			</Line2DSeries>'
			+'		</series>'
			+'	</Line2DChart>'
			+'  <Style>'
			+'         .labelStyle{paddingTop:6; fontSize:12; color:black;}'
			+'  </Style>'
			+'</rMateChart>';
	} else if(id == "selngWeek" || id == "flpopWeekCo" || id == "blckFclty") { // 요일별 매출 & 요일별 유동인구 & 상권 주요시설 현황
		var xUnit = "";
		var yUnit = "";
		var fillStr = "";
		if(id == "blckFclty") {
			xUnit = "시설";
			yUnit = "갯수";
			dataArray.push({"xData" : "관공서", 	"yData" : datas['OFFICES'] || 0});
			dataArray.push({"xData" : "금융기관", 	"yData" : datas['FINANCIAL'] || 0});
			dataArray.push({"xData" : "병원", 	"yData" : datas['HOSPITAL'] || 0});
			dataArray.push({"xData" : "학교", 	"yData" : datas['SCHOOL'] || 0});
			dataArray.push({"xData" : "유통점", 	"yData" : datas['DISTRIBUTOR'] || 0});
			dataArray.push({"xData" : "극장", 	"yData" : datas['THEATER'] || 0});
			dataArray.push({"xData" : "숙박시설", 	"yData" : datas['ACCOMMODATION'] || 0});
			dataArray.push({"xData" : "교통시설", 	"yData" : datas['FACILITIES'] || 0});

			$("#offices").text(datas['OFFICES'] || 0);
			$("#financial").text(datas['FINANCIAL'] || 0);
			$("#hospital").text(datas['HOSPITAL'] || 0);
			$("#school").text(datas['SCHOOL'] || 0);
			$("#distributor").text(datas['DISTRIBUTOR'] || 0);
			$("#theater").text(datas['THEATER'] || 0);
			$("#accommodation").text(datas['ACCOMMODATION'] || 0);
			$("#facilities").text(datas['FACILITIES'] || 0);

			$("#"+id+"Top1").text((datas['TOP1'] || '시설').replace(" ",""));

			// 퍼블변경 - 22.01.07
			for(var i=0; i < dataArray.length; i++){
				fillStr += '<SolidColor color="#00A0F3" alpha="1"/>';
			}
		} else {
			xUnit = "요일";
			yUnit = "비율";
			dataArray.push({"xData" : "월요일", "yData" : datas['MON']});
			dataArray.push({"xData" : "화요일", "yData" : datas['TUE']});
			dataArray.push({"xData" : "수요일", "yData" : datas['WEN']});
			dataArray.push({"xData" : "목요일", "yData" : datas['THU']});
			dataArray.push({"xData" : "금요일", "yData" : datas['FRI']});
			dataArray.push({"xData" : "토요일", "yData" : datas['SAT']});
			dataArray.push({"xData" : "일요일", "yData" : datas['SUN']});
			$("#"+id+"Top1").text((datas['TOP1'] || '요일(0%)').replace(" ",""));

			// 퍼블변경 - 22.01.07
			var curBestDay = -1;
			var chkGbnDay = 0;
			for(var i=0; i< dataArray.length; i++){
				if(curBestDay < parseFloat(dataArray[i].yData)){
					curBestDay = parseFloat(dataArray[i].yData);
					chkGbnDay = i;
				}
			}
			for(var i=0; i < dataArray.length; i++){
				if(i == chkGbnDay) {
					fillStr += '<SolidColor color="#00A0F3" alpha="1"/>';
				} else {
					fillStr += '<SolidColor color="#C0C0C0" alpha="1"/>';
				}
			}
		}
		datas = dataArray;

		array.layout =  '<rMateChart backgroundAlpha="0.1" cornerRadius="12" borderStyle="none">'; //backgroundAlpha="0.1" 배경 투명
		array.layout +=	'	<Options>';
//			array.layout += '		<Legend useVisibleCheck="false" position="bottom"  defaultMouseOverAction="true" />'
		array.layout +=	'	</Options>';
		array.layout +=	'	<NumberFormatter id="num" useThousandsSeparator="true"/>';
		// 데이터 따라 표기 소수점 분기 - 22.04.22
		if(id == "selngWeek") {
			array.layout +=	'	<NumberFormatter id="numfmt" useThousandsSeparator="true" precision="1" />';
		} else if(id == "flpopWeekCo") {
			array.layout +=	'	<NumberFormatter id="numfmt" useThousandsSeparator="true" precision="2" />';
		} else {
			array.layout +=	'	<NumberFormatter id="numfmt" useThousandsSeparator="true"/>';
		}
		array.layout +=	'	<Column2DChart displayCompleteCallFunction="rptCmpHandler" showDataTips="true" dataTipFormatter="{numfmt}">'; // showDataTips: false => 마우스 오버시 데이터 표시 제거
		array.layout +=	'		<horizontalAxis>'; // x축
		array.layout +=	'			<CategoryAxis id="hAxis" categoryField="xData" formatter="{num}" displayName="'+xUnit+'" labelJsFunction="axisLabelFunc"  axis="{hAxis}"  labelRotation="45"/>';
		array.layout +=	'		</horizontalAxis>';
		array.layout +=	'		<verticalAxis>'; //y축 정의
		array.layout +=	'			<LinearAxis id="vAxis" displayName="" title="" fontFamily="맑은 고딕"/>';
		array.layout +=	'		</verticalAxis>';
		array.layout +=	'		<series>';
		array.layout +=	'			<Column2DSeries id="series1" yField="yData" displayName="'+yUnit+'" labelPosition="inside" labelAlign="middle" styleName="labelStyle">';
		array.layout +=	'				<fills>';
		if(!fillStr) {
			array.layout +=	'					<SolidColor color="#00A0F3" alpha="1"/>'; //* color:색깔 alpha:투명array.layout +=	'*/
			array.layout +=	'					<SolidColor color="#e77f7e" alpha="1"/>'; //* color:색깔 alpha:투명도 */
			array.layout +=	'					<SolidColor color="#f6cd32" alpha="1"/>'; //* color:색깔 alpha:투명도 */
			array.layout +=	'					<SolidColor color="#b086c9" alpha="1"/>'; //* color:색깔 alpha:투명도 */
			array.layout +=	'					<SolidColor color="#48a6a4" alpha="1"/>'; //* color:색깔 alpha:투명도 */
			array.layout +=	'					<SolidColor color="#7181dd" alpha="1"/>'; //* color:색깔 alpha:투명도 */
			array.layout +=	'					<SolidColor color="#b2c93c" alpha="1"/>'; //* color:색깔 alpha:투명도 */
			array.layout +=	'					<SolidColor color="#5dba5a" alpha="1"/>'; //* color:색깔 alpha:투명도 */
		} else {
			array.layout += fillStr;
		}
		array.layout +=	'				</fills>';
		array.layout +=	'				<showDataEffect>';
		array.layout +=	'					<SeriesInterpolate/>';
		array.layout +=	'				</showDataEffect>';
		array.layout +=	'			</Column2DSeries>';
		array.layout +=	'		</series>';
		array.layout +=	'	</Column2DChart>';
		array.layout +=	'  <Style>';
		array.layout +=	'         .title{color : black ;fontSize : 11;}';
		array.layout +=	'         .labelStyle{paddingTop:6; fontSize:12; color:black;}';
		array.layout +=	'  </Style>';
		array.layout +=	'	</rMateChart>';
	} else if(id == "selngHour" || id =="flpopHourCo") { // 시간대별 매출 & 시간대별 유동인구
		dataArray.push({"xData" : "00~06시", "yData" : datas['HOUR_0006']});
		dataArray.push({"xData" : "06~11시", "yData" : datas['HOUR_0611']});
		dataArray.push({"xData" : "11~14시", "yData" : datas['HOUR_1114']});
		dataArray.push({"xData" : "14~17시", "yData" : datas['HOUR_1417']});
		dataArray.push({"xData" : "17~21시", "yData" : datas['HOUR_1721']});
		dataArray.push({"xData" : "21~24시", "yData" : datas['HOUR_2124']});
		$("#"+id+"Top1").text((datas['TOP1'] || '00 ~ 00').replace("시", "")+"시");
		$("#"+id+"Top1Text").text(((Number((datas['TOP1'] || '00 ~ 00').slice(-2)) > 12) ? "오후시간(":"오전시간(")+(datas['TOP1'] || '00 ~ 00')+"시)");
		datas = dataArray;
		array.layout =  '<rMateChart backgroundAlpha="0.1" cornerRadius="12" borderStyle="none">' //backgroundAlpha="0.1" 배경 투명
			+'	<Options>'
			+'	</Options>'
			+'	<NumberFormatter id="numfmt" useThousandsSeparator="true" precision="1" />'
			+'	<Area2DChart displayCompleteCallFunction="rptCmpHandler" showDataTips="true" dataTipDisplayMode="axis" dataTipFormatter="{numfmt}">'
			+'		<horizontalAxis>'
			+'			<CategoryAxis id="hAxis" categoryField="xData" padding="0.5"/>'
			+'		</horizontalAxis>'
			+'		<verticalAxis>'
			+'			<LinearAxis id="vAxis" minimum="0"/>'
			+'		</verticalAxis>'
			+'		<verticalAxisRenderers>'
			+'			<Axis2DRenderer axis="{vAxis}"/>'
			+'		</verticalAxisRenderers>'
			+'		<series>'
			+'			<Area2DSeries labelPosition="up" yField="yData" form="curve" displayName="매출비율"  styleName="labelStyle">'
			+'				<stroke>'
			+'					<Stroke color="#00A0F3" weight="2"/>'
			+'				</stroke>'
			+'				<showDataEffect>'
			+'					<SeriesInterpolate/>'
			+'				</showDataEffect>'
			+'			</Area2DSeries>'
			+'		</series>'
			+'		<horizontalAxisRenderers>' //x축 라벨에 회전 START
			+'			<Axis2DRenderer axis="{hAxis}" labelRotation="0" fontSize="12" color="black" showLine="true" fontFamily="맑은 고딕"/>'
			+'		</horizontalAxisRenderers>' //x축 라벨에 회전 END
			+'		<verticalAxisRenderers>'
			+'			<Axis2DRenderer axis="{vAxis}" axisTitleStyleName="title" fontSize="12" color="black" showLine="true" fontFamily="맑은 고딕"/>'
			+'		</verticalAxisRenderers>' //x축 라벨에 회전 END
			+'	</Area2DChart>'
			+'  <Style>'
			+'         .labelStyle{paddingTop:6; fontSize:13; color:black;}'
			+'  </Style>'
			+'</rMateChart>';
	} else if(id == "selngSex") { // 성별 매출
		dataArray.push({"name" : "남성", "data" : datas['MAN']});
		dataArray.push({"name" : "여성", "data" : datas['WOMAN']});
		$("#selngSexTop1").text(datas['TOP1'] || '성별(0%)');
		$("#selngSexTop1Text1, #selngSexTop1Text2").text(!datas['TOP1'] ? "성별" : datas['TOP1'].substr(0,2));

		datas = dataArray;
		array.layout = pieChartLayOut("name", "data", "", "right", id);
	} else if(id == "selngSexInduty") { // 대분류업종 성별 매출
		// 외식업은 기존 그대로 가고 나머지는 안쪽 생성
		// 서비스업
		var charVars = "rMateOnLoadCallFunction=rptReadyHandler&usePattern=true"; //웹접근성 패턴 차트 사용
		var tmpArray2 = {};
//			tmpArray2.layout = layout.replace("header", "서비스업");
		tmpArray2.layout = pieChartLayOut("name", "data", "서비스업", "", id+"2");
		//console.log(">>>> 서비스업="+datas['SVC_ML_SELNG_RATE']+":"+datas['SVC_ML_SELNG_RATE'])
		tmpArray2.datas = [
							{"name" : "남성", "data" : datas['SVC_ML_SELNG_RATE']}
							, {"name" : "여성", "data" : datas['SVC_FML_SELNG_RATE']}
							]
		reportInfo[id+"2"] = tmpArray2;
		rMateChartH5.create("chart_"+(id+"2"), (id+"2"), charVars, "100%", "100%");

		// 소매업
//			tmpArray2.layout = layout.replace("header", "소매업");
		var tmpArray3 = {};
		tmpArray3.layout = pieChartLayOut("name", "data", "소매업", "", id+"3");
		tmpArray3.datas = [
							{"name" : "남성", "data" : datas['SML_ML_SELNG_RATE']}
							, {"name" : "여성", "data" : datas['SML_FML_SELNG_RATE']}
							]
		reportInfo[id+"3"] = tmpArray3;
		rMateChartH5.create("chart_"+(id+"3"), (id+"3"), charVars, "100%", "100%");

		// 외식업
//			array.layout = layout.replace("header", "외식업");
		array.layout = pieChartLayOut("name", "data", "외식업", "", id);
		dataArray.push({"name" : "남성", "data" : datas['OUT_ML_SELNG_RATE']});
		dataArray.push({"name" : "여성", "data" : datas['OUT_FML_SELNG_RATE']});
		datas = dataArray;
	} else if(id == "selngAge") { // 연령대별 매출
		$("#selngAgeTitleTop1").text("연령대별 "+(!!datas['TOP_INDUTY_NM'] ? (datas['TOP_INDUTY_NM'] + " ") : "")+"매출 현황");
		var layout =  '<rMateChart backgroundAlpha="0.1" cornerRadius="12" borderStyle="none">' //backgroundAlpha="0.1" 배경 투명
			+'	<Options>'
			+'	</Options>'
			+'	<NumberFormatter id="num" useThousandsSeparator="true"/>'
			+'	<NumberFormatter id="numfmt" useThousandsSeparator="true" precision="1" />'
			+'	<Column2DChart displayCompleteCallFunction="rptCmpHandler" showDataTips="true" dataTipFormatter="{numfmt}">' // showDataTips: false => 마우스 오버시 데이터 표시 제거
			+'		<horizontalAxis>' // x축
			+'			<CategoryAxis id="hAxis" categoryField="xData" displayName="분기" labelJsFunction="axisLabelFunc"  axis="{hAxis}"  labelRotation="45"/>'
			+'		</horizontalAxis>'
			+'		<verticalAxis>' //y축 정의
			+'			<LinearAxis id="vAxis" displayName="" formatter="{num}" title="" fontFamily="맑은 고딕"/>'
			+'		</verticalAxis>'
			+'		<series>'
			+'			<Column2DSeries id="series1" yField="yData" displayName="비율" labelPosition="inside" labelAlign="middle" styleName="labelStyle">'
			+'				<fills>'
//				+'					<SolidColor color="#00A0F3" alpha="1"/>' //* color:색깔 alpha:투명도 */
//				+'					<SolidColor color="#e77f7e" alpha="1"/>' //* color:색깔 alpha:투명도 */
//				+'					<SolidColor color="#f6cd32" alpha="1"/>' //* color:색깔 alpha:투명도 */
//				+'					<SolidColor color="#b086c9" alpha="1"/>' //* color:색깔 alpha:투명도 */
//				+'					<SolidColor color="#48a6a4" alpha="1"/>' //* color:색깔 alpha:투명도 */
//				+'					<SolidColor color="#7181dd" alpha="1"/>' //* color:색깔 alpha:투명도 */
//				+'					<SolidColor color="#b2c93c" alpha="1"/>' //* color:색깔 alpha:투명도 */
			+'					fillArea';
			+'				</fills>'
			+'				<showDataEffect>'
			+'					<SeriesInterpolate/>'
			+'				</showDataEffect>'
			+'			</Column2DSeries>'
			+'		</series>'
			+'	</Column2DChart>'
			+'  <Style>'
			+'         .title{color : black ;fontSize : 11;}'
			+'         .labelStyle{paddingTop:6; fontSize:12; color:black;}'
			+'  </Style>'
			+'	</rMateChart>';
		// 외식업은 기존 그대로 가고 나머지는 안쪽 생성
		var charVars = "rMateOnLoadCallFunction=rptReadyHandler&usePattern=true"; //웹접근성 패턴 차트 사용
		var mainChart = "";
		var subChart = ["OUT", "SVC", "SML"];
		if(datas['TOP_INDUTY_NM'] == "외식업") {
			mainChart = "OUT";
		} else if(datas['TOP_INDUTY_NM'] == "서비스업") {
			mainChart = "SVC";
		} else if(datas['TOP_INDUTY_NM'] == "소매업") {
			mainChart = "SML";
		} else {
			//console.log(id+"의 탑 구분자 값 존재 X")
			return false;
		}
		subChart = subChart.filter(function(item) {
			return item != mainChart;
		});
		//console.log(">>>> subChart");
		//console.log(subChart);
		$("#selngAgeTopInduty1, #selngAgeTop1Text1").text(datas['TOP_INDUTY_NM']);
		$("#selngAgeTop1, #selngAgeTop1Text2").text(datas['TOP1']);

		subChart.forEach(function(item, index, array) {
			var tmpArray = {};
			//console.log(">>> item:"+item);
			tmpArray.layout = layout.replace("header", datas[item+'_LAS_INDUTY_NM']);
			tmpArray.datas = [
								{"xData" : "10대", "yData" : datas[item+'_AGRDE_10_SELNG_RATE']}
								, {"xData" : "20대", "yData" : datas[item+'_AGRDE_20_SELNG_RATE']}
								, {"xData" : "30대", "yData" : datas[item+'_AGRDE_30_SELNG_RATE']}
								, {"xData" : "40대", "yData" : datas[item+'_AGRDE_40_SELNG_RATE']}
								, {"xData" : "50대", "yData" : datas[item+'_AGRDE_50_SELNG_RATE']}
								, {"xData" : "60대 이상", "yData" : datas[item+'_AGRDE_60_ABOVE_SELNG_RATE']}
							]
			tmpArray.subData = datas[item+'_LAS_INDUTY_NM'];
			$("#selngAgeTitleSub"+(index+1)).text("연령대별 "+(!!datas[item+'_LAS_INDUTY_NM'] ? (datas[item+'_LAS_INDUTY_NM'] + " ") : "")+"매출 현황");
			// 퍼블변경 - 22.01.07
			var curBestDay = -1;
			var chkGbnDay = 0;
			var fillStr = "";
			for(var i=0; i< tmpArray.datas.length; i++){
				if(curBestDay < parseFloat(tmpArray.datas[i].yData)){
					curBestDay = parseFloat(tmpArray.datas[i].yData);
					chkGbnDay = i;
				}
			}
			for(var i=0; i < tmpArray.datas.length; i++){
				if(i == chkGbnDay) {
					fillStr += '<SolidColor color="#00A0F3" alpha="1"/>';
				} else {
					fillStr += '<SolidColor color="#C0C0C0" alpha="1"/>';
				}
			}
			tmpArray.layout = tmpArray.layout.replace("fillArea", fillStr);

			var subId = (id+"Sub"+(index+1));
			reportInfo[subId] = tmpArray;
			rMateChartH5.create("chart_"+subId, subId, charVars, "100%", "100%");
		});

		array.layout = layout.replace("header", datas[mainChart+'_LAS_INDUTY_NM']);
		datas = [
					{"xData" : "10대", "yData" : datas[mainChart+'_AGRDE_10_SELNG_RATE']}
					, {"xData" : "20대", "yData" : datas[mainChart+'_AGRDE_20_SELNG_RATE']}
					, {"xData" : "30대", "yData" : datas[mainChart+'_AGRDE_30_SELNG_RATE']}
					, {"xData" : "40대", "yData" : datas[mainChart+'_AGRDE_40_SELNG_RATE']}
					, {"xData" : "50대", "yData" : datas[mainChart+'_AGRDE_50_SELNG_RATE']}
					, {"xData" : "60대 이상", "yData" : datas[mainChart+'_AGRDE_60_ABOVE_SELNG_RATE']}
				];
		// 퍼블변경 - 22.01.07
		var curBestDay = -1;
		var chkGbnDay = 0;
		var fillStr = "";
		for(var i=0; i< datas.length; i++){
			if(curBestDay < parseFloat(datas[i].yData)){
				curBestDay = parseFloat(datas[i].yData);
				chkGbnDay = i;
			}
		}
		for(var i=0; i < datas.length; i++){
			if(i == chkGbnDay) {
				fillStr += '<SolidColor color="#00A0F3" alpha="1"/>';
			} else {
				fillStr += '<SolidColor color="#C0C0C0" alpha="1"/>';
			}
		}
		array.layout = array.layout.replace("fillArea", fillStr);
	} else if(id == "flpopCo" || id == "repopDnstCo" || id == "wrcPopltnHa" || id == "aptHshldCo" || id =="cnvrsnRntchrg") { // 유동인구 & 주거인구 수 & 직장인구 수 & 가구세대수 및 아파트 비아파트 비율 & 임대시세
		var subId = "";
		var subId2 = "";
		var subId3 = "";
		var unit = "";
		var dataName1, dataName2, dataName3 , dataName4 = "";
		if(id == "flpopCo" || id == "repopDnstCo" || id == "wrcPopltnHa" || id == "aptHshldCo") {
			if(id == "flpopCo") {
				reportCompareAdd.flpopCo = datas['TRDAR_TOT_FLPOP_CO_BF_0']; // 리포트용 추가 - 21.12.07

				subId = "TOT_FLPOP";
				subId2 = "TOT_FLPOP_CO";
				subId3 = "FlpopCo";
				unit = "명";
				dataName1 = "선택상권";
				dataName2 = "자치구";
				dataName3 = "서울시";
			} else if(id == "repopDnstCo") {
				reportCompareAdd.repopCo = datas['TRDAR_TOT_REPOP_CO']; // 리포트용 추가 - 21.12.07

				subId = "TOT_REPOP_DNST";
				subId2 = "TOT_REPOP_DNST";
				subId3 = "RepopDnstCo";
				unit = "명";
				dataName1 = "선택상권";
				dataName2 = "자치구";
				dataName3 = "서울시";
			} else if(id == "wrcPopltnHa") {
				reportCompareAdd.wrcPopltnCo = datas['TOT_WRC_POPLTN_CO']; // 리포트용 추가 - 21.12.07

				subId = "TOT_WRC_POPLTN";
				subId2 = "TOT_WRC_POPLTN_HA";
				subId3 = "WrcPopltnHa";
				unit = "명";
				dataName1 = "선택상권";
				dataName2 = "자치구";
				dataName3 = "서울시";
			} else if(id == "aptHshldCo") {
				subId = "HSHLD_CO";
				subId2 = "TOT_HSHLD_CO";
				subId3 = "AptHshldCo";
				unit = "가구";
				dataName1 = "선택상권";
				dataName2 = "자치구";
				dataName3 = "서울시";
			}

			if(id == "flpopCo" || id == "aptHshldCo") {
				$("#"+id+"_co").text(Number((datas['TRDAR_'+subId2+'_BF_0'] || 0)).toLocaleString('en') +unit);
			} else if(id == "wrcPopltnHa") {
				$("#"+id+"_co").text(Number((datas[subId+"_CO"] || 0)).toLocaleString('en') +unit);
			} else {
				$("#"+id+"_co").text(Number((datas['TRDAR_'+(subId2.replace("_DNST","")).replace("_CO","")+"_CO"] || 0)).toLocaleString('en') +unit);
			}
//				$("#"+id+"_dnst").text((id == "wrcPopltnHa") ? Number((datas['TRDAR_'+subId2.replace("_CO","")+'_DNST'] || 0)).toLocaleString('en') +"/㎢" : Number((datas['TRDAR_'+subId2.replace("_CO","")+'_BF_0'] || 0)).toLocaleString('en') +"/㎢");
			$("#"+id+"_dnst").text(Number((datas['TRDAR_'+subId2.replace("_CO","")+'_BF_0'] || 0)).toLocaleString('en') +"명/㎢");

			var yearDiff = (id == "wrcPopltnHa") ? datas['TRDAR_'+subId2+'_YDIFF'] : datas['TRDAR_'+subId2+'_YEAR_DIFF'];
			var quDiff = (id == "wrcPopltnHa") ? datas['TRDAR_'+subId2+'_QIFF'] : datas['TRDAR_'+subId2+'_QU_DIFF'];

			if(yearDiff > 0) {
				$("#trdarTot"+subId3+"YearDiff").attr("class", "increase");
			} else if(yearDiff < 0) {
				$("#trdarTot"+subId3+"YearDiff").attr("class", "decrease");
			} else {
				$("#trdarTot"+subId3+"YearDiff").attr("class", "");
			}
			$("#trdarTot"+subId3+"YearDiff").text(Number(Math.abs(yearDiff || 0)).toLocaleString('en') + unit);

			if(quDiff > 0) {
				$("#trdarTot"+subId3+"QuDiff").attr("class", "increase");
			} else if(quDiff < 0) {
				$("#trdarTot"+subId3+"QuDiff").attr("class", "decrease");
			} else {
				$("#trdarTot"+subId3+"QuDiff").attr("class", "");
			}
			$("#trdarTot"+subId3+"QuDiff").text(Number(Math.abs(quDiff || 0 )).toLocaleString('en') + unit);
		} else if( id == "cnvrsnRntchrg"){
			subId = "RNTCHRG";
			subId2 = "RNTCHRG";
			subId3 = "CnvrsnRntchrg";
			unit = "원";
			dataName1 = "선택상권";
			dataName2 = "자치구";
			dataName3 = "서울시";
			$("#"+id+"_co").text(Number((datas['TRDAR_'+subId2+'_BF_0'] || 0)).toLocaleString('en') +unit);
		}
		for(var i=4; i >= 0; i-- ) {
			//console.log(id+"="+datas[subId+'_QU_BF_'+i] +"?"+(datas['TRDAR_'+subId2+'_BF_'+i] != null )+"?"+( datas['SIGNGU_'+subId2+'_BF_'+i] != null )+"?"+( datas['SIDO_'+subId2+'_BF_'+i] != null))
			if(id == "aptHshldCo") {
				if(!!datas[subId+'_QU_BF_'+i] && datas['TRDAR_'+subId2+'_BF_'+i] != null && datas['SIGNGU_'+subId2+'_BF_'+i] != null) {
					dataArray.push({"xData" : datas[subId+'_QU_BF_'+i], "yData1" : parseFloat(datas['TRDAR_'+subId2+'_BF_'+i]), "yData2" : parseFloat(datas['SIGNGU_'+subId2+'_BF_'+i])});
				}
			} else {
				if(!!datas[subId+'_QU_BF_'+i] && datas['TRDAR_'+subId2+'_BF_'+i] != null && datas['SIGNGU_'+subId2+'_BF_'+i] != null && datas['SIDO_'+subId2+'_BF_'+i] != null) {
					dataArray.push({"xData" : datas[subId+'_QU_BF_'+i], "yData1" : parseFloat(datas['TRDAR_'+subId2+'_BF_'+i]), "yData2" : parseFloat(datas['SIGNGU_'+subId2+'_BF_'+i]), "yData3" : parseFloat(datas['SIDO_'+subId2+'_BF_'+i])});
				}
			}
		}

		// 가구세대 파이차트 추가
		if(id == "aptHshldCo") {
			var charVars = "rMateOnLoadCallFunction=rptReadyHandler&usePattern=true"; //웹접근성 패턴 차트 사용
			var tmpArray = {};
			var tmpId = "trdarAptHshldRt";
			tmpArray.layout = pieChartLayOut("name", "data", "선택 상권", "", tmpId);
			tmpArray.datas = [
								{"name" : "아파트", "data" : datas['APT_HSHLD_RT']}
								, {"name" : "비아파트", "data" : datas['NON_APT_HSHLD_RT']}
								]
			reportInfo[tmpId] = tmpArray;
			rMateChartH5.create("chart_"+tmpId, tmpId, charVars, "100%", "100%");

			tmpId = "signguAptHshldRt";
			tmpArray.layout = pieChartLayOut("name", "data", "자치구", "", tmpId);
			tmpArray.datas = [
								{"name" : "아파트", "data" : datas['SIGNGU_APT_HSHLD_RT']}
								, {"name" : "비아파트", "data" : datas['SIGNGU_NON_APT_HSHLD_RT']}
								]

			reportInfo[tmpId] = tmpArray;
			rMateChartH5.create("chart_"+tmpId, tmpId, charVars, "100%", "100%");
		}

		datas = dataArray;
		array.layout = '<rMateChart backgroundAlpha="0.1" cornerRadius="12" borderStyle="none">';
		array.layout +='	<Options>'
		array.layout +='		<Legend useVisibleCheck="false" position="bottom"  defaultMouseOverAction="true" />'
		array.layout +='	</Options>'
		array.layout +='	<NumberFormatter id="num" useThousandsSeparator="true"/>'
		if(id == "repopDnstCo") {
			array.layout +='	<NumberFormatter id="numfmt" useThousandsSeparator="true" precision="2"/>';
		} else {
			array.layout +='	<NumberFormatter id="numfmt" useThousandsSeparator="true"/>';
		}
		array.layout +='	<Line2DChart dataTipDisplayMode="axis" displayCompleteCallFunction="rptCmpHandler" showDataTips="true" paddingTop="0" dataTipFormatter="{numfmt}">';
		array.layout +='		<horizontalAxis>';
		array.layout +='			<CategoryAxis id="hAxis" categoryField="xData"/>';
		array.layout +='		</horizontalAxis>';
		array.layout +='		<verticalAxis>';
		array.layout +='			<LinearAxis id="vAxis" minimum="0" formatter="{num}"/>';
		array.layout +='		</verticalAxis>';
		array.layout +='		<series>';
		array.layout +='			<Line2DSeries fill="#00A0F3" radius="6" labelPosition="up" yField="yData1" form="curve" displayName="'+dataName1+'" itemRenderer="CircleItemRenderer" styleName="labelStyle">';
		array.layout +='				<lineStroke>';
		array.layout +='					<Stroke color="#00A0F3" weight="3"/>';
		array.layout +='				</lineStroke>';
		array.layout +='				<showDataEffect>';
		array.layout +='					<SeriesInterpolate/>';
		array.layout +='				</showDataEffect>';
		array.layout +='			</Line2DSeries>';
		array.layout +='			<Line2DSeries fill="#FFB83B" radius="6" labelPosition="up" yField="yData2" form="curve" displayName="'+dataName2+'" itemRenderer="CircleItemRenderer" styleName="labelStyle">';
		array.layout +='				<lineStroke>';
		array.layout +='					<Stroke color="#FFB83B" weight="3"/>';
		array.layout +='				</lineStroke>';
		array.layout +='				<showDataEffect>';
		array.layout +='					<SeriesInterpolate/>';
		array.layout +='				</showDataEffect>';
		array.layout +='			</Line2DSeries>';
		if( id != "aptHshldCo") {
			array.layout +='			<Line2DSeries fill="#999999" radius="6" labelPosition="up" yField="yData3" form="curve" displayName="'+dataName3+'" itemRenderer="CircleItemRenderer" styleName="labelStyle">';
			array.layout +='				<lineStroke>';
			array.layout +='					<Stroke color="#999999" weight="3"/>';
			array.layout +='				</lineStroke>';
			array.layout +='				<showDataEffect>';
			array.layout +='					<SeriesInterpolate/>';
			array.layout +='				</showDataEffect>';
			array.layout +='			</Line2DSeries>';
		}

		array.layout +='		</series>';
		array.layout +='	</Line2DChart>';
		array.layout +='  <Style>';
		array.layout +='         .labelStyle{paddingTop:6; fontSize:12; color:black;}';
		array.layout +='  </Style>';
		array.layout +='</rMateChart>';
	} else if(id == "flpopSexAge" || id == "repopSexAge" || id == "wrcPopltnSexAge") { // 성별,연령별 유동인구 & 성별,연령별 주거인구  & 성별,연령별 직장인구
		for(var i=1; i < 7; i++ ) {
			if(datas['MAN_'+i+"0"] != null && datas['WOMAN_'+i+"0"] != null) {
				dataArray.push({"xData" : i+"0대"+ (i== 6 ?" 이상" : ""), "yData1" : parseFloat(datas['MAN_'+i+"0"]), "yData2" : parseFloat(datas['WOMAN_'+i+"0"])});
			}
		}
		$("#"+id+"Top").text((datas['TOP1'] || "성별, 연령대(0%)").replace("60대", "60대 이상").replace("이상이상","이상"));

		datas = dataArray;
		array.layout = '<rMateChart backgroundAlpha="0.1" cornerRadius="12" borderStyle="none">' //backgroundAlpha="0.1" 배경 투명
			+'	<Options>'
			+'		<Legend useVisibleCheck="false" position="bottom"  defaultMouseOverAction="true" />'
			+'	</Options>'
			+'	<NumberFormatter id="num" useThousandsSeparator="true"/>'
			+'	<NumberFormatter id="numfmt" useThousandsSeparator="true" precision="1" />'
			+'	<Column2DChart displayCompleteCallFunction="rptCmpHandler" showDataTips="true" dataTipFormatter="{numfmt}">' // showDataTips: false => 마우스 오버시 데이터 표시 제거
			+'		<horizontalAxis>' // x축
			+'			<CategoryAxis id="hAxis" categoryField="xData" displayName="%" labelJsFunction="axisLabelFunc"  axis="{hAxis}"  labelRotation="45"/>'
			+'		</horizontalAxis>'
			+'		<verticalAxis>' //y축 정의
			+'			<LinearAxis id="vAxis" displayName="%" title="" fontFamily="맑은 고딕" formatter="{num}"/>'
			+'		</verticalAxis>'
			+'		<series>'
			+'			<Column2DSeries id="series2" yField="yData1" displayName="남성" labelPosition="inside" labelAlign="middle" styleName="labelStyle">'
			+'				<fill>'
			+'					<SolidColor color="#00A0F3" alpha="1"/>'
			+'				</fill>'
			+'				<showDataEffect>'
			+'					<SeriesInterpolate/>'
			+'				</showDataEffect>'
			+'			</Column2DSeries>'
			+'			<Column2DSeries id="series3" yField="yData2" displayName="여성" labelPosition="inside" labelAlign="middle" styleName="labelStyle">'
			+'				<fill>' //색상변경 시작
			+'					<SolidColor color="#00CD99" alpha="1"/>'
			+'				</fill>'
			+'				<showDataEffect>'
			+'					<SeriesInterpolate/>'
			+'				</showDataEffect>'
			+'			</Column2DSeries>'
			+'		</series>'
			+'	</Column2DChart>'
			+'  <Style>'
			+'         .title{color : black ;fontSize : 11;}'
			+'         .labelStyle{paddingTop:6; fontSize:12; color:black;}'
			+'  </Style>'
			+'	</rMateChart>';
	} else if(id == "aptPrc") { // 아파트 가격대
		var sg = datas["SIGNGU_NM"] || '자치구';
		dataArray.push({"xData" : "1억 미만", "yData1" : parseFloat(datas["TRDAR_1_HDMIL_BELO_RT"]), "yData2" : parseFloat(datas["SIGNGU_1_HDMIL_BELO_RT"])});
		dataArray.push({"xData" : "1억대", "yData1" : parseFloat(datas["TRDAR_1_HDMIL_RT"]), "yData2" : parseFloat(datas["SIGNGU_1_HDMIL_RT"])});
		dataArray.push({"xData" : "2억대", "yData1" : parseFloat(datas["TRDAR_2_HDMIL_RT"]), "yData2" : parseFloat(datas["SIGNGU_2_HDMIL_RT"])});
		dataArray.push({"xData" : "3억대", "yData1" : parseFloat(datas["TRDAR_3_HDMIL_RT"]), "yData2" : parseFloat(datas["SIGNGU_3_HDMIL_RT"])});
		dataArray.push({"xData" : "4억대", "yData1" : parseFloat(datas["TRDAR_4_HDMIL_RT"]), "yData2" : parseFloat(datas["SIGNGU_4_HDMIL_RT"])});
		dataArray.push({"xData" : "5억대", "yData1" : parseFloat(datas["TRDAR_5_HDMIL_RT"]), "yData2" : parseFloat(datas["SIGNGU_5_HDMIL_RT"])});
		dataArray.push({"xData" : "6억 이상", "yData1" : parseFloat(datas["TRDAR_6_HDMIL_ABOVE_RT"]), "yData2" : parseFloat(datas["SIGNGU_6_HDMIL_ABOVE_RT"])});
		datas = dataArray;
		// 범례 추가 및 세대 수 추가 - 22.04.20
		$("#aeSqmt_prc").text(saveDatas["TOP1"] || "");
		array.layout = '<rMateChart backgroundAlpha="0.1" cornerRadius="12" borderStyle="none">' //backgroundAlpha="0.1" 배경 투명
			+'	<Options>'
			+'		<Legend useVisibleCheck="false" position="bottom"  defaultMouseOverAction="true" />'
			+'	</Options>'
			+'	<NumberFormatter id="num" useThousandsSeparator="true"/>'
			+'	<NumberFormatter id="numfmt" useThousandsSeparator="true" precision="2" />'
			+'	<Column2DChart displayCompleteCallFunction="rptCmpHandler" showDataTips="true" dataTipFormatter="{numfmt}">' // showDataTips: false => 마우스 오버시 데이터 표시 제거
			+'		<horizontalAxis>' // x축
			+'			<CategoryAxis id="hAxis" categoryField="xData" displayName="%" labelJsFunction="axisLabelFunc"  axis="{hAxis}"  labelRotation="45"/>'
			+'		</horizontalAxis>'
			+'		<verticalAxis>' //y축 정의
			+'			<LinearAxis id="vAxis" displayName="%" formatter="{num}" title="" fontFamily="맑은 고딕"/>'
			+'		</verticalAxis>'
			+'		<series>'
			+'			<Column2DSeries id="series2" yField="yData1" displayName="선택상권" labelPosition="inside" labelAlign="middle" styleName="labelStyle">'
			+'				<fill>'
			+'					<SolidColor color="#00A0F3" alpha="1"/>'
			+'				</fill>'
			+'				<showDataEffect>'
			+'					<SeriesInterpolate/>'
			+'				</showDataEffect>'
			+'			</Column2DSeries>'
			+'			<Column2DSeries id="series3" yField="yData2" displayName="'+sg+'" labelPosition="inside" labelAlign="middle" styleName="labelStyle">'
			+'				<fill>' //색상변경 시작
			+'					<SolidColor color="#FFB83B" alpha="1"/>'
			+'				</fill>'
			+'				<showDataEffect>'
			+'					<SeriesInterpolate/>'
			+'				</showDataEffect>'
			+'			</Column2DSeries>'
			+'		</series>'
			+'	</Column2DChart>'
			+'  <Style>'
			+'         .title{color : black ;fontSize : 11;}'
			+'         .labelStyle{paddingTop:6; fontSize:12; color:black;}'
			+'  </Style>'
			+'	</rMateChart>';
	} else if(id == "repopDnst") { // 주거인구 수
		for(var i=0; i < 5; i++ ) {
			if(!!datas['TRDAR_TOT_REPOP_DNST_BF_0'+i] && datas['TRDAR_TOT_REPOP_DNST_BF_'+i] != null && datas['SIGNGU_TOT_REPOP_DNST_BF_'+i] != null && datas['SIDO_TOT_REPOP_DNST_BF_'+i] != null) {
				dataArray.push({"xData" : datas['REPOP_QU_BF_'+i], "yData1" : parseFloat(datas['TRDAR_TOT_REPOP_DNST_BF_'+i]), "yData2" : parseFloat(datas['SIGNGU_TOT_REPOP_DNST_BF_'+i]), "yData3" : parseFloat(datas['SIDO_TOT_REPOP_DNST_BF_'+i])});
			}
		}
		$("#trdarSelngStorAmt").text(Number((datas['TRDAR_SELNG_STOR_AMT_BF_0'] || 0)).toLocaleString('en') +'만원');

		if(datas['TRDAR_SELNG_STOR_AMT_YEAR_DIFF'] > 0) {
			$("#trdarSelngStorAmtYearDiff").attr("class", "increase");
		} else if(datas['TRDAR_SELNG_STOR_AMT_YEAR_DIFF'] < 0) {
			$("#trdarSelngStorAmtYearDiff").attr("class", "decrease");
		} else {
			$("#trdarSelngStorAmtYearDiff").attr("class", "");
		}
		$("#trdarSelngStorAmtYearDiff").text(Number(Math.abs(datas['TRDAR_SELNG_STOR_AMT_YEAR_DIFF'] || 0)).toLocaleString('en') +'만원');

		if(datas['TRDAR_SELNG_STOR_AMT_QU_DIFF'] > 0) {
			$("#trdarSelngStorAmtQuDiff").attr("class", "increase");
		} else if(datas['TRDAR_SELNG_STOR_AMT_QU_DIFF'] < 0) {
			$("#trdarSelngStorAmtQuDiff").attr("class", "decrease");
		} else {
			$("#trdarSelngStorAmtQuDiff").attr("class", "");
		}
		$("#trdarSelngStorAmtQuDiff").text(Number(Math.abs(datas['TRDAR_SELNG_STOR_AMT_QU_DIFF'] || 0 )).toLocaleString('en') +'만원');

		datas = dataArray;
		array.layout = '<rMateChart backgroundAlpha="0.1" cornerRadius="12" borderStyle="none">'
			+'	<NumberFormatter id="numfmt" useThousandsSeparator="true"/>'
			+'	<Line2DChart dataTipDisplayMode="axis" displayCompleteCallFunction="rptCmpHandler" showDataTips="true" paddingTop="0">'
			+'		<horizontalAxis>'
			+'			<CategoryAxis id="hAxis" categoryField="xData"/>'
			+'		</horizontalAxis>'
			+'		<verticalAxis>'
			+'			<LinearAxis id="vAxis" minimum="0"/>'
			+'		</verticalAxis>'
			+'		<series>'
			+'			<Line2DSeries fill="#00A0F3" radius="6" labelPosition="up" yField="yData1" form="curve" displayName="생존율" itemRenderer="CircleItemRenderer" styleName="labelStyle">'
			+'				<lineStroke>'
			+'					<Stroke color="#00A0F3" weight="3"/>'
			+'				</lineStroke>'
			+'				<showDataEffect>'
			+'					<SeriesInterpolate/>'
			+'				</showDataEffect>'
			+'			</Line2DSeries>'
			+'			<Line2DSeries fill="#FFB83B" radius="6" labelPosition="up" yField="yData2" form="curve" displayName="1층 외" itemRenderer="CircleItemRenderer" styleName="labelStyle">'
			+'				<lineStroke>'
			+'					<Stroke color="#FFB83B" weight="3"/>'
			+'				</lineStroke>'
			+'				<showDataEffect>'
			+'					<SeriesInterpolate/>'
			+'				</showDataEffect>'
			+'			</Line2DSeries>'
			+'			<Line2DSeries fill="#5dba5a" radius="6" labelPosition="up" yField="yData3" form="curve" displayName="전체" itemRenderer="CircleItemRenderer" styleName="labelStyle">'
			+'				<lineStroke>'
			+'					<Stroke color="#5dba5a" weight="3"/>'
			+'				</lineStroke>'
			+'				<showDataEffect>'
			+'					<SeriesInterpolate/>'
			+'				</showDataEffect>'
			+'			</Line2DSeries>'
			+'		</series>'
			+'	</Line2DChart>'
			+'  <Style>'
			+'         .labelStyle{paddingTop:6; fontSize:12; color:black;}'
			+'  </Style>'
			+'</rMateChart>';
	} else if ( id == "expndtr") {
		dataArray.push({"name" : "음식", "data" :datas['FOOD']});
		dataArray.push({"name" : "의류", "data" :datas['CLOTHES']});
		dataArray.push({"name" : "생활용품", "data" :datas['HOUSEHOLD_GOOS']});
		dataArray.push({"name" : "의료비", "data" :datas['MEDICAL_EXPENSES']});
		dataArray.push({"name" : "교통", "data" :datas['TRAFFIC']});
		dataArray.push({"name" : "여가", "data" :datas['LEISURE']});
		dataArray.push({"name" : "문화", "data" :datas['CULTURE']});
		dataArray.push({"name" : "교육", "data" :datas['EDUCATION']});
		dataArray.push({"name" : "유흥", "data" :datas['PLEASURE']});

		$("#"+id+"Top1").text((datas['TOP1'] || '시설').replace(" ",""));

		datas = dataArray;
		// direction="vertical" 옵션을 넣으면 그래패턴 안먹어서 영역 문제로 범례 바텀으로 변경 - 22.05.03
		array.layout = pieChartLayOut("name", "data", "", "bottom", id);
	} else if(id == "compareStore" || id == "compareSelngAmt" || id == "compareFlpopCo" || id == "compareOpening" || id == "compareRepopDnstCo" || id == "compareWrcPopltnHa") {
		xUnit = "지역";
		datas.forEach(function(info, index,array){
			if(id == "compareStore") {
				yUnit = "점포수";
				dataArray.push({"xData" : info["analsTrdarNm"], "yData" : (!info['storCo'] ? 0 : parseFloat(info['storCo']))});
			} else if(id == "compareSelngAmt") {
				yUnit = "매출액";
				dataArray.push({"xData" : info["analsTrdarNm"], "yData" : (!info['selngAmtAvg'] ? 0 : parseFloat(info['selngAmtAvg']))});
			} else if(id == "compareFlpopCo") {
				yUnit = "유동인구";
				dataArray.push({"xData" : info["analsTrdarNm"], "yData" : (!info['flpopCo'] ? 0 : parseFloat(info['flpopCo']))});
			} else if(id == "compareOpening") {
				yUnit = "평균영업기간";
				dataArray.push({"xData" : info["analsTrdarNm"], "yData" : (!info['saleMtAvg'] ? 0 : parseFloat(info['saleMtAvg']))});
			} else if(id == "compareRepopDnstCo") {
				yUnit = "주거인구";
				dataArray.push({"xData" : info["analsTrdarNm"], "yData" : (!info['repopCo'] ? 0 : parseFloat(info['repopCo']))});
			} else if(id == "compareWrcPopltnHa") {
				yUnit = "직장인구";
				dataArray.push({"xData" : info["analsTrdarNm"], "yData" : (!info['wrcPopltnCo'] ? 0 : parseFloat(info['wrcPopltnCo']))});
			}
		})

		datas = dataArray;
		array.layout = '<rMateChart backgroundAlpha="0.1" cornerRadius="12" borderStyle="none">' //backgroundAlpha="0.1" 배경 투명
		array.layout +='	<Options>'
		array.layout +='		<Caption text="'+yUnit+'"/>'
		array.layout +='	</Options>'
		array.layout +='	<NumberFormatter id="num" useThousandsSeparator="true"/>';
		array.layout +='	<NumberFormatter id="numfmt" '+(id == "compareOpening" ? 'precision="1" ' : "")+'useThousandsSeparator="true"/>'
		array.layout +='	<Column2DChart displayCompleteCallFunction="rptCmpHandler" showDataTips="true" dataTipFormatter="{numfmt}">' // showDataTips: false => 마우스 오버시 데이터 표시 제거
		array.layout +='		<horizontalAxis>' // x축
		array.layout +='			<CategoryAxis id="hAxis" categoryField="xData" displayName="'+xUnit+'" labelJsFunction="axisLabelFunc"  axis="{hAxis}"  labelRotation="45"/>'
		array.layout +='		</horizontalAxis>'
		array.layout +='		<verticalAxis>' //y축 정의
		array.layout +='			<LinearAxis id="vAxis" displayName="" formatter="{num}" title="" fontFamily="맑은 고딕"/>'
		array.layout +='		</verticalAxis>'
		array.layout +='		<series>'
		array.layout +='			<Column2DSeries id="series1" yField="yData" displayName="'+yUnit+'" labelPosition="inside" labelAlign="middle" styleName="labelStyle">'
		array.layout +='				<fills>'
		array.layout +='					<SolidColor color="#e02171"/>'
		array.layout +='					<SolidColor color="#32caaf"/>'
		if(datas.length > 2) {
			array.layout +='					<SolidColor color="#3b99ce"/>'
		}
		array.layout +='				</fills>'
		array.layout +='				<showDataEffect>'
		array.layout +='					<SeriesInterpolate/>'
		array.layout +='				</showDataEffect>'
		array.layout +='			</Column2DSeries>'
		array.layout +='		</series>'
		array.layout +='	</Column2DChart>'
		array.layout +='  <Style>'
		array.layout +='         .title{color : black ;fontSize : 11;}'
		array.layout +='         .labelStyle{paddingTop:6; fontSize:12; color:black;}'
		array.layout +='  </Style>'
		array.layout +='	</rMateChart>';
	} else if(id == "aeSqmt") { // 아파트 세대
		$("#aeSqmt_area").text(!datas["TOP1"]? "" : datas["TOP1"].replace("M", "㎡").replace("미만", " 미만"));
		var sg = datas["SIGNGU_NM"] || '자치구';

		dataArray.push({"xData" : "66㎡대 미만", "yData1" : datas["TRDAR_AE_66_SQMT_BELO"], "yData2" : datas["SIGNGU_AE_66_SQMT_BELO"]});
		dataArray.push({"xData" : "66㎡대", "yData1" : datas["TRDAR_AE_66_SQMT"], "yData2" : datas["SIGNGU_AE_66_SQMT"]});
		dataArray.push({"xData" : "99㎡대", "yData1" : datas["TRDAR_AE_99_SQMT"], "yData2" : datas["SIGNGU_AE_99_SQMT"]});
		dataArray.push({"xData" : "132㎡대", "yData1" : datas["TRDAR_AE_132_SQMT"], "yData2" : datas["SIGNGU_AE_132_SQMT"]});
		dataArray.push({"xData" : "165㎡대", "yData1" : datas["TRDAR_AE_165_SQMT"], "yData2" : datas["SIGNGU_AE_165_SQMT"]});
		datas = dataArray;

		array.layout = '<rMateChart backgroundAlpha="0.1" cornerRadius="12" borderStyle="none">';
		array.layout +='	<Options>';
		array.layout +='		<Legend useVisibleCheck="false" position="bottom"  defaultMouseOverAction="true" />';
		array.layout +='	</Options>';
		array.layout +='	<NumberFormatter id="numfmt" useThousandsSeparator="true"/>';
			/* 라인차트에서 막대차트로 변경 요청 - 22.04.20 
			array.layout +='	<Line2DChart dataTipDisplayMode="axis" displayCompleteCallFunction="rptCmpHandler" showDataTips="true" paddingTop="0">';
			array.layout +='		<horizontalAxis>';
			array.layout +='			<CategoryAxis id="hAxis" categoryField="xData"/>'; 
			array.layout +='		</horizontalAxis>';
			array.layout +='		<verticalAxis>';
			array.layout +='			<LinearAxis id="vAxis" minimum="0"/>';
			array.layout +='		</verticalAxis>';
			array.layout +='		<series>';
			array.layout +='			<Line2DSeries fill="#00A0F3" radius="6" labelPosition="up" yField="yData1" form="curve" displayName="선택영역" itemRenderer="CircleItemRenderer" styleName="labelStyle">';
			array.layout +='				<lineStroke>';
			array.layout +='					<Stroke color="#00A0F3" weight="3"/>';
			array.layout +='				</lineStroke>';
			array.layout +='				<showDataEffect>';
			array.layout +='					<SeriesInterpolate/>'; 
			array.layout +='				</showDataEffect>';
			array.layout +='			</Line2DSeries>';
			array.layout +=('			<Line2DSeries fill="#FFB83B" radius="6" labelPosition="up" yField="yData2" form="curve" displayName="'+sg+'" itemRenderer="CircleItemRenderer" styleName="labelStyle">');
			array.layout +='				<lineStroke>';
			array.layout +='					<Stroke color="#FFB83B" weight="3"/>';
			array.layout +='				</lineStroke>';
			array.layout +='				<showDataEffect>';
			array.layout +='					<SeriesInterpolate/>'; 
			array.layout +='				</showDataEffect>';
			array.layout +='			</Line2DSeries>';
			array.layout +='		</series>';
			array.layout +='	</Line2DChart>';
			*/
		array.layout +='	<Column2DChart displayCompleteCallFunction="rptCmpHandler" showDataTips="true" dataTipFormatter="{numfmt}">'; // showDataTips: false => 마우스 오버시 데이터 표시 제거
		array.layout +='		<horizontalAxis>'; // x축
		array.layout +='			<CategoryAxis id="hAxis" categoryField="xData" displayName="'+xUnit+'" labelJsFunction="axisLabelFunc"  axis="{hAxis}"  labelRotation="45"/>';
		array.layout +='		</horizontalAxis>';
		array.layout +='		<verticalAxis>'; //y축 정의
		array.layout +='			<LinearAxis id="vAxis" displayName="" formatter="{numfmt}" title="" fontFamily="맑은 고딕"/>';
		array.layout +='		</verticalAxis>';
		array.layout +='		<series>';
		array.layout +='			<Column2DSeries id="series1" yField="yData1" displayName="선택상권" labelPosition="inside" labelAlign="middle" styleName="labelStyle">';
		array.layout +='				<fill>';
		array.layout +='					<SolidColor color="#00A0F3"/>';
		array.layout +='				</fill>';
		array.layout +='				<showDataEffect>';
		array.layout +='					<SeriesInterpolate/>';
		array.layout +='				</showDataEffect>';
		array.layout +='			</Column2DSeries>';
		array.layout +='			<Column2DSeries id="series2" yField="yData2" displayName="'+sg+'" labelPosition="inside" labelAlign="middle" styleName="labelStyle">';
		array.layout +='				<fill>';
		array.layout +='					<SolidColor color="#FFB83B"/>';
		array.layout +='				</fill>';
		array.layout +='				<showDataEffect>';
		array.layout +='					<SeriesInterpolate/>';
		array.layout +='				</showDataEffect>';
		array.layout +='			</Column2DSeries>';
		array.layout +='		</series>';
		array.layout +='	</Column2DChart>';
		array.layout +='  <Style>';
		array.layout +='         .labelStyle{paddingTop:6; fontSize:12; color:black;}';
		array.layout +='  </Style>';
		array.layout +='</rMateChart>';
	} else {
		console.log("구분자 존재하지 않음 : "+id);
		return false;
	}
	array.datas = datas;
	array.origin = saveDatas;
	reportInfo[id] = array;

	setDesc(id, saveDatas, report);
	return true;
}

//레포트 포지션
function setRptChtPosition() {
	$(".rMateChartH5__Main").css("position","static");
	$(".rMateChartH5__Root").css("position","static");
}

//공통 레포트 완료시 패턴적용여부 적용
function rptCmpHandler(chartId) {
	//console.log(">>>> rptCmpHandler:"+chartId)
	var id = chartId.replace("chart_", "");
	var obj = document.getElementById(id);
	if(obj != undefined && obj != null &&
			obj["setLayout"] != undefined && obj["setLayout"] != null){
		obj.accessibilityPattern(reportPattern); // 그래프 패턴 고정

	}
}

function pieChartLayOut(xLine, yLine, title, legendDirection, id) {
	var layout =  '<rMateChart backgroundAlpha="0.1" cornerRadius="12" borderStyle="none">' //backgroundAlpha="0.1" 배경 투명
	layout +=  '	<Options>'
	// 퍼블변경으로 인한 타이틀 방법 변경 - 21.12.16
	if(!!id && !!title) {
		$("#"+id).closest("div.chartArea").find("p.title").text(title);
	}
//		if(!!title) {
//			layout +=  '		<Caption text="'+title+'"/>'
//		}
	if(!!legendDirection) {
		// direction="vertical" 옵션을 넣으면 그래패턴 안먹어서 삭제 - 22.05.03
		layout +=  '		<Legend defaultMouseOverAction="false" useVisibleCheck="true" position="'+legendDirection+'" />';
	}
	layout +=  '	</Options>';
	layout +=  '	<Pie2DChart displayCompleteCallFunction="rptCmpHandler" showDataTips="true">';
	layout +=  '		<series>';
	layout +=  '			<Pie2DSeries nameField="'+(!xLine ? "name": xLine)+'" field="'+(!yLine ? "data": yLine)+'" startAngle="90" labelPosition="insideWithCallout" styleName="labelStyle">';
	layout +=  '              <fills>';
	if(id == "expndtr") {
		layout +=  '				<SolidColor color="#00A0F3" alpha="1"/>'; //* color:색깔 alpha:투명도 */
		layout +=  '				<SolidColor color="#00CD99" alpha="1"/>'; //* color:색깔 alpha:투명도 */
		layout +=  '				<SolidColor color="#FFB83B" alpha="1"/>'; //* color:색깔 alpha:투명도 */
		layout +=  '				<SolidColor color="#9576FD" alpha="1"/>'; //* color:색깔 alpha:투명도 */
		layout +=  '				<SolidColor color="#FF8DBD" alpha="1"/>'; //* color:색깔 alpha:투명도 */
		layout +=  '				<SolidColor color="#FA8316" alpha="1"/>'; //* color:색깔 alpha:투명도 */
		layout +=  '				<SolidColor color="#7DE412" alpha="1"/>'; //* color:색깔 alpha:투명도 */
		layout +=  '				<SolidColor color="#47CDF8" alpha="1"/>'; //* color:색깔 alpha:투명도 */
		layout +=  '				<SolidColor color="#FF6B6B" alpha="1"/>'; //* color:색깔 alpha:투명도 */
	} else {
		layout +=  '				<SolidColor color="#00A0F3" alpha="1"/>'; //* color:색깔 alpha:투명도 */
		layout +=  '				<SolidColor color="#00CD99" alpha="1"/>'; //* color:색깔 alpha:투명도 */
		layout +=  '				<SolidColor color="#f6cd32" alpha="1"/>'; //* color:색깔 alpha:투명도 */
		layout +=  '				<SolidColor color="#b086c9" alpha="1"/>'; //* color:색깔 alpha:투명도 */
		layout +=  '				<SolidColor color="#48a6a4" alpha="1"/>'; //* color:색깔 alpha:투명도 */
		layout +=  '				<SolidColor color="#7181dd" alpha="1"/>'; //* color:색깔 alpha:투명도 */
		layout +=  '				<SolidColor color="#b2c93c" alpha="1"/>'; //* color:색깔 alpha:투명도 */
		layout +=  '				<SolidColor color="#5dba5a" alpha="1"/>'; //* color:색깔 alpha:투명도 */
		layout +=  '				<SolidColor color="#ffbb00" alpha="1"/>'; //* color:색깔 alpha:투명도 */
	}
	layout +=  '              </fills>'
	layout +=  '				<showDataEffect>'
	layout +=  '					<SeriesInterpolate duration="1000"/>'
	layout +=  '				</showDataEffect>'
	layout +=  '			</Pie2DSeries>'
	layout +=  '		</series>'
	layout +=  '	</Pie2DChart>'
	layout +=  '  <Style>'
	layout +=  '     .labelStyle{paddingTop:6;fontSize:14;color:black;}'
	layout +=  '  </Style>'
	layout +=  '</rMateChart>';

	return layout
}

function setDesc(id, datas, report) {

	const data = report

	var descStr = "";

	var code1 = (Math.floor(Math.random()*2)+1)==1?'A':'B';
	var searchParams = {};
	let trdarNm = "<strong>" + data.name + "</strong>"
	let svcNm = "<strong>" + data.industryName + "</strong>"

	if(id == "store") { // 점포수
		var curTtot = Number(datas['STOR_CO']);
		var prevTtot = Number(datas['STOR_CO_BF_1']);
		var prev1Ttot = Number(datas['STOR_CO_BF_4']);
		var code1 = (Math.floor(Math.random()*2)+1)==1?'A':'B';
		//추가
		if(curTtot == undefined || curTtot == null || curTtot == 0)
			code1 = "C";
		searchParams.step1 = "RT_02_A_01_"+code1+"_L1";
		searchParams.step2 = "RT_02_A_01_"+code1+"_L2";
		if(code1 == 'A'){
			//전분기 비교
			if(curTtot > prevTtot) searchParams.dgnss = "2";//증감
			else{
				if(curTtot == prevTtot) searchParams.dgnss = "0"; //동일
				else searchParams.dgnss = "1"; //감소
			}
		}else if(code1 == 'B'){
			//전년분기 비교
			if(curTtot > prev1Ttot) searchParams.dgnss = "2";//증감
			else{
				if(curTtot == prev1Ttot) searchParams.dgnss = "0"; //동일
				else searchParams.dgnss = "1"; //감소
			}
		}
		var result = getSyncAjaxData(searchParams, "/report/cmm/desc.json");
		if(result != null && result.length > 0){
			var text = result[0].txt;
			if(code1 != 'C'){
				//A 또는 B일 경우
				text = text.replace("(%P1)", svcNm);
				var comment = "<strong>정체</strong> 상태입니다.";
				if(searchParams.dgnss == "1") comment = "<strong>감소</strong>하고 있습니다.";
				else if(searchParams.dgnss == "2") comment = "<strong>증가</strong>하고 있습니다.";
				text = text.replace("(%P2)", comment);
			}
			descStr = text;
		}
	} else if(id == "being") { // 생존율
		var curTRt3 = Number(datas['STDR_BEING_RT']);
		var prev1Trt3 = Number(datas['STDR_BEING_RT_BF_4']);
		if(curTRt3 > prev1Trt3) searchParams.dgnss = "1";//증감
		else if(curTRt3 < prev1Trt3)  searchParams.dgnss = "0";//감소
		else searchParams.dgnss = "2";//동일

		code1 = (Math.floor(Math.random()*3)+1);
		if(code1 == 1) code1 = "A"
		else{
			if(code1 == 2) code1 = "B";
			else code1 = "C";
		}
		//추가
		if(curTRt3 == undefined || curTRt3 == null || curTRt3 == 0){
			code1 = 'D';
		}
		searchParams.step1 = "RT_02_A_03_"+code1+"_L1";
		searchParams.step2 = "RT_02_A_03_"+code1+"_L2";
		var result = getSyncAjaxData(searchParams, "/report/cmm/desc.json");
		if(result != null && result.length > 0){
			var text = result[0].txt;
			if(code1 != 'D'){
				var comment = "";
				if(code1 == 'A' || code1 == 'B'){
					comment = "큰 변동이 없습니다.";
					if(searchParams.dgnss == "0") comment = "<strong>감소</strong>하고 있습니다.";
					else if(searchParams.dgnss == "1") comment = "<strong>증가</strong>하고 있습니다.";
				}else if(code1 == 'C'){
					comment = "<strong>동일</strong>합니다.";
					if(searchParams.dgnss == "0") comment = "<strong>감소</strong>했습니다.";
					else if(searchParams.dgnss == "1") comment = "<strong>증가</strong>했습니다.";
				}
				text = text.replace("(%P1)", comment);
			}
			descStr = text;
		}
	} else if(id == "opening") { // 평균 영업기간
		var curTSale = parseFloat(datas["TRDAR_SALE_MT_AVG"]);
		var curSiSale = parseFloat(datas["SIGNGU_MT_AVG"]);
		var curSgSale = parseFloat(datas["MEGA_MT_AVG"]);

		//추가 (기존사용하던거랑 차별화 문제로 변수명에 1붙임 의미없음)
		var curTSaleRt1  = parseFloat(datas["TRDAR_SALE_MT_AVG"]);  // / 12
		var curSiSaleRt1 = parseFloat(datas["SIGNGU_MT_AVG"]);  // 12
		var curSgSaleRt1 = parseFloat(datas["MEGA_MT_AVG"]);  // /12

		if(curTSale > curSiSale) searchParams.dgnss = "1";//증감
		else if(curTSale < curSiSale) searchParams.dgnss = "0";//감소
		else  searchParams.dgnss = "2";//동일

		code1 = (Math.floor(Math.random()*2)+1)==1?'A':'B';
		//추가
		if(curTSale == undefined || curTSale == null || curTSale == 0){
			code1 = "C";
		}
		searchParams.step1 = "RT_02_A_04_"+code1+"_L1";
		searchParams.step2 = "RT_02_A_04_"+code1+"_L2";
		var result = getSyncAjaxData(searchParams, "/report/cmm/desc.json");
		if(result != null && result.length > 0){
			var text = result[0].txt;
			if(code1 == 'A'){
				var curTSalert = 0;
				if(curTSale > 0) curTSalert = Number(curTSaleRt1);//Math.round((curTSale/12),0);
				var curSgSalert = 0;
				if(curSgSale > 0) curSgSalert = Number(curSgSaleRt1); //Math.round((curSgSale/12),0);
				var curSiSalert = 0;
				if(curSiSale > 0) curSiSalert = Number(curSiSaleRt1);//Math.round((curSiSale/12),0);
				text = text.replace("(%P1)", svcNm); //업종
				text = text.replace("(%P2)", ("<strong>"+curTSalert+"년"+"</strong>")); //상권평균영업기간
				text = text.replace("(%P3)", ("<strong>"+curSgSalert+"년"+"</strong>")); //자치구평균영업기간
				text = text.replace("(%P4)", ("<strong>"+curSiSalert+"년"+"</strong>")); //서울평균영업기간
			}else if(code1 == 'B'){
				var comment = "기에 자료가 부족합니다.";
				if(searchParams.dgnss == "0") comment = "여 낮습니다.";
				else if(searchParams.dgnss == "1") comment = "여 높습니다.";
				text = text.replace("(%P1)", comment); //비교값
			}
			descStr = text;
		}
	} else if(id == "opbiz" || id == "clsbiz") { // 개업 & 폐업
		if(!!reportInfo.opbiz && !!reportInfo.clsbiz){
			var curTOpz = Number(reportInfo.opbiz.origin["OPBIZ_STOR_CO"]);
			var curTClz = Number(reportInfo.clsbiz.origin["CLSBIZ_STOR_CO"]);
			var prevTOpz = Number(reportInfo.opbiz.origin["OPBIZ_STOR_CO_BF_1"]);
			var prevTClz = Number(reportInfo.clsbiz.origin["CLSBIZ_STOR_CO_BF_1"]);
			var gbnOpz = curTOpz - prevTOpz;
			var gbnClz = curTClz - prevTClz;
			if(gbnOpz > 0 && gbnClz > 0)
				searchParams.dgnss = "3";
			else if(gbnOpz > 0 && gbnClz <= 0)
				searchParams.dgnss = "2";
			else if(gbnOpz < 0 && gbnClz > 0)
				searchParams.dgnss = "1";
			else searchParams.dgnss = "0";

			code1 = (Math.floor(Math.random()*2)+1)==1?'A':'B';
			//추가
			if(curTOpz == undefined || curTOpz == null || curTOpz == 0){
				code1 = "C";
			}
			searchParams.step1 = "RT_02_A_05_"+code1+"_L1";
			searchParams.step2 = "RT_02_A_05_"+code1+"_L2";
			var result = getSyncAjaxData(searchParams, "/report/cmm/desc.json");
			if(result != null && result.length > 0){
				var text = result[0].txt;
				if(code1 == 'A'){
					var comment = "동일";
					if(gbnOpz < 0) comment = "감소";
					else if(gbnOpz > 0) comment = "증가";
					text = text.replace("(%P1)", ("<strong>"+comment+"</strong>")); //비교값
					comment = "<strong>동일</strong>합니다.";
					if(gbnClz < 0) comment = "<strong>감소</strong>하고 있습니다.";
					else if(gbnClz > 0) comment = "<strong>증가</strong>하고 있습니다.";
					text = text.replace("(%P2)", comment); //비교값
				}else if(code1 == 'B'){
					var comment = "정체상태";
					if(gbnOpz < 0) comment = "감소추세";
					else if(gbnOpz > 0) comment = "증가추세";
					text = text.replace("(%P1)", ("<strong>"+comment+"</strong>")); //비교값
					comment = "정체상태";
					if(gbnClz < 0) comment = "감소추세";
					else if(gbnClz > 0) comment = "증가추세";
					text = text.replace("(%P2)", ("<strong>"+comment+"</strong>")); //비교값
				}
				descStr = text;
				if(id == "opbiz") {
					$("#clsbiz").closest("ul").find("li.detail").html(descStr);
					reportInfo.clsbiz.desc = text.split("<strong>").join("");
					reportInfo.clsbiz.desc = text.split("</strong>").join("")


				} else {
					$("#opbiz").closest("ul").find("li.detail").html(descStr);
					reportInfo.opbiz.desc = text.split("<strong>").join("");
					reportInfo.opbiz.desc = text.split("</strong>").join("");

				}
			}
		}
		} else if(id == "induty" || id == "induty2") { // 업종분포
			/*
			var curCd10 = parseFloat(datas["CS1_STOR_CO_0"]);
			var curCd20 = parseFloat(datas["CS2_STOR_CO_0"]);
			var curCd30 = parseFloat(datas["CS3_STOR_CO_0"]);
			var prevCd10 = parseFloat(datas["CS1_STOR_CO_1"]);
			var prevCd20 = parseFloat(datas["CS2_STOR_CO_1"]);
			var prevCd30 = parseFloat(datas["CS3_STOR_CO_1"]);

			//증감 단순 가감
			var rtCd10 = curCd10 - prevCd10;
			var rtCd20 = curCd20 - prevCd20;
			var rtCd30 = curCd30 - prevCd30;

			code1 = (Math.floor(Math.random()*3)+1);
			if(code1 == 1) code1 = "A"
			else{
				if(code1 == 2) code1 = "B";
				else code1 = "C";
			}
			searchParams.step1 = "RT_02_A_06_"+code1+"_L1";
			searchParams.step2 = "RT_02_A_06_"+code1+"_L2";
			if(code1 == 'C'){
				if(rtCd10 > rtCd20 && rtCd10 > rtCd30) searchParams.dgnss = 2;
				else if(rtCd20 > rtCd10 && rtCd20 > rtCd30) searchParams.dgnss = 1;
				else searchParams.dgnss = 0;
			}else{
				if(curCd10 > curCd20 && curCd10 > curCd30) searchParams.dgnss = 2;
				else if(curCd20 > curCd10 && curCd20 > curCd30) searchParams.dgnss = 1;
				else searchParams.dgnss = 0;
			}
			*/
		if(!!reportInfo && !!reportInfo.induty && !!reportInfo.induty2) {
				// 변경 파라미터 - 22.03.22
			code1 = (Math.floor(Math.random()*3)+1);
			if(code1 == 1) code1 = "A"
				else{
					if(code1 == 2) code1 = "B";
					else code1 = "C";
				}

			searchParams.step1 = "RT_02_A_06_"+code1+"_L1";
			searchParams.step2 = "RT_02_A_06_"+code1+"_L2";
				/* 기존 분기 전 
				if(datas["INDUTY_TOP1"] == "CS1_STOR_CO") { searchParams.dgnss = "2"; } 
				else if(datas["INDUTY_TOP1"] == "CS2_STOR_CO") { searchParams.dgnss = "1"; }
				else { searchParams.dgnss = "0"; }

				var result = getSyncAjaxData(searchParams, "/report/cmm/desc.json");
				if(result != null && result.length > 0){
					var text = result[0].txt;
					var comment = '<strong>외식업</strong>(이)';
					if(searchParams.dgnss == '1') comment = '<strong>서비스업(이)</strong>';
					else if(searchParams.dgnss == '0') comment = '<strong>소매업(이)</strong>';
					if(code1 == 'A'){
						text = text.replace("(%P1)", comment); //비교값
					}else if(code1 == 'B'){
						text = text.replace("(%P1)", comment); //비교값
					}else if(code1 == 'C'){
						text = text.replace("(%P1)", trdarNm); //비교값			
						text = text.replace("(%P2)", comment); //비교값
						text = text.replace("(%P3)", "증가"); //비교값
					}
					descStr = text;
				}
				*/
				// CS1_STOR_CO --외식업 ,CS2_STOR_CO --서비스업, CS3_STOR_CO --소매업
			if(reportInfo.induty2.origin.INDUTY_TOP1.trim() == "외식업") { searchParams.dgnss = "2"; }
			else if(reportInfo.induty2.origin.INDUTY_TOP1.trim() == "서비스업") { searchParams.dgnss = "1"; }
			else { searchParams.dgnss = "0"; }
			var result = getSyncAjaxData(searchParams, "/report/cmm/desc.json");
			if(result != null && result.length > 0){
				var text = result[0].txt;
					// 추가 내역 - 22.04.17
//					if(reportInfo.induty.orgin.INDUTY_TOP1 == "CS1_STOR_CO") { searchParams.dgnss = "2"; } 
//					else if(reportInfo.induty.orgin.INDUTY_TOP1 == "CS2_STOR_CO") { searchParams.dgnss = "1"; }
//					else { searchParams.dgnss = "0"; }
				var comment = '<strong>외식업</strong>(이)';
				if(reportInfo.induty.origin.INDUTY_TOP1 == "CS2_STOR_CO") comment = '<strong>서비스업(이)</strong>';
				else if(reportInfo.induty.origin.INDUTY_TOP1 == "CS3_STOR_CO") comment = '<strong>소매업(이)</strong>';
				if(code1 == 'A'){
					text = text.replace("(%P1)", comment); //비교값
				}else if(code1 == 'B'){
					text = text.replace("(%P1)", comment); //비교값
				}else if(code1 == 'C'){
					text = text.replace("(%P1)", trdarNm); //비교값
					text = text.replace("(%P2)", comment); //비교값
					text = text.replace("(%P3)", "증가"); //비교값
				}
				descStr = text.replace("음식업종", "외식업종"); // 요청반영 - 22.04.18
			}
		}
	} else if(id == "selngAmt") { // 매출액
		var curTAmt = Number(datas["TRDAR_SELNG_STOR_AMT_BF_0"]);
		var curSgAmt = Number(datas["SIGNGU_SELNG_STOR_AMT_BF_0"]);
		var prev1TAmt = Number(datas["TRDAR_SELNG_STOR_AMT_BF_4"]);

		var code1 = (Math.floor(Math.random()*3)+1);
		if(code1 == 1) code1 = "A";
		else{
			if(code1 == 2) code1 = "B";
			else code1 = "C";
		}
			//console.log(">>>>> curTAmt:"+curTAmt)
			//추가
//			if(curTAmt == undefined || curTAmt == null || curTAmt <= 5000000){
		if(curTAmt == undefined || curTAmt == null){ //조건 확인
			code1 = "D";
		}
		searchParams.step1 = "RT_03_A_01_"+code1+"_L1";
		searchParams.step2 = "RT_03_A_01_"+code1+"_L2";
		if(code1 == 'C'){
			if((curTAmt - curSgAmt) > 0) searchParams.dgnss = 1;
			else if((curTAmt - curSgAmt) < 0) searchParams.dgnss = 0;
			else  searchParams.dgnss = 2;
		}else{
			if(code1 != 'D'){
				if((curTAmt - prev1TAmt) > 0) searchParams.dgnss = 1;
				else if((curTAmt - prev1TAmt) < 0) searchParams.dgnss = 0;
				else  searchParams.dgnss = 2;
			}
		}
		var result = getSyncAjaxData(searchParams, "/report/cmm/desc.json");
		if(result != null && result.length > 0){
			var text = result[0].txt;
			var comment = "동일합니다.";
			if(searchParams.dgnss == 1) comment = "증가 추세입니다.";
			else if(searchParams.dgnss == 0) comment = "감소 추세입니다.";
			if(code1 == 'A'){
				text = text.replace('(%P1)', trdarNm);
				text = text.replace('(%P2)', svcNm);
				text = text.replace('(%P3)', comment);
				text = text.replace('(%P4)', svcNm);
			}else if(code1 == 'B'){
				text = text.replace('(%P1)', comment);
				text = text.replace('(%P2)', svcNm);
			}else if(code1 == 'C'){
				text = text.replace('(%P1)', trdarNm);
				text = text.replace('(%P2)', comment);
				text = text.replace('(%P3)', svcNm);

			}else if(code1 == 'D'){
				//추가
				text = text.replace('(%P1)', trdarNm);
			}
			descStr = text;
		}
	} else if(id == "selngCo") { // 매출건수

	} else if(id == "selngWeek") { // 요일별 매출
		var curTDay0 = parseFloat(datas["MON"]);
		var curTDay1 = parseFloat(datas["TUE"]);
		var curTDay2 = parseFloat(datas["WEN"]);
		var curTDay3 = parseFloat(datas["THU"]);
		var curTDay4 = parseFloat(datas["FRI"]); //평일
		var curTDay5 = parseFloat(datas["SAT"]);
		var curTDay6 = parseFloat(datas["SUN"]);
		var crrTArr = [curTDay0, curTDay1, curTDay2, curTDay3, curTDay4, curTDay5, curTDay6]
		var curBestDay = -1;
		var chkGbnDay = 0;
		for(var i=0; i<crrTArr.length; i++){
			if(curBestDay < parseFloat(crrTArr[i])){
				curBestDay = parseFloat(crrTArr[i]);
				chkGbnDay = i;
			}
		}
		if(chkGbnDay == 0) curBestDay = '월요일';
		if(chkGbnDay == 1) curBestDay = '화요일';
		if(chkGbnDay == 2) curBestDay = '수요일';
		if(chkGbnDay == 3) curBestDay = '목요일';
		if(chkGbnDay == 4) curBestDay = '금요일';
		if(chkGbnDay == 5) curBestDay = '토요일';
		if(chkGbnDay == 6) curBestDay = '일요일';
		curBestDay = ("<strong>"+curBestDay+"</strong>");
		/*
		var curTWeekday = (curTDay0+curTDay1+curTDay2+curTDay3);
		var curFri = curTDay4;
		var curTWeekend = (curTDay5+curTDay6);
		*/
		var curTWeekday = (curTDay0+curTDay1+curTDay2+curTDay3+curTDay4);
		var curTWeekend = (curTDay5+curTDay6);
		var cutTWTot = curTWeekday + curTWeekend;

		code1 = (Math.floor(Math.random()*2)+1)==1?'A':'B';
		//console.log(">>>>> cutTWTot:"+cutTWTot)
		//추가
//			if(cutTWTot == undefined || cutTWTot == null || cutTWTot <= 5000000){
		if(cutTWTot == undefined || cutTWTot == null){
			code1 = "C";
		}
		searchParams.step1 = "RT_03_A_02_"+code1+"_L1";
		searchParams.step2 = "RT_03_A_02_"+code1+"_L2";
		/*
		if( ((curTWeekday - curTWeekend)>0) && ((curTWeekday-curFri)>0)) searchParams.dgnss = 0;
		else if( ((curFri - curTWeekend)>0) && ((curFri - curTWeekday)>0)) searchParams.dgnss = 1;
		else  searchParams.dgnss = 2;
		*/
		if(curTWeekday > curTWeekend) searchParams.dgnss = 0; //평일
		else searchParams.dgnss = 1;  //휴일

		var result = getSyncAjaxData(searchParams, "/report/cmm/desc.json");
		if(result != null && result.length > 0){
			var text = result[0].txt;
			if(code1 == 'A'){
				text = text.replace("(%P1)", trdarNm);
				text = text.replace("(%P2)", curBestDay);
			}else if(code1 == 'B'){
				text = text.replace("(%P1)", svcNm);
				/*
				var comment = '주중(월~목)';
				if(searchParams.dgnss == 1) comment = '금요일';
				else if(searchParams.dgnss == 2) comment = "주말(토~일)";
				*/
				var comment = '평일';
				if(searchParams.dgnss == 1) comment = '주말';//'휴일';
				text = text.replace("(%P2)", comment);
				text = text.replace((curBestDay+"은"), (curBestDay + " 업종의")); // 은->업종의 변경 - 22.03.23
			}
			descStr = text;
		}
	} else if(id == "selngHour" || id == "flpopHourCo") { // 시간대별 매출 & 시간대별 유동인구
		var curTTime0 = parseFloat(datas["HOUR_0006"]);
		var curTTime1 = parseFloat(datas["HOUR_0611"]);
		var curTTime2 = parseFloat(datas["HOUR_1114"]);
		var curTTime3 = parseFloat(datas["HOUR_1417"]);
		var curTTime4 = parseFloat(datas["HOUR_1721"]);
		var curTTime5 = parseFloat(datas["HOUR_2124"]);
		var curTTGbn1 = (curTTime0+curTTime1);
		var curTTGbn2 = (curTTime2+curTTime3);
		var curTTGbn3 = (curTTime4+curTTime5);
		var curTTimeTot = curTTGbn1+curTTGbn2+curTTGbn3;

		code1 = (Math.floor(Math.random()*2)+1)==1?'A':'B';
		//추가
//			if(curTTimeTot == undefined || curTTimeTot == null || curTTimeTot <= 5000000){
		if(curTTimeTot == undefined || curTTimeTot == null){
			code1 = 'C';
		}
		searchParams.step1 = "RT_03_A_03_"+code1+"_L1";
		searchParams.step2 = "RT_03_A_03_"+code1+"_L2";
		if(curTTGbn1 > curTTGbn2 && curTTGbn1 > curTTGbn3) searchParams.dgnss = 0;
		else if(curTTGbn2 > curTTGbn3 && curTTGbn2 > curTTGbn1) searchParams.dgnss = 1;
		else searchParams.dgnss = 2;
		var result = getSyncAjaxData(searchParams, "/report/cmm/desc.json");
		if(result != null && result.length > 0){
			var text = result[0].txt;
			if(code1 != 'C'){
				/* 요청 변경 - 22.04.18
				var comment = '오전시간(00~11시)';
				if(searchParams.dgnss == 1) comment = '오후시간(11~17시)';
				if(searchParams.dgnss == 2) comment = '저녁시간(17~24시)';
					*/
				var comment = datas["TOP1"];

					if(typeof comment == "undefined"){
						text = "선택상권의 매출 데이터가 존재하지 않습니다.";
					}

					else{
						text = text.replace("(%P1)", ("<strong>"+comment+"</strong>"));
					}
				}
			text = text.replace("대 매출이", "매출이");
			if(id == "flpopHourCo") {
				text = text.replace("매출이", "유동인구가");
			}
			descStr = text.replace("대 입니다", "입니다");
		}
	} else if(id == "selngSex") { // 성별 매출
		var curTMale = Number(datas["MAN"]);
		var curTFemale = Number(datas["WOMAN"]);
		var curTGdTot = curTMale + curTFemale;
		code1 = 'A';
		//추가
//			if(curTGdTot == undefined || curTGdTot == null || curTGdTot <= 5000000){
		if(curTGdTot == undefined || curTGdTot == null){
			code1 = 'B';
		}
		searchParams.step1 = "RT_03_A_04_"+code1+"_L1";
		searchParams.step2 = "RT_03_A_04_"+code1+"_L2";
		if(curTMale > curTFemale) searchParams.dgnss = 1;
		else searchParams.dgnss = 0;
		var result = getSyncAjaxData(searchParams, "/report/cmm/desc.json");
		if(result != null && result.length > 0){
			var text = result[0].txt;
			if(code1 != 'B'){
				var gender = datas["TOP1"];
//					var gender = "여성";
//					if(searchParams.dgnss == 1){ gender = "남성"; }

					if(typeof gender == "undefined"){
						text = "선택상권의 매출 데이터가 존재하지 않습니다.";
					}

					else{
						text = text.replace("(%P1)", ("<strong>"+gender+"</strong>"));
					}
				}
			descStr = text;
		}
	} else if(id == "selngAge") { // 연령대별 매출
		var curTAge10 = parseFloat(datas["OUT_AGRDE_10_SELNG_RATE"]) + parseFloat(datas["SML_AGRDE_10_SELNG_RATE"]) + parseFloat(datas["SVC_AGRDE_10_SELNG_RATE"]);
		var curTAge20 = parseFloat(datas["OUT_AGRDE_20_SELNG_RATE"]) + parseFloat(datas["SML_AGRDE_20_SELNG_RATE"]) + parseFloat(datas["SVC_AGRDE_20_SELNG_RATE"]);
		var curTAge30 = parseFloat(datas["OUT_AGRDE_30_SELNG_RATE"]) + parseFloat(datas["SML_AGRDE_30_SELNG_RATE"]) + parseFloat(datas["SVC_AGRDE_30_SELNG_RATE"]);
		var curTAge40 = parseFloat(datas["OUT_AGRDE_40_SELNG_RATE"]) + parseFloat(datas["SML_AGRDE_40_SELNG_RATE"]) + parseFloat(datas["SVC_AGRDE_40_SELNG_RATE"]);
		var curTAge50 = parseFloat(datas["OUT_AGRDE_50_SELNG_RATE"]) + parseFloat(datas["SML_AGRDE_50_SELNG_RATE"]) + parseFloat(datas["SVC_AGRDE_50_SELNG_RATE"]);
		var curTAge60 = parseFloat(datas["OUT_AGRDE_60_ABOVE_SELNG_RATE"]) + parseFloat(datas["SML_AGRDE_60_ABOVE_SELNG_RATE"]) + parseFloat(datas["SVC_AGRDE_60_SELNG_RATE"]);
		var curTAge1020 = (curTAge10+curTAge20);
		var curTAge3040 = (curTAge30+curTAge40);
		var curTAge5060 = (curTAge50+curTAge60);
		var curTAgeTot = curTAge1020+curTAge3040+curTAge5060;

		code1 = (Math.floor(Math.random()*2)+1)==1?'A':'B';
		//추가
		if(curTAgeTot == undefined || curTAgeTot == null || curTAgeTot <= 5000000){
			code1 = 'C';
		}
		searchParams.step1 = "RT_03_A_05_"+code1+"_L1";
		searchParams.step2 = "RT_03_A_05_"+code1+"_L2";
		if( (curTAge1020 > curTAge3040) && (curTAge1020 > curTAge5060))  searchParams.dgnss = 0;
		else if( (curTAge3040 > curTAge1020) && (curTAge3040 > curTAge5060))  searchParams.dgnss = 1;
		else searchParams.dgnss = 2;
		var result = getSyncAjaxData(searchParams, "/report/cmm/desc.json");
		if(result != null && result.length > 0){
			var text = result[0].txt;
			if(code1 != 'C'){
				var totSvc = "<strong>"+datas["TOP_INDUTY_NM"]+"</strong>";
//					var totSvc = '외식업';
//					if(searchParams.dgnss == 1){
//						//30~40대 best
//						var svc10 = Number(curSvc12Data.svc1030rt) + Number(curSvc12Data.svc1040rt);
//						var svc20 = Number(curSvc12Data.svc2030rt) + Number(curSvc12Data.svc2040rt);
//						var svc30 = Number(curSvc12Data.svc3030rt) + Number(curSvc12Data.svc3040rt);
//						if((svc20 > svc10) && (svc20 > svc30)) totSvc = '서비스업';
//						else if((svc30 > svc10) && (svc30 > svc20)) totSvc = '소매업';
//					}else if(searchParams.dgnss == 2){
//						//50~60대 best
//						var svc10 = Number(curSvc12Data.svc1050rt) + Number(curSvc12Data.svc1060rt);
//						var svc20 = Number(curSvc12Data.svc2050rt) + Number(curSvc12Data.svc2060rt);
//						var svc30 = Number(curSvc12Data.svc3050rt) + Number(curSvc12Data.svc3060rt);
//						if((svc20 > svc10) && (svc20 > svc30)) totSvc = '서비스업';
//						else if((svc30 > svc10) && (svc30 > svc20)) totSvc = '소매업';
//					}else{
//						//10~20대 best				
//						var svc10 = Number(curSvc12Data.svc1010rt) + Number(curSvc12Data.svc1020rt);
//						var svc20 = Number(curSvc12Data.svc2010rt) + Number(curSvc12Data.svc2020rt);
//						var svc30 = Number(curSvc12Data.svc3010rt) + Number(curSvc12Data.svc3020rt);
//						if((svc20 > svc10) && (svc20 > svc30)) totSvc = '서비스업';
//						else if((svc30 > svc10) && (svc30 > svc20)) totSvc = '소매업';
//					}
				var comment = "<strong>"+datas["TOP1"]+"</strong>";
//					var comment = '20대이하';
//					if(searchParams.dgnss == 1) comment = '3-40대'
//					else if(searchParams.dgnss == 2) comment = '5-60대이상'
				if(code1 == 'A'){
					text = text.replace("(%P1)", totSvc);
					text = text.replace("(%P2)", comment);
				}else{
					//text = text.replace("(%P1)", comment);
					text = text.replace("(%P1)", totSvc);
					text = text.replace("(%P2)", comment);
				}
			}
			descStr = text;
		}
	} else if(id == "flpopCo") { // 유동인구 수
		var curTFlHtot = Number(datas["TRDAR_TOT_FLPOP_CO_BF_0"]);
		var prevTFHtot = Number(datas["TRDAR_TOT_FLPOP_CO_BF_1"]);
		var prev1TFHtot = Number(datas["TRDAR_TOT_FLPOP_CO_BF_4"]);

		var code1 = (Math.floor(Math.random()*2)+1)==1?'A':'B';
		searchParams.step1 = "RT_04_A_01_"+code1+"_L1";
		searchParams.step2 = "RT_04_A_01_"+code1+"_L2";
		if(code1 == 'A'){
			//전분기 비교
			if(curTFlHtot > prevTFHtot) searchParams.dgnss = 2;
			else if(curTFlHtot < prevTFHtot) searchParams.dgnss = 1;
			else searchParams.dgnss = 0; //동일
		}else{
			//전년 비교
			if(curTFlHtot > prev1TFHtot) searchParams.dgnss = 2;
			else if(curTFlHtot < prev1TFHtot)  searchParams.dgnss = 1;
			else searchParams.dgnss = 0; //동일
		}
		var result = getSyncAjaxData(searchParams, "/report/cmm/desc.json");
		if(result != null && result.length > 0){
			var text = result[0].txt;
			if(code1 == 'A'){
				text = text.replace("(%P1)",trdarNm);
				text = text.replace("(%P3)","길단위");
				var comment = "<strong>증가</strong>하고 있는";
				if(searchParams.dgnss == 1) comment = "<strong>감소</strong>하고 있는";
				else if(searchParams.dgnss == 0) comment = "<strong>동일</strong>한";
				text = text.replace("(%P2)",comment);
			}else{
				var comment = "<strong>증가</strong>하고 있습니다.";
				if(searchParams.dgnss == 1) comment = "<strong>감소</strong>하고 있습니다.";
				else if(searchParams.dgnss == 0) comment = "<strong>동일</strong>합니다.";
				text = text.replace("(%P1)",comment);
				text = text.replace("(%P2)","길단위");
			}
			// 텍스트 변경 추가 - 22.04.18
			descStr = texttext = text.replace("상존인구(길단위)", "유동인구").split("상존").join("유동").split("매출").join("유동인구");
		}
	} else if(id == "flpopWeekCo") { // 요일별 유동인구
		var curTFlDay0 = parseFloat(datas["MON"]);
		var curTFlDay1 = parseFloat(datas["TUE"]);
		var curTFlDay2 = parseFloat(datas["WEN"]);
		var curTFlDay3 = parseFloat(datas["THU"]);
		var curTFlDay4 = parseFloat(datas["FRI"]);
		var curTFlDay5 = parseFloat(datas["SAT"]);
		var curTFlDay6 = parseFloat(datas["SUN"]);

		/*
		var curTFWeekday = (curTFlDay0+curTFlDay1+curTFlDay2+curTFlDay3);
		var curFri = curTFlDay4;
		var curTFWeekend = (curTFlDay5 + curTFlDay6);
		*/
		var curTFWeekday = (curTFlDay0+curTFlDay1+curTFlDay2+curTFlDay3+curTFlDay4);
		var curTFWeekend = (curTFlDay5 + curTFlDay6);

		var chkGbnDay = 0;
		var curBestDay = -1;
		var curTFlDayArr = [curTFlDay0, curTFlDay1, curTFlDay2, curTFlDay3, curTFlDay4, curTFlDay5, curTFlDay6]
		for(var i=0; i<curTFlDayArr.length; i++){
			if(curBestDay < Number(curTFlDayArr[i])){
				curBestDay = Number(curTFlDayArr[i]);
				chkGbnDay = i;
			}
		}
		if(chkGbnDay == 0) curBestDay = '월요일';
		if(chkGbnDay == 1) curBestDay = '화요일';
		if(chkGbnDay == 2) curBestDay = '수요일';
		if(chkGbnDay == 3) curBestDay = '목요일';
		if(chkGbnDay == 4) curBestDay = '금요일';
		if(chkGbnDay == 5) curBestDay = '토요일';
		if(chkGbnDay == 6) curBestDay = '일요일';
		code1 = (Math.floor(Math.random()*2)+1)==1?'A':'B';
		searchParams.step1 = "RT_04_A_02_"+code1+"_L1";
		searchParams.step2 = "RT_04_A_02_"+code1+"_L2";
		/*
		if(curTFWeekday > curTFWeekend && curTFWeekday > curFri) searchParams.dgnss = 0;
		else if(curFri > curTFWeekend && curFri > curTFWeekday)  searchParams.dgnss = 1;
		else searchParams.dgnss = 2;
		*/
		if(curTFWeekday > curTFWeekend) searchParams.dgnss = 0; //평일
		else searchParams.dgnss = 1; //주말

		var result = getSyncAjaxData(searchParams, "/report/cmm/desc.json");
		if(result != null && result.length > 0){
			var text = result[0].txt;
			if(code1 == 'A'){
//					text = text.replace("(%P1)", curBestDay);
				text = text.replace("(%P1)", ("<strong>"+datas["TOP1"]+"</strong>"));
			}else{
				/*
				var comment = '주중(월~목)';
				if(searchParams.dgnss == 1) comment = '금요일';
				else if(searchParams.dgnss == 2) comment = '주말(토~일)';
				*/
				var comment = '평일';
				if(searchParams.dgnss == 1) comment = '주말';
				text = text.replace("(%P1)", ("<strong>"+comment+"</strong>"));
			}
			text = text.replace("(%P2)", ""); // 일단 문맥상 건물단위->빈값 - 22.03.22
			// 상존 -> 유동 - 22.03.22
			descStr = text.split("상존").join("유동");
		}
	} else if(id == "repopDnstCo") { // 주거인구
		var curTFlHtot = parseFloat(datas["TRDAR_TOT_REPOP_DNST_BF_0"]);
		var prevTFHtot = parseFloat(datas["TRDAR_TOT_REPOP_DNST_BF_1"]);
		var prev1TFHtot = parseFloat(datas["TRDAR_TOT_REPOP_DNST_BF_4"]);

		var code1 = (Math.floor(Math.random()*2)+1)==1?'A':'B';
		searchParams.step1 = "RT_04_A_01_"+code1+"_L1";
		searchParams.step2 = "RT_04_A_01_"+code1+"_L2";
		if(code1 == 'A'){
			//전분기 비교
			if(curTFlHtot > prevTFHtot) searchParams.dgnss = 2;
			else if(curTFlHtot < prevTFHtot) searchParams.dgnss = 1;
			else searchParams.dgnss = 0; //동일
		}else{
			//전년 비교
			if(curTFlHtot > prev1TFHtot) searchParams.dgnss = 2;
			else if(curTFlHtot < prev1TFHtot)  searchParams.dgnss = 1;
			else searchParams.dgnss = 0; //동일
		}
		var result = getSyncAjaxData(searchParams, "/report/cmm/desc.json");
		if(result != null && result.length > 0){
			var text = result[0].txt;
			if(code1 == 'A'){
				text = text.replace("(%P1)",trdarNm);
				text = text.replace("(%P3)","길단위");
				var comment = "증가하고 있는";
				if(searchParams.dgnss == 1) comment = "감소하고 있는";
				else if(searchParams.dgnss == 0) comment = "동일한";
				text = text.replace("(%P2)",comment);
			}else{
				var comment = "증가하고 있습니다.";
				if(searchParams.dgnss == 1) comment = "감소하고 있습니다.";
				else if(searchParams.dgnss == 0) comment = "동일합니다.";
				text = text.replace("(%P1)",comment);
				text = text.replace("(%P2)","길단위");
			}
			text = text.replace("상존인구(길단위)", "주거인구").replace("상존", "주거");
			descStr = text;
		}
	} else if(id == "wrcPopltnHa") { // 직장인구
		var curTFlHtot = parseFloat(datas["TRDAR_TOT_WRC_POPLTN_HA_BF_0"]);
		var prevTFHtot = parseFloat(datas["TRDAR_TOT_WRC_POPLTN_HA_BF_1"]);
		var prev1TFHtot = parseFloat(datas["TRDAR_TOT_WRC_POPLTN_HA_BF_4"]);

		var code1 = (Math.floor(Math.random()*2)+1)==1?'A':'B';
		searchParams.step1 = "RT_04_A_01_"+code1+"_L1";
		searchParams.step2 = "RT_04_A_01_"+code1+"_L2";
		if(code1 == 'A'){
			//전분기 비교
			if(curTFlHtot > prevTFHtot) searchParams.dgnss = 2;
			else if(curTFlHtot < prevTFHtot) searchParams.dgnss = 1;
			else searchParams.dgnss = 0; //동일
		}else{
			//전년 비교
			if(curTFlHtot > prev1TFHtot) searchParams.dgnss = 2;
			else if(curTFlHtot < prev1TFHtot)  searchParams.dgnss = 1;
			else searchParams.dgnss = 0; //동일
		}
		var result = getSyncAjaxData(searchParams, "/report/cmm/desc.json");
		if(result != null && result.length > 0){
			var text = result[0].txt;
			if(code1 == 'A'){
				text = text.replace("(%P1)",trdarNm);
				text = text.replace("(%P3)","길단위");
				var comment = "<strong>증가</strong>하고 있는";
				if(searchParams.dgnss == 1) comment = "<strong>감소</strong>하고 있는";
				else if(searchParams.dgnss == 0) comment = "<strong>동일</strong>한";
				text = text.replace("(%P2)",comment);
			}else{
				var comment = "<strong>증가하고 있습니다.";
				if(searchParams.dgnss == 1) comment = "<strong>감소</strong>하고 있습니다.";
				else if(searchParams.dgnss == 0) comment = "<strong>동일</strong>합니다.";
				text = text.replace("(%P1)",comment);
				text = text.replace("(%P2)","길단위");
			}
			text = text.replace("상존인구(길단위)", "직장인구").replace("상존", "직장"); // 상존-> 직장 변경 추가 - 22.03.22
			descStr = text;
		}
	} else if(id == "aptHshldCo") { // 가구세대수
		var curTRetot = Number(datas["TRDAR_TOT_HSHLD_CO_BF_0"]);     //주거세대
		var prev1TRetot = Number(datas["TRDAR_TOT_HSHLD_CO_BF_4"]); //전년 주거세대
		var bdTotGbn = curTRetot - prev1TRetot;

		var curTApt = parseFloat(datas["APT_HSHLD_RT"]);       //아파트
		var curTNApt = parseFloat(datas["NON_APT_HSHLD_RT"]);     //비아파트(일반)
//			var prev1TApt = Number(prev1Data.bdtapt);   //전년 아파트
//			var prev1TNApt = Number(prev1Data.bdtnapt); //전년 비아파트(일반)

		var code1 = (Math.floor(Math.random()*2)+1)==1?'A':'B';
		//추가
		if(curTRetot == undefined || curTRetot == null || curTRetot == 0){
			code1 = 'C';
		}
		searchParams.step1 = "RT_05_A_01_"+code1+"_L1";
		searchParams.step2 = "RT_05_A_01_"+code1+"_L2";
		searchParams.dgnss = '';
		if(curTApt > curTNApt) searchParams.dgnss = '0';
		var result = getSyncAjaxData(searchParams, "/report/cmm/desc.json");
		if(result != null && result.length > 0){
			var text = result[0].txt;
			if(searchParams.dgnss == '')
				text = text.replace("아파트가 많은 지역의 경우 배달이 유리합니다.",""); //예외
			if(code1 != 'C'){
				var comment = "<strong>증가</strong>하고 있고";
				if(bdTotGbn == 0) comment = "<strong>동일</strong>하고";
				else if(bdTotGbn < 0) comment = "<strong>감소</strong>하고 있고";
				text = text.replace("(%P1)", trdarNm);
				text = text.replace("(%P2)", comment);
				if(curTApt > curTNApt) text = text.replace("(%P3)", "많");
				else if(curTApt < curTNApt) text = text.replace("(%P3)", "적");
				else if(curTApt == curTNApt) text = text.replace("(%P3)", "같");
			}
			// 주거->가구 - 22.04.17
			descStr = text.split("주거").join("가구");
		}
	} else if(id == "aeSqmt") { // 아파트 세대
		var curAptTot = 0; //Number(curData.apttot); //개별세대수 합산과 맞지 않음

		var curApt66d = Number(datas["TRDAR_AE_66_SQMT_BELO"]);
		var curApt66 = Number(datas["TRDAR_AE_66_SQMT"]);
		var curApt99 = Number(datas["TRDAR_AE_99_SQMT"]);
		var curApt132 = Number(datas["TRDAR_AE_132_SQMT"]);
		var curApt165 = Number(datas["TRDAR_AE_165_SQMT"]);

		curAptTot = curApt66d +  curApt66 + curApt99 + curApt132 + curApt165;
		if(curAptTot > 0 && !!datas["TOP1"] && !!datas["AREA_TEXT"]) {
			descStr = "<strong>"+datas["TOP1"].replace("M", "㎡").replace("미만", " 미만")+"</strong> 아파트가 가장 많으며 아파트는 총 <strong>"+(Math.round(Number(curAptTot))||0).toLocaleString()+"</strong>세대입니다. <strong>"+datas["AREA_TEXT"]+"</strong>비율이 높은 편입니다.";
		}
//
//			var gbnBestApt1 = -1;
//			searchParams.dgnss = 0;
//			var gbnApt1 = "66㎥이하";
//			if(gbnBestApt1 < curApt66d){
//				gbnBestApt1 = curApt66d;
//			}
//			if(gbnBestApt1 < curApt66){
//				gbnBestApt1 = curApt66;
//				gbnApt1 = "66㎥대";
//				searchParams.dgnss = 1;
//			}
//			if(gbnBestApt1 < curApt99){
//				gbnBestApt1 = curApt99;
//				gbnApt1 = "99㎥대";
//				searchParams.dgnss = 1;
//			}
//			if(gbnBestApt1 < curApt132){
//				gbnBestApt1 = curApt132;
//				gbnApt1 = "132㎥대";
//				searchParams.dgnss = 2;
//			}
//			if(gbnBestApt1 < curApt165){
//				gbnBestApt1 = curApt165;
//				gbnApt1 = "165㎥이상";
//				searchParams.dgnss = 2;
//			}
//
//			var curApt1d = Number(curData.apt1d);
//			var curApt1 = Number(curData.apt1);
//			var curApt2 = Number(curData.apt2);
//			var curApt3 = Number(curData.apt3);
//			var curApt4 = Number(curData.apt4);
//			var curApt5 = Number(curData.apt5);
//			var curApt6u = Number(curData.apt6u);
//
//			var gbnBestApt2 = -1;
//			var gbnApt2 = "1억이하";
//			if(gbnBestApt2 < curApt1d){gbnBestApt2 = curApt1d;}
//			if(gbnBestApt2 < curApt1){gbnBestApt2 = curApt1;   gbnApt2 = "1억대";}
//			if(gbnBestApt2 < curApt2){gbnBestApt2 = curApt2;   gbnApt2 = "2억대";}
//			if(gbnBestApt2 < curApt3){gbnBestApt2 = curApt3;  gbnApt2 = "3억대";}
//			if(gbnBestApt2 < curApt4){gbnBestApt2 = curApt4;  gbnApt2 = "4억대";}
//			if(gbnBestApt2 < curApt5){gbnBestApt2 = curApt5;  gbnApt2 = "5억대";}
//			if(gbnBestApt2 < curApt6u){gbnBestApt2 = curApt6u;  gbnApt2 = "6억대";}
//
//			var curAptGbn1 = (curApt66d);
//			var curAptGbn2 = (curApt66 + curApt99);
//			var curAptGbn3 = (curApt132 + curApt165);
//
//			code1 = (Math.floor(Math.random()*2)+1)==1?'A':'B';
//			if(curAptTot == undefined || curAptTot == null || curAptTot == 0){
//				code1 = 'C';
//			}
//			searchParams.step1 = "RT_05_A_02_"+code1+"_L1";
//			searchParams.step2 = "RT_05_A_02_"+code1+"_L2";
//			/*
//			if((curAptGbn1 - curAptGbn2) > 0 && (curAptGbn1 - curAptGbn3) > 0)  searchParams.dgnss = 0;
//			else if((curAptGbn2 - curAptGbn1) > 0 && (curAptGbn2 - curAptGbn3) > 0) searchParams.dgnss = 1;
//			else searchParams.dgnss = 2;
//			*/
//			var result = getSyncAjaxData(searchParams, "/report/cmm/desc.json");
//			if(result != null && result.length > 0){
//				var text = result[0].txt;
//				if(code1 != 'C'){
//					text = text.replace("(%P1)",gbnApt1);
//					if(code1 == 'A') text = text.replace("(%P2)",numberComma(gbnApt2));
//					else  text = text.replace("(%P2)",curAptTot); //총아파트 가구수	
//				}
//				descStr = text;
//			}
	} else if(id == "blckFclty") { // 주요시설, 접객시설 현황
		var curFcSort = [];
		curFcSort.push({name:"관공서", fclty:Number(datas["OFFICES"] || 0)});
		curFcSort.push({name:"금융기관", fclty:Number(datas["FINANCIAL"] || 0)});
		curFcSort.push({name:"병원", fclty:Number(datas["HOSPITAL"] || 0)});
		curFcSort.push({name:"학교", fclty:Number(datas["SCHOOL"] || 0)});
		curFcSort.push({name:"유통점", fclty:Number(datas["DISTRIBUTOR"] || 0)});
		curFcSort.push({name:"영화/공연", fclty:Number(datas["THEATER"] || 0)});
		curFcSort.push({name:"숙박", fclty:Number(datas["ACCOMMODATION"] || 0)});
		curFcSort.push({name:"교통시설", fclty:Number(datas["FACILITIES"] || 0)});
		curFcSort.sort(function(a, b) { // 오름차순
			return b["fclty"] - a["fclty"];
		});
		code1 = 'A';
		//추가
		if(curFcSort[0].fclty == undefined || curFcSort[0].fclty == null || curFcSort[0].fclty == 0){
			code1 = 'B';
		}
		searchParams.step1 = "RT_05_A_03_"+code1+"_L1";
		searchParams.step2 = "RT_05_A_03_"+code1+"_L2";
		searchParams.dgnss = 0;
		var result = getSyncAjaxData(searchParams, "/report/cmm/desc.json");
		if(result != null && result.length > 0){
			var text = result[0].txt;
			if(code1 != 'B'){
				text = text.replace("(%P1)", ("<strong>"+curFcSort[0].name+"</strong>"));
				text = text.replace("(%P2)", curFcSort[0].name);
				// 빈행일때 제어 추가 - 22.03.23
				text = text.replace(",(%P3)", !curFcSort[1].fclty ? "" : (", "+curFcSort[1].name));
				text = text.replace("외 (%P4)", !curFcSort[2].fclty ? "" : ("외 "+curFcSort[2].name));
			}
			descStr = text;
		}
	} else if(id == "incomeSctnCd") { // 소득수준(선택영역, 행정동, 자치구, 서울시 소득수준)
		var curTIcttot = Number(datas["TRDAR_INCOME_SCTN_CD"]);
		var curSiIcttot = Number(datas["MEGA_SCTM_CD_NM"]);
		var curSgIcttot = Number(datas["SIGNGU_INCOME_SCTN_CD"]);

		var curTIctnm  = (datas["TRDAR_SCTM_CD_NM"] || "").replace(":","(")+")";
		var curSiIctnm = (datas["MEGA_SCTM_CD_NM"] || "").replace(":","(")+")";
		var curSgIctnm = (datas["SIGNGU_SCTM_CD_NM"] || "").replace(":","(")+")";
		if(curTIctnm == undefined || curTIctnm == null) curTIctnm = '';
		if(curSiIctnm == undefined || curSiIctnm == null) curSiIctnm = '';
		if(curSgIctnm == undefined || curSgIctnm == null) curSgIctnm = '';

		code1 = (Math.floor(Math.random()*2)+1)==1?'A':'B';
		searchParams.step1 = "RT_05_A_04_"+code1+"_L1";
		searchParams.step2 = "RT_05_A_04_"+code1+"_L2";
		if(code1 == 'A'){
			if((curTIcttot - curSiIcttot) > 0) searchParams.dgnss = 1;
			else  searchParams.dgnss = 0;
		}else{
			//서울시 비교 또는 자치구 비교 가능
			if((curTIcttot - curSgIcttot) > 0) searchParams.dgnss = 1;
			else  searchParams.dgnss = 0;
		}
		var result = getSyncAjaxData(searchParams, "/report/cmm/desc.json");
		if(result != null && result.length > 0){
			var text = result[0].txt;
			text = text.replace("(%P1)", "<strong>"+curTIctnm+"</strong>");
			if(code1 == 'A'){
				text = text.replace("(%P2)", " <strong>"+curSiIctnm+"</strong>");
				var comment = "많";
				if(curTIcttot == curSiIcttot) comment = "같";
				else if(curTIcttot < curSiIcttot) comment = "적";
				text = text.replace("(%P3)", comment);
			}else{
				text = text.replace("(%P2)", "<strong>"+curSgIctnm+"</strong>");
				text = text.replace("(%P3)", "<strong>"+curSiIctnm+"</strong>");
			}
			descStr = text;
		}
	} else if(id == "expndtr") { // 소비트렌드
		var curHssmp1 = parseFloat(datas["FOOD"]);
		var curHssmp2 = parseFloat(datas["CLOTHES"]);
		var curHssmp3 = parseFloat(datas["HOUSEHOLD_GOOS"]);
		var curHssmp4 = parseFloat(datas["MEDICAL_EXPENSES"]);
		var curHssmp5 = parseFloat(datas["TRAFFIC"]);
		var curHssmp6 = parseFloat(datas["LEISURE"]);
		var curHssmp7 = parseFloat(datas["CULTURE"]);
		var curHssmp8 = parseFloat(datas["EDUCATION"]);
		var curHssmp9 = parseFloat(datas["PLEASURE"]);

		var curHsSort = [];
		curHsSort.push({name:"음식", hssmp:curHssmp1});
		curHsSort.push({name:"의류", hssmp:curHssmp2});
		curHsSort.push({name:"생활용품", hssmp:curHssmp3});
		curHsSort.push({name:"의료비", hssmp:curHssmp4});
		curHsSort.push({name:"교통", hssmp:curHssmp5});
		curHsSort.push({name:"여가", hssmp:curHssmp6});
		curHsSort.push({name:"문화", hssmp:curHssmp7});
		curHsSort.push({name:"교육", hssmp:curHssmp8});
		curHsSort.push({name:"유흥", hssmp:curHssmp9});
		curHsSort.sort(function(a, b) { // 내림차순
			return b["hssmp"] - a["hssmp"];
		});

		code1 = (Math.floor(Math.random()*3)+1);
		if(code1 == 1) code1 = "A"
		else{
			if(code1 == 2) code1 = "B";
			else code1 = "C";
		}
		searchParams.step1 = "RT_05_A_05_"+code1+"_L1";
		searchParams.step2 = "RT_05_A_05_"+code1+"_L2";
		searchParams.dgnss = 0;
		var result = getSyncAjaxData(searchParams, "/report/cmm/desc.json");
		if(result != null && result.length > 0){
			var text = result[0].txt;
			text = text.replace("(%P1)",("<strong>"+curHsSort[0].name+"</strong>"));
			text = text.replace("(%P2)",("<strong>"+curHsSort[0].name+"</strong>"));
			descStr = text;
		}
	} else if(id == "cnvrsnRntchrg") { // 임대시세
		var curDlstot1 = Number(datas["TRDAR_RNTCHRG_BF_0"]);
		var curSilstot1 = Number(datas["SIGNGU_RNTCHRG_BF_0"]);
		var curSglstot1 = Number(datas["SIDO_RNTCHRG_BF_0"]);
		//추가
		var prev1Dlstot1 = Number(datas["TRDAR_RNTCHRG_BF_4"]); //전년 임대시세

		code1 = (Math.floor(Math.random()*3)+1);
		if(code1 == 1) code1 = "A"
		else{
			if(code1 == 2) code1 = "B";
			else code1 = "C";
		}
		if(curDlstot1 == undefined || curDlstot1 == null || curDlstot1 == 0){
			code1 = 'D';
		}

		if(code1 != 'D'){
			var gbnRt1 = '원 같고';
			if( (curDlstot1 - curSglstot1) < 0)  gbnRt1 = '원 낮고';
			else if( (curDlstot1 - curSglstot1) > 0)  gbnRt1 = '원 높고';
			var gbnRt2 = '원 같';
			if( (curDlstot1 - curSilstot1) < 0)  gbnRt2 = '원 낮';
			else if( (curDlstot1 - curSilstot1) > 0)  gbnRt2 = '원 높';
		}

		searchParams.step1 = "RT_05_A_06_"+code1+"_L1";
		searchParams.step2 = "RT_05_A_06_"+code1+"_L2";
		if(code1 == 'A'){
			if((curDlstot1 - curSilstot1) > 0) searchParams.dgnss = 1;  //상승
			else if((curDlstot1 - curSilstot1) < 0) searchParams.dgnss = 0; //하락
			else searchParams.dgnss = 2; //동일
		}else if(code1 == 'B'){
			if((curDlstot1 - curSilstot1) > 0) searchParams.dgnss = 1;  //상승
			else if((curDlstot1 - curSilstot1) < 0) searchParams.dgnss = 0; //하락
			else searchParams.dgnss = 2; //동일
		}else if(code1 == 'C'){
			if((curDlstot1 - curSilstot1) > 0) searchParams.dgnss = 1;  //상승
			else if((curDlstot1 - curSilstot1) > 0) searchParams.dgnss = 0; //하락
			else searchParams.dgnss = 2; //동일
		}
		var result = getSyncAjaxData(searchParams, "/report/cmm/desc.json");
		if(result != null && result.length > 0){
			var text = result[0].txt;
			if(code1 == 'A'){
				var comment = "<strong>동일</strong>하고";
				if((curDlstot1 - prev1Dlstot1) > 0) comment = "<strong>증가</strong>하고 있으며";
				else if((curDlstot1 - prev1Dlstot1) < 0) comment = "<strong>감소</strong>하고 있으며";
				text = text.replace("(%P1)", comment);
				comment = "같";
				if(searchParams.dgnss == 1) comment = "높";
				else if(searchParams.dgnss == 0) comment = "낮";
				//var price = Math.abs(curSilstot1 - curDlstot1); //numberComma(price)
				text = text.replace("(%P2)", comment);
			}else if(code1 == 'B'){
				text = text.replace("(%P1)", numberComma(curDlstot1));
				text = text.replace("(%P2)", numberComma(Math.abs((curSglstot1-curDlstot1))));
				text = text.replace("(%P3)", gbnRt1);
				text = text.replace("(%P4)", numberComma(Math.abs((curSilstot1-curDlstot1))));
				text = text.replace("(%P5)", gbnRt2);
			}else if(code1 == 'C'){
				text = text.replace("(%P1)", numberComma(curDlstot1));
				text = text.replace("(%P2)", numberComma(Math.abs((curSglstot1-curDlstot1))));
				text = text.replace("(%P3)", gbnRt1);
				text = text.replace("(%P4)", numberComma(Math.abs((curSilstot1-curDlstot1))));
				text = text.replace("(%P5)", gbnRt2);
			}
			descStr = text;
		}
	} else {
			//console.log(">>>> setDesc구분자 없음:"+id)
		return "";
	}
//		$("#"+id).closest("ul").find("li.detail").html($("#"+id).closest("ul").find("li.detail").text().replace("한식음식점", svcNm));
		//console.log(">>>>>>> setDesc "+id+":"+descStr);
		//console.log(datas);
		//console.log(searchParams);
	if(!!descStr) {
		$("#"+id).closest("ul").find("li.detail").html(descStr);
		reportInfo[id].desc = descStr.replace(/<strong>/gi, "").replace(/<\/strong>/gi, "");
	}
}

function getSyncAjaxData(params, url) {
	var result = null;
	$.ajax({
		url: url,
		type: 'POST',
		dataType: 'json',
		async: false,
		data: params,
		success:function(data){
			if(data != undefined && data != null){
				result = data;
			}
		}
	});
	return result;
}

//천단위 콤마
function numberComma(x) {
	if( x != null && typeof x == 'number') {
		return "<strong>"+x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"</strong>";
	} else {
		return x;
	}
}

// deep copy - 22.04.12
function cloneObject(obj) {
	var clone = {};
	for (var key in obj) {
		if(typeof obj[key] == "object" && obj[key] != null) {
			clone[key] = obj[key];
		}
	}
}

function changeReportPattern(obj) {
		console.log(">>>"+$(obj).hasClass("active"));
		console.log(">>>>> hasClass('active'):"+$(obj).hasClass("active")+", reportPattern:"+reportPattern);
	if(!$(obj).hasClass("active") && !reportPattern) {
		reportPattern = true;
		$(obj).addClass("active");

		//체크박스 이미지로 변경
		$("#megaStorCo").attr("class", "si2");
		$("#signguStorCo").attr("class", "gu2");
		$("#adstrdStorCo").attr("class", "dong2");

		//체크박스 button으로 변경
		$("#siBtn").attr("class", "siBtnColor2");
		$("#guBtn").attr("class", "guBtnColor2");
		$("#dongBtn").attr("class", "dongBtnColor2");

	} else {
		reportPattern = false;
		$(obj).removeClass("active");

		//원래 이미지로 변경
		$("#megaStorCo").attr("class", "si");
		$("#signguStorCo").attr("class", "gu");
		$("#adstrdStorCo").attr("class", "dong");

		//원래 button으로 변경
		$("#siBtn").attr("class", "siBtnColor");
		$("#guBtn").attr("class", "guBtnColor");
		$("#dongBtn").attr("class", "dongBtnColor");
	}

		//이미지 다시 reload
//		var imgUrl = reportInfos.title.img;
//
//		if(imgUrl != undefined && imgUrl != null){
//			if(this.checked)
//				imgUrl = imgUrl.replace("p=N","p=Y");
//			else
//				imgUrl = imgUrl.replace("p=Y","p=N");
//			
//			if($('#influenceImgTitleTrdar')[0] != undefined && $('#influenceImgTitleTrdar')[0] != null)
//				$('#influenceImgTitleTrdar')[0].src = imgUrl;
//			if($('#influenceImgSumTrdar')[0] != undefined && $('#influenceImgSumTrdar')[0] != null)
//				$('#influenceImgSumTrdar')[0].src = imgUrl;
//		}
		//chart이미지 reload
	var rptChts = $("div.rMateChartH5__Root").parent();
	rptChts.each(function() {
		if(document.getElementById("chart_"+this.id) != undefined){
				console.log(">>>>> this.id:"+this.id);
			try {
				document.getElementById("chart_"+this.id).accessibilityPattern(reportPattern);
			} catch (e) {
				console.log(e);
			}
		}
	});
		//타이틀 일 경우 사진영역 레전드 변경
//		$('.tabs-report > li').each(function(){
//			if(this.id == 'liRptTitle' || this.id == 'liRptSum'){
//				//active여부 파악
//				if($('#'+this.id).hasClass('ui-tabs-active')){
//					setTitleLegend();
//				}
//			}
//		});
}

