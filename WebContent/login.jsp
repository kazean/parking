<%@ page contentType="text/html; charset=UTF-8"%>
<% String contextPath=request.getContextPath();%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
  $(function(){
    
    var $subObj = $("input[type=submit]");
    var $form = $("form");
    var $action = $form.attr("action","login.do");
    var url = 'login.do';
    
    //아이디 저장 시작
    var itemValue = localStorage.getItem("saveId");
    if(itemValue != null){
       $("input[name=c_id]").val(itemValue);
    }
    $subObj.click(function(){
      var $id = $('input[name=c_id]').val();
      var $pwd = $('input[name=c_password]').val();
      console.log($id);
      console.log($pwd);
      if($("input[name=c]").prop("checked") == true){
        localStorage.setItem("saveId", $("input[name=c_id]").val()); 
      }else{
        localStorage.removeItem("saveId");
      }
    //아이디 저장 종료
    
    //로그인 ajax시작
      $.ajax({ 
          url: url,        
          method: 'POST',     
          data: $form.serialize(),
            success: function(responseData){
             var data = responseData.trim();
             if(data =="1"){
               alert("로그인성공");
               location.href = "<%=contextPath%>";
             }else if( data =="-1"){
               alert("로그인실패");
             }
         }
       });return false; 
     });  // end for clickfunction
   });  // end for allfunction
 
 
</script>
<style>

.login{ width:300px; height:300px; border: 1px solid; border-radius: 50px;border-color:#F2B210;  margin:auto; padding:30px; position:absolute;
  top:50%;  left:50%;  background:#F2B210;  transform:translate(-50%, -50%)}
.infobox{margin:auto;}
.login form{height:100px;margin:auto; }

</style>

<body>
<div class="login" >
  <div class="loginbox">login</div>
 <form>  
   <h5> 아이디:</h5>     <input type ="text" name="c_id" >
                         <input type ="checkbox" name="c">id저장<br>
   <h5> 비밀번호 : </h5> <input type ="password" name="c_password" >
    <input type = "submit" value = "로그인">
 </form>
</div> 

</body>
</html>