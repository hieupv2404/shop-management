<%--
  Created by IntelliJ IDEA.
  User: Black Diamond
  Date: 15-Sep-21
  Time: 4:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Email Application - Mazer Admin Dashboard</title>

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/static/assets/css/bootstrap.css">

    <link rel="stylesheet" href="/static/assets/css/pages/email.css">

    <link rel="stylesheet" href="/static/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="/static/assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="/static/assets/css/app.css">
    <link rel="shortcut icon" href="/static/assets/images/favicon.svg" type="image/x-icon">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

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
                        <a href="/admin/get/chat" class='sidebar-link'>
                            <i class="bi bi-chat-dots-fill"></i>
                            <span>Chat Application</span>
                        </a>
                    </li>

                    <li class="sidebar-item  ">
                        <a href="/admin/get/users" class='sidebar-link'>
                            <i class="bi-person-lines-fill"></i>
                            <span>Users</span>
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

        <div class="page-heading email-application">
            <div class="page-title">
                <div class="row">
                    <div class="col-12 col-md-6 order-md-1 order-last">
                        <h3>Chat Application</h3>
                        <p class="text-subtitle text-muted"></p>
                    </div>
                    <div class="col-12 col-md-6 order-md-2 order-first">
                        <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="/admin/get/dashboard">Dashboard</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Chat Application</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
            <section class="section content-area-wrapper">
                <div class="sidebar-left">
                    <div class="sidebar">
                        <div class="sidebar-content email-app-sidebar d-flex">
                            <!-- sidebar close icon -->
                            <span class="sidebar-close-icon">
                        <i class="bx bx-x"></i>
                    </span>
                            <!-- sidebar close icon -->
                            <div class="email-app-menu">
                                <div class="form-group form-group-compose">
                                    <!-- compose button  -->
                                    <button type="button" class="btn btn-primary btn-block my-4 compose-btn" id="disconnect">
                                        <i class="bx bx-plus"></i>
                                        Compose
                                    </button>
                                </div>
                                <div class="sidebar-menu-list ps">
                                    <!-- sidebar menu  -->
                                    <div class="list-group list-group-messages">
                                        <a href="#" class="list-group-item pt-0 active" id="inbox-menu">
                                            <div class="fonticon-wrap d-inline me-3">

                                                <svg class="bi" width="1.5em" height="1.5em" fill="currentColor">
                                                    <use
                                                            xlink:href="/static/assets/vendors/bootstrap-icons/bootstrap-icons.svg#envelope"/>
                                                </svg>
                                                </i>
                                            </div>
                                            Inbox
                                            <span
                                                    class="badge badge-light-primary badge-pill badge-round float-right mt-50">5</span>
                                        </a>
                                        <a href="#" class="list-group-item">
                                            <div class="fonticon-wrap d-inline me-3">

                                                <svg class="bi" width="1.5em" height="1.5em" fill="currentColor">
                                                    <use
                                                            xlink:href="/static/assets/vendors/bootstrap-icons/bootstrap-icons.svg#archive"/>
                                                </svg>
                                            </div>
                                            Sent
                                        </a>
                                        <a href="#" class="list-group-item">
                                            <div class="fonticon-wrap d-inline me-3">

                                                <svg class="bi" width="1.5em" height="1.5em" fill="currentColor">
                                                    <use
                                                            xlink:href="/static/assets/vendors/bootstrap-icons/bootstrap-icons.svg#pencil"/>
                                                </svg>
                                            </div>
                                            Draft
                                        </a>
                                        <a href="#" class="list-group-item">
                                            <div class="fonticon-wrap d-inline me-3">

                                                <svg class="bi" width="1.5em" height="1.5em" fill="currentColor">
                                                    <use xlink:href="/static/assets/vendors/bootstrap-icons/bootstrap-icons.svg#star"/>
                                                </svg>
                                            </div>
                                            Starred
                                        </a>
                                        <a href="#" class="list-group-item">
                                            <div class="fonticon-wrap d-inline me-3">

                                                <svg class="bi" width="1.5em" height="1.5em" fill="currentColor">
                                                    <use
                                                            xlink:href="/static/assets/vendors/bootstrap-icons/bootstrap-icons.svg#info-circle"/>
                                                </svg>
                                            </div>
                                            Spam
                                            <span
                                                    class="badge badge-light-danger badge-pill badge-round float-right mt-50">3</span>
                                        </a>
                                        <a href="#" class="list-group-item">
                                            <div class="fonticon-wrap d-inline me-3">
                                                <svg class="bi" width="1.5em" height="1.5em" fill="currentColor">
                                                    <use
                                                            xlink:href="/static/assets/vendors/bootstrap-icons/bootstrap-icons.svg#trash"/>
                                                </svg>
                                            </div>
                                            Trash
                                        </a>
                                    </div>
                                    <!-- sidebar menu  end-->

                                    <!-- sidebar label start -->
                                    <label class="sidebar-label">Labels</label>
                                    <div class="list-group list-group-labels">
                                        <a href="#"
                                           class="list-group-item d-flex justify-content-between align-items-center">
                                            Product
                                            <span class="bullet bullet-success bullet-sm"></span>
                                        </a>
                                        <a href="#"
                                           class="list-group-item d-flex justify-content-between align-items-center">
                                            Work
                                            <span class="bullet bullet-primary bullet-sm"></span>
                                        </a>
                                        <a href="#"
                                           class="list-group-item d-flex justify-content-between align-items-center">
                                            Misc
                                            <span class="bullet bullet-warning bullet-sm"></span>
                                        </a>
                                        <a href="#"
                                           class="list-group-item d-flex justify-content-between align-items-center">
                                            Family
                                            <span class="bullet bullet-danger bullet-sm"></span>
                                        </a>
                                        <a href="#"
                                           class="list-group-item d-flex justify-content-between align-items-center">
                                            Design
                                            <span class="bullet bullet-info bullet-sm"></span>
                                        </a>
                                    </div>
                                    <!-- sidebar label end -->
                                    <div class="ps__rail-x" style="left: 0px; bottom: 0px;">
                                        <div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div>
                                    </div>
                                    <div class="ps__rail-y" style="top: 0px; right: 0px;">
                                        <div class="ps__thumb-y" tabindex="0" style="top: 0px; height: 0px;"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- User new mail right area -->
                        <!--/ User Chat profile right area -->
                    </div>
                </div>
                <div class="content-right">
                    <div class="content-overlay"></div>
                    <div class="content-wrapper">
                        <div class="content-header row">
                        </div>
                        <div class="content-body">
                            <!-- email app overlay -->
                            <div class="app-content-overlay"></div>
                            <div class="email-app-area">
                                <!-- Email list Area -->
                                <div class="email-app-list-wrapper">
                                    <div class="email-app-list">
                                        <div class="email-action">
                                            <!-- action left start here -->
                                            <div class="action-left d-flex align-items-center">
                                                <!-- select All checkbox -->
                                                <div class="checkbox checkbox-shadow checkbox-sm selectAll me-3">
                                                    <input type="checkbox" id="checkboxsmall" class='form-check-input'>
                                                    <label for="checkboxsmall"></label>
                                                </div>
                                                <!-- delete unread dropdown -->
                                                <ul class="list-inline m-0 d-flex">
                                                    <li class="list-inline-item mail-delete">
                                                        <button type="button" class="btn btn-icon action-icon"
                                                                data-toggle="tooltip">
                                                    <span class="fonticon-wrap">
                                                        <svg class="bi" width="1.5em" height="1.5em"
                                                             fill="currentColor">
                                                            <use
                                                                    xlink:href="/static/assets/vendors/bootstrap-icons/bootstrap-icons.svg#trash"/>
                                                        </svg>
                                                    </span>
                                                        </button>
                                                    </li>
                                                    <li class="list-inline-item mail-unread">
                                                        <button type="button" class="btn btn-icon action-icon">
                                                    <span class="fonticon-wrap d-inline">

                                                        <svg class="bi" width="1.5em" height="1.5em"
                                                             fill="currentColor">
                                                            <use
                                                                    xlink:href="/static/assets/vendors/bootstrap-icons/bootstrap-icons.svg#envelope"/>
                                                        </svg>
                                                    </span>
                                                        </button>
                                                    </li>
                                                    <li class="list-inline-item">
                                                        <div class="dropdown">
                                                            <button type="button"
                                                                    class="dropdown-toggle btn btn-icon action-icon"
                                                                    id="folder"
                                                                    data-toggle="dropdown" aria-haspopup="true"
                                                                    aria-expanded="false">
                                                        <span class="fonticon-wrap">

                                                            <svg class="bi" width="1.5em" height="1.5em"
                                                                 fill="currentColor">
                                                                <use
                                                                        xlink:href="/static/assets/vendors/bootstrap-icons/bootstrap-icons.svg#folder"/>
                                                            </svg>
                                                        </span>
                                                            </button>
                                                            <div class="dropdown-menu dropdown-menu-right"
                                                                 aria-labelledby="folder">
                                                                <a class="dropdown-item" href="#"><i
                                                                        class="bx bx-edit"></i>
                                                                    Draft</a>
                                                                <a class="dropdown-item" href="#"><i
                                                                        class="bx bx-info-circle"></i>Spam</a>
                                                                <a class="dropdown-item" href="#"><i
                                                                        class="bx bx-trash"></i>Trash</a>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="list-inline-item">
                                                        <div class="dropdown">
                                                            <button type="button"
                                                                    class="btn btn-icon dropdown-toggle action-icon"
                                                                    id="tag"
                                                                    data-toggle="dropdown" aria-haspopup="true"
                                                                    aria-expanded="false">
                                                        <span class="fonticon-wrap">

                                                            <svg class="bi" width="1.5em" height="1.5em"
                                                                 fill="currentColor">
                                                                <use
                                                                        xlink:href="/static/assets/vendors/bootstrap-icons/bootstrap-icons.svg#tag"/>
                                                            </svg>
                                                        </span>
                                                            </button>
                                                            <div class="dropdown-menu dropdown-menu-right"
                                                                 aria-labelledby="tag">
                                                                <a href="#" class="dropdown-item align-items-center">
                                                                    <span class="bullet bullet-success bullet-sm"></span>
                                                                    <span>Product</span>
                                                                </a>
                                                                <a href="#" class="dropdown-item align-items-center">
                                                                    <span class="bullet bullet-primary bullet-sm"></span>
                                                                    <span>Work</span>
                                                                </a>
                                                                <a href="#" class="dropdown-item align-items-center">
                                                                    <span class="bullet bullet-warning bullet-sm"></span>
                                                                    <span>Misc</span>
                                                                </a>
                                                                <a href="#" class="dropdown-item align-items-center">
                                                                    <span class="bullet bullet-danger bullet-sm"></span>
                                                                    <span>Family</span>
                                                                </a>
                                                                <a href="#" class="dropdown-item align-items-center">
                                                                    <span class="bullet bullet-info bullet-sm"></span>
                                                                    <span> Design</span>
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                            <!-- action left end here -->

                                            <!-- action right start here -->
                                            <div
                                                    class="action-right d-flex flex-grow-1 align-items-center justify-content-around">
                                                <!-- search bar  -->
                                                <div class="email-fixed-search flex-grow-1">
                                                    <div class="sidebar-toggle d-block d-lg-none">
                                                        <i class="bx bx-menu"></i>
                                                    </div>

                                                    <div class="form-group position-relative  mb-0 has-icon-left">
                                                        <input type="text" class="form-control"
                                                               placeholder="Search email..">
                                                        <div class="form-control-icon">
                                                            <svg class="bi" width="1.5em" height="1.5em"
                                                                 fill="currentColor">
                                                                <use
                                                                        xlink:href="/static/assets/vendors/bootstrap-icons/bootstrap-icons.svg#search"/>
                                                            </svg>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- pagination and page count -->
                                                <span class="d-none d-sm-block">1-10 of 653</span>
                                                <button class="btn btn-icon email-pagination-prev d-none d-sm-block">
                                                    <svg class="bi" width="1.5em" height="1.5em" fill="currentColor">
                                                        <use
                                                                xlink:href="/static/assets/vendors/bootstrap-icons/bootstrap-icons.svg#chevron-left"/>
                                                    </svg>
                                                </button>
                                                <button class="btn btn-icon email-pagination-next d-none d-sm-block">
                                                    <svg class="bi" width="1.5em" height="1.5em" fill="currentColor">
                                                        <use
                                                                xlink:href="/static/assets/vendors/bootstrap-icons/bootstrap-icons.svg#chevron-right"/>
                                                    </svg>
                                                </button>
                                            </div>
                                        </div>
                                        <!-- / action right -->

                                        <!-- email user list start -->
                                        <div class="email-user-list list-group" style="overflow: auto" >
                                            <ul class="users-list-wrapper media-list">
                                                <li id="greetings" hidden></li>
                                            </ul>
                                            <!-- email user list end -->

                                            <!-- no result when nothing to show on list -->
                                            <div class="no-results">
                                                <i class="bx bx-error-circle font-large-2"></i>
                                                <h5>No Items Found</h5>
                                            </div>
<%--                                            <div class="ps__rail-x" style="left: 0px; bottom: 0px;">--%>
<%--                                                <div class="ps__thumb-x" tabindex="0"--%>
<%--                                                     style="left: 0px; width: 0px;"></div>--%>
<%--                                            </div>--%>
<%--                                            <div class="ps__rail-y" style="top: 0px; height: 733px; right: 0px;">--%>
<%--                                                <div class="ps__thumb-y" tabindex="0"--%>
<%--                                                     style="top: 0px; height: 567px;"></div>--%>
<%--                                            </div>--%>
                                        </div>
                                    </div>
                                </div>
                                <!--/ Email list Area -->

                                <!-- Detailed Email View -->
                                <!--/ Detailed Email View -->
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
    let href = "/app/say/chat/admin";
    stompClient = Stomp.over(socket);
    stompClient.connect({}, function (frame) {
        // setConnected(true);
        console.log('Connected: ' + frame);
        stompClient.subscribe(href, function (greeting) {
            let nameList= JSON.parse(greeting.body).sessionId.toString();
                if (sessionStorage.getItem("list")==null){
                    let list=[JSON.parse(greeting.body).sessionId.toString()];
                    sessionStorage.setItem("list",JSON.stringify(list));
                    let chatList=[JSON.parse(greeting.body).id.toString()];
                    sessionStorage.setItem(nameList,JSON.stringify(chatList));
                }
                else {
                    let list = JSON.parse(sessionStorage.getItem("list"));
                    if (!list.includes(JSON.parse(greeting.body).sessionId.toString())) {
                        list.push(JSON.parse(greeting.body).sessionId.toString());
                        sessionStorage.setItem("list", JSON.stringify(list));
                        let chatList = [JSON.parse(greeting.body).id.toString()];
                        sessionStorage.setItem(nameList, JSON.stringify(chatList));
                    }
                    else {
                        let list = JSON.parse(sessionStorage.getItem(nameList));
                        list.push(JSON.parse(greeting.body).id.toString());
                        sessionStorage.setItem(nameList,JSON.stringify(list));
                        document.getElementById(JSON.parse(greeting.body).sessionId.toString()).remove();
                    }
                }
            sessionStorage.setItem(JSON.parse(greeting.body).id, greeting.body);
            showGreeting(greeting.body);
        });
    });

    function disconnect() {
            if (stompClient !== null) {
                stompClient.disconnect();
                stompClient.unsubscribe();
            }
            setConnected(false);
            console.log("Disconnected");
        }

    function sendName() {
        let href = "/app/say/" + "<%=session.getAttribute("id")%>";
        console.log(href);
        stompClient.send(href, {}, JSON.stringify({
            'name': $("#name").val()
        }));
    }

    function showGreeting(message) {
        let id=JSON.parse(message).sessionId;
        let href="/admin/get/chat?id="+JSON.parse(message).sessionId;
        $("#greetings").before("<a href="+href+" role='button'>"+
            "<li class='media mail-read' id="+ id +">"+
            "<div class='user-action'>"+
                "<div class='checkbox-con me-3'>"+
                    "<div class='checkbox checkbox-shadow checkbox-sm'>"+
                        "<input type='checkbox' id='checkboxsmall1'"+
                               "class='form-check-input'>"+
                            "<label for='checkboxsmall1'></label>"+
                    "</div>"+
                "</div>"+
                "<span class='favorite text-warning'>"+
                                                    "<svg class='bi' width='1.5em' height='1.5em' fill='currentColor'>"+
                                                        "<use"+
                                                            "xlink:href='/static/assets/vendors/bootstrap-icons/bootstrap-icons.svg#star-fill'/>"+
                                                    "</svg>"+
                                                "</span>"+
            "</div>"+
            "<div class='pr-50'>"+
                "<div class='avatar'>"+
                    "<img src='/static/assets/images/faces/1.jpg' alt='avtar img holder'>"+
                "</div>"+
            "</div>"+
            "<div class='media-body'>"+
                "<div class='user-details'>"+
                    "<div class='mail-items'>"+
                                                        "<span class='list-group-item-text text-truncate'>"+JSON.parse(message).sessionId+"</span>"+
                    "</div>"+
                    "<div class='mail-meta-item'>"+
                                                        "<span class='float-right'>"+
                                                            "<span class='mail-date'>4:14 AM</span>"+
                                                        "</span>"+
                    "</div>"+
                "</div>"+
                "<div class='mail-message'>"+
                    "<p class='list-group-item-text truncate mb-0'>"+
            JSON.parse(message).name+
                    "</p>"+
                    "<div class='mail-meta-item'>"+
                                                        "<span class='float-right'>"+
                                                            "<span class='bullet bullet-success bullet-sm'></span>"+
                                                        "</span>"+
                    "</div>"+
                "</div>"+
            "</div>"+
        "</li>"+
            "</a>"
    );
    }

    $(function ()
        {

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
        const array2 = JSON.parse(sessionStorage.getItem(element));

        console.log(array2[array2.length-1]);
        showGreeting(sessionStorage.getItem(array2[array2.length-1]));
    }
</script>
</html>

