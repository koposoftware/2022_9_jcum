$(function(e) {
    // 메뉴 탭
    $('.lnb li a').not('.sms a, .sms_auto a, .sms_auto a, .send_list a').on('click', function(e) {        
        if(this.hash.indexOf("_view_") == -1)
        {
            e.preventDefault();
            $(this).parent('li').addClass('now').siblings('li').removeClass('now');
            $(this.hash).show().siblings('.page-cont, .tab-cont').hide();
            location.hash = this.hash+"_view_";
        }
    });

    //메뉴 리로드
    if(location.hash.indexOf("_view_") != -1)
    {
		var hash_val = location.hash.replace("_view_", "");
		$('.lnb li').removeClass('now');
		$("a[href='"+hash_val+"']").parent('li').addClass('now');
		$(hash_val).show().siblings('.page-cont, .tab-cont').hide();
    }

    // 왼쪽 메뉴 토글 2017.09.08 수정 
    $('#snb > li.plus > a').on('click', function(e) {
        e.preventDefault();
        if ($('#aside').hasClass('flexible')) {
            if ($(this).parent('li').hasClass('on')) {
                if ($(this).parent('li').hasClass('now')) {
                    $(this).parent('li').removeClass('now');
                } else {
                    $(this).parent('li').addClass('now');
                }
            } else {
                $('#snb > li').removeClass('on');
                $('#snb > li').removeClass('now');
                $('#snb > li > ul').slideUp();
                $(this).parent('li').addClass('on');
                $(this).parent('li').addClass('now');
                $(this).siblings('ul').slideDown();
            }
        } else {
            if ($(this).parent('li').hasClass('on')) {
                $(this).parent('li').removeClass('on');
                $(this).siblings('ul').slideUp();
            } else {
                $('#snb > li').removeClass('on');
                $('#snb > li > ul').slideUp();
                $(this).parent('li').addClass('on');
                $(this).siblings('ul').slideDown();
            }
        }
    });
    // 툴팁 토글
    $('.page-hd .user .lnk2, .page-body .about dd .btn-ctr, .page-body .notice li.bull a').not('.tooltip a').on('click', function(e) {
        e.preventDefault();
		
        $(this).siblings('.tooltip').slideToggle();
    });
    $('body').on('click', function(e) {
        $('.page-body .notice li.bull').each(function(i) {
            if ($(this).find('.tooltip').css('display') == 'block') {
                if (!$(this).has(e.target).length) {
                    $(this).find('.tooltip').slideUp();
                }
            }
        });
        if ($('.page-hd .user .tooltip').css('display') == 'block') {
            if (!$('.page-hd .user').has(e.target).length) {
                $('.page-hd .user .tooltip').slideUp();
            }
        }
        if ($('.page-body .about dd .tooltip').css('display') == 'block') {
            if (!$('.page-body .about dd').has(e.target).length) {
                $('.page-body .about dd .tooltip').slideUp();
            }
        }
    });
    // 위로
    var is_mobile = false;
    var filter = "win16|win32|win64|mac|macintel";
    if (navigator.platform) {
        if (filter.indexOf(navigator.platform.toLowerCase()) < 0) {
            is_mobile = true;
        }
    }
    if (is_mobile) {
        $('.go-top').css('bottom', ($('.btn-r').length) ? '55px' : '10px' );
    }
    $(window).scroll(function() {
        if ($(this).scrollTop() > 0) {
            $('.go-top').fadeIn();
        } else {
            $('.go-top').fadeOut();
        }
    });
    $('.go-top').on('click', function(e) {
        e.preventDefault();
        $('html, body').animate({'scrollTop': 0}, 500);
    });
    // 페이지 리사이즈
    $(window).resize(function() {
        if ($(window).width() >= 768 && $(window).width() < 1024) {
            $('.btn-control').addClass('btn-flexible');
            $('#aside').addClass('flexible');
            $('#content').addClass('flexible');
        } else {
            $('.btn-control').removeClass('btn-flexible');
            $('#aside').removeClass('flexible');
            $('#content').removeClass('flexible');
        }
    });
    // 페이지 세팅
    if ($(window).width() < 768) {
        // 왼쪽 메뉴 열기 
        $('.page-hd .user .btn-control').on('click', function(e) {
            e.preventDefault();
            $('#aside').animate({'left': 0}, 500);
        });
        // 왼쪽 메뉴 닫기 
        $('#aside h1 a').on('click', function(e) {
            e.preventDefault();
            $('#aside').animate({'left': '-100%'}, 500);
        });
    } else {
        if ($(window).width() >= 768 && $(window).width() < 1024) {
            $('.btn-control').addClass('btn-flexible');
            $('#aside').addClass('flexible');
            $('#content').addClass('flexible');
        } else {
            $('.btn-control').removeClass('btn-flexible');
            $('#aside').removeClass('flexible');
            $('#content').removeClass('flexible');
        }
        // 왼쪽 메뉴 토글 
        $('.page-hd .user .btn-control').on('click', function(e) {
            e.preventDefault();
            if ($(this).hasClass('btn-flexible')) {
                $(this).removeClass('btn-flexible');
                $('#aside').removeClass('flexible');
                $('#content').removeClass('flexible');
            } else {
                $(this).addClass('btn-flexible');
                $('#aside').addClass('flexible');
                $('#content').addClass('flexible');
            }
        });
    }
    // 팝업 열기 
    $('.btn-layer-open').on('click', function(e) {
        e.preventDefault();
        $('.overlay').show();
        $(this.hash).show();
        $("body").css({overflow:'hidden'}).bind('touchmove', function(e) {e.preventDefault()});
    });
    // 팝업 닫기
    $('.btn-layer-close').on('click', function(e) {
		
        e.preventDefault();
        $('.overlay').hide();
        $(this).parents('.layer-wrap').hide();
        $("body").css({overflow:''}).unbind('touchmove');
    });
    // on/off 스위치
    $('.switch').on('click', function(e) {
        e.preventDefault();
        if ($(this).hasClass('on')) {
            $(this).addClass('off').removeClass('on');
            $(this).html($(this).html().replace('노출', '미노출'));
        } else {
            $(this).addClass('on').removeClass('off');
            $(this).html($(this).html().replace('미노출', '노출'));
        }
    });

	// 달력 선택
	/*
    $('.datepicker input').datepicker({
        showOn: 'both',
        buttonImage: './img/common/ico_calendar.gif',
        dateFormat: 'yy.mm.dd',
        showMonthAfterYear: true
    });
	*/
    // 지점 선택
    $('.select-box .btn-navy').on('click', function(e) {
        e.preventDefault();
        if ($(this).next('ul').css('display') == 'block') {
            $(this).next('ul').hide();
        } else {
            $(this).next('ul').show();
        }
    });
    $('.select-box ul li a').on('click', function(e) {
        e.preventDefault();
        $(this).parents('ul').siblings('.btn-navy').find('span').text($(this).text());
        $(this).parents('ul').hide();
    });
    $('body').on('click', function(e) {
        if ($('.select-box ul').css('display') == 'block') {
            if (!$('.select-box').has(e.target).length) {
                $('.select-box ul').hide();
            }
        }
    });
    // 기간 선택
    $('.date-wrap a').on('click', function(e) {
        e.preventDefault();
        $(this).addClass('now').siblings('a').removeClass('now');
        $(this).parents('.report').siblings('.tbl-' + $(this).attr('data-type')).show().siblings('.tbl-list').hide();
    });
    // 게시판 내용 토글 2017.09.08 추가
    $('li.essential a, li.question a', '.board-list').on('click', function(e) {
        e.preventDefault();
        $(this).parent('li.question').toggleClass('on').siblings('li.question').removeClass('on');
        $(this).parent('li').next('li.answer').slideToggle().siblings('li.answer').slideUp();
    });
    // 영역 필터 2017.09.08 추가
    $('.btn-filter').on('click', function(e) {
        e.preventDefault();
        if ($(this).next('.page-filter').css('display') == 'block') {
            $(this).text($(this).text().replace('▲', '▼'));
            $(this).next('.page-filter').hide();
        } else {
            $(this).text($(this).text().replace('▼', '▲'));
            $(this).next('.page-filter').show();
        }
    });
    $('.page-filter .btn-c .btn-gray').on('click', function(e) {
        e.preventDefault();
        $(this).parents('.page-filter').hide();
    });
    // 메세지 영역 필터 2017.09.08 추가
	$('.inner .btn-c .btn-gray, .send-box .top').on('click', function(e) {
        e.preventDefault();
        if ($(this).parents('.send-box').find('.inner').css('display') == 'block') {
			$(this).parents('.send-box').find('.top .btn-arrow').text( $(this).parents('.send-box').find('.top .btn-arrow').text().replace('▲', '▼'));
            $(this).parents('.send-box').find('.inner').hide();
        } else {
			$(this).parents('.send-box').find('.top .btn-arrow').text($(this).parents('.send-box').find('.top .btn-arrow').text().replace('▼', '▲'));
            $(this).parents('.send-box').find('.inner').show();
        }
    });
	/*
    $('.top .btn-arrow, .inner .btn-c .btn-gray, .send-box .top').on('click', function(e) {
        e.preventDefault();
		 console.log($(this).parents('.send-box').find('.inner').css('display'));
        if ($(this).parents('.send-box').find('.inner').css('display') == 'block') { console.log('a');
			$(this).parents('.send-box').find('.top .btn-arrow').text( $(this).parents('.send-box').find('.top .btn-arrow').text().replace('▲', '▼'));
            $(this).parents('.send-box').find('.inner').hide();
        } else { console.log('b');
			$(this).parents('.send-box').find('.top .btn-arrow').text($(this).parents('.send-box').find('.top .btn-arrow').text().replace('▼', '▲'));
            $(this).parents('.send-box').find('.inner').show();
        }
    });*/
});
