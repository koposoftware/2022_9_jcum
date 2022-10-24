function isChromium() { // Actually, isWithChromiumPDFReader
    for (var i=0; i<navigator.plugins.length; i++)
        if (navigator.plugins[i].name == 'Chromium PDF Viewer') return true;
    return false;
}

//사진 미리보기
function LogoReadURL(input,preview) {
	if (window.FileReader) {
		if (input.files && input.files[0]) {
			var filetype = input.files[0].type;

			//이미지 파일인지 체크
			if (filetype == "image/png" || filetype == "image/gif" || filetype == "image/jpeg") {
				var reader = new FileReader();

				reader.onload = function (e) {
					$(preview).attr('src', e.target.result);
				}			
				reader.readAsDataURL(input.files[0]);
			}
			else {
				return false;
			}
		}
	}
	else {
		$(preview).attr('src','');
	}
	return true;
}
//사진 미리보기(다중 이미지 지원 버전. 2020.01.08)
function MultiLogoReadURL(input, preview, callback=null) {
	// 다중 업로드 지원하면서 다중 미리보기
	if (window.FileReader) {
		if (input.files) {
			var files_length = input.files.length;
			if (files_length < 1) {
				return false;
			}
		
			for (var i=0; i < files_length; i++) {
				var j=i;
				$("[id^="+preview.replace('#', '')+"]").each(function() { 
					var src = $(this).attr('src');
					if (src !='') {
						j = j+1;
					} else {
						return false;
					}
				});
				
				(function(file, j) {
					var filetype = file.type;
					
					if (filetype == "image/png" || filetype == "image/gif" || filetype == "image/jpeg") {
						var reader = new FileReader();
						reader.onload = function (e) {
							$("[id^="+preview.replace('#', '')+"]:eq("+j+")").attr('src', e.target.result);
							$("[id^="+preview.replace('#', '')+"]:eq("+j+")").attr('data-index', file.lastModified);
							$("[id^="+preview.replace('#', '')+"]:eq("+j+")").show();

							if (callback != null) {
								callback();
							}
						}
						reader.readAsDataURL(file);
					}
					else {
						//continue;
					}
				})(input.files[i], j)
			}
		}
	}
	else {
		$(preview+"1").attr('src','');
	}
	
	return true;
}

//숫자만 입력
function onlyNumber(self) {
	var number = $(self).val();
	number = number.replace(/[^0-9]/gi, '');
	if (number == "") {
		number = 0;
	}
	number = parseInt(number);

	$(self).val(number);
}

//숫자만 입력
function onlyNumber2(self) {
	var number = $(self).val();
	number = number.replace(/[^0-9]/gi, '');
	var reg = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;
	//특수문자 검증
	if(reg.test(number)) {
		//특수문자 제거후 리턴
		number = number.replace(reg, "");
		number = parseInt(number);
		$(self).val(number);
	} else {
		//특수문자가 없으므로 본래 문자 리턴
		number = parseInt(number);
		$(self).val(number);
	}
}

//숫자만 입력
function onlyInt(self) {
	var number = $(self).val();
	number = number.replace(/[^0-9-]/gi, '');
	
	if (number == "0-") {
		number = "-";
	}
	if (number.indexOf("-") > 0) {
		number = "-"+number.replace(/[^0-9]/gi, '');
	}
	if (number != "-") {
		number = parseInt(number);
	}
	if (isNaN(number) && number != "-") {
		number = 0;
	}

	$(self).val(number);
}

// 전화번호만 입력
function onlyPhone(self) {
	var str = $(self).val();
	str = str.replace(/[^0-9]/gi, '');
	$(self).val(str);
}

// 전화번호 자동하이픈
function onlyPhoneAuto(self) {
	var str = $(self).val();
	str = str.replace(/[^0-9]/gi, '').replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
	$(self).val(str);
}

function checkBisNo(bizID) {
	if (bizID.length != 10) {
		return false;
	}
	return true;
}

