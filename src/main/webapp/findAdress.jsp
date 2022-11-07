<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
  <input id="member_post"  type="text" name="userHousecode" placeholder="house Code" readonly><br>
  <input id="member_addr" type="text" name="userAdress" placeholder="Address" readonly> <br>
  <input type="text" name="userDetailAdress" placeholder="Detailed Address">
  <div class="d-flex-justify-content-end"><br>
  <button type="button" class="btn btn-info" placeholder="Enter Adress" name = "userAdress" required readonly  onclick="findAddr()"/>주소 검색</button>
  
</body>
<script>
function findAddr(){
	new daum.Postcode({
        oncomplete: function(data) {
        	
        	console.log(data); //웹 콘솔에 data 메시지 출력
            
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var jibunAddr = data.jibunAddress; // 지번 주소 변수
            
            // 우편번호와 주소 정보를 해당 필드에 넣음
            document.getElementById('member_post').value = data.zonecode;
            if(roadAddr !== ''){
                document.getElementById("member_addr").value = roadAddr;
            } 
            else if(jibunAddr !== ''){
                document.getElementById("member_addr").value = jibunAddr;
            }
        }
    }).open();
}
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</html>