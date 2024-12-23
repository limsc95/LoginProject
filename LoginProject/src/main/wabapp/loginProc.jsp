<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.*" %>

<%

    String userid= request.getParameter("userid");
    String password = request.getParameter("password");

    //DAO의 loginMember()를 통해 값이 있는 경우 값을 가져 옴.
    MemberDAO mdao = new MemberDAO();
    MemberBean bean = mdao.loginMember(userid,password);

    String id = bean.getId();
    String pw = bean.getPwd1();
    String msg = "";

    if (userid != null && password != null && userid.equals(id) && password.equals(pw)) {
    //로그인 성공 시 세션값 추가
    session.setAttribute("id", id);
    // 세션 유지시간 60초 설정
    session.setMaxInactiveInterval(60);
    msg = "로그인 성공";
    }
    else{
        msg = "로그인 실패";
    }
%>
<script>
    // 페이지 로드 후 실행
    window.onload = function() {
        // 서버 측에서 설정한 메시지 표시
        alert("<%= msg %>");
        // 로그인 페이지로 이동
        window.location.href = 'login.jsp';
    };
</script>
