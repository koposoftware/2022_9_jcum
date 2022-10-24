var options = {
	series: [
	{
		name: "1개월",
		data: [10, 15, 12, 20, 18, 26, 24, 25, 20, 25, 22, 30]
	},
	{
		name: "1개월",
		data: [15, 10, 17, 15, 23, 21, 30, 20, 26, 20, 28, 25]
	}
	],
	chart: {
		height: 300,
		type: 'line',
		zoom: {
			enabled: false,
		},
		dropShadow: {
			enabled: true,
			color: '#000',
			top: 18,
			left: 7,
			blur: 16,
			opacity: 0.2
		},
		toolbar: {
			show: false
		}
	},
	colors: ['#f0746c', '#255cd3'],
	dataLabels: {
		enabled: false,
	},
	stroke: {
		width: [3,3],
		curve: 'smooth'
	},
	grid: {
		show: false,
	},
	markers: {
		colors: ['#f0746c', '#255cd3'],
		size: 5,
		strokeColors: '#ffffff',
		strokeWidth: 2,
		hover: {
			sizeOffset: 2
		}
	},
	xaxis: {
		categories: ['일', '월', '화', '수', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
		labels:{
			style:{
				colors: '#8c9094'
			}
		}
	},
	yaxis: {
		min: 0,
		max: 0,
		/*labels:{
			style:{
				colors: '#8c9094'
			}
		}*/
	},
	legend: {
		position: 'top',
		horizontalAlign: 'right',
		floating: true,
		offsetY: 0,
		labels: {
			useSeriesColors: true
		},
		markers: {
			width: 10,
			height: 10,
		}
	}
};

var options11 = {
	series: [{
		name: 'Sales',
		data: [4, 3, 10, 9, 29, 19, 22, 9, 12, 7, 19, 5, 13, 9, 17, 2, 7, 5]
	},
	{
		name: 'Sales1',
		data: [4, 3, 10, 9, 29, 19, 22, 9, 12, 7, 19, 5, 13, 9, 17, 2, 7, 5]
	}

	],

	chart: {
		height: 350,
		type: 'line',
		offsetY: 15,
    	offsetX: -10,
	},

	forecastDataPoints: {
		count: 7
	},
	stroke: {
		width: 5,
		curve: 'smooth'
	},
	xaxis: {
		categories: ['일', '월', '화', '수', '목', '금', '토'],
		labels: {
			style: {
				colors: '#8c9094'
			}
		}
	},
	title: {
		text: '',
		align: 'left',
		style: {
			fontSize: "16px",
			color: '#666'
		}
	},
	fill: {
		type: 'gradient',
		gradient: {
			shade: 'dark',
			gradientToColors: ['#FDD835'],
			shadeIntensity: 1,
			type: 'horizontal',
			opacityFrom: 1,
			opacityTo: 1,
			stops: [0, 100, 100, 100]
		},
	},
	yaxis: {
		/*
			  min: 0,
			  max: 40
		  */
	}
};


var options2 = {
	series: [{
		name: 'Week',
		data: [{
			x: 'Monday',
			y: 21
		}, {
			x: 'Tuesday',
			y: 22
		}, {
			x: 'Wednesday',
			y: 10
		}, {
			x: 'Thursday',
			y: 28
		}, {
			x: 'Friday',
			y: 16
		}, {
			x: 'Saturday',
			y: 21
		}, {
			x: 'Sunday',
			y: 13
		}],
	}],
	chart: {
		height: 70,
		type: 'bar',
		toolbar: {
			show: false,
		},
		sparkline: {
			enabled: true
		},
	},
	plotOptions: {
		bar: {
			columnWidth: '25px',
			distributed: true,
			endingShape: 'rounded',
		}
	},
	dataLabels: {
		enabled: false
	},
	legend: {
		show: false
	},
	xaxis: {
		type: 'category',
		lines: {
			show: false,
		},
		axisBorder: {
			show: false,
		},
		labels: {
			show: false,
		},
	},
	yaxis: [{
		y: 0,
		offsetX: 0,
		offsetY: 0,
		labels: {
			show: false,
		},
		padding: {
			left: 0,
			right: 0
		},
	}],
};

var options3 = {
	series: [{
		name: 'Week',
		data: [{
			x: 'Monday',
			y: 10
		}, {
			x: 'Tuesday',
			y: 8
		}, {
			x: 'Wednesday',
			y: 15
		}, {
			x: 'Thursday',
			y: 12
		}, {
			x: 'Friday',
			y: 20
		}, {
			x: 'Saturday',
			y: 14
		}, {
			x: 'Sunday',
			y: 7
		}],
	}],
	colors: ['#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff'],
	chart: {
		height: 70,
		type: 'bar',
		toolbar: {
			show: false,
		},
		sparkline: {
			enabled: true
		},
	},
	plotOptions: {
		bar: {
			columnWidth: '25px',
			distributed: true,
			endingShape: 'rounded',
		}
	},
	dataLabels: {
		enabled: false
	},
	legend: {
		show: false
	},
	xaxis: {
		type: 'category',
		lines: {
			show: false,
		},
		axisBorder: {
			show: false,
		},
		labels: {
			show: false,
		},
	},
	yaxis: [{
		y: 0,
		offsetX: 0,
		offsetY: 0,
		labels: {
			show: false,
		},
		padding: {
			left: 0,
			right: 0
		},
	}],
};

var options4 = {
	series: [50, 60, 70, 80],
	chart: {
		height: 350,
		type: 'radialBar',
	},
	colors: ['#003049', '#d62828', '#f77f00', '#fcbf49', '#e76f51'],
	plotOptions: {
		radialBar: {
			dataLabels: {
				name: {
					fontSize: '22px',
				},
				value: {
					fontSize: '16px',
				},
				total: {
					show: true,
					label: 'Total',
					formatter: function (w) {
						return 260
					}
				}
			}
		}
	},
	labels: ['Flu', 'Covid-19', 'Pheumoniae', 'Diabeties'],
};


var optionsArea = {
	series: [{
		name: 'series1',
		data: [31, 40, 28, 51, 42, 109, 100]
	}],
	chart: {
		toolbar: {
        show: false
        },
		height: 250,
		type: 'area',
		offsetY: 15,
    	offsetX: -10,
	},
	dataLabels: {
		enabled: false
	},
	stroke: {
		curve: 'smooth'
	},
	xaxis: {
		categories: ['09/03', '09/04', '09/05', '09/06', '09/07', '09/08', '09/09'],
	},

};

var optionsBar = {
	series: [
		{
			name: 'Actual',
			data: [
				{
					x: '2011',
					y: 1292,

				},
				{
					x: '2012',
					y: 4432,
				},
				{
					x: '2013',
					y: 5423,
				},
				{
					x: '2014',
					y: 6653,
				},
				{
					x: '2015',
					y: 8133,
				},
				{
					x: '2016',
					y: 7132,
				},
				{
					x: '2017',
					y: 7332,
				},
				{
					x: '2018',
					y: 9999,
				}
			]
		}
	],
	chart: {
		height: 350,
		type: 'bar',
		toolbar: {
        show: false
        },
	},
	plotOptions: {
		bar: {
			columnWidth: '60%'
		}
	},
	colors: ['#019591'],
	dataLabels: {
		enabled: false
	},
	legend: {
		show: true,
		showForSingleSeries: true,
		customLegendItems: ['Actual'],
		markers: {
			fillColors: ['#019591']
		}
	}
};


// 주간 가장 많이 팔린 메뉴
var WeekMenuoptions = {
	series: [{
		data: [400, 430, 448, 470, 540, 580, 690, 1100, 1200, 1380]
	}],
	chart: {
		type: 'bar',
		height: 350,
		toolbar: {
        show: false
        },
	},
	plotOptions: {
		bar: {
			borderRadius: 4,
			horizontal: true,
		}
	},
	dataLabels: {
		enabled: false
	},
	xaxis: {
		categories: ['South Korea', 'Canada', 'United Kingdom', 'Netherlands', 'Italy', 'France', 'Japan',
			'United States', 'China', 'Germany'
		],
	}
};

var Weekchart = new ApexCharts(document.querySelector("#Weekchart"), WeekMenuoptions);
Weekchart.render();

var chartBar = new ApexCharts(document.querySelector("#chart"), optionsBar);
chartBar.render();

var chartArea = new ApexCharts(document.querySelector('#area-adwords'), optionsArea);
chartArea.render();

var chart = new ApexCharts(document.querySelector("#activities-chart"), options11);
chart.render();

//var chart2 = new ApexCharts(document.querySelector("#appointment-chart"), options2);
//chart2.render();

var chart3 = new ApexCharts(document.querySelector("#surgery-chart"), options3);
chart3.render();

//var chart4 = new ApexCharts(document.querySelector("#diseases-chart"), options4);
//chart4.render();



$('document').ready(function(){	
	$('.data-table').DataTable({
		scrollCollapse: false,
		autoWidth: false,
		responsive: true,
		searching: false,
		bLengthChange: false,
		bPaginate: true,
		bInfo: false,
		columnDefs: [{
			targets: "datatable-nosort",
			orderable: false,
		}],
		"lengthMenu": [[5, 25, 50, -1], [5, 25, 50, "All"]],
		"language": {
			"info": "_START_-_END_ of _TOTAL_ entries",
			searchPlaceholder: "Search",
			paginate: {
				next: '<i class="ion-chevron-right"></i>',
				previous: '<i class="ion-chevron-left"></i>'
			}
		},
	});
	
	load();
	
	$("#selEvent").change(function(){
		$("#activities-chart").empty();
		
		if($("#selEvent option:selected").text() === "1주일"){
			let data = {
				startDt: "22/10/16",
				endDt: "22/10/22",
				type:"week"
			}
			$.ajax({
				url: "/salesDateGraph",
				data: data,
				type: "post",
				dataType: "json",
				async: false,

				success: function(resp) {
					console.log(resp);
					let val1 = [];
					for(let i = 0; i < resp.salesRange.length; i++){
						val1[i] = resp.salesRange[i].CNT;
					}
					let val2 = [];
					for(let i = 0; i < resp.salesPurRange.length; i++){
						val2[i] = resp.salesPurRange[i].CNT;
					}
					let sum = [];
					//console.log(sum.concat(val1,val2));
					//console.log(Math.max.apply(Math, sum.concat(val1,val2)));
					options11.series[0].name = "매출";
					options11.series[0].data = val1;
					
					options11.series[1].name = "매입";
					options11.series[1].data = val2;
					
					options11.xaxis.categories = ['일','월','화','수','목','금','토'];
					//options.xaxis.labels.style.colors = '#8c9094';
					
					options11.yaxis.min = 0;
					options11.yaxis.max = Math.max.apply(Math, sum.concat(val1,val2));
					//console.log(Math.max.apply(Math, sum.concat(val1,val2)));
					//options.yaxis.labels.style.colors = "#8c9094";
					
					
					//console.log(options);
					var chart = new ApexCharts(document.querySelector("#activities-chart"), options11);
					chart.render();
					
				},
				error: function(request, status, error) {
					console.log(request.status);
					console.log(request.responseText);
					console.log(request.error);
				}
			});
			
			
		}else if($("#selEvent option:selected").text() === "1개월"){
			let data = {
				startDt: "22/09/22",
				endDt: "22/10/22",
				type:"month"
			}
			$.ajax({
				url: "/salesDateGraph",
				data: data,
				type: "post",
				dataType: "json",
				async: false,

				success: function(resp) {
					
					let val1 = [];
					let date1 = [];
					for(let i = 0; i < resp.salesRange.length; i++){
						val1[i] = resp.salesRange[i].CNT;
						date1[i] = resp.salesRange[i].TODAY;
					}
					let val2 = [];
					let date2 = [];
					for(let i = 0; i < resp.salesPurRange.length; i++){
						val2[i] = resp.salesPurRange[i].CNT;
						date2[i] = resp.salesRange[i].TODAY;
					}
					let sum = [];
					let dateSum = [];
					
					//console.log([...new Set((dateSum.concat(date1,date2)).sort())]);
					//console.log(sum.concat(val1,val2));
					//console.log(Math.max.apply(Math, sum.concat(val1,val2)));
					options11.series[0].name = "매출";
					options11.series[0].data = val1;
					
					options11.series[1].name = "매입";
					options11.series[1].data = val2;
					
					options11.xaxis.categories = [...new Set((dateSum.concat(date1,date2)).sort())];
					//options.xaxis.labels.style.colors = '#8c9094';
					
					options11.yaxis.min = 0;
					options11.yaxis.max = Math.max.apply(Math, sum.concat(val1,val2));
					//console.log(Math.max.apply(Math, sum.concat(val1,val2)));
					//options.yaxis.labels.style.colors = '#8c9094';
					
					//options.xaxis.labels.style.colors = '#8c9094';
					
					//console.log(options);
					
					var chart1 = new ApexCharts(document.querySelector("#activities-chart"), options11);
					chart1.render();
				},
				error: function(request, status, error) {
					console.log(request.status);
					console.log(request.responseText);
					console.log(request.error);
				}
			});
		}else if($("#selEvent option:selected").text() === "6개월"){
			let data = {
				startDt: "22/04/22",
				endDt: "22/10/22",
				type:"sixmonth"
			}
			$.ajax({
				url: "/salesDateGraph",
				data: data,
				type: "post",
				dataType: "json",
				async: false,

				success: function(resp) {
					
					let val1 = [];
					let date1 = [];
					for(let i = 0; i < resp.salesRange.length; i++){
						val1[i] = resp.salesRange[i].CNT;
						date1[i] = resp.salesRange[i].TODAY;
					}
					let val2 = [];
					let date2 = [];
					for(let i = 0; i < resp.salesPurRange.length; i++){
						val2[i] = resp.salesPurRange[i].CNT;
						date2[i] = resp.salesRange[i].TODAY;
					}
					let sum = [];
					let dateSum = [];
					
					//console.log([...new Set((dateSum.concat(date1,date2)).sort())]);
					//console.log(sum.concat(val1,val2));
					//console.log(Math.max.apply(Math, sum.concat(val1,val2)));
					options11.series[0].name = "매출";
					options11.series[0].data = val1;
					
					options11.series[1].name = "매입";
					options11.series[1].data = val2;
					
					options11.xaxis.categories = [...new Set((dateSum.concat(date1,date2)).sort())];
					//options.xaxis.labels.style.colors = '#8c9094';
					
					options11.yaxis.min = 0;
					options11.yaxis.max = Math.max.apply(Math, sum.concat(val1,val2));
					//console.log(Math.max.apply(Math, sum.concat(val1,val2)));
					//options.yaxis.labels.style.colors = '#8c9094';
					
					//options.xaxis.labels.style.colors = '#8c9094';
					
					//console.log(options);
					
					var chart1 = new ApexCharts(document.querySelector("#activities-chart"), options11);
					chart1.render();
				},
				error: function(request, status, error) {
					console.log(request.status);
					console.log(request.responseText);
					console.log(request.error);
				}
			});
		}else{
			let data = {
				startDt: "21/10/22",
				endDt: "22/10/22",
				type:"year"
			}
			$.ajax({
				url: "/salesDateGraph",
				data: data,
				type: "post",
				dataType: "json",
				async: false,

				success: function(resp) {
					
					let val1 = [];
					let date1 = [];
					for(let i = 0; i < resp.salesRange.length; i++){
						val1[i] = resp.salesRange[i].CNT;
						date1[i] = resp.salesRange[i].TODAY;
					}
					let val2 = [];
					let date2 = [];
					for(let i = 0; i < resp.salesPurRange.length; i++){
						val2[i] = resp.salesPurRange[i].CNT;
						date2[i] = resp.salesRange[i].TODAY;
					}
					let sum = [];
					let dateSum = [];
					
					//console.log([...new Set((dateSum.concat(date1,date2)).sort())]);
					//console.log(sum.concat(val1,val2));
					//console.log(Math.max.apply(Math, sum.concat(val1,val2)));
					options11.series[0].name = "매출";
					options11.series[0].data = val1;
					
					options11.series[1].name = "매입";
					options11.series[1].data = val2;
					
					options11.xaxis.categories = [...new Set((dateSum.concat(date1,date2)).sort())];
					//options.xaxis.labels.style.colors = '#8c9094';
					
					options11.yaxis.min = 0;
					options11.yaxis.max = Math.max.apply(Math, sum.concat(val1,val2));
					//console.log(Math.max.apply(Math, sum.concat(val1,val2)));
					//options.yaxis.labels.style.colors = '#8c9094';
					
					//options.xaxis.labels.style.colors = '#8c9094';
					
					//console.log(options);
					
					var chart1 = new ApexCharts(document.querySelector("#activities-chart"), options11);
					chart1.render();
				},
				error: function(request, status, error) {
					console.log(request.status);
					console.log(request.responseText);
					console.log(request.error);
				}
			});
		}
		
		
	
	});
	
	function load() {
		$("#activities-chart").empty();
		let data = {
			startDt: "22/10/16",
			endDt: "22/10/22",
			type: "week"
		}
		$.ajax({
			url: "/salesDateGraph",
			data: data,
			type: "post",
			dataType: "json",
			async: false,

			success: function(resp) {
				let val1 = [];
				for (let i = 0; i < resp.salesRange.length; i++) {
					val1[i] = resp.salesRange[i].CNT;
				}
				let val2 = [];
				for (let i = 0; i < resp.salesPurRange.length; i++) {
					val2[i] = resp.salesPurRange[i].CNT;
				}
				let sum = [];
				options11.series[0].name = "매출";
				options11.series[0].data = val1;

				options11.series[1].name = "매입";
				options11.series[1].data = val2;

				options11.xaxis.categories = ['일', '월', '화', '수', '목', '금', '토'];
				//options.xaxis.labels.style.colors = '#8c9094';

				options11.yaxis.min = 0;
				options11.yaxis.max = Math.max.apply(Math, sum.concat(val1, val2));
				//options.yaxis.labels.style.colors = '#8c9094';

				var chart1 = new ApexCharts(document.querySelector("#activities-chart"), options11);
				chart1.render();
				//console.log(options);
				
			},
			error: function(request, status, error) {
				console.log(request.status);
				console.log(request.responseText);
				console.log(request.error);
			}
		});
	} // load
	
	// 요일별 매장 방문자 수
	let data = {
		startDt: "22/10/16",
		endDt: "22/10/22",
		type : "marketCustom"
	}
	$.ajax({
		url: "/salesDateGraph",
		data: data,
		type: "post",
		dataType: "json",
		async: false,

		success: function(resp) {
			$("#area-adwords").empty();
			let val = [];
			let date = [];
			for (let i = 0; i < resp.onSitePayment.length; i++) {
				val[i] = resp.onSitePayment[i].CNT;
				date[i] = resp.onSitePayment[i].TODAY;
			}
			optionsArea.series[0].name = "방문자 수";
			optionsArea.series[0].data = val;

			optionsArea.xaxis.categories = date;

			var chartArea = new ApexCharts(document.querySelector('#area-adwords'), optionsArea);
			chartArea.render();

		},
		error: function(request, status, error) {
			console.log(request.status);
			console.log(request.responseText);
			console.log(request.error);
		}
	});
	
	// 요일별 평균결제금액
	let dataavg = {
		startDt: "22/10/16",
		endDt: "22/10/22",
		type: "daysAvgPay"
	}
	$.ajax({
		url: "/salesDateGraph",
		data: dataavg,
		type: "post",
		dataType: "json",
		async: false,

		success: function(resp) {
			$("#chart").empty();
			console.log(resp);
			let val = [];
			let date = [];
			for (let i = 0; i < resp.daysAvgPay.length; i++) {
				val[i] = resp.daysAvgPay[i].AVG;
				date[i] = resp.daysAvgPay[i].DAY;
			}
			optionsBar.series[0].name = "평균결제금액";
			optionsBar.series[0].data = val;

			optionsBar.xaxis.categories = date;

			var chartBar = new ApexCharts(document.querySelector('#chart'), optionsBar);
			chartBar.render();

		},
		error: function(request, status, error) {
			console.log(request.status);
			console.log(request.responseText);
			console.log(request.error);
		}
	});
	
	
	// 주간 가장 많이 팔린 메뉴
	let WeekMenu = {
		startDt: "22/10/16",
		endDt: "22/10/22",
		type: "weekMenu"
	}
	$.ajax({
		url: "/salesDateGraph",
		data: WeekMenu,
		type: "post",
		dataType: "json",
		async: false,

		success: function(resp) {
			console.log(resp);
			$("#Weekchart").empty();
			let amount1 = 0;
			let amount2 = 0;
			let amount3 = 0;
			let amount4 = 0;
			
			
			for(let i = 0; i < resp.weekMenu.menuList.length; i++){
				if(resp.weekMenu.menuList[i].foodName === "불고기피자"){
					amount1 += resp.weekMenu.menuList[i].amount;
				}else if(resp.weekMenu.menuList[i].foodName === "포테이토피자"){
					amount2 += resp.weekMenu.menuList[i].amount;
				}else if(resp.weekMenu.menuList[i].foodName === "고구마피자"){
					amount3 += resp.weekMenu.menuList[i].amount;
				}else if(resp.weekMenu.menuList[i].foodName === "페퍼로니피자"){
					amount4 += resp.weekMenu.menuList[i].amount;
				}else{
					
				}
			}
			
			WeekMenuoptions.series[0].name = "수량";
			WeekMenuoptions.series[0].data = [amount1,amount2,amount3,amount4];
			WeekMenuoptions.xaxis.categories = ["불고기 피자","포테이토 피자","고구마 피자","페퍼로니 피자"];
			
			var Weekchart = new ApexCharts(document.querySelector("#Weekchart"), WeekMenuoptions);
			Weekchart.render();

		},
		error: function(request, status, error) {
			console.log(request.status);
			console.log(request.responseText);
			console.log(request.error);
		}
	});
});