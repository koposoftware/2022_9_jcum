package com.project.sbo.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.sbo.service.AdminService;
import com.project.sbo.service.MailSenderService;
import com.project.sbo.service.SboService;
import com.project.sbo.service.StoreService;
import com.project.sbo.util.CreateOrderNum;
import com.project.sbo.util.FoodInfoFromJson;
import com.project.sbo.util.OcrText;
import com.project.sbo.util.UploadFile;
import com.project.sbo.vo.Cart;
import com.project.sbo.vo.MailDto;
import com.project.sbo.vo.OcrData;
import com.project.sbo.vo.OrderList;
import com.project.sbo.vo.Sales;
import com.project.sbo.vo.StoreDetail;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class SmallBusinessOwner {
	
	@Autowired
	static
	ResourceLoader resourceLoader;
	
	@Autowired
	private UploadFile uploadFile;
	
	@Autowired
	private StoreService storeService;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private SboService sbo;
	
	private final MailSenderService mailService;



	@GetMapping("/sbo/owner")
	public String owner() {
		return "sbo/owner";
	}

	@GetMapping("/sbo/agree")
	public String agree() {
		return "sbo/agree";
	}

	@GetMapping("/sbo/join")
	public String join() {
		//return "index";
		return "sbo/join";
	}	
	// 로그인 이후 페이지, 메인으로 이동
	@GetMapping("/sbo/login")
	public String login(Model model) {
		return "sbo/main";
	}
	
	// 리포트 파일
	@GetMapping("/reportFinance")
	public String reFinance() {
		return "/sbo/sbizmanage/reportFinance";
	}
	
	// 오늘 배달 건수 및 오늘날짜 기준 일주일전 배달 건수
	@ResponseBody
	@PostMapping("/salesGraph")
	public Map<String, Object> mainGraph(){
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		Calendar c = Calendar.getInstance();
		String today = sdf.format(c.getTime());
		c.add(c.DATE, -7);
		String stDate = sdf.format(c.getTime());
		//"22/09/30", "22/09/23"
		//System.out.println("aab  : "+sbo.salesToday("22/09/30", "22/09/23"));
		
		Map<String, Object> rmap = new HashMap<String, Object>();
		rmap.put("Date", sbo.salesToday("22/09/30", "22/09/23"));
		// 오전/오후 건수
		rmap.put("salesCnt", sbo.salesAmPmCnt("22/09/30", "22/09/29"));
		// 오늘 기준으로 1주일, 전주 계산
		rmap.put("salesWeekSum", sbo.salesWeekSum("22/09/23", "22/09/30"));
		// 오늘 기준으로 2주일, 전주 계산
		rmap.put("salesTwoWeekSum", sbo.salesWeekSum("22/09/09", "22/09/16"));
		return rmap;
	}
	
	// 오늘 배달 건수 및 오늘날짜 기준 일주일전 배달 건수
	@ResponseBody
	@PostMapping("/salesDateGraph")
	public Map<String, Object> subGraph(String startDt, String endDt, String type) {
		//System.out.println(startDt);
		//System.out.println(endDt);
//		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
//		Calendar c = Calendar.getInstance();
//		String today = sdf.format(c.getTime());
//		c.add(c.DATE, -7);
//		String stDate = sdf.format(c.getTime());
		// "22/09/30", "22/09/23"
		// System.out.println("aab : "+sbo.salesToday("22/09/30", "22/09/23"));

		
		
		//Map<String, Object> salseToday = adminService.salesDetail(storeId, date, sort);
		//return new ResponseEntity<Map<String, Object>>(salseToday, HttpStatus.OK);
		Map<String, Object> rmap = new HashMap<String, Object>();
		if(type.equals("marketCustom")) {
			rmap.put("onSitePayment",sbo.onSitePayment(startDt, endDt));
		}else if(type.equals("daysAvgPay")) {
			rmap.put("daysAvgPay",sbo.daysAvgPay(startDt, endDt));
		}else if(type.equals("weekMenu")) {
			rmap.put("weekMenu", adminService.weekMenu(startDt, endDt));
		}
		else {
			// 주간 - 매입, 1주, 1개월, 6개월, 1년
			rmap.put("salesPurRange",sbo.salesRangePurchaseCnt(startDt, endDt));
			// 주간 - 매출, 1주, 1개월, 6개월, 1년
			rmap.put("salesRange",sbo.salesRangeCnt(startDt, endDt));
		}
		//System.out.println(rmap);
		return rmap;
	}
	
	// 회원가입 및 가게등록
	@PostMapping("/sbo/actionJoin")
	//public String main(Store store, MultipartFile file) throws IOException {
	public String main(MultipartFile file) throws IOException {
	    if (file.isEmpty()) {
	        String img = "";
	        //store.setReviewImg(img);
	    } else {
	        String img = uploadFile.fildUpload(file);
	        //store.setReviewImg(img);
	    }
	    
	    //System.out.println("값은요? : "+store);
		
		return "redirect:/sbo/owner";
	}
	
	// 가게 정보 출력
	@GetMapping("/store")
	public String store(Model model) {
		// 나중에 사업자 번호로 처리
		StoreDetail storeDetail = storeService.storeDetail(205, 2);
		model.addAttribute("store", storeDetail);
		return "sbo/store/detail";
	}
	// 주문 확인
	@GetMapping("/orders/{id}")
	public String order(@PathVariable long id) {
		return "sbo/store/order";
	}
	
	@GetMapping("/orders/orderList")
	public ResponseEntity<Map<String, Object>> orderList(long storeId, String list, int page) {
	 
		List<OrderList> orderList = adminService.order(205, list, 1);
		//List<OrderList> orderList = adminService.order(storeId, list, page);
		Map<String, Object> map = new HashMap<>();
		List<List<Cart>> menuList = new ArrayList<>();
		//System.out.println(orderList);
		if(orderList.size() != 0 && orderList.get(0).getFoodInfo() != null) {
			for (int i=0;i<orderList.size();i++) {
				menuList.add(FoodInfoFromJson.foodInfoFromJson(orderList.get(i).getFoodInfo()));
			}
		}
		
		map.put("orderList", orderList);
		map.put("cartList", menuList);
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}
	
	// 주문 접수 하기
	@PatchMapping("/orders/orderAccept")
	public ResponseEntity<String> orderAccept(String orderNum, int time, long userId) {
		adminService.orderAccept(orderNum, time, userId);
		
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	// 주문 완료
	@PatchMapping("/orders/orderComplete")
	public ResponseEntity<String> orderComplete(String orderNum, long userId) {
		//System.out.println(orderNum+userId);
		adminService.orderComplete(orderNum, userId);
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
//	// 매출 확인
//	@GetMapping("/sales/{id}")
//	public String sales(@PathVariable long id) {
//		return "sbo/store/sales";
//	}
	
	// 오늘 매출 데이터 메서드, 매출 상세
	@GetMapping("/sales/salesDetail")
	public ResponseEntity<Map<String, Object>> salesDetail(long storeId, String date, String sort) {
		//System.out.println(storeId + " : "+date+" : "+sort);
		Map<String, Object> salseToday = adminService.salesDetail(storeId, date, sort);
		return new ResponseEntity<Map<String, Object>>(salseToday, HttpStatus.OK);
	}
	
	// 매출 그래프 데이터
	@GetMapping("/sales/salesGraph")
	public ResponseEntity<List<Sales>> sales(long storeId, String date, String term) {
		
		List<Sales> sales = adminService.sales(storeId, date, term);
		//System.out.println("값은"+sales);
		return new ResponseEntity<List<Sales>>(sales, HttpStatus.OK);
	}
	
	// 대출 확인 페이지
	@GetMapping("/loan")
	public String loans() {
		return "/sbo/store/loan";
	}
	
	// OCR 파일 처리
	@PostMapping("/loan/ocr")
	public ResponseEntity<?> ocr(MultipartFile file) throws IOException {
		String aa = "";
		int regindex = 0;
		int regName = 0;
		int date = 0;
		int amt = 0;
		int tax = 0;
		int sum = 0;
		HashMap<String, String> ocrdata = null;
		
		if(file.isEmpty()) {
			String img = File.separator + "img" + File.separator + "none.gif";
		} else {
			String imgPath = uploadFile.fildUpload(file);
			//System.out.println(imgPath);
			
			aa = OcrText.detectText(imgPath);
			
			
			// 사업자 등록증 처리
			int index = aa.indexOf("등록번호");
			aa = aa.substring((index + 6) , (index + 20));
			aa = aa.split("-")[0] + aa.split("-")[1] + aa.split("-")[2];
			
			// 거래명세표
			//System.out.println(aa);
			//regindex = aa.indexOf("사업자");
			//regName = aa.indexOf("월일");
			//date = aa.indexOf("총액");
			//amt = aa.indexOf("100,000");
			//tax = aa.indexOf("10,000");
			//sum = aa.indexOf("#");
			
			//ocrdata = new HashMap<String, String>();
			//ocrdata.put("regNumber", aa.substring((regindex + 4) , (regindex + 16)));
			//ocrdata.put("regName", aa.substring((regName + 2) , (regName + 17)));
			//ocrdata.put("regAmt", aa.substring((amt) , (amt + 7)));
			//ocrdata.put("regTax", aa.substring((tax) , (tax + 6)));
			//ocrdata.put("regDate", aa.substring((date + 2) , (date + 11)));
			//ocrdata.put("regSum", aa.substring((sum + 2) , (sum + 9)));
			
			
			//System.out.println("사업자 등록번호 : "+aa.substring((regindex + 4) , (regindex + 16)));
			//System.out.println("업체명 : "+aa.substring((regName + 2) , (regName + 17)));
			//System.out.println("영수일시 : "+aa.substring((date + 2) , (date + 11)));
			//System.out.println("영수금액 : "+aa.substring((amt + 2) , (amt + 9)));
			//System.out.println("부가세 : " + aa.substring((tax) , (tax + 6)));
		}
		
		//return new ResponseEntity<>(ocrdata,HttpStatus.OK);
		return new ResponseEntity<>(aa.trim(),HttpStatus.OK);
	}
	
	// 매입 데이터 저장 처리
	@ResponseBody
	@RequestMapping(value="/ocrSendData" ,method = RequestMethod.POST)
	public Map<String, Object> purchaseDB(OcrData ocrData){
		String orderNum = CreateOrderNum.createOrderNum();
		ocrData.setPurchaseNo(Long.parseLong(orderNum));
		//System.out.println(ocrData);
		
		sbo.purchaseWrite(ocrData);
		
		Map<String, Object> rmap = new HashMap<String, Object>();
		rmap.put("msg", "success");
		return rmap;
	}
	
	// 대출 상품 페이지 이동
	@GetMapping("/loanstore")
	public String loan() {
		return "/sbo/store/loandetail";
	}
	
	// 대출 신청 시 상세 페이지
	@GetMapping("/common")
	public String common() {
		return "/sbo/store/common";
	}
	
	// 신청 접수 페이지
	@GetMapping("/loansignup")
	public String loansignup() {
		return "/sbo/store/loandetail2";
	}
	
	// 경영관리 페이지
	@GetMapping("/sbizCon1")
	public String sbiz1() {
		return "sbo/sbizmanage/sbizloan";
	}
	
	// 대출상품 계산 후 나열
	@ResponseBody
	@PostMapping("/loanSearch")
	public Map<String, Object> loanSearch(String bizDate, String bizAmount, String sort) {
		
		Map<String, Object> rmap = new HashMap<String, Object>();
		if(bizDate != null && bizAmount != null) {
			rmap.put("loanSearch",sbo.loanItemSearch(bizDate, bizAmount, sort));				
		}
		return rmap;
	}
	
	// 연매출 확인
	@ResponseBody
	@PostMapping("/bizAmountYear")
	public Map<String, Object> bizAmountYearCheak() {
		
		Map<String, Object> rmap = new HashMap<String, Object>();
			rmap.put("bizAmountYearCheak",sbo.bizAmountYearCheak());
		return rmap;
	}
	
	// 매출 확인
	@GetMapping("/sales/{id}")
	public String sales(@PathVariable long id) {
		//return "sbo/store/sales";
		return "sbo/sbizmanage/sbizloan";
	}
	
	// 상권 분석
	@GetMapping("/commercial")
	public String commercial() {
		//return "sbo/store/sales";
		return "sbo/sbizmanage/sbizmapinfo";
	}
	
	@GetMapping("/jsonto")
	public String commercial1() {
		//return "sbo/store/sales";
		return "sbo/sbizmanage/test";
	}
	
	// 매입 등록 및 조회 페이지
	@GetMapping("/purchase")
	public String purchase(Model model) {
        List<OcrData> purchaseList = sbo.selectAll();
        model.addAttribute("purchaseList", purchaseList);
        //System.out.println(purchaseList);
		
		return "sbo/purchaseRegi";
	}
	
	// 리포트 메일발송
    @PostMapping("/mail")
    public void execMail(MailDto mailDto) {
    	//System.out.println(mailDto);
        mailService.mailSend(mailDto);
    }
    
    
	@ResponseBody
	@PostMapping("/aaaaa")
	public Map<String, Object> tetetete(String pdf) throws IOException {
		Map<String, Object> result = new HashMap<>();
	    String fileBase64 = pdf;
	    String fileName = "월간리포트";
	    String ext = ".pdf";
	    String date = "";
		// 저장할 파일 경로를 지정합니다.
		//File file = new File(FileSystemView.getFileSystemView().getHomeDirectory()
		//        + "C:/resource" + fileName);
		
		//String rootPath = FileSystemView.getFileSystemView().
		//System.out.println(file);
		// BASE64를 일반 파일로 변환하고 저장합니다.
		Base64.Decoder decoder = Base64.getDecoder();
		byte[] decodedBytes = decoder.decode(fileBase64.getBytes());
		FileOutputStream fileOutputStream = new FileOutputStream("C:/resource/"+fileName+ext);
		fileOutputStream.write(decodedBytes);
		fileOutputStream.close();
		result.put("su", "ok");
	    return result;
	}
    

	
}
