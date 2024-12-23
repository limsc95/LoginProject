<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 가입</title>
    <style>
        h2 {
            text-align: center;
            margin-bottom: 30px;
        }
        * {
            font-family: 'Arial', sans-serif;
        }
        .container {
            width: 80%;
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: inline-block;
            width: 120px;
            margin-right: 10px;
        }
        .required:after {
            content: " *";
            color: red;
        }
        /* Default input width */
        input[type="text"],
        input[type="password"],
        input[type="email"] {
            width: 350px;
            padding: 5px;
            margin: 2px 0;
        }

        #birthdate {
            width: 200px;
        }

        #postal {
            width: 150px;
        }
        select {
            width: 365px;
            padding: 5px;
        }
        .button-group {
            text-align: right;
            margin-top: 20px;
        }
        button {
            padding: 8px 15px;
            margin-left: 10px;
            cursor: pointer;
        }
        .checkbox-group {
            margin-left: 120px;
        }
        .checkbox-group label {
            width: auto;
            margin-right: 20px;
        }

        #userid {
            width: 250px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>회원 가입</h2>
    <form action="login.jsp" method="post">
        <div class="form-group">
            <label for="userid" class="required">아이디</label>
            <input type="text" id="userid" name="userid" required>
            <button type="button" onclick="checkId()">ID중복확인</button>
        </div>

        <div class="form-group">
            <label for="password" class="required">비밀번호</label>
            <input type="password" id="password" name="password" required>
        </div>

        <div class="form-group">
            <label for="password2" class="required">비밀번호 확인</label>
            <input type="password" id="password2" name="password2" required>
        </div>

        <div class="form-group">
            <label for="name" class="required">이름</label>
            <input type="text" id="name" name="name" required>
        </div>

        <div class="form-group">
            <label class="required">성별</label>
            <input type="radio" id="male" name="gender" value="남" checked>
            <label for="male">남</label>
            <input type="radio" id="female" name="gender" value="여">
            <label for="female">여</label>
        </div>

        <div class="form-group">
            <label for="birthdate" class="required">생년월일</label>
            <input type="text" id="birthdate" name="birthdate" required>
            <span style="margin-left: 10px; font-size: 14px;"> ex) 900323</span>
        </div>

        <div class="form-group">
            <label for="email" class="required">Email</label>
            <input type="email" id="email" name="email" required>
        </div>

        <div class="form-group">
            <label for="postal">우편번호</label>
            <input type="text" id="postal" name="postal">
            <button type="button" onclick="findPostal()">우편번호 찾기</button>
        </div>

        <div class="form-group">
            <label for="address">주소</label>
            <input type="text" id="address" name="address">
        </div>

        <div class="form-group">
            <label for="hobby">취미</label>
            <div class="checkbox-group">
                <input type="checkbox" id="internet" name="hobby" value="인터넷">
                <label for="internet">인터넷</label>
                <input type="checkbox" id="travel" name="hobby" value="여행">
                <label for="travel">여행</label>
                <input type="checkbox" id="game" name="hobby" value="게임">
                <label for="game">게임</label>
                <input type="checkbox" id="movie" name="hobby" value="영화">
                <label for="movie">영화</label>
                <input type="checkbox" id="exercise" name="hobby" value="운동">
                <label for="exercise">운동</label>
            </div>
        </div>

        <div class="form-group">
            <label for="job">직업</label>
            <select id="job" name="job">
                <option value="">선택하세요</option>
                <option value="학생">학생</option>
                <option value="회사원">회사원</option>
                <option value="공무원">공무원</option>
                <option value="자영업">자영업</option>
                <option value="전문직">전문직</option>
            </select>
        </div>

        <div class="button-group">
            <button type="submit">회원가입</button>
            <button type="reset">다시쓰기</button>
        </div>
    </form>
</div>

<script>
    function checkId() {
        alert("중복아이디 체크");
        location.href="idCheck.jsp";
    }

    function findPostal() {
        alert("주소찾기");
        location.href="zip.jsp";
    }
</script>
</body>
</html>
