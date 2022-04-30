<%--
  Created by IntelliJ IDEA.
  User: Gabriel Yoon
  Date: 2021-05-10
  Time: 오후 5:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.83.1">
    <title>Signup page</title>

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <%-- <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/checkout/"> --%>
    <!-- Bootstrap core CSS -->
    <%--    <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">--%>

    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>
    <!-- Custom styles for this template -->
    <link href="css/form-validation.css" rel="stylesheet">
</head>
<body class="bg-light">
<%@include file="../common/header.jsp" %>
<main>
    <div class="container">
        <div>
            <h4 class="mb-3" style="font-family: 'Noto Serif KR', serif;">기본 정보</h4>
            <div class="needs-validation" novalidate>
                <div class="row g-3">
                    <div class="col-12">
                        <label for="name" class="form-label" style="font-family: 'Noto Serif KR', serif;">이 름</label>
                        <input type="text" class="form-control" id="name" placeholder="" value="" required>
                        <div class="invalid-feedback">
                            이름을 입력해주세요.
                        </div>
                    </div>

                    <div class="col-12">
                        <label for="id" class="form-label" style="font-family: 'Noto Serif KR', serif;">아이디</label>
                        <div class="input-group has-validation">
                            <span class="input-group-text">@</span>
                            <input type="text" class="form-control" id="id" placeholder="되도록이면 학번으로 가입해주세요." required>
                            <div class="invalid-feedback">
                                아이디를 입력해주세요.
                            </div>
                        </div>
                    </div>

                    <div class="col-12">
                        <label for="password" class="form-label"
                               style="font-family: 'Noto Serif KR', serif;">비밀번호</label>
                        <input type="text" class="form-control" id="pw" required="">
                        <div class="invalid-feedback">
                            비밀번호를 입력해주세요.
                        </div>
                    </div>
                </div>
<%--                <hr class="my-4">--%>
<%--                <div class="form-check">--%>
<%--                    <input type="checkbox" class="form-check-input" id="save-info">--%>
<%--                    <label class="form-check-label" for="save-info">모든 정보는 암호화되지 않습니다!</label>--%>
<%--                </div>--%>
                <button class="w-100 btn btn-dark btn-lg" onclick="signUp()"
                        style="font-family: 'Noto Serif KR', serif;">회원가입 하기
                </button>
            </div>
        </div>
    </div>
</main>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="js/form-validation.js"></script>
</body>
<script>
    function signUp() {
        var name = $('#name').val();
        var id = $('#id').val();
        var pw = $('#pw').val();

        var data = name + "-/-/-" + id + "-/-/-" + pw;
        var check =
            swal({
                title: '회원 가입 하시겠습니까?',
                icon: 'info',

                buttons: {
                    cancel: {
                        text: '취소',
                        value: false,
                        className: 'btn btn-danger'
                    },
                    confirm: {
                        text: '확인',
                        value: true,
                        className: 'btn btn-primary'
                    },
                }
            }).then((check) => {
                if (check) {
                    $.ajax({ //ajax 프레임워크( jQuery)로 위 data를 서버로 보냄.
                        url: "ajax.sep", //ajax.do(ajaxAction)에 있는
                        type: "post",
                        data: {
                            req: "signup",
                            data: data
                        },
                        success: function (data) {
                            if (data == '성공') {
                                swal({
                                    title: '회원가입 성공!',
                                    text: '회원이 되신 걸 환영합니다.',
                                    icon: 'success',
                                    button: '확인'
                                }).then(function () {
                                    window.location.href = 'loginPage.sep';
                                });
                            } else {
                                swal({
                                    title: '오류',
                                    text: '이미 아이디가 존재합니다...!',
                                    icon: 'error',
                                    button: '확인'
                                }).then(function () {
                                    window.location.href = 'loginPage.sep';
                                });
                            }
                        }
                    })
                }
            });
    }
</script>

</html>
