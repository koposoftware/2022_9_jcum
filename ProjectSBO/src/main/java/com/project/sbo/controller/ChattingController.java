package com.project.sbo.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.project.sbo.vo.AttachFileVO;
import com.project.sbo.vo.ChatingRoom;

@Controller
public class ChattingController {

	
	@GetMapping("/chat")
	public String chat() {
		return "main";
	}
	
	@PostMapping("/chat/fileUp")
	@ResponseBody
	public ResponseEntity<List<AttachFileVO>> chatUpload(MultipartFile[] uploadFile) {
		List<AttachFileVO> list = new ArrayList<AttachFileVO>();
		String uploadFolder = "C:\\resource";
		
		String uploadFolderPath = getFolder();
		File uploadPath = new File(uploadFolder, getFolder());
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdir();
		}
		
		for(MultipartFile multipartFile : uploadFile) {
			
			AttachFileVO attachDTO = new AttachFileVO();
			
			String uploadFileName = multipartFile.getOriginalFilename();
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			attachDTO.setFileName(uploadFileName);
			
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			File savefile = new File(uploadPath, uploadFileName);
			
			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(savefile);
				attachDTO.setUuid(uuid.toString());
				attachDTO.setUploadPath(uploadFolderPath);
				
				list.add(attachDTO);
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return new ResponseEntity<List<AttachFileVO>>(list,HttpStatus.OK);
	}
	
	@GetMapping(value="/download", produces = org.springframework.http.MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<org.springframework.core.io.Resource> downloadFile(String fileName){
		org.springframework.core.io.Resource resource = new FileSystemResource("C:\\resource\\"+fileName);
		if(resource.exists() == false) {
			return new ResponseEntity<org.springframework.core.io.Resource>(HttpStatus.NOT_FOUND);
		}
		String resourceName = resource.getFilename();
		String resourceOriginalName = resourceName.substring(resourceName.indexOf("_")+1);
		HttpHeaders headers = new HttpHeaders();
		
		try {
			String downloadName = null;
			downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8");
			headers.add("Content-Disposition",
					"attachment; filename=" +
			new String(downloadName.getBytes("UTF-8"),"ISO-8859-1"));
		}catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
	
	
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-",File.separator);
	}
	
	
	// ????????? ??????
	public static LinkedList<ChatingRoom> chatingRoomList = new LinkedList<>();
	
	
	//	----------------------------------------------------
	// ?????? ?????????
	
	// ??? ????????? ??? ??????
	public ChatingRoom findRoom(String roomNumber) {
		ChatingRoom room = ChatingRoom.builder().roomNumber(roomNumber).build(); 
		int index = chatingRoomList.indexOf(room);
		
		if(chatingRoomList.contains(room)) {
			return chatingRoomList.get(index); 
		}
		return null;
	}
	
	
	// ????????? ??????
	public void addCookie(String cookieName, String cookieValue) {
		ServletRequestAttributes attr = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
		HttpServletResponse response = attr.getResponse();
		
		Cookie cookie = new Cookie(cookieName, cookieValue);
		
		int maxage = 60 * 60 * 24 * 7;
		cookie.setMaxAge(maxage);
		response.addCookie(cookie);
	}
	
	
	
	// ??? ??????, ????????? ?????? ??????
	public void deleteCookie( ) {
		ServletRequestAttributes attr = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
		HttpServletResponse response = attr.getResponse();
		
		Cookie roomCookie = new Cookie("roomNumber", null);
		Cookie nicknameCookie = new Cookie("nickname",null);
		
		roomCookie.setMaxAge(0);
		nicknameCookie.setMaxAge(0);
		
		response.addCookie(nicknameCookie);
		response.addCookie(roomCookie);
	}
	
	
	
	// ???????????? ?????????, ????????? ??????
	public Map<String, String> findCookie() {
		ServletRequestAttributes attr = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
		HttpServletRequest request = attr.getRequest();
		
		Cookie[] cookies = request.getCookies();
		String roomNumber = "";
		String nickname= "";
		
		if(cookies == null) {
			return null;
		}
		
		if(cookies != null) {
			for(int i=0;i<cookies.length;i++) {
				if("roomNumber".equals(cookies[i].getName())) {
					roomNumber = cookies[i].getValue();
				}
				if("nickname".equals(cookies[i].getName())) {
					nickname = cookies[i].getValue();
				}
			}
			
			if(!"".equals(roomNumber) && !"".equals(nickname)) {
				Map<String, String> map = new HashMap<>();
				map.put("nickname", nickname);
				map.put("roomNumber", roomNumber);
				
				return map;
			}
		}
		
		return null;
	}
	
	// ????????? ??????
	public void createNickname(String nickname) {
		addCookie("nickname", nickname);
	}
	
	// ??? ????????????
	public boolean enterChatingRoom(ChatingRoom chatingRoom, String nickname) {
		createNickname(nickname);
		
		if(chatingRoom == null) {
			deleteCookie();
			return false;
		} else {
			LinkedList<String> users = chatingRoom.getUsers();
			users.add(nickname);
			
			addCookie("roomNumber", chatingRoom.getRoomNumber());
			return true;
		}
	}
	
	//	----------------------------------------------------
	
	// ????????????

	// ????????? ??????
	@GetMapping("/chatingRoomList")
	public ResponseEntity<?> chatingRoomList() {
		return new ResponseEntity<LinkedList<ChatingRoom>>(chatingRoomList, HttpStatus.OK);
	}
	
	
	// ??? ?????????
	@PostMapping("/chatingRoom")
	public ResponseEntity<?> chatingRoom(String roomName, String nickname) {
		
		// ?????? ????????? ?????????????????? ??????
		String roomNumber = UUID.randomUUID().toString();
		ChatingRoom chatingRoom = ChatingRoom.builder()
				.roomNumber(roomNumber)
				.users(new LinkedList<>())
				.roomName(roomName)
				.build();
		
		//System.out.println("????????? : "+chatingRoom);
		
		chatingRoomList.add(chatingRoom);
		
		// ??? ????????????
		enterChatingRoom(chatingRoom, nickname);
		
		return new ResponseEntity<>(chatingRoom, HttpStatus.OK);
	}
	
	
	// ??? ????????????
	@GetMapping("/chatingRoom-enter")
	public ResponseEntity<?> EnterChatingRoom(String roomNumber, String nickname){
		
		// ??? ????????? ??? ??????
		ChatingRoom chatingRoom = findRoom(roomNumber);
		
		if(chatingRoom == null) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		} else {
			// ??? ????????????
			enterChatingRoom(chatingRoom, nickname);
			
			return new ResponseEntity<>(chatingRoom, HttpStatus.OK);
		}
	}
	
