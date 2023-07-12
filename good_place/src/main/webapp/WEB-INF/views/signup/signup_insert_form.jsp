<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300&family=Nanum+Brush+Script&display=swap" rel="stylesheet">

<style>
     *{
        font-family: 'IBM Plex Sans KR', sans-serif;
        font-size: 30px;
        color: yellow;
        background: url("/goodplace/resources/img/bg.jpg");
    }

</style>

   <!-- 아이디 중복체크를 위한 Ajax사용을 위해 js를 참조 -->
   <!-- <script src="/ajax/resources/js/httpRequest.js"></script> -->
   <script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>

   <script>
      //아이디 중복여부 체크
      let b_idCheck = false;
   
      function send(f){
         //유효성 체크
         let id = f.id.value.trim();
         if( id == '' ){
            alert("id는 필수 입력사항입니다");
            return;
         }
         
         let pwd = f.pwd.value;
         if( pwd == ''){
            alert("비밀번호는 필수 입력사항입니다");
         }
         
         let name = f.name.value.trim();
         if( name == ''){
            alert("이름은 필수 입력사항입니다");
         }
         
         let gender = f.gender.value;
         if( gender == ''){
            alert("성별은 필수 입력사항입니다");
         }
         
         let email = f.email.value.trim();
         if( email == ''){
            alert("이메일은 필수 입력사항입니다");
         }
         
         let birth = f.birth.value;
         if( birth == ''){
            alert("생일은 필수 입력사항입니다");
         }
      
         //중복체크 여부 확인
         if(b_idCheck == false){
            alert("아이디 중복체크를 해주세요");
            return;
         }
         
         f.action = "insert.do";//?id=aaa&pwd=1111&name=홍길동&addr=마포구
         f.submit();
         alert("회원가입이 되셨습니다.");
      }//send()
      
      //아이디 중복체크 메서드
      function check_id(){
         let id = document.getElementById("id").value.trim();
         if( id == '' ){
            alert("아이디를 먼저 입력하세요");
            return;
         }
         
         let url = "check_id.do";
         //@, !, _등의 특수문자가 포함된 파라미터를 보내고자 한다면...
         let param = "id=" + encodeURIComponent(id);
         
         //check_id.do?id=aaa
         sendRequest(url, param, resultFunc, "GET");
      }//check_id()

      //Ajax작업을 마치고 돌아올 콜백 메서드
      function resultFunc(){
         
         if(xhr.readyState == 4 && xhr.status == 200){
            
            //도착한 데이터를 받는다
            let data = xhr.responseText;
            
            if( data == 'yes' ){
               alert("이미 사용중인 아이디 입니다");
               return;
            }
            
            alert("사용 가능한 아이디 입니다");
            b_idCheck = true;
            
         }
      }
      
      //아이디를 입력받는 input의 값이 변경되면 onchange를 통해 호출되는 함수
      function che(){
         b_idCheck = false;
      }
      
   </script>
</head>
<body>
   <form method="post">
      <table border="1" align="center">
         <caption>::회원가입::</caption>
            <tr>
               <th>아이디</th>
               <td>
                  <input name="id" id="id" placeholder="아이디를 입력해주세요." onchange="che();">
                  <input type="button" value="중복체크" onclick="check_id();">
               </td>
            </tr>
            
            <tr>
               <th>비밀번호</th>
               <td><input type="password" name="pwd" placeholder="비밀번호를 입력해주세요."></td>
            </tr>
            
            <tr>
               <th>이름</th>
               <td><input name="name" placeholder="이름을 입력해주세요."></td>
            </tr>
            
            <tr>
               <th>성별</th>
               <td><input type="radio" name="gender" value="남자">남자<input type="radio" name="gender" value="여자">여자</td>
            </tr>
            
            <tr>
               <th>이메일</th>
               <td><input name="email" type="email" placeholder="이메일을 입력해주세요."></td>
            </tr>
            
            <tr>
               <th>생일</th>
               <td><input type="date" name="birth"></td>
            </tr>
            
            <tr>
            <td colspan="2" align="center">
               <input type="button" value="가입하기" onclick="send(this.form);">
               <input type="button" value="취소" onclick="location.href='main.do'">
            </td>
         </tr>
            
      </table>
   </form>
</body>
</html>