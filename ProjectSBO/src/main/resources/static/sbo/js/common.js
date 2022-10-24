$(function(){
	// 서울시 표준 GNB 로딩
	/* script로 위치변경 - 22.04.22
	if(window.location.host === "golmok.seoul.go.kr"){
		Yjs.Gnb.init('G172', 'seoul-common-gnb');
	}
	*/

	/*변경사항*/
	// 탭 동작
	/*    $("ul.tabs-a li").on("click", function () {
            var feature = getMapFeature();
                    if($('.bottom-content-wrap2').is(":visible")){
                var bcwHeight = "calc( 100% - 37px)";
            } else {
                var bcwHeight = "100%";
            }
            $('.bottom-content-wrap').css({height: bcwHeight, overflow: 'auto'});
            $("ul.tabs-a > li").removeClass("active");
            $(this).addClass("active");
            $(".tab-content-a").hide();
            var activeTab = $(this).attr("rel");
            $("#" + activeTab).fadeIn();
        });*/
	/*$("ul.tabs-b li").on("click", function (e) {
		 if (e.target.type == "button"){
			 return;
		 }

        $("ul.tabs-b li").removeClass("active");
        $(this).addClass("active");
        $(".tab-content-b").hide();
        var activeTab = $(this).attr("rel");
        $("#" + activeTab).fadeIn();
    });*/
	/*$(".tabs-b").tabs({
		active: 0,
		activate: function(event, ui){
			ui.oldTab.find('button').attr('tabindex', '-1');
			ui.newTab.find('button').attr('tabindex', '0');
		}
	});*/

	/*$("#result-area1 ul.tabs-c li").on("click", function () {
        $("#result-area1 ul.tabs-b li").removeClass("active");
        $(this).addClass("active");
        $("#result-area1 .tab-content-b").hide();
        var activeTab = $(this).attr("rel");
        $("#" + activeTab).fadeIn();
    });
    $("#result-area2 ul.tabs-c li").on("click", function () {
        $("#result-area2 ul.tabs-c li").removeClass("active");
        $(this).addClass("active");
        $("#result-area2 .tab-content-c").hide();
        var activeTab = $(this).attr("rel");
        $("#" + activeTab).fadeIn();
        $("#" + activeTab + ' ul.selectbox').scrollTop(0)
    });*/

	$(".tabs-c").tabs({
		active: 0,
		activate: function(event, ui){
			ui.newPanel.find('ul.selectbox').scrollTop(0);
		}
	});


	/*변경사항*/
	/*
    $('.bottom-wrap .tabs-a li').bind("class-change",function(){
        if($('.bottom-content-wrap2').is(":visible") == false){
            $('#divKeepPop').css("z-index","20");
            $('#divFtInfoPop').css("z-index","20"); //기존의 지도상의 상권영역 데이터 팁 z-index(및 원복)
        }
        var bottomSize = $('.bottom-wrap').innerHeight();
        var bottomHMax = $('body').innerHeight() - (($(window).innerWidth() > 1000) ? 182 : 125); //전체 바디에서 header 제외
        var bottomMenuH = $('.tabs-a li').innerHeight();

        if(bottomSize == bottomHMax || bottomSize == bottomMenuH){ //처음 탭을 클릭하거나 , 탭을 클릭해서 result 탭 크기가 최대에서 변화가 없다면 다른탭을 클릭해도 그 크기로
            if($('.bottom-wrap .tabs-a li.active').text() != ''){ //active된 중분류 탭이 있다면
                $('#bottom-wrap').animate({bottom: 0, top: 'auto', height: bottomHMax});
                $('#divKeepPop').css("z-index",Number($('.bottom-wrap').css("z-index"))-1); //상권영역 데이터 팁 z-index result 밑으로 숨기기
                $('#divFtInfoPop').css("z-index",Number($('.bottom-wrap').css("z-index"))-1);
            }
        }else { //탭의 크기가 바뀌었을 때
            if($('.bottom-wrap .tabs-a li.active').text() != ''){
                if($('.bottom-content-wrap2').is(":visible")){
                    //만약 탭의 크기가 바뀐 이유가 상권 비교 분석 탭(기존의 탭보다 크기가 작음)으로 인한 것이라면 분석탭 Max
                    $('#bottom-wrap').animate({bottom: 0, top: 'auto', height: bottomHMax});
                    $('#divKeepPop').css("z-index",Number($('.bottom-wrap').css("z-index"))-1); //상권영역 데이터 팁 z-index result 밑으로 숨기기
                    $('#divFtInfoPop').css("z-index",Number($('.bottom-wrap').css("z-index"))-1);
                    $('#wrap2Tap').addClass('folded');
                    $('.bottom-content-wrap2 .btn-close').addClass('folded');
                }else{
                    //드래그라면 다른 탭을 클릭해도 변경된 크기 유지해서 분석
                    $('#bottom-wrap').animate({bottom: 0, top: 'auto', height: bottomSize});
                    $('#divKeepPop').css("z-index",Number($('.bottom-wrap').css("z-index"))-1); //상권영역 데이터 팁 z-index result 밑으로 숨기기
                    $('#divFtInfoPop').css("z-index",Number($('.bottom-wrap').css("z-index"))-1);
                }

            }

        }
        bottomHMaxResize();
    });
    */
	/*    $(".tabs-a").tabs({
            collapsible: true,
            active: false,
            activate: function(event, ui){
                   if($('.bottom-content-wrap2').is(":visible") == false){
                    $('#divKeepPop').css("z-index","20");
                    $('#divFtInfoPop').css("z-index","20"); //기존의 지도상의 상권영역 데이터 팁 z-index(및 원복)
                }
                var bottomSize = $('.bottom-wrap').innerHeight();
                var bottomHMax = $('body').innerHeight() - (($(window).innerWidth() > 1000) ? 182 : 125); //전체 바디에서 header 제외
                var bottomMenuH = $('.tabs-a > ul li').innerHeight();
                var indutyInfo = getInduCode();
                var mapId = $('#mapId').val();
                var feature = getAnalyseFeature(mapId); //map_link.js
                var contents = $('#nav-pc > ul').children('.active').attr("class");
                //서울 상권 검색과 내점포 분석은 업종선택과 분석영역이 모두 있어야 하단의 분석 탭이 Maxsize로 올라갑니다.
                //창업신호둥과의 구분을 위해 header에서 nav의 active된 class의 이름을 가져옵니다.
                if(bottomSize == bottomHMax || bottomSize == bottomMenuH){//처음 탭을 클릭하거나 , 탭을 클릭해서 result 탭 크기가 최대에서 변화가 없다면 다른탭을 클릭해도 그 크기로
                    if(contents.match("freeAreaAnalysis") != null || contents.match("fixedAreaAnalysis") != null){
                        //서울상권 검색이나 내점포 분석 일때
                        if(feature != null && indutyInfo.MName != '선택'){
                            //지도상에 선택한 피쳐가 있고 업종선택에서 중분류가 선택이 아닐때
                            $('#bottom-wrap').animate({bottom: 0, top: 'auto', height: bottomHMax});
                            $('#divKeepPop').css("z-index",Number($('.bottom-wrap').css("z-index"))-1); //상권영역 데이터 팁 z-index result 밑으로 숨기기
                            $('#divFtInfoPop').css("z-index",Number($('.bottom-wrap').css("z-index"))-1);
                        }else {
                            $('#middleTab li').removeClass("ui-tabs-active");
                        }
                    }else if(contents.match("signal") != null){
                        //창업신호등일때
                        $('#bottom-wrap').animate({bottom: 0, top: 'auto', height: bottomHMax});
                        $('#divKeepPop').css("z-index",Number($('.bottom-wrap').css("z-index"))-1); //상권영역 데이터 팁 z-index result 밑으로 숨기기
                        $('#divFtInfoPop').css("z-index",Number($('.bottom-wrap').css("z-index"))-1);
                    }
                }else { //탭의 크기가 바뀌었을 때
                    if($('.bottom-wrap .tabs-a > ul li.ui-tabs-active').text() != ''){
                        if($('.bottom-content-wrap2').is(":visible")){
                            //만약 탭의 크기가 바뀐 이유가 상권 비교 분석 탭(기존의 탭보다 크기가 작음)으로 인한 것이라면 분석탭 Max
                            $('#bottom-wrap').animate({bottom: 0, top: 'auto', height: bottomHMax});
                            $('#divKeepPop').css("z-index",Number($('.bottom-wrap').css("z-index"))-1); //상권영역 데이터 팁 z-index result 밑으로 숨기기
                            $('#divFtInfoPop').css("z-index",Number($('.bottom-wrap').css("z-index"))-1);
                            $('#wrap2Tap').addClass('folded');
                            $('.bottom-content-wrap2 .btn-close').addClass('folded');
                        }else{
                            //드래그라면 다른 탭을 클릭해도 변경된 크기 유지해서 분석
                            $('#bottom-wrap').animate({bottom: 0, top: 'auto', height: bottomSize});
                            $('#divKeepPop').css("z-index",Number($('.bottom-wrap').css("z-index"))-1); //상권영역 데이터 팁 z-index result 밑으로 숨기기
                            $('#divFtInfoPop').css("z-index",Number($('.bottom-wrap').css("z-index"))-1);
                        }

                    }

                }
                bottomHMaxResize();
                $('.tab-container-a').scrollTop(0);
            }
        });*/


	/*    $(".tabs-a").tabs({
            active: false,
            activate: function(event, ui){
                if($('.bottom-content-wrap2').is(":visible")){
                    var bcwHeight = "calc( 100% - 37px)";
                } else {
                    var bcwHeight = "100%";
                }
                $('.bottom-content-wrap').css({height: bcwHeight, overflow: 'auto'});
                $('.tab-container-a').scrollTop(0);
            }
        });*/

	/*    $(".tabs-a").tabs({
            collapsible: true,
            active: false,
            activate: function(event, ui){
                var bottomHMax = $('body').innerHeight() - (($(window).innerWidth() > 1000) ? 182 : 125); //전체 바디에서 header 제외
                var indutyInfo = getInduCode();
                var mapId = $('#mapId').val();
                var feature = getAnalyseFeature(mapId); //map_link.js
                if(feature != null && indutyInfo.MName != '선택'){
                    $('#bottom-wrap').animate({bottom: 0, top: 'auto', height: bottomHMax});
                    bottomHMaxResize();
                    $('.tab-container-a').scrollTop(0);
                }else {
                    var li = $("#middleTab li");
                    for(var i=0; i<li.length; i++){
                        var one = $(li)[i];
                        $(one).removeClass("ui-tabs-active");
                        $(one).removeClass("ui-state-active");

                    }
                    if(indutyInfo.MName == '선택'){
                        alert("업종을 선택해주세요.");
                    }else if(feature == null){
                        alert("분석영역을 선택해주세요.");
                    }
                }
            }
        });*/

	/*middleTab을 클릭했을 때 active되어있으면 분석 결과 올라오기*/
	$(".tabs-a").on("click", function(event, ui){
		var bottomHMax = $('body').innerHeight() - (($(window).innerWidth() > 1000) ? 182 : 125); //전체 바디에서 header 제외
		if($("#middleTab li.analActive").length != 0 && $('.bottom-content-wrap2').is(":visible") == false){
			$('#bottom-wrap').animate({bottom: 0, top: 'auto', height: bottomHMax});
			$(".tab-container-a").show();
			bottomHMaxResize();
			$('.tab-container-a').scrollTop(0);
		}else if($("#middleTab li.analActive").length != 0 && $('.bottom-content-wrap2').is(":visible")){
			$('.bottom-content-wrap').css({bottom: 0, top: 'auto', height: bottomHMax-37});
			$('.bottom-content-inner').hide();
			$(".bottom-content-wrap2 #wrap2Tap").addClass("folded");
			$(".bottom-content-wrap2 .btn-close").addClass("folded");
			$('#bottom-wrap').css({bottom: 0, top: 'auto', height: bottomHMax});

			bottomHMaxResize();
			$('.tab-container-a').scrollTop(0);
		}
	});


	/*변경사항 bottomHMaxResize()*/
	bottomHMaxResize = function(){
		var contents = $('#nav-pc > ul').children('.active').attr("class");
		if(contents != null){ //메인페이지의 경우 contents가 null이여서 match함수가 에러남!!
			if(contents.match("freeAreaAnalysis") != null || contents.match("fixedAreaAnalysis") != null){ //서울상권, 내점포 분석일 경우
				var bodyH = $('body').innerHeight();
				var headerH = ($(window).innerWidth() > 1000) ? 182 : 125;
				var bottomH = $('#bottom-wrap').innerHeight();
				var bottomMenuH = 0;
				var bottomHMax =0;
				bottomMenuH = $('.tabs-a > ul li').innerHeight();
				bottomHMax =($('.tabs-a > ul li.analActive').text() != '' || $('.bottom-content-wrap2').is(":visible"))? (bodyH - headerH) : bottomMenuH;
				//중분류 분석이 active 되어있다면 bottomMax사이즈가 수정가능 아니라면 메뉴탭만큼만!!
				//비교분석 탭이 살아있으면 bottomMax사이즈가 수정가능
				var bottomHNew = (bottomH > bottomHMax) ? bottomHMax : bottomH;
				var compareTapH = $('#wrap2Tap').outerHeight();

				$('#bottom-wrap').css({bottom: 0, top: 'auto', height: bottomHNew}).resizable({
					maxHeight: bottomHMax,
					minHeight: ($('.bottom-content-wrap2').is(":visible"))? 37+compareTapH : 37,
					handles:'n'
				}).on('resize', function(e) {
					e.stopPropagation();
				});
			}else{
				var bodyH = $('body').innerHeight();
				var headerH = ($(window).innerWidth() > 1000) ? 182 : 125;
				var bottomH = $('#bottom-wrap').innerHeight();
				var bottomMenuH = 0;
				var bottomHMax =0;
				bottomMenuH = $('.tabs-a > ul li').innerHeight();
				bottomHMax =($('.bottom-content-wrap3').is(":visible"))? (bodyH - headerH) : bottomMenuH;
				//중분류 분석이 active 되어있다면 bottomMax사이즈가 수정가능 아니라면 메뉴탭만큼만!!
				//비교분석 탭이 살아있으면 bottomMax사이즈가 수정가능
				var bottomHNew = (bottomH > bottomHMax) ? bottomHMax : bottomH;
				var compareTapH = $('#wrap2Tap').outerHeight();

				$('#bottom-wrap').css({bottom: 0, top: 'auto', height: bottomHNew}).resizable({
					maxHeight: bottomHMax,
					minHeight: ($('.bottom-content-wrap2').is(":visible"))? 37+compareTapH : 37,
					handles:'n'
				}).on('resize', function(e) {
					e.stopPropagation();
				});
			}
		} else {
			contents = $('.nav-m > ul').children('.active').attr("class");
			if( contents != null && contents.match("freeAreaAnalysisAdmin") != null ) {
				var bodyH = $('body').innerHeight();
				var headerH = ($(window).innerWidth() > 1000) ? 182 : 125;
				var bottomH = $('#bottom-wrap').innerHeight();
				var bottomMenuH = 0;
				var bottomHMax =0;
				bottomMenuH = $('.tabs-a > ul li').innerHeight();
				bottomHMax =($('.tabs-a > ul li.analActive').text() != '' || $('.bottom-content-wrap2').is(":visible"))? (bodyH - headerH) : bottomMenuH;
				//중분류 분석이 active 되어있다면 bottomMax사이즈가 수정가능 아니라면 메뉴탭만큼만!!
				//비교분석 탭이 살아있으면 bottomMax사이즈가 수정가능
				var bottomHNew = (bottomH > bottomHMax) ? bottomHMax : bottomH;
				var compareTapH = $('#wrap2Tap').outerHeight();

				$('#bottom-wrap').css({bottom: 0, top: 'auto', height: bottomHNew}).resizable({
					maxHeight: bottomHMax,
					minHeight: ($('.bottom-content-wrap2').is(":visible"))? 37+compareTapH : 37,
					handles:'n'
				}).on('resize', function(e) {
					e.stopPropagation();
				});
			}
		}
	};

	$(window).on('resize load',function(){

		bottomHMaxResize();
		inquiryToggle();


		if($('#mapId').attr("value") != undefined){ //지도가 아닐경우 실행안됨
			mapUpdateSize(); //map_custom

		}
	});

	/*변경사항*/
	// 하단 영역 슬라이딩 업

	bottomSlideUp = function(){
		var mapId =  $('#mapId').val();
		if(mapId !== 'gentrification'){
			var bodyH = $('body').innerHeight();
			var headerH = ($(window).innerWidth() > 1000) ? 182 : 125;
			var bottomHMax = bodyH - headerH;
			//아래 if문은 안걸리는데 퍼블리싱 이유가 있을거 같아서 일단 내버려둠...
			if ( $("#bottom-wrap").height() < 200 ) { // 하단영역 높이가 200픽셀 이하이면 최대의 절반 높이로 애니
				$('#bottom-wrap').animate({bottom: 0, top: 'auto', height: bottomHMax});
			}
		}

	}



	// 상권 비교 분석 보이기
	compareOpen = function(){
		$(".bottom-content-wrap2 .bottom-content-inner").show();
		//bottomSlideUp();
		$('#divKeepPop').css("z-index",1); //상권영역 데이터 팁 z-index result 밑으로 숨기기
		$('#divFtInfoPop').css("z-index",1);

		var li = $("#middleTab li");
		for(var i=0; i<li.length; i++){
			var one = $(li)[i];
			$(one).removeClass("analActive");
			$(one).removeClass("analActive");
			$(one).removeClass("ui-state-active");
			$(one).removeClass("ui-tabs-active");
			$(".tab-container-a div").hide();
		}
		$("#middleTab").addClass("folded");
		$('#bottom-wrap').animate({bottom: 0, top: 'auto', height: '484px'});
		$('.bottom-content-wrap').css({height: 37, overflow: 'hidden'});
		//$(".tab-container-a").hide();
		//$('.bottom-content-wrap2').css({bottom: 0, top: 'auto', height: '503px'}); //하단 '503px'고정
		$('.bottom-content-wrap2').fadeIn();
		$('#wrap2Tap').removeClass('folded');
		$('.bottom-content-wrap2 .btn-close').removeClass('folded');
		if($("#middleTab li.ui-tabs-active").length != 0){
			$("#middleTab li.ui-tabs-active").removeClass("ui-tabs-active");
		}
		bottomHMaxResize();
	};

	// 상권 비교 분석 닫기
	compareClose = function(){
		$('#divKeepPop').css("z-index","20");
		$('#divFtInfoPop').css("z-index","20"); //기존의 지도상의 상권영역 데이터 팁 z-index(및 원복)
		$('.bottom-content-wrap2').hide();
		$('.bottom-content-wrap').css({height: '100%', overflow: 'auto'});
		bottomHMaxResize();
		if($('.tabs-a > ul li.ui-tabs-active') != null && $('#bottom-wrap').css('height') == '74px'){
			$('#bottom-wrap').css('height','37px');
		}
	};

	/*변경사항*/
	// 좌측영역 열기/닫기
	$('.left-handle').on('click', function(){
		if($('.inquiry-wrap').is('.folded')){
			$('.inquiry-wrap').removeClass('folded').trigger('left-unfolded');
			//$('.map-wrap').removeClass('expand');
			//$('.bottom-wrap').removeClass('expand');
		} else {
			$('.inquiry-wrap').addClass('folded').trigger('left-folded');
			//$('.map-wrap').addClass('expand');
			//$('.bottom-wrap').addClass('expand');
		}
		/*변경사항*/
		if($('#mapId').attr("value") != undefined){ //지도가 아닐경우 실행안됨
			mapUpdateSize(); //map_custom

		}

	});
	/*변경사항*/
	var inquiryToggle = function(){
		if ($(window).innerWidth() > 1000){
			$('.inquiry-wrap').removeClass('folded').trigger('left-unfolded');
		} else {
			$('.inquiry-wrap').addClass('folded').trigger('left-folded');
		}
	};
	// 우측영역 열기/닫기
	$('.right-handle').on('click', function(){
		if(isOpenedRight){
			if($('.right-wrap').is('.folded')){
				$('.right-wrap').removeClass('folded');
			} else {
				$('.right-wrap').addClass('folded');
			}
		} else{
			//	alert('지도의 분석영역을 클릭하면 해당영역을 분석합니다.')
		}
	});
	var rightToggle = function(){
		if ($(window).innerWidth() > 1000){
			$('.right-wrap').removeClass('folded');
		} else {
			$('.right-wrap').addClass('folded');
		}
	};
	/*변경사항!!!!*/
	// 지도 툴 열기/닫기
	/*$("#toolA > ul > li:not(:nth-child(4))").hover(function(){
		$("#toolA > ul > li:not(:nth-child(4))").not($(this)).removeClass("active");
		$("#toolA > ul > li:nth-child(4) .bg").removeClass("clickactive");
		$(".mMRule, .iMin, .iRule").hide();
		$(this).addClass("active");
	}, function(){
		$(this).removeClass("active");
	});
	$('#toolA > ul > li:not(:nth-child(4))').on('focusin',function(){
		$('#toolA > ul > li:not(:nth-child(4))').not($(this)).removeClass('active');
		$("#toolA > ul > li:nth-child(4) .bg").removeClass("clickactive");
		$(".mMRule, .iMin, .iRule").hide();
		$(this).addClass("active");
	});
	$('#toolA > ul > li:not(:nth-child(4)) > ul > li').on('focusin',function(){
		$(this).parent().parent().addClass("active");
	});
	$("#toolA > ul > li:not(:nth-child(4)) > ul > li").on("click", function(){
		$("#toolA > ul > li:not(:nth-child(4)) > ul > li").removeClass("active");
		$("#toolA > ul > li:nth-child(4) .bg").removeClass("clickactive");
		$(".mMRule, .iMin, .iRule").hide();
		$(this).addClass("active");
	});
	$("#toolA > ul > li:not(:nth-child(4)) > ul li").hover(function(){
		$(this).addClass("active");
	}, function(){
		$(this).removeClass("active");
	});
	$('#toolA > ul > li:not(:nth-child(4)) > ul > li > ul > li').on('focusin',function(){
		$(this).parent().parent().addClass("active");
	});
	$("#toolA > ul > li:nth-child(4) .bg").on("click", function(){
		$("#toolA > ul > li:not(:nth-child(4))").not($(this)).removeClass("active");
		if($(this).hasClass("clickactive")){
			$(this).removeClass("clickactive");
			$(".mMRule, .iMin, .iRule").hide();
		} else {
			$(this).addClass("clickactive");
			$(".mMRule, .iMin, .iRule").show();
		}
	});

	*/
	$(".iMin").on("click", function(){
		$(".mMRule").hide();
		$(".iRule").show();
	});
	$(".iRule").on("click", function(){
		$(".mMRule").show();
	});
	 $(".iBdMin").on("click", function(){
		 	$(".mBdMRule").hide();
		 	$(".iBdRule").show();
	});
	$(".iBdRule").on("click", function(){
		 	$(".mBdMRule").show();
	});



	// 모달
	$('.poplink').on('click', function(e){
		e.preventDefault();
		$($(this).attr('href')).show();
		$($(this).attr('poplink')).show();
		//$("#wrap").css("overflow","hidden");
	});

	// 우측 메뉴
	$(".nav-trigger").on("click", function(){
		$(".nav-m").addClass("show").animate({right: 0}, 300, "easeInOutQuint");
	});
	$(".nav-close").on("click", function(){
		$(".nav-m").animate({right: "-280px"}, 300, "easeInOutQuint", function(){
			$(".nav-m").removeClass("show");
		});
		$(".nav-m .nav").accordion({active: false});
	});
	$( ".nav-m .nav" ).accordion({
		header: ">li > a",
		heightStyle: "content",
		active: false,
		collapsible: true
	});

	// 패밀리 사이트
	$(".jsBtnGo").on("click", function(){
		var url = $("#labelFamilySite option:selected").val();
		window.open(url);
		return false;
	});
	/* $("ul.tabs-report > li").on("click", function () {
           $("ul.tabs-report > li").removeClass("active");
           $(this).addClass("active");
           $(".tab-content-report").hide();
           var activeTab = $(this).attr("rel");
           $("#" + activeTab).fadeIn();
       });*/
	// 장애인 지원 스위치 버튼
	$.switcher('.form-check-input');

	// 상단 내비게이션 동작
	/*
  function gnbFnc(){
      var topnav = $('.nav-pc > ul');
      var topnavs = topnav.find('> li');
      var topnavsA = topnavs.find('a');
      var topnavsUl = topnavs.find('ul');
      topnavs.on('mouseenter',function(){
          topnavsUl.stop().animate({height: 100, paddingTop: 12},300);
      });
      topnav.on('mouseleave focusout',function(){
          topnavsUl.stop().animate({height: 0, paddingTop: 0},300);
      });
      topnavsA.on('focusin',function(){
          topnavsUl.stop().css({height: 100, paddingTop: 12},300);
      });
  }
  gnbFnc();
  */
	var topnavsUlH = 0;
	$('.nav-pc > ul > li').on('mouseenter',function(){
	if($(this).children("ul").children().length === 1){
		topnavsUlH = 30;
	}else if($(this).children("ul").children().length === 2){
		topnavsUlH = 52;
	}else if($(this).children("ul").children().length === 3){
		topnavsUlH = 75;
	}else if($(this).children("ul").children().length === 4){
		topnavsUlH = 98;
	}else if($(this).children("ul").children().length === 5){
		topnavsUlH = 121;
	}else if($(this).children("ul").children().length === 6){
		topnavsUlH = 140;
	}else if($(this).children("ul").children().length === 8){ //임시로 추가
		topnavsUlH = 180;
	}
		$(this).find('ul').stop().css({overflow:"visible"}).animate({height: topnavsUlH, paddingTop: 10, borderWidth: 1},300);
	});

	$('.nav-pc > ul > li').on('mouseleave',function(){
		$(this).find('ul').stop().css({overflow:"hidden"}).animate({height: 0, paddingTop: 0, borderWidth: 0},300);
	});
	$('.nav-pc > ul > li').on('focusout',function(){
		$('.nav-pc > ul > li > ul').stop().css({overflow:"hidden"}).animate({height: 0, paddingTop: 0, borderWidth: 0},300);
	});
	$('.nav-pc > ul > li > a').on('focusin',function(){
		if($(this).children("ul").children().length === 1){
			topnavsUlH = 30;
		}else if($(this).children("ul").children().length === 2){
			topnavsUlH = 52;
		}else if($(this).children("ul").children().length === 3){
			topnavsUlH = 75;
		}else if($(this).children("ul").children().length === 4){
			topnavsUlH = 98;
		}else if($(this).children("ul").children().length === 8){ //임시로 추가
			topnavsUlH = 180; 
		}
		$(this).next('ul').stop().css({overflow:"visible"}).animate({height: topnavsUlH, paddingTop: 10, borderWidth: 1},300);
	});
	$('.nav-pc > ul > li > ul a').on('focusin',function(){
		if($(this).children("ul").children().length === 1){
			topnavsUlH = 30;
		}else if($(this).children("ul").children().length === 2){
			topnavsUlH = 52;
		}else if($(this).children("ul").children().length === 3){
			topnavsUlH = 75;
		}else if($(this).children("ul").children().length === 4){
			topnavsUlH = 98;
		}
		$(this).parent().parent().stop().css({overflow:"visible"}).animate({height: topnavsUlH, paddingTop: 10, borderWidth: 1},300);

	});

	// 탭키 누를시 포커싱이 필요한 요소에 포커싱 가능하게 처리
	$('.selectbox label, ul.tabs-a > li, ul.tabs-b > li, ul.tabs-c > li, .left-handle, .right-handle, #toolA > ul > li:not(:nth-child(4)), #toolA > ul > li:not(:nth-child(4)) > ul li, #toolA > ul > li:nth-child(4) .bg, #toolB li, .areamove-wrap label, .ui-switcher, #area-radio label').each(function() {
		$(this).attr('tabindex', '0');
	});

	// 키보드 엔터 or 스페이스바 누를시 선택
	$('.selectbox label, ul.tabs-a > li, ul.tabs-b > li, ul.tabs-c > li, .left-handle, .right-handle, #toolA > ul > li:not(:nth-child(4)), #toolA > ul > li:not(:nth-child(4)) > ul li, #toolA > ul > li:nth-child(4) .bg, #toolB li, .areamove-wrap label, .ui-switcher, #area-radio label').keypress(function(e){
		if((e.keyCode ? e.keyCode : e.which) === 13 || (e.keyCode ? e.keyCode : e.which) === 32){
			$(this).trigger('click');
		}
	});

});
