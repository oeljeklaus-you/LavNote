<%--
  Created by IntelliJ IDEA.
  User: youyujie
  Date: 2018/5/15
  Time: 下午6:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="keywords" content="fastnote,快笔记,fastnote.com">
    <meta name="description" content="fastnote, 快笔记，快人一步的云笔记！">
    <meta name="author" content="fastnote,快笔记">
    <title>注册</title>

    <link href="/css/bootstrap-min.css" rel="stylesheet">
    <link href="/css/font-awesome-4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="/css/index.css?t=a" rel="stylesheet">
    <style>
        html, body {
            height: 100%;
        }
    </style>
</head>
<body id="boxBody" class="lang-zh-cn">
<style>
    .fastnote-privacy {
        font-size: 10px;
        margin-bottom: 10px;
    }
    .fastnote-privacy a {
        font-size: 10px;
    }
</style>
<section id="box" class="animated fadeInUp">

    <div>
        <h1 id="logo"></h1>
        <div id="boxForm">
            <div id="boxHeader">注册</div>
            <form method="post">
                <div class="alert alert-danger" id="loginMsg"></div>
                <input id="from" type="hidden" value="" />
                <div class="form-group">
                    <label class="control-label" for="email">Email</label>
                    <input type="text" class="form-control" id="email" name="email">
                </div>
                <div class="form-group">
                    <label class="control-label" for="pwd">密码</label>
                    <input type="password" class="form-control" id="pwd" name="pwd">
                    密码至少6位
                </div>
                <div class="form-group">
                    <label class="control-label" for="pwd2">确认密码</label>
                    <input type="password" class="form-control" id="pwd2" name="pwd2" >
                </div>

                <div class="fastnote-privacy">点击注册或第三方登录即表明你同意本<a target="_blank" href="https://pro.fastnote.com/p/591adc52893c0fe74a2c67ae">服务条款</a>和<a target="_blank" href="https://pro.fastnote.com/p/585c99dca6caa45a631a1b5b">隐私条款</a></div>

                <button id="registerBtn" class="btn btn-success">注册</button>


                <div class="line line-dashed"></div>
                <p class="text-muted text-center"><small>已有帐户?</small></p>

                <a id="loginBtn" href="/page/login.do" class="btn btn-default btn-block">登录</a>

                <div class="line line-dashed"></div>
                <p class="text-muted text-center"><small>使用第三方帐号登录</small></p>


                <div class="third-account">
                    <a href="#" id="wechat" class="btn btn-wechat m-b-sm btn-third">
                        <i class="fa fa-wechat pull-left"></i> 微信
                    </a>
                    <a href="#" id="qq" class="btn btn-qq m-b-sm btn-third">
                        <i class="fa fa-qq pull-left"></i> QQ
                    </a>

                    <a href="#" id="weibo" class="btn btn-weibo m-b-sm btn-third">
                        <i class="fa fa-weibo pull-left"></i> 微博
                    </a>

                    <a href="#" id="github" class="btn btn-github m-b-sm btn-third">
                        <i class="fa fa-github pull-left"></i> Github
                    </a>
                    <div class="third-split"></div>
                    <a href="#" id="google" class="btn btn-google m-b-sm btn-third">
                        <i class="fa fa-google pull-left"></i> Google
                    </a>
                    <a href="#" id="facebook" class="btn btn-facebook m-b-sm btn-third">
                        <i class="fa fa-facebook pull-left"></i> Facebook
                    </a>
                    <a href="#" id="twitter" class="btn btn-twitter m-b-sm btn-third">
                        <i class="fa fa-twitter pull-left"></i> Twitter
                    </a>
                </div>


            </form>
        </div>
    </div>
</section>

<div id="boxFooter">
    <p>
        <a href="/page/index.do">主页</a>
    </p>
    <p>
        © <a href="/page/index.do">fastnote</a>
    </p>
</div>

<script src="/js/jquery-1.9.0.min.js"></script>
<script src="/js/bootstrap.js"></script>
<script src="/js/common.js"></script>

<script>
    $(function() {
        if (navigator.userAgent.toLowerCase().indexOf('micromessenger') >= 0) {
            location.href = '/mp/note?from=' + ($("#from").val() || '');
            return;
        }

        $("#email").focus();

        function showMsg(msg, id) {
            $("#loginMsg").html(msg).show();
            if(id) {
                $("#" + id).focus();
            }
        }
        function hideMsg() {
            $("#loginMsg").hide();
        }
        $("#registerBtn").click(function(e){
            e.preventDefault();
            var email = $("#email").val();
            var pwd = $("#pwd").val();
            var pwd2 = $("#pwd2").val();
            if(!email) {
                showMsg("请输入Email", "email");
                return;
            } else {
                var myreg = /^([a-zA-Z0-9]+[_|\_|\.|\-]?)*[a-zA-Z0-9\-_]+@([a-zA-Z0-9\-]+[_|\_|\.|\-]?)*[a-zA-Z0-9\-]+\.[0-9a-zA-Z]{2,6}$/;
                if(!myreg.test(email)) {
                    showMsg("Email格式有误", "email");
                    return;
                }
            }
            if(!pwd) {
                showMsg("请输入密码", "pwd");
                return;
            } else {
                if(pwd.length < 6) {
                    showMsg("密码至少6位", "pwd");
                    return;
                }
            }
            if(!pwd2) {
                showMsg("请输入确认密码", "pwd2");
                return;
            } else {
                if(pwd != pwd2) {
                    showMsg("两次密码输入不正确", "pwd2");
                    return;
                }
            }

            $("#registerBtn").html("正在处理...").addClass("disabled");


            var iu = "";

            $.post("/user/register.do", {email: email, pwd: pwd, iu: iu}, function(e) {
                $("#registerBtn").html("注册").removeClass("disabled");
                if(e.ok) {
                    <!--$("#registerBtn").html("注册成功, 正在跳转...");-->
                    var msg = "已经激活邮箱的链接发送到您的邮箱, 请查收邮件."
                    var loginAddress = getEmailLoginAddress(email);
                    if(loginAddress) {
                        msg += ' <a target="_blank" href="' + loginAddress + '">查收邮箱</a>';
                    }
                    $("#loginMsg").html(msg).show().removeClass("alert-danger").addClass("alert-success");

                } else {
                    showMsg(e.msg, "email");
                }
            });
        });


        $(".btn-third").click(function(e) {
            e.preventDefault();
            $(this).button("loading");
            var id = $(this).attr('id');
            location.href = '/oauth/url?t=' + id;
        });
    });
</script>
</body>
</html>