<%--
  Created by IntelliJ IDEA.
  User: Gabriel Yoon
  Date: 2021-05-10
  Time: 오후 5:24
  To change this template use File | Settings | File Templates.
--%>

<!-- 1. 입력 폼을 채우지 않고 회원가입 시도 시 회원가입 하시겠습니까? 위에
     "이 입력란을 작성하세요" 문구가 뜨는데 로그인 페이지는 안뜨고 회원가입 페이지만 뜸 -->
<!-- 2. 입력 폼을 채우고 제출하면 페이지 리로드 후 변화가 없음
     뒤로가기 클릭 시 jquery 문구 "회원가입 하시겠습니까?가 출력되고 확인 클릭 시 로그인 페이지로 이동함 -->

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

    <!-- Libs CSS -->
    <link rel="stylesheet" href="../../../assets/libs/ion-rangeslider/css/ion.rangeSlider.min.css">
    <link rel="stylesheet" href="../../../assets/libs/litepicker/dist/css/litepicker.css">
    <link rel="stylesheet" href="../../../assets/libs/bootstrap-icons/font/bootstrap-icons.css">
    <link rel="stylesheet"  href="../../../assets/libs/magnific-popup/dist/magnific-popup.css">

    <!-- Theme CSS -->
    <link rel="stylesheet" href="../../../assets/css/theme.min.css">

    <!-- Libs JS -->
    <script src="../../../assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="../../../assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../../../assets/libs/jquery-slimscroll/jquery.slimscroll.min.js"></script>
    <script src="../../../assets/libs/magnific-popup/dist/jquery.magnific-popup.min.js"></script>
    <script src="../../../assets/libs/prismjs/prism.js"></script>
    <script src="../../../assets/libs/leaflet/dist/leaflet.js"></script>
    <script src="../../../assets/libs/litepicker/dist/litepicker.js"></script>
    <script src="../../../assets/libs/ion-rangeslider/js/ion.rangeSlider.min.js"></script>
    <script src="../../../assets/libs/inputmask/dist/jquery.inputmask.min.js"></script>

    <!-- clipboard -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/1.5.12/clipboard.min.js"></script>
    
    <!-- Theme JS -->
    <script src="../../../assets/js/theme.min.js"></script>

    <%-- <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/checkout/"> --%>
    <!-- Bootstrap core CSS -->
    <%--    <link href="../../../assets/dist/css/bootstrap.min.css" rel="stylesheet">--%>

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

<main>
    <!-- sign up -->

    <div class="container">
        <div class="py-5 text-center" style="margin-bottom: 30px; margin-top: 140px;">
            <h2 style="font-family: 'Noto Serif KR', serif;">회원 가입</h2>
            <p class="lead" style="font-family: 'Noto Serif KR', serif;"> 아래의 정보들을 모두 입력하세요. </p>
        </div>
        <div>
            <h4 class="mb-3" style="font-family: 'Noto Serif KR', serif;">기본 정보</h4>
            <div class="needs-validation" novalidate>
                <div class="row g-3"">
                    <div class="col-12">
                        <label for="name" class="form-label" style="font-family: 'Noto Serif KR', serif;">이 름</label>
                        <input style="margin-bottom: 20px;" type="text" class="form-control" id="name" placeholder="" value="" required>
                        <div class="invalid-feedback">
                            이름을 입력해주세요.
                        </div>
                    </div>
                    <div style="width: 700px; margin: auto;">
                        <label for="id" class="form-label" style="font-family: 'Noto Serif KR', serif;">아이디</label>
                        <div class="input-group has-validation">
                            <input type="text" class="form-control" id="id" placeholder="" required>
                            <div class="invalid-feedback">
                                아이디를 입력해주세요.
                            </div>
                        </div>
                    </div>

                    <div style="width: 600px; margin: auto;">
                        <label for="pw" class="form-label" style="font-family: 'Noto Serif KR', serif;">비밀번호</label>
                        <input type="text" class="form-control" id="pw" placeholder="" required="">
                        <div class="invalid-feedback">
                            비밀번호를 입력해주세요.
                        </div>
                    </div>
                </div>
                <button class="w-100 btn btn-dark btn-lg" onclick="signUp()" style="font-family: 'Noto Serif KR', serif; margin-top: 30px;">회원가입 하기</button>
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
