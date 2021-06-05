<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
    <link href="icon/fontawesome/css/all.min.css" rel="stylesheet">
    <link href="teacher/style.css" rel="stylesheet">
</head>
<style>
    .modal {
        position: fixed;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
        display: flex;
        animation: fadeIn linear 0.2s;
    }

    .modal__overlay {
        position: absolute;
        background-color: rgba(0, 0, 0, 0.3);
        width: 100%;
        height: 100%;
    }

    .modal__body {
        --growth-from: 0.7;
        --growth-to: 1;
        animation: growth ease-in 0.2s;
        margin: auto;
        position: relative;
        z-index: 1;
    }

    .auth__form {
        width: 500px;
        background-color: white;
        border-radius: 2px;
    }

    .auth__form__header {
        margin: 10px 40px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .auth__form__heading {
        font-size: 2.2rem;
        font-weight: 500;
        color: black;
    }

    .auth__form__switch-btn {
        color: orange;
        font-size: 1.6rem;
        font-weight: 400;
    }

    .auth__form-group {
        margin: 0 32px;
    }

    .auth__form-input {
        height: 40px;
        width: 100%;
        font-size: 1.4rem;
        outline: none;
        border: 1px solid #c2c2c2;
        padding: 0 12px;
        margin-top: 16px;
    }

    .auth__form-policy {
        margin: 18px 38px;
    }

    .auth__form-policy-text {
        font-size: 1.3rem;
        color: black;
        text-align: center;
        line-height: 1.8rem;
    }

    .auth__form-policy-text--primary {
        color: orange;
        text-decoration: none;
    }

    .auth__form-help {
        margin: 18px 16px 0 32px;
        text-align: right;
    }

    .auth__form-help-link {
        position: relative;
        text-decoration: none;
        font-size: 1.4rem;
        font-weight: 500;
        color: #b4b4b4;
        margin: 0 16px;
    }

    .auth__form-help-link:first-child {
        color: orange;
    }

    .auth__form-help-link--separate::before {
        content: "";
        position: absolute;
        display: block;
        border-left: 1px solid orange;
        height: 16px;
        right: -16px;
    }

    .auth__form-controls {
        margin: 86px 32px 0 0;
        text-align: right;
    }

    .auth__form-btn {
        font-size: 1.6rem;
    }

    .auth__form-btn--hover:hover {
        background-color: #f7f7f7;
    }

    .auth__form-socials {
        margin-top: 22px;
        padding: 0 32px;
        height: 64px;
        background-color: #f5f5f5;
        display: flex;
        align-items: center;
        justify-content: space-between;
        border-bottom-left-radius: 2px;
        border-bottom-right-radius: 2px;
    }

    .auth__form-socials-link-fb,
    .auth__form-socials-link-gg {
        text-decoration: none;
        font-size: 1.6rem;

    }

    .auth__form-socials-link-fb {
        background-color: #3a5a98;
        color: white;
    }

    .auth__form-socials-link-fb i,
    .auth__form-socials-link-gg i {
        font-size: 1.6rem;
        margin-right: 24px;
    }

    .auth__form-socials-link-gg {
        color: black;
    }

    @keyframes growth {
        from {
            transform: scale(var(--growth-from));
        }
        to {
            transform: scale(var(--growth-to));
        }
    }
</style>
<body onload="loginErr()" style="background-image: url('https://images.pexels.com/photos/583846/pexels-photo-583846.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940');background-size: cover">
<div id="btn-login">
    <button id="registration" onclick="openForm(this.id)" class="btn" style="background-color: rgb(40,39,129)">Đăng kí</button>
    <button id="login" onclick="openForm(this.id)" class="btn" style="background-color: rgb(40,39,129)"> Đăng nhập</button>
</div>
<div style="display: none" class="modal" id="modal">
    <div class="modal__overlay" onclick="closeForm('modal')">

    </div>

    <div class="modal__body" style="width: 500px;height: 70vh">

        <!-- Register -->
        <form method="post" action="Register">
            <div class="auth__form" id="register" style="display: none">

                <div class="auth__form__header">

                    <h3 class="auth__form__heading">Đăng kí</h3>
                    <span class="auth__form__switch-btn" onclick="switchForm('login')">Đăng nhập</span>

                </div>

                <div class="auth__form-group">

                    <input type="text" placeholder="Email của bạn" class="auth__form-input">

                </div>

                <div class="auth__form-group">

                    <input type="password" placeholder="Mật khẩu của bạn" class="auth__form-input">

                </div>

                <div class="auth__form-group">

                    <input type="password" placeholder="Nhập lại mật khẩu" class="auth__form-input">

                </div>

                <div class="auth__form-policy">

                    <p class="auth__form-policy-text">
                        Bằng việc đăng kí, bạn đã đồng ý với Việt Nam Tour về
                        <a href="#" class="auth__form-policy-text--primary">Điều khoản dịch vụ</a> &
                        <a href="#" class="auth__form-policy-text--primary">Chính sách bảo mật</a>
                    </p>

                </div>
                <div class="auth__form-controls">

                    <button class="btn auth__form-btn auth__form-btn--hover" onclick="closeForm('modal')">TRỞ LẠI
                    </button>
                    <button class="btn btn--primary auth__form-btn">ĐĂNG KÍ</button>

                </div>

                <div class="auth__form-socials">

                    <a href="#" class="btn auth__form-socials-link-fb">
                        <i class="fab fa-facebook"></i>
                        <span>Facebook</span>
                    </a>

                    <a href="#" class="btn auth__form-socials-link-gg">
                        <i class="fab fa-google"></i>
                        <span>Google</span>
                    </a>

                </div>
            </div>
        </form>
        <div class="auth__form" id="logins" style="display: none">

            <form method="post" action="users?action=login" id="form-login">
                <div class="auth__form__header">

                    <h3 class="auth__form__heading">Đăng nhập</h3>
                    <span id="switchRegister" class="auth__form__switch-btn" onclick="switchForm(this.id)">Đăng Kí</span>

                </div>

                <div class="auth__form-group">

                    <input type="text" name="account" placeholder="Email của bạn" class="auth__form-input">
                    <span style="color: red" id="account-err" >${message}</span>
                </div>

                <div class="auth__form-group">

                    <input type="password" name="password" placeholder="Mật khẩu của bạn" class="auth__form-input">
                    <span style="color: red" id="password-err" >${message2}</span>
                </div>

                <div class="auth__form-help">

                    <a href="#" class="auth__form-help-link auth__form-help-link--separate">
                        Quên mật khẩu
                    </a>

                    <a href="#" class="auth__form-help-link">
                        Cần trợ giúp?
                    </a>

                </div>

                <div class="auth__form-controls">
                    <button class="btn auth__form-btn auth__form-btn--hover" onclick="closeForm('modal')">TRỞ LẠI</button>
                    <button class="btn btn--primary auth__form-btn" type="submit">ĐĂNG NHẬP</button>
                </div>

                <div class="auth__form-socials">
                    <a href="#" class="btn auth__form-socials-link-fb">
                        <i class="fab fa-facebook"></i>
                        <span>Facebook</span>
                    </a>
                    <a href="#" class="btn auth__form-socials-link-gg">
                        <i class="fab fa-google"></i>
                        <span>Google</span>
                    </a>
                </div>
            </form>
        </div>
    </div>

</div>

</body>

<script>
    function openForm(id) {
        if (id == "registration") {
            document.getElementById("modal").style.display = "block"
            document.getElementById("register").style.display = "block"
            document.getElementById("btn-login").style.display = "none"
        } else if (id == "login") {
            document.getElementById("modal").style.display = "block"
            document.getElementById("logins").style.display = "block"
            document.getElementById("btn-login").style.display = "none"
        } else {
            document.getElementById("modal").style.display = "none"
            document.getElementById("logins").style.display = "none"
        }
    }

    function closeForm(id) {
        let status = document.getElementById(id).style.display
        if (status == "none") {
            document.getElementById(id).style.display = "block"
        } else {
            document.getElementById(id).style.display = "none"
            document.getElementById("logins").style.display = "none"
            document.getElementById("register").style.display = "none"
            document.getElementById("btn-login").style.display = "block"
        }
    }

    function switchForm(id) {
        if (id == "switchRegister") {
            document.getElementById("register").style.display = "block"
            document.getElementById("logins").style.display = "none"
        } else {
            document.getElementById("register").style.display = "none"
            document.getElementById("logins").style.display = "block"
        }
    }
    function loginErr(){
        let status = document.getElementById("account-err").innerText;
        let status2 = document.getElementById("password-err").innerText;
        if (status == "Account does not exist" || status2 == "Incorrect password") {
            document.getElementById("modal").style.display = "block"
            document.getElementById("logins").style.display = "block"
        }
    }
</script>

</body>
</html>
