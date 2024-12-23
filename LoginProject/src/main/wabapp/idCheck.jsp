<%@ page import="org.json.simple.JSONObject" %>
<%@ page contentType="application/json; charset=UTF-8" %>
<%@ page import="org.*" %>
<%
    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");

    // 클라이언트로부터 받은 id
    String id = request.getParameter("id");

    // JSON 응답 객체 생성
    JSONObject jsonResponse = new JSONObject();

    if (id == null || id.isEmpty()) {
        jsonResponse.put("error", "id가 전달되지 않았습니다.");
        out.print(jsonResponse.toJSONString());
        out.flush();
        return;
    }

    try {
        MemberDAO mdao = new MemberDAO();
        int cnt = mdao.idCheck(id);
        System.out.print(cnt);
        if (cnt > 0) {
            jsonResponse.put("message", "이미 사용중인 아이디입니다.");
        } else {
            jsonResponse.put("message", "사용 가능한 아이디입니다.");
        }
    } catch (Exception e) {
        jsonResponse.put("error", "서버 처리 중 오류가 발생했습니다.");
        e.printStackTrace(); // 서버 로그 기록
    }

    // JSON 응답 전송
    out.print(jsonResponse.toJSONString());
    out.flush();
%>