//비밀번호 영문,숫자,특수문자 중에 2가지 혼합하여 8자리이상
function chkPwd(str) {
	var pw = str;
	var num = pw.search(/[0-9]/g);
	var eng = pw.search(/[a-z]/ig);

	var spe = pw.search(/[`~!@@#$%^&*|\\\'\";:\/?]/gi);

	//8자 이상만 허용
	if(pw.length < 8 || pw.length > 20 ) {
		return false;
	}
	//공백 미허용
	if(pw.search(/\s/) != -1) {
		return false;
	}

	//영문,숫자,특수문자 중에 2가지 혼합
	if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ) {
		return false;
	}

	return true;
}

// 한글/영문
function chkContent(self) {
	var str = $(self).val();
	str = str.replace(/[^a-zㄱ-ㅎㅏ-ㅣ가-힣 \r\n]/gi, '');
	$(self).val(str);
}

// 한글/영문/숫자/띄어쓰기만 입력가능
function chkCode(self) {
	var str = $(self).val();
	str = str.replace(/[^0-9a-zㄱ-ㅎㅏ-ㅣ가-힣 ]/gi, '');
	$(self).val(str);
}

function isiPhone() {
	return (
		(navigator.platform.indexOf("iPhone") != -1) ||
		(navigator.platform.indexOf("iPod") != -1)
	);
}

//maxlength 체크 (type=number에서 maxlength 안먹어서)
//사용법 -> <input type="number" maxlength='11' oninput="maxLengthCheck(this)"/>
function maxLengthCheck(obj) {
	if (obj.value.length > obj.maxLength) {
		obj.value = obj.value.slice(0, obj.maxLength);
	}    
}

function maxLengthCheck2(obj) {
	if (obj.value > obj.maxLength) {
		obj.value = obj.maxLength;
	}    
}

function linelength(obj) {
	var line = obj.value.match(/(\r\n|\n|\r)/g);
	var add = 0;
	if (line != null) {
		add = line.length;
	}
	return add;
}

//글자수 계산
function strlength(obj) {
	return obj.value.length + linelength(obj);
}

//textarea maxlength 효과주기
//portable chrome maxlength 속성이 먹혀서 max_length로 이름 변경
function textarea_maxlength(obj) {
	var maxlength = parseInt(obj.getAttribute("max_length"));
	
	var length = strlength(obj);
	if (length > maxlength) {
		obj.value = obj.value.substring(0, maxlength - linelength(obj));
	}
}

//2019-05-04 textarea 라인 제한두기
function limit_line(obj) {
	var line = linelength(obj) + 1;
	var maxline = $(obj).attr('max_line');
	if (line > maxline) {
		obj.value = obj.value.slice(0, obj.value.length -1);
	}
}

//전화번호 형식
function autoHypenPhone(str) {
	str = str.replace(/[^0-9]/g, '');
	var tmp = '';
	if( str.length < 4) {
		return str;
	} else if(str.length < 7) {
		tmp += str.substr(0, 3);
		tmp += '-';
		tmp += str.substr(3);
		return tmp;
	} else if(str.length < 11) {
		tmp += str.substr(0, 3);
		tmp += '-';
		tmp += str.substr(3, 3);
		tmp += '-';
		tmp += str.substr(6);
		return tmp;
	} else {				
		tmp += str.substr(0, 3);
		tmp += '-';
		tmp += str.substr(3, 4);
		tmp += '-';
		tmp += str.substr(7);
		return tmp;
	}
}

//이메일 유효성 검사
function ck_email(email) {
	var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	
	if (regEmail.test(email)) {
		return true;
	}
	return false;
}
//float 유효성 검사
function ck_float(str) {
	var pattern = /^\d+(?:[.]?[\d]?[\d])?$/;
	if (pattern.test(str)) {
		return true;
	}
	return false;
}

function only_percent(e) {
	var pattern = /^(\d{1,2}([.]\d{0,2})?)?$/;
	var val = e.srcElement.value;
	if (val != 100) {	
		if (!pattern.test(val)) {
			e.srcElement.value = e.srcElement.value.substring(0,e.srcElement.value.length - 1);
			e.srcElement.focus();
		}
	}
}

// 띄어쓰기 없애기
function checkSpace(obj) {
	obj.value = obj.value.replace(/\s/gi,"");
}

// 문자의 바이트 수를 체크
function checkByte(str) {
	var totalByte = 0;
	for(var i =0; i < str.length; i++) {
		var currentByte = str.charCodeAt(i);

		totalByte++;
		if(currentByte > 128) {
			totalByte++;
		}
	}
	return totalByte;
}


//바이트만큼 자르기
function cutByLen(str, maxByte) {
	for(b=i=0;c=str.charCodeAt(i);) {
		b+=c>>7?2:1;

		if (b > maxByte)
			break;
		i++;
	}

	return str.substring(0,i);
}

//입력필드 바이트수 자동 전달
function input_byte(obj, out_name) {	
	var len=checkByte(obj.value);
	$(out_name).text(len);
}


function popup(mylink, w, h) {
    if (!window.focus) return true;
    var href;
    if (typeof (mylink) == 'string') href = mylink;
	else href = mylink.href;

	var dualScreenLeft = window.screenLeft != undefined ? window.screenLeft : screen.left;
    var dualScreenTop = window.screenTop != undefined ? window.screenTop : screen.top;
	var width = window.innerWidth ? window.innerWidth : document.documentElement.clientWidth ? document.documentElement.clientWidth : screen.width;
    var height = window.innerHeight ? window.innerHeight : document.documentElement.clientHeight ? document.documentElement.clientHeight : screen.height;
    var left = ((width / 2) - (w / 2)) + dualScreenLeft;
	var top = ((height / 2) - (h / 2)) + dualScreenTop;
	if(top>200)
		top=200;

	window.open(href, '', 'width='+w+',height='+h+', top=' + top + ', left=' + left+',scrollbars=yes');
	
    return false;
}

//ajax 페이지 불러오기  (complete // 2020-06-22 추가)
function load_page(tag, url, params, complete) {
	if (complete == undefined) {
		complete = function(){};
	}
	if(params != "undefined" || params !="") {
		$(tag).load(url, params, complete);
	}
	else {
		$(tag).load(url, complete);
	}
}
// ajax 페이지 더보기
function load_page_more(tag, url, params) {
    $(tag).append($("<div>").load(url));
}

function goPay() {
	location.href="/store2/pay/product";
}

function goBack() {
	window.history.back();
}

function open_cardbill(card_transno) {
	var showreceiptUrl = "https://iniweb.inicis.com/DefaultWebApp/mall/cr/cm/mCmReceipt_head.jsp?noTid="+card_transno+"&noMethod=1";
	window.open(showreceiptUrl,"showreceipt","width=420,height=540, scrollbars=no,resizable=no");
}

function open_segum(billnum) {
	window.open('http://taxmanager.makeshop.co.kr/admin/receiver_view.html?dc_ref_id='+billnum,'pop','scrollbars=yes,toolbar=no,status=no,width=950,height=640,resizable=no,menubar=no');	
}


function setCookie(cname, cvalue, exdays) {
	var d = new Date();
	d.setDate(d.getDate() + exdays);
	var expires = "expires="+d.toUTCString();
	document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

function getCookie(cname) {
	var name = cname + "=";
	var ca = document.cookie.split(';');
	for(var i = 0; i < ca.length; i++) {
		var c = ca[i];
		while (c.charAt(0) == ' ') {
			c = c.substring(1);
		}
		if (c.indexOf(name) == 0) {
			return c.substring(name.length, c.length);
		}
	}
	return "";
}

// 숫자 타입에서 쓸 수 있도록 format() 함수 추가
Number.prototype.format = function() {
    if(this==0) return 0;

    var reg = /(^[+-]?\d+)(\d{3})/;
    var n = (this + '');

    while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');

    return n;
};

// 문자열 타입에서 쓸 수 있도록 format() 함수 추가
String.prototype.format = function() {
    var num = parseFloat(this);
    if( isNaN(num) ) return "0";
    return num.format();
};