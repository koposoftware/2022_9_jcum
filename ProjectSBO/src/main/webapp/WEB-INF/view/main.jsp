<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
 
<link rel="stylesheet" href="/css/main.css">
	
</head>
<body>
	<!-- 채팅방 목록 -->
	<main>
        <h1>하나상담창구</h1>
        <button class="new_chat">상담창구만들기</button>
        <nav>
        	<span>방 제목</span>
        	<span>인원</span>
        </nav>
       	<hr>
       	
        <ul>
            <li>
            <!-- 
				<span class="chat_title"></span>
				<span class="chat_count"></span>
				 -->
            </li> 
        </ul>
    </main>
	<!-- 채팅방 목록 -->
	
	<!-- 채팅방 입장 -->
    <div class="chat">
   		<div>
   			<div class="chat_body">
		        <h2 class="chat_title">1번방</h2>		
		        <button class="chat_back">◀</button>
		
		        <ul class="chat_list">
		            <li>
		            	<!-- <div class="notification">
		            		<span></span>
		            	</div> -->
		            </li>
		        </ul>
	
		        <div class="chat_input">
		            <div class="chat_input_area">
		                <textarea style="border:solid #868383 1px;"></textarea>
		            </div>
		            
		            <div class="chat_button_area" style="border-bottom: solid #868383 1px;
		            border-right: solid #868383 1px; border-top: solid #868383 1px;">
		                <button id="messageSend">전송</button>
		                <button id="linkSend">링크</button>
		                <button class="area" id="fileSend">파일</button>
		                <!-- <form method="post" enctype="multipart/form-data"> -->
		                	<input type="file" name="uploadFile" class="real-upload"
							 multiple style="display: none;">
						<!-- </form> -->
		            </div>
					<script>
						const realUpload = document.querySelector(".real-upload");
						const upload = document.querySelector(".area");
						upload.addEventListener("click", () => realUpload.click());
  					</script>
				</div>
	        </div>
        
	        <div class="chat_users">
	        	<h2>
	        		참가인원
	        		<span class="user"></span>
	        	</h2>
	        	
	        	<div class="chat_nickname" id="uploadResult">
	        		<ul>
	        			<li>
	       				</li>
	        		</ul>
	        	</div>
	        </div>	
   		</div>
    </div>
    <!-- 채팅방 입장 -->
    
    <!-- sock js -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.2/sockjs.min.js"></script>
	<!-- STOMP -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
	    
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="/js/main.js"></script>
	<script type="text/javascript">
    
    //$(document).ready(function(){
						
		//$(".real-upload").change(function(e){
			
			/* let formData = new FormData();
			let inputFile = $("input[name='uploadFile']");
			let files = inputFile[0].files;
			
			for(let i = 0; i < files.length; i++){
				formData.append("uploadFile",files[i]);
			}
			//const form = $("form")[0];
			//const formdata = new FormData(form);
			
			$.ajax({
				url: "/chat/fileUp",
				type: "POST",
				data: formData,
				processData: false,
            	contentType: false,
			})
			.done(function(result){
				console.log(result);
				
				showUploadFile(result);
			})
			.fail(function(request, status, error){
				console.log(request.status);
				console.log(request.responseText);
				console.log(request.error);
			})
		});
		
		var uploadResult = $("#uploadResult ul");
		
		function showUploadFile(uploadResultArr){
			var str = "";
			$(uploadResultArr).each(function(i, obj){
				if(!obj.image){
					var fileCellPath = encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName);
					str += "<li><a href='/download?fileName="+fileCellPath+"'>"
						+  obj.fileName+"</a></li>";
				}else{
					
				}
				//str += "<li>" + obj.fileName +"</li>";
			});
			uploadResult.append(str);
		}
		 */
		
	//});
    
    
    </script>
</body>
</html>
