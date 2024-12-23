<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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

        #birth {
            width: 200px;
        }

        #zipcode {
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

        #id {
            width: 250px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>회원 가입</h2>
    <form action="memberProc.jsp" method="post" onsubmit="return sub()">
        <div class="form-group">
            <label for="id" class="required">아이디</label>
            <input type="text" id="id" name="id" required>
            <button type="button" onclick="checkId()">ID중복확인</button>
        </div>
        <input type="hidden" id="idChecked" name="idChecked" value="0">

        <div class="form-group">
            <label for="pwd1" class="required">비밀번호</label>
            <input type="password" id="pwd1" name="pwd1" required>
        </div>

        <div class="form-group">
            <label for="pwd2" class="required">비밀번호 확인</label>
            <input type="password" id="pwd2" name="pwd2" required>
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
            <label for="birth" class="required">생년월일</label>
            <input type="text" id="birth" name="birth" required>
            <span style="margin-left: 10px; font-size: 14px;"> ex) 900323</span>
        </div>

        <div class="form-group">
            <label for="email" class="required">Email</label>
            <input type="email" id="email" name="email" required>
        </div>

        <div class="form-group">
            <label for="zipcode">우편번호</label>
            <input type="text" id="zipcode" name="zipcode">
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
    let idCheck=false;
    function checkId() {
        // 입력된 아이디 가져오기
        let id = document.getElementById("id").value;

        // 새 창 띄우기
        var popupWidth = 500;
        var popupHeight = 300;
        var leftPosition = (window.screen.width - popupWidth) / 2;
        var topPosition = (window.screen.height - popupHeight) / 2;

        var checkWindow = window.open("about:blank", "IdCheck",
            "width=" + popupWidth +
            ",height=" + popupHeight +
            ",left=" + leftPosition +
            ",top=" + topPosition);

        // Ajax 요청
        $.ajax({
            url: 'idCheck.jsp',
            type: 'POST',
            data: { id: id },
            success: function(response) {
                var html = '<html><head><title>ID 중복체크</title>';
                html += '<style>';
                html += 'body { font-family: Arial, sans-serif; padding: 20px; text-align: center; }';
                html += 'p { margin: 20px 0; }';
                html += 'button { padding: 5px 15px; margin: 5px; cursor: pointer; }';
                html += '</style>';
                html += '</head><body>';

                if (response.message === "이미 사용중인 아이디입니다.") {
                    html += '<p>' + response.message + '</p>';
                    html += '<button onclick="window.close()">닫기</button>';
                } else {
                    html += '<p>"' + id + '" 는 ' + response.message + '</p>';
                    html += '<button onclick="window.opener.document.getElementById(\'id\').readOnly = true; window.opener.document.getElementById(\'idChecked\').value = \'1\'; window.close();">사용하기</button>';
                    html += '<button onclick="window.close()">닫기</button>';
                }

                html += '</body></html>';
                checkWindow.document.write(html);
            },
            error: function() {
                checkWindow.close();
                alert('서버 통신 오류가 발생했습니다.');
            }
        });
    }

    function findPostal() {
        new daum.Postcode({
            oncomplete: function(data) {
                let zipcode=document.getElementById("zipcode");
                let address=document.getElementById("address");
                zipcode.value=data.zonecode;
                address.value=data.address;
            }
        }).open();
    }

    function sub(){
        let idChecked=document.getElementById("idChecked");

        if(idChecked.value==0){
            alert("아이디 중복체크가 안되었습니다.\n중복체크 후 다시 시도해주세요.");
            return false;
        }else{
            return true;
        }
    }
</script>
</body>
</html>
