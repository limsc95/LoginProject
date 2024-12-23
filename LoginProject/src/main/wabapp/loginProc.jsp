<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

    String userid= request.getParameter("userid");
    String password = request.getParameter("password");


    String id = "test";
    String pw = "1234";

    if (userid != null && password != null && userid.equals(id) && password.equals(pw)) {
%>
<script>
    alert('로그인에 성공했다');
    window.location.href = 'welcome.jsp';
</script>
<%
} else {
%>
<script>
    alert('로그인에 실패했다');
    window.location.href = 'login.jsp';
</script>
<%
    }
%>
