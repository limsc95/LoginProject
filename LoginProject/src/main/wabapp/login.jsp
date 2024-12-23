<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>로그인</title>
</head>
<body>
<h2>로그인 폼</h2>
<form action="loginProc.jsp" method="post">
    <div class="form-group">
        <label for="username">아이디:</label>
        <input type="text" id="username" name="username" required>
    </div>
    <div class="form-group">
        <label for="password">암호:</label>
        <input type="password" id="password" name="password" required>
    </div>
    <div class="button-group">
        <button type="submit">로그인</button>
    </div>
</form>
</body>
</html>
