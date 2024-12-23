<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
</head>
<body>
    <%
    request.setCharacterEncoding("UTF-8");
    String[] hobbys = request.getParameterValues("hobby");
    String hobby="";
    if(hobbys!=null){
        for(String h : hobbys){
            hobby+= h + " ";
        }
    }
    %>
    <jsp:useBean id="mbean" class="org.MemberBean">
        <jsp:setProperty name="mbean" property="*"/>
    </jsp:useBean>

    <%
    MemberDAO mdao = new MemberDAO();
    mbean.setHobby(hobby);

    mdao.insertMember(mbean);
    response.sendRedirect("login.jsp");
    %>

</body>
</html>