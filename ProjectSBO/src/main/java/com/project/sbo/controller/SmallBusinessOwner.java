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
	// ????????? ?????? ?????????, ???????????? ??????
	@GetMapping("/sbo/login")
	public String login(Model model) {
		return "sbo/main";
	}
	
	// ????????? ??????
	@GetMapping("/reportFinance")
	public String reFinance() {
		return "/sbo/sbizmanage/reportFinance";
	}
	
	// ?????? ?????? ?????? ??? ???????????? ?????? ???????????? ?????? ??????
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
		// ??????/?????? ??????
		rmap.put("salesCnt", sbo.salesAmPmCnt("22/09/30", "22/09/29"));
		// ?????? ???????????? 1??????, ?????? ??????
		rmap.put("salesWeekSum", sbo.salesWeekSum("22/09/23", "22/09/30"));
		// ?????? ???????????? 2??????, ?????? ??????
		rmap.put("salesTwoWeekSum", sbo.salesWeekSum("22/09/09", "22/09/16"));
		return rmap;
	}
	
	// ?????? ?????? ?????? ??? ???????????? ?????? ???????????? ?????? ??????
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
			// ?????? - ??????, 1???, 1??????, 6??????, 1???
			rmap.put("salesPurRange",sbo.salesRangePurchaseCnt(startDt, endDt));
			// ?????? - ??????, 1???, 1??????, 6??????, 1???
			rmap.put("salesRange",sbo.salesRangeCnt(startDt, endDt));
		}
		//System.out.println(rmap);
		return rmap;
	}
	
	// ???????????? ??? ????????????
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
	    
	    //System.out.println("?????????? : "+store);
		
		return "redirect:/sbo/owner";
	}
	
	// ?????? ?????? ??????
	@GetMapping("/store")
	public String store(Model model) {
		// ????????? ????????? ????????? ??????
		StoreDetail storeDetail = storeService.storeDetail(205, 2);
		model.addAttribute("store", storeDetail);
		return "sbo/store/detail";
	}
	// ?????? ??????
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
	
	// ?????? ?????? ??????
	@PatchMapping("/orders/orderAccept")
	public ResponseEntity<String> orderAccept(String orderNum, int time, long userId) {
		adminService.orderAccept(orderNum, time, userId);
		
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	// ?????? ??????
	@PatchMapping("/orders/orderComplete")
	public ResponseEntity<String> orderComplete(String orderNum, long userId) {
		//System.out.println(orderNum+userId);
		adminService.orderComplete(orderNum, userId);
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
//	// ?????? ??????
//	@GetMapping("/sales/{id}")
//	public String sales(@PathVariable long id) {
//		return "sbo/store/sales";
//	}
	
	// ?????? ?????? ????????? ?????????, ?????? ??????
	@GetMapping("/sales/salesDetail")
	public ResponseEntity<Map<String, Object>> salesDetail(long storeId, String date, String sort) {
		//System.out.println(storeId + " : "+date+" : "+sort);
		Map<String, Object> salseToday = adminService.salesDetail(storeId, date, sort);
		return new ResponseEntity<Map<String, Object>>(salseToday, HttpStatus.OK);
	}
	
	// ?????? ????????? ?????????
	@GetMapping("/sales/salesGraph")
	public ResponseEntity<List<Sales>> sales(long storeId, String date, String term) {
		
		List<Sales> sales = adminService.sales(storeId, date, term);
		//System.out.println("??????"+sales);
		return new ResponseEntity<List<Sales>>(sales, HttpStatus.OK);
	}
	
	// ?????? ?????? ?????????
	@GetMapping("/loan")
	public String loans() {
		return "/sbo/store/loan";
	}
	
	// OCR ?????? ??????
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
			
			
			// ????????? ????????? ??????
			int index = aa.indexOf("????????????");
			aa = aa.substring((index + 6) , (index + 20));
			aa = aa.split("-")[0] + aa.split("-")[1] + aa.split("-")[2];
			
			// ???????????????
			//System.out.println(aa);
			//regindex = aa.indexOf("?????????");
			//regName = aa.indexOf("??????");
			//date = aa.indexOf("??????");
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
			
			
			//System.out.println("????????? ???????????? : "+aa.substring((regindex + 4) , (regindex + 16)));
			//System.out.println("????????? : "+aa.substring((regName + 2) , (regName + 17)));
			//System.out.println("???????????? : "+aa.substring((date + 2) , (date + 11)));
			//System.out.println("???????????? : "+aa.substring((amt + 2) , (amt + 9)));
			//System.out.println("????????? : " + aa.substring((tax) , (tax + 6)));
		}
		
		//return new ResponseEntity<>(ocrdata,HttpStatus.OK);
		return new ResponseEntity<>(aa.trim(),HttpStatus.OK);
	}
	
	// ?????? ????????? ?????? ??????
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
	
	// ?????? ?????? ????????? ??????
	@GetMapping("/loanstore")
	public String loan() {
		return "/sbo/store/loandetail";
	}
	
	// ?????? ?????? ??? ?????? ?????????
	@GetMapping("/common")
	public String common() {
		return "/sbo/store/common";
	}
	
	// ?????? ?????? ?????????
	@GetMapping("/loansignup")
	public String loansignup() {
		return "/sbo/store/loandetail2";
	}
	
	// ???????????? ?????????
	@GetMapping("/sbizCon1")
	public String sbiz1() {
		return "sbo/sbizmanage/sbizloan";
	}
	
	// ???????????? ?????? ??? ??????
	@ResponseBody
	@PostMapping("/loanSearch")
	public Map<String, Object> loanSearch(String bizDate, String bizAmount, String sort) {
		
		Map<String, Object> rmap = new HashMap<String, Object>();
		if(bizDate != null && bizAmount != null) {
			rmap.put("loanSearch",sbo.loanItemSearch(bizDate, bizAmount, sort));				
		}
		return rmap;
	}
	
	// ????????? ??????
	@ResponseBody
	@PostMapping("/bizAmountYear")
	public Map<String, Object> bizAmountYearCheak() {
		
		Map<String, Object> rmap = new HashMap<String, Object>();
			rmap.put("bizAmountYearCheak",sbo.bizAmountYearCheak());
		return rmap;
	}
	
	// ?????? ??????
	@GetMapping("/sales/{id}")
	public String sales(@PathVariable long id) {
		//return "sbo/store/sales";
		return "sbo/sbizmanage/sbizloan";
	}
	
	// ?????? ??????
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
	
	// ?????? ?????? ??? ?????? ?????????
	@GetMapping("/purchase")
	public String purchase(Model model) {
        List<OcrData> purchaseList = sbo.selectAll();
        model.addAttribute("purchaseList", purchaseList);
        //System.out.println(purchaseList);
		
		return "sbo/purchaseRegi";
	}
	
	// ????????? ????????????
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
	    String fileName = "???????????????";
	    String ext = ".pdf";
	    String date = "";
		// ????????? ?????? ????????? ???????????????.
		//File file = new File(FileSystemView.getFileSystemView().getHomeDirectory()
		//        + "C:/resource" + fileName);
		
		//String rootPath = FileSystemView.getFileSystemView().
		//System.out.println(file);
		// BASE64??? ?????? ????????? ???????????? ???????????????.
		Base64.Decoder decoder = Base64.getDecoder();
		byte[] decodedBytes = decoder.decode(fileBase64.getBytes());
		FileOutputStream fileOutputStream = new FileOutputStream("C:/resource/"+fileName+ext);
		fileOutputStream.write(decodedBytes);
		fileOutputStream.close();
		result.put("su", "ok");
	    return result;
	}
    

	
}