	// ??? ?????????
	@PatchMapping("/chatingRoom-exit")
	public ResponseEntity<?> ExitChatingRoom(){
			
		Map<String, String> map = findCookie();
			
		if(map == null) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		
		
		String roomNumber = map.get("roomNumber");
		String nickname = map.get("nickname");
		
		// ??????????????? ???????????? ?????? ???????????? ????????????
		ChatingRoom chatingRoom = findRoom(roomNumber);
		List<String> users = chatingRoom.getUsers();
		
		// ????????? ??????
		users.remove(nickname);
		
		// ???????????? ???????????? ????????? ??????
		deleteCookie();
		
		// ????????? ????????? ????????? ??? ??????
		if(users.size() == 0) {
			chatingRoomList.remove(chatingRoom);
		}
		
		return new ResponseEntity<>(chatingRoom, HttpStatus.OK);
	}
	
	
	// ?????? ???????????? ?????????
	@GetMapping("/chatingRoom")
	public ResponseEntity<?> chatingRoom() {
		// ????????? ???????????? ???????????? ????????? ??????????????? ?????? ?????????
		Map<String, String> map = findCookie();
		
		if(map == null) {
			return new ResponseEntity<>(HttpStatus.OK);
		}
		
		String roomNumber = map.get("roomNumber");
		String nickname = map.get("nickname");
		
		ChatingRoom chatingRoom = findRoom(roomNumber);
		
		if(chatingRoom == null) {
			deleteCookie(); 
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		} else {
			Map<String, Object> map2 = new HashMap<>();
			map2.put("chatingRoom", chatingRoom);
			map2.put("myNickname", nickname);
			
			return new ResponseEntity<>(map2, HttpStatus.OK);
		}
	}
}
