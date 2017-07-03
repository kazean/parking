<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<title>partnerAdd</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	$(function() {

		/* <input type="text" name="p_id" >
		<input type="text" name="p_password">
		<input type="text" name="p_name">
		<input type="text" name="p_phone_number">
		<input type="text" name="p_license">
		<input type="text" name="p_bank">
		<input type="text" name="p_account">


		<button name = "btInsert">  입력</button> */

		

		var $form = $(".insertForm");
		$form.submit(function(){
			event.preventDefault(); // 기본효과를 막음
			console.log("입력버튼 클릭!");
			var data = $form.serialize();
			$.ajax({
				url : "addPartner.do",
				data : data,
				method : 'POST',
				success : function(responseData){
					
					console.log("입력성공");
					
				}
			});  return false;
			
		});
		
		
		
		//취소버튼액션 - 리스트화면으로 보내기
        $('#btCancel').click(function(){
        	$.ajax({
                url : "partnerList.do",
                method: 'GET', 
                data:{'pageno':1},
                success : function(responseData){
                  $("article").empty();
                  $("article").html(responseData.trim()); 
                }
              }); return false;
        });
		
		
		
		
	});
</script>
<style>
.insertForm h5{width: 200px; display: inline-block;}

</style>
</head>
<body>


<h3>파트너 추가</h3>



   <%--  #{p_id},
    #{p_password},
    #{p_name},
    #{p_phone_number},
    #{p_license},
    #{p_bank},
    #{p_account},
    sysdate,
    #{p_status} --%>


<form class = "insertForm">

<h5>아이디 : </h5> <input type="text" name="p_id" >   <br>
<h5>비밀번호 :</h5>  <input type="text" name="p_password"><br>
<h5>이름 :</h5>  <input type="text" name="p_name"><br>
<h5>전화번호 : </h5> <input type="text" name="p_phone_number"><br>
<h5>사업자번호 :</h5>  <input type="text" name="p_license"><br>
<h5>계좌은행 :</h5>  <input type="text" name="p_bank"><br>
<h5>계좌번호  :</h5> <input type="text" name="p_account"><br>
<h5>관리자명 (어드민 계정 ) :</h5> <input type="text" name="p_register_admin_id"><br>

<input type="submit" value="입력하기" name = "smInsert">
<input type="submit" value="취소" id = "btCancel">
</form>

</body>
</html>