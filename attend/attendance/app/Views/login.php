<!doctype html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport"
        content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, viewport-fit=cover" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <meta name="theme-color" content="#000000">
    <title>Attendance</title>
	<meta name="description" content="">
    <meta name="keywords" content="bootstrap 4, mobile template, cordova, phonegap, mobile, html" />
    <link href="<?= base_url(); ?>img/icon/192x192.png" type="text/css" sizes="180x180" rel="apple-touch-icon" />
    <link href="<?= base_url(); ?>img/favicon.png" type="text/css" sizes="32x32" type="image/png" />
    <link rel="stylesheet" href="<?= base_url(); ?>css/style.css">
	<link rel="stylesheet" href="<?= base_url(); ?>css/custom.css">
    <link href="<?= base_url(); ?>css/style.bundle.css" rel="stylesheet" type="text/css" />
	<link href="<?= base_url(); ?>css/custom.css" rel="stylesheet" type="text/css" />
    <link href="<?= base_url(); ?>css/login-3.css" rel="stylesheet" type="text/css" />
	<link href="<?= base_url(); ?>plugins/global/plugins.bundle.css" rel="stylesheet" type="text/css" />
    <link rel="manifest" href="manifest.json">
    <link rel="shortcut icon" href="/media/logo.png" />
</head>
<body class="bg-white">
    <div id="loader">
        <div class="spinner-border text-primary" role="status"></div>
    </div>
    <div id="appCapsule" class="pt-15">
        <div class="login-form mt-1">
            <div class="section">
            <img src="<?= base_url(); ?>media/logo.png" alt="Attendance" width="140">
            </div>
            <div class="section mt-3">
                <h2>Attendance</h2>
				<h4>Login</h4>
            </div>
            <div class="section mt-1 mb-5">
                <div class="mb-5">
                <?php $session = session(); ?>
                <?php if ($session->getFlashData('error')): ?>
                    <div class="alert alert-danger">
                        <?= $session->getFlashData('error'); ?>
                    </div>
                <?php endif; ?>
                <?php if ($session->getFlashData('success')): ?>
                    <div class="alert alert-success">
                        <?= $session->getFlashData('success'); ?>
                    </div>
                <?php endif; ?>
                </div>
                <form name="loginForm" action="<?= base_url(); ?>Login/processLogin" method="post">
                    <div class="form-group boxed">
                        <div class="input-wrapper">
                            <input type="text" class="form-control" id="email" placeholder="User ID" name="username">
                            <i class="clear-input">
                                <ion-icon name="close-circle"></ion-icon>
                            </i>
                        </div>
                    </div>
                    <div class="form-group boxed">
                        <div class="input-wrapper">
                            <input type="password" class="form-control" id="password1" placeholder="Password" name="password">
                            <i class="clear-input">
                                <ion-icon name="close-circle"></ion-icon>
                            </i>
                        </div>
                    </div>
                    <div class="form-button-group">
                        <button type="submit" class="btn btn-primary btn-block btn-lg">Log in</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script type="module" src="https://unpkg.com/ionicons@5.0.0/dist/ionicons/ionicons.js"></script>
    <script src="<?= base_url(); ?>js/lib/jquery-3.4.1.min.js"></script>
    <script src="<?= base_url(); ?>js/lib/popper.min.js"></script>
    <script src="<?= base_url(); ?>js/lib/bootstrap.min.js"></script>
    <script src="<?= base_url(); ?>js/plugins/owl-carousel/owl.carousel.min.js"></script>
    <script src="<?= base_url(); ?>js/plugins/jquery-circle-progress/circle-progress.min.js"></script>
    <script src="<?= base_url(); ?>js/base.js"></script>
    <script src="<?= base_url('plugins/global/plugins.bundle.js'); ?>"></script>
    <script src="<?= base_url('js/scripts.bundle.js'); ?>"></script>
    <script src="<?= base_url('main.js'); ?>"></script>
    <script>
            $(document).ready(function () {
				$('#kt_login_forgot').click(function () {
					$('.login.login-3').addClass('login-forgot-on');
					$('.login.login-3').removeClass('login-signin-on');
				});
                $('#signinForm').on('submit', function(e) {
                    if(!$('#signinForm input[name=\"username\"]').val().trim()) {
                        e.preventDefault();
                        alert('Email cannot be empty.');
                    }
                })
                setTimeout(function() {
                    $('.alert').alert('close');
                }, 5000);
/*                $("#loginForm inputname=['username']").on('change', function(e) {
                    $(this).length > 
            })*/
            });
            $(document).on('click keypress', function() {
                $('.alert').alert('close');
            })
    </script>
</body>
</html>
