<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<%
    String id  = (String)session.getAttribute("id");
    int timeoutPeriod = session.getMaxInactiveInterval();
%>
<head>
    <title>로그인</title>
    <style>
        center{
            display: grid;
            text-align: center;
            align-items: center;
            justify-content: center;
        }
        .container{
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }.container2{
            margin: 20px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: inline-block;
            width: 70px;
            margin-right: 10px;
        }
    </style>
</head>
<body>
<center>
<%if(id==null){%>
<div class="container">
<h2>로그인 폼</h2>
    <div class="form-group">
    <form action="loginProc.jsp" method="post">
        <label for="username">아이디</label>
        <input type="text" id="userid" name="userid" required>
    </div>
    <div class="form-group">
        <label for="password">암호</label>
        <input type="password" id="password" name="password" required>
    </div>
    <div class="button-group">
        <button type="submit">로그인</button>
        </form>
        <button onclick="location.href='index.jsp'">회원가입</button>
    </div>
</div>
<%}
else{
%>
<div class="container2">
<p><%=id%>님 환영합니다.</p>
<p>로그아웃까지 남은시간:<span id="timeLimit"><%=timeoutPeriod%>초</span></p>
    <div class="button-group">
        <button onclick="location.href='logout.jsp'">로그아웃</button>
    </div>
</div>
<%
}%>
<script>
    let timeLimit = document.getElementById('timeLimit');
    let n = <%=timeoutPeriod%>;
    let timer = setInterval(function(){
                timeLimit.innerText=n+"초";
                if(n==0){
                clearInterval(timer);
                location.href='logout.jsp';
                }
                n--;
                },1000)
</script>
</center>
</body>
</html>
