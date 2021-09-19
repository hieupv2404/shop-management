<%--
  Created by IntelliJ IDEA.
  User: Black Diamond
  Date: 16-Sep-21
  Time: 10:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chatbox - Mazer Admin Dashboard</title>

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/static/assets/css/bootstrap.css">

    <link rel="stylesheet" href="/static/assets/css/widgets/chat.css">

    <link rel="stylesheet" href="/static/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="/static/assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="/static/assets/css/app.css">
    <link rel="shortcut icon" href="/static/assets/images/favicon.svg" type="image/x-icon">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
</head>

<body>
<div id="app">
    <div id="sidebar" class="active">
        <div class="sidebar-wrapper active">
            <div class="sidebar-header">
                <div class="d-flex justify-content-between">
                    <div class="logo">
                        <a href="index.html"><img src="/static/assets/images/logo/logo.png" alt="Logo" srcset=""></a>
                    </div>
                    <div class="toggler">
                        <a href="#" class="sidebar-hide d-xl-none d-block"><i class="bi bi-x bi-middle"></i></a>
                    </div>
                </div>
            </div>
            <div class="sidebar-menu">
                <ul class="menu">
                    <li class="sidebar-title">Menu</li>

                    <li class="sidebar-item  ">
                        <a href="/admin/get/dashboard" class='sidebar-link'>
                            <i class="bi bi-grid-fill"></i>
                            <span>Dashboard</span>
                        </a>
                    </li>
                    <li class="sidebar-item  has-sub">
                        <a href="#" class='sidebar-link'>
                            <i class="bi bi-stack"></i>
                            <span>Category</span>
                        </a>
                        <ul class="submenu ">
                            <li class="submenu-item ">
                                <a href="/admin/categories/addCategory">Create Category</a>
                            </li>
                            <li class="submenu-item ">
                                <a href="/admin/categories/getAll">List Category</a>
                            </li>
                        </ul>
                    </li>
                    <li class="sidebar-item  has-sub">
                        <a href="#" class='sidebar-link'>
                            <i class="bi bi-stack"></i>
                            <span>product</span>
                        </a>
                        <ul class="submenu ">
                            <li class="submenu-item ">
                                <a href="/admin/products/addProduct">Create Product</a>
                            </li>
                            <li class="submenu-item ">
                                <a href="/admin/products/getAll">List Product</a>
                            </li>
                        </ul>
                    </li>

                    <li class="sidebar-item  active">
                        <a href="/admin/get/chatBox" class='sidebar-link'>
                            <i class="bi bi-chat-dots-fill"></i>
                            <span>Chat Application</span>
                        </a>
                    </li>

                    <li class="sidebar-item">
                        <a href="/auth/logout" class="sidebar-link">
                            <i class="bi-person-x-fill"></i>
                            <span>Log out</span>
                        </a>
                    </li>
                </ul>
            </div>
            <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
        </div>
    </div>
    <div id="main">
        <header class="mb-3">
            <a href="#" class="burger-btn d-block d-xl-none">
                <i class="bi bi-justify fs-3"></i>
            </a>
        </header>

        <div class="page-heading">
            <div class="page-title">
                <div class="row">
                    <div class="col-12 col-md-6 order-md-1 order-last">
                        <h3>Chatbox</h3>
                        <p class="text-subtitle text-muted">For user to check they list</p>
                    </div>
                    <div class="col-12 col-md-6 order-md-2 order-first">
                        <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Chatbox</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
            <section class="section">
                <div class="row">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header">
                                <div class="media d-flex align-items-center">
                                    <div class="avatar me-3">
                                        <img src="/static/assets/images/faces/1.jpg" alt="" srcset="">
                                        <span class="avatar-status bg-success"></span>
                                    </div>
                                    <div class="name flex-grow-1">
                                        <h6 class="mb-0">Fred</h6>
                                        <span class="text-xs">Online</span>
                                    </div>
                                    <button class="btn btn-sm">
                                        <i data-feather="x"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="card-body pt-4 bg-grey">
                                <div class="chat-content" id="greetings" style=" height: 350px; flex-direction: column;overflow: auto ">

                                </div>
                            </div>
                            <div class="card-footer">
                                <div class="message-form d-flex flex-direction-column align-items-center">
                                    <a href="http://" class="black"><i data-feather="smile"></i></a>
                                    <div class="d-flex flex-grow-1 ml-4">
                                        <input id="name" type="text" class="form-control" placeholder="Type your message.."/>
                                        <button id="send"  class="btn btn-default" type="submit">Send</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>

        <footer>
            <div class="footer clearfix mb-0 text-muted">
                <div class="float-start">
                    <p>2021 &copy; Mazer</p>
                </div>
                <div class="float-end">
                    <p>Crafted with <span class="text-danger"><i class="bi bi-heart"></i></span> by <a
                            href="http://ahmadsaugi.com">A. Saugi</a></p>
                </div>
            </div>
        </footer>
    </div>
</div>
<script src="/static/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="/static/assets/js/bootstrap.bundle.min.js"></script>

<script src="/static/assets/js/main.js"></script>
</body>
<script type="text/javascript">
    var stompClient = null;

    function setConnected(connected) {
        $("#connect").prop("disabled", connected);

        $("#disconnect").prop("disabled", !connected);

        if (connected) {
            $("#conversation").show();
        } else {
            $("#conversation").hide();
        }
        $("#greetings").html("");
    }

    let socket = new SockJS('/ws');
    let href = "/topic/chat/" + "${id}";
    stompClient = Stomp.over(socket);
    stompClient.connect({}, function (frame) {
        // setConnected(true);
        console.log('Connected: ' + frame);
        stompClient.subscribe(href, function (greeting) {
            if (sessionStorage.getItem("list")==null){
                let list=JSON.parse(greeting.body).id.toString();
                sessionStorage.setItem("list",JSON.stringify(list));
            }
            else {
                let list = JSON.parse(sessionStorage.getItem("list"));
                list.push(JSON.parse(greeting.body).id.toString());
                sessionStorage.setItem("list",JSON.stringify(list));
            }
            sessionStorage.setItem(JSON.parse(greeting.body).id, greeting.body);
            showGreeting(greeting.body);
            let objDiv = document.getElementById("greetings");
            objDiv.scrollTop = objDiv.scrollHeight;
        });
    });

    function sendName() {
        let href = "/app/say/" + "${id}";
        console.log(href);
        stompClient.send(href, {}, JSON.stringify({
            'name': $("#name").val()
        }));
    }

    function showGreeting(message) {
        if (JSON.parse(message).sender == "client") {
            $("#greetings").append("<div class='chat chat-left'>" +
                "<div class='chat-body'>" +
                "<div class='chat-message'>" + JSON.parse(message).name + "</div>" +
                "</div>" +
                "</div>"
            );
        } else {
            $("#greetings").append("<div class='chat'>" +
                "<div class='chat-body'>" +
                "<div class='chat-message'>" + JSON.parse(message).name + "</div>" +
                "</div>" +
                "</div>"
            );
        }
    }

    $(function () {

            $("form").on('submit', function (e) {
                e.preventDefault();
            });

            $("#connect").click(function () {
                connect();
            });

            $("#disconnect").click(function () {
                disconnect();
            });

            $("#send").click(function () {
                sendName();
            });

        }
    );
</script>
<script>
    const array1 = JSON.parse(sessionStorage.getItem("list"));

    for (const element of array1) {
        showGreeting(sessionStorage.getItem(element));
    }
    let objDiv = document.getElementById("greetings");
    objDiv.scrollTop = objDiv.scrollHeight;
</script>
</html>

