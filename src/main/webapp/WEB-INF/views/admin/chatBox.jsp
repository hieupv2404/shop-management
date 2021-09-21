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
                        <p class="text-subtitle text-muted">An application for user to check email inbox</p>
                    </div>
                    <div class="col-12 col-md-6 order-md-2 order-first">
                        <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Email Application</li>
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
                        <div class="compose-new-mail-sidebar ps">
                            <div class="card shadow-none quill-wrapper p-0">
                                <div class="card-header">
                                    <h3 class="card-title" id="emailCompose">New Message</h3>
                                    <button type="button" class="close close-icon">
                                        <i class="bx bx-x"></i>
                                    </button>
                                </div>
                                <!-- form start -->
                                <form action="#" id="compose-form">
                                    <div class="card-content">
                                        <div class="card-body pt-0">
                                            <div class="form-group pb-50">
                                                <label for="emailfrom">from</label>
                                                <input type="text" id="emailfrom" class="form-control"
                                                       placeholder="user@example.com" disabled="">
                                            </div>
                                            <div class="form-label-group">
                                                <input type="email" id="emailTo" class="form-control" placeholder="To"
                                                       required="">
                                                <label for="emailTo">To</label>
                                            </div>
                                            <div class="form-label-group">
                                                <input type="text" id="emailSubject" class="form-control"
                                                       placeholder="Subject">
                                                <label for="emailSubject">Subject</label>
                                            </div>
                                            <div class="form-label-group">
                                                <input type="text" id="emailCC" class="form-control" placeholder="CC">
                                                <label for="emailCC">CC</label>
                                            </div>
                                            <div class="form-label-group">
                                                <input type="text" id="emailBCC" class="form-control" placeholder="BCC">
                                                <label for="emailBCC">BCC</label>
                                            </div>
                                            <!-- Compose mail Quill editor -->
                                            <div class="snow-container border rounded p-50">
                                                <div class="compose-editor mx-75 ql-container ql-snow">
                                                    <div class="ql-editor ql-blank" data-gramm="false"
                                                         data-placeholder="Type something....." contenteditable="true">
                                                        <p><br></p>
                                                    </div>
                                                    <div class="ql-clipboard" tabindex="-1"
                                                         contenteditable="true"></div>
                                                    <div class="ql-tooltip ql-hidden"><a class="ql-preview"
                                                                                         target="_blank"
                                                                                         href="about:blank"></a><input
                                                            type="text" data-formula="e=mc^2"
                                                            data-link="https://quilljs.com" data-video="Embed URL"><a
                                                            class="ql-action"></a><a class="ql-remove"></a></div>
                                                </div>
                                                <div class="d-flex justify-content-end">
                                                    <div class="compose-quill-toolbar pb-0 ql-toolbar ql-snow">
                                                <span class="ql-formats mr-0">
                                                    <button class="ql-bold" type="button"><svg viewBox="0 0 18 18">
                                                            <path class="ql-stroke"
                                                                  d="M5,4H9.5A2.5,2.5,0,0,1,12,6.5v0A2.5,2.5,0,0,1,9.5,9H5A0,0,0,0,1,5,9V4A0,0,0,0,1,5,4Z">
                                                            </path>
                                                            <path class="ql-stroke"
                                                                  d="M5,9h5.5A2.5,2.5,0,0,1,13,11.5v0A2.5,2.5,0,0,1,10.5,14H5a0,0,0,0,1,0,0V9A0,0,0,0,1,5,9Z">
                                                            </path>
                                                        </svg></button>
                                                    <button class="ql-italic" type="button"><svg viewBox="0 0 18 18">
                                                            <line class="ql-stroke" x1="7" x2="13" y1="4" y2="4"></line>
                                                            <line class="ql-stroke" x1="5" x2="11" y1="14" y2="14">
                                                            </line>
                                                            <line class="ql-stroke" x1="8" x2="10" y1="14" y2="4">
                                                            </line>
                                                        </svg></button>
                                                    <button class="ql-underline" type="button"><svg viewBox="0 0 18 18">
                                                            <path class="ql-stroke"
                                                                  d="M5,3V9a4.012,4.012,0,0,0,4,4H9a4.012,4.012,0,0,0,4-4V3">
                                                            </path>
                                                            <rect class="ql-fill" height="1" rx="0.5" ry="0.5"
                                                                  width="12" x="3" y="15"></rect>
                                                        </svg></button>
                                                    <button class="ql-link" type="button"><svg viewBox="0 0 18 18">
                                                            <line class="ql-stroke" x1="7" x2="11" y1="7" y2="11">
                                                            </line>
                                                            <path class="ql-even ql-stroke"
                                                                  d="M8.9,4.577a3.476,3.476,0,0,1,.36,4.679A3.476,3.476,0,0,1,4.577,8.9C3.185,7.5,2.035,6.4,4.217,4.217S7.5,3.185,8.9,4.577Z">
                                                            </path>
                                                            <path class="ql-even ql-stroke"
                                                                  d="M13.423,9.1a3.476,3.476,0,0,0-4.679-.36,3.476,3.476,0,0,0,.36,4.679c1.392,1.392,2.5,2.542,4.679.36S14.815,10.5,13.423,9.1Z">
                                                            </path>
                                                        </svg></button>
                                                    <button class="ql-image" type="button"><svg viewBox="0 0 18 18">
                                                            <rect class="ql-stroke" height="10" width="12" x="3" y="4">
                                                            </rect>
                                                            <circle class="ql-fill" cx="6" cy="7" r="1"></circle>
                                                            <polyline class="ql-even ql-fill"
                                                                      points="5 12 5 11 7 9 8 10 11 7 13 9 13 12 5 12">
                                                            </polyline>
                                                        </svg></button>
                                                </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group mt-2">
                                                <div class="custom-file">
                                                    <input type="file" class="custom-file-input" id="emailAttach">
                                                    <label class="custom-file-label" for="emailAttach">Attach
                                                        File</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-end pt-0">
                                        <button type="reset" class="btn btn-light-secondary cancel-btn mr-1">
                                            <i class="bx bx-x me-3"></i>
                                            <span class="d-sm-inline d-none">Cancel</span>
                                        </button>
                                        <button type="submit" class="btn-send btn btn-primary">
                                            <i class="bx bx-send me-3"></i> <span class="d-sm-inline d-none">Send</span>
                                        </button>
                                    </div>
                                </form>
                                <!-- form start end-->
                            </div>
                            <div class="ps__rail-x" style="left: 0px; bottom: 0px;">
                                <div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div>
                            </div>
                            <div class="ps__rail-y" style="top: 0px; right: 0px;">
                                <div class="ps__thumb-y" tabindex="0" style="top: 0px; height: 0px;"></div>
                            </div>
                        </div>
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
                                                <a href="/admin/get/chat" role="button">
                                                <li class="media mail-read">
                                                    <div class="user-action">
                                                        <div class="checkbox-con me-3">
                                                            <div class="checkbox checkbox-shadow checkbox-sm">
                                                                <input type="checkbox" id="checkboxsmall1"
                                                                       class='form-check-input'>
                                                                <label for="checkboxsmall1"></label>
                                                            </div>
                                                        </div>
                                                        <span class="favorite text-warning">
                                                    <svg class="bi" width="1.5em" height="1.5em" fill="currentColor">
                                                        <use
                                                                xlink:href="/static/assets/vendors/bootstrap-icons/bootstrap-icons.svg#star-fill"/>
                                                    </svg>
                                                </span>
                                                    </div>
                                                    <div class="pr-50">
                                                        <div class="avatar">
                                                            <img src="/static/assets/images/faces/1.jpg"
                                                                 alt="avtar img holder">
                                                        </div>
                                                    </div>
                                                    <div class="media-body">
                                                        <div class="user-details">
                                                            <div class="mail-items">
                                                        <span class="list-group-item-text text-truncate">Open source
                                                            project public release 👍</span>
                                                            </div>
                                                            <div class="mail-meta-item">
                                                        <span class="float-right">
                                                            <span class="mail-date">4:14 AM</span>
                                                        </span>
                                                            </div>
                                                        </div>
                                                        <div class="mail-message">
                                                            <p class="list-group-item-text truncate mb-0">
                                                                Hey John, bah kivu decrete epanorthotic unnotched
                                                                Argyroneta nonius veratrine preimaginary
                                                            </p>
                                                            <div class="mail-meta-item">
                                                        <span class="float-right">
                                                            <span class="bullet bullet-success bullet-sm"></span>
                                                        </span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                </a>
                                                <li class="media mail-read">
                                                    <div class="user-action">
                                                        <div class="checkbox-con me-3">
                                                            <div class="checkbox checkbox-shadow checkbox-sm">
                                                                <input type="checkbox" id="checkboxsmall2"
                                                                       class='form-check-input'>
                                                                <label for="checkboxsmall2"></label>
                                                            </div>
                                                        </div>
                                                        <span class="favorite">
                                                    <svg class="bi" width="1.5em" height="1.5em" fill="currentColor">
                                                        <use
                                                                xlink:href="/static/assets/vendors/bootstrap-icons/bootstrap-icons.svg#star"/>
                                                    </svg>
                                                </span>
                                                    </div>
                                                    <div class="pr-50">
                                                        <div class="avatar">
                                                            <img class="rounded-circle"
                                                                 src="/static/assets/images/faces/3.jpg"
                                                                 alt="Generic placeholder image">
                                                        </div>
                                                    </div>
                                                    <div class="media-body">
                                                        <div class="user-details">
                                                            <div class="mail-items">
                                                        <span class="list-group-item-text text-truncate">Ecommerce
                                                            website Paypal integration 😃</span>
                                                            </div>
                                                            <div class="mail-meta-item">
                                                        <span class="float-right">
                                                            <span class="mail-date">2:15 AM</span>
                                                        </span>
                                                            </div>
                                                        </div>
                                                        <div class="mail-message">
                                                            <p class="list-group-item-text mb-0 truncate">
                                                                We will start the new application development soon once
                                                                this will be completed.
                                                            </p>
                                                            <div class="mail-meta-item">
                                                        <span class="float-right">
                                                            <span class="bullet bullet-danger bullet-sm"></span>
                                                        </span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="media">
                                                    <div class="user-action">
                                                        <div class="checkbox-con me-3">
                                                            <div class="checkbox checkbox-shadow checkbox-sm">
                                                                <input type="checkbox" id="checkboxsmall3"
                                                                       class='form-check-input'>
                                                                <label for="checkboxsmall3"></label>
                                                            </div>
                                                        </div>
                                                        <span class="favorite">

                                                    <svg class="bi" width="1.5em" height="1.5em" fill="currentColor">
                                                        <use
                                                                xlink:href="/static/assets/vendors/bootstrap-icons/bootstrap-icons.svg#star"/>
                                                    </svg>
                                                </span>
                                                    </div>
                                                    <div class="pr-50">
                                                        <div class="avatar">
                                                            <img class="rounded-circle"
                                                                 src="/static/assets/images/faces/7.jpg"
                                                                 alt="Generic placeholder image">
                                                        </div>
                                                    </div>
                                                    <div class="media-body">
                                                        <div class="user-details">
                                                            <div class="mail-items">
                                                        <span class="list-group-item-text text-truncate">How To Set
                                                            Intentions That Energize You</span>
                                                            </div>
                                                            <div class="mail-meta-item">
                                                        <span class="float-right">
                                                            <span class="mail-date">2:15 AM</span>
                                                        </span>
                                                            </div>
                                                        </div>
                                                        <div class="mail-message">
                                                            <p class="list-group-item-text mb-0 truncate">
                                                                I will provide you more details after this Saturday.
                                                                Hope
                                                                that will be fine for you..
                                                            </p>
                                                            <div class="mail-meta-item">
                                                        <span class="float-right d-flex align-items-center">
                                                            <i class="bx bx-paperclip me-3"></i>
                                                            <span class="bullet bullet-success bullet-sm"></span>
                                                        </span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="media">
                                                    <div class="user-action">
                                                        <div class="checkbox-con me-3">
                                                            <div class="checkbox checkbox-shadow checkbox-sm">
                                                                <input type="checkbox" id="checkboxsmall4"
                                                                       class='form-check-input'>
                                                                <label for="checkboxsmall4"></label>
                                                            </div>
                                                        </div>
                                                        <span class="favorite">

                                                    <svg class="bi" width="1.5em" height="1.5em" fill="currentColor">
                                                        <use
                                                                xlink:href="/static/assets/vendors/bootstrap-icons/bootstrap-icons.svg#star"/>
                                                    </svg>
                                                </span>
                                                    </div>
                                                    <div class="pr-50">
                                                        <div class="avatar">
                                                            <img class="rounded-circle"
                                                                 src="/static/assets/images/faces/5.jpg"
                                                                 alt="Generic placeholder image">
                                                        </div>
                                                    </div>
                                                    <div class="media-body">
                                                        <div class="user-details">
                                                            <div class="mail-items">
                                                        <span class="list-group-item-text text-truncate">Harness The
                                                            Power Of Words In Your Life</span>
                                                            </div>
                                                            <div class="mail-meta-item">
                                                        <span class="float-right">
                                                            <span class="mail-date">Yesterday</span>
                                                        </span>
                                                            </div>
                                                        </div>
                                                        <div class="mail-message">
                                                            <p class="list-group-item-text text-truncate mb-0">
                                                                When the equation, first to ability the forwards, the a
                                                                but
                                                                travelling, outlines sentinels
                                                                bad expand to goodness....
                                                            </p>
                                                            <div class="mail-meta-item">
                                                        <span class="float-right d-flex align-items-center">
                                                            <i class="bx bx-paperclip me-3"></i>
                                                            <span class="bullet bullet-warning bullet-sm"></span>
                                                        </span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="media mail-read">
                                                    <div class="user-action">
                                                        <div class="checkbox-con me-3">
                                                            <div class="checkbox checkbox-shadow checkbox-sm">
                                                                <input type="checkbox" id="checkboxsmall5"
                                                                       class='form-check-input'>
                                                                <label for="checkboxsmall5"></label>
                                                            </div>
                                                        </div>
                                                        <span class="favorite">

                                                    <svg class="bi" width="1.5em" height="1.5em" fill="currentColor">
                                                        <use
                                                                xlink:href="/static/assets/vendors/bootstrap-icons/bootstrap-icons.svg#star"/>
                                                    </svg>
                                                </span>
                                                    </div>
                                                    <div class="pr-50">
                                                        <div class="avatar">
                                                            <img class="rounded-circle"
                                                                 src="/static/assets/images/faces/3.jpg"
                                                                 alt="Generic placeholder image">
                                                        </div>
                                                    </div>
                                                    <div class="media-body">
                                                        <div class="user-details">
                                                            <div class="mail-items">
                                                        <span class="list-group-item-text text-truncate mb-0">Helen
                                                            Keller A Teller And A Seller</span>
                                                            </div>
                                                            <div class="mail-meta-item">
                                                        <span class="float-right">
                                                            <span class="mail-date">15 July</span>
                                                        </span>
                                                            </div>
                                                        </div>
                                                        <div class="mail-message">
                                                            <p class="list-group-item-text mb-0 truncate">
                                                                Thanks for your feedback ! Here's a new layout for a new
                                                                Modern
                                                                Admin theme.
                                                            </p>
                                                            <div class="mail-meta-item">
                                                        <span class="float-right d-flex align-items-center">
                                                            <i class="bx bx-paperclip me-3"></i>
                                                            <span class="bullet bullet-warning bullet-sm"></span>
                                                        </span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="media mail-read">
                                                    <div class="user-action">
                                                        <div class="checkbox-con me-3">
                                                            <div class="checkbox checkbox-shadow checkbox-sm">
                                                                <input type="checkbox" id="checkboxsmall6"
                                                                       class='form-check-input'>
                                                                <label for="checkboxsmall6"></label>
                                                            </div>
                                                        </div>
                                                        <span class="favorite text-warning">
                                                    <svg class="bi" width="1.5em" height="1.5em" fill="currentColor">
                                                        <use
                                                                xlink:href="/static/assets/vendors/bootstrap-icons/bootstrap-icons.svg#star-fill"/>
                                                    </svg>
                                                </span>
                                                    </div>
                                                    <div class="pr-50">
                                                        <div class="avatar">
                                                            <img class="rounded-circle"
                                                                 src="/static/assets/images/faces/8.jpg"
                                                                 alt="Generic placeholder image">
                                                        </div>
                                                    </div>
                                                    <div class="media-body">
                                                        <div class="user-details">
                                                            <div class="mail-items">
                                                        <span class="list-group-item-text text-truncate mb-0">
                                                            Use Your Reset Button To Change Your Vibration 🎉
                                                        </span>
                                                            </div>
                                                            <div class="mail-meta-item">
                                                        <span class="float-right">
                                                            <span class="mail-date">12-07-2019</span>
                                                        </span>
                                                            </div>
                                                        </div>
                                                        <div class="mail-message">
                                                            <p class="list-group-item-text mb-0 truncate">
                                                                Hey John, bah kivu decrete epanorthotic unnotched
                                                                Argyroneta nonius veratrine preimaginary.</p>
                                                            <div class="mail-meta-item">
                                                        <span class="float-right">
                                                            <span class="bullet bullet-info bullet-sm"></span>
                                                        </span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="media">
                                                    <div class="user-action">
                                                        <div class="checkbox-con me-3">
                                                            <div class="checkbox checkbox-shadow checkbox-sm">
                                                                <input type="checkbox" id="checkboxsmall7"
                                                                       class='form-check-input'>
                                                                <label for="checkboxsmall7"></label>
                                                            </div>
                                                        </div>
                                                        <span class="favorite text-warning">
                                                    <svg class="bi" width="1.5em" height="1.5em" fill="currentColor">
                                                        <use
                                                                xlink:href="/static/assets/vendors/bootstrap-icons/bootstrap-icons.svg#star-fill"/>
                                                    </svg>
                                                </span>
                                                    </div>
                                                    <div class="pr-50">
                                                        <div class="avatar">
                                                            <img class="rounded-circle"
                                                                 src="/static/assets/images/faces/5.jpg"
                                                                 alt="Generic placeholder image">
                                                        </div>
                                                    </div>
                                                    <div class="media-body">
                                                        <div class="user-details">
                                                            <div class="mail-items">
                                                        <span class="list-group-item-text text-truncate mb-0">Harness
                                                            The Power Of Words In Your Life</span>
                                                            </div>
                                                            <div class="mail-meta-item">
                                                        <span class="float-right">
                                                            <span class="mail-date">03-29-2019</span>
                                                        </span>
                                                            </div>
                                                        </div>
                                                        <div class="mail-message">
                                                            <p class="list-group-item-text mb-0 truncate">
                                                                Hope your like it, or feel free to comment, feedback or
                                                                rebound
                                                                !
                                                            </p>
                                                            <div class="mail-meta-item">
                                                        <span class="float-right">
                                                            <span class="bullet bullet-success bullet-sm"></span>
                                                        </span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="media mail-read">
                                                    <div class="user-action">
                                                        <div class="checkbox-con me-3">
                                                            <div class="checkbox checkbox-shadow checkbox-sm">
                                                                <input type="checkbox" id="checkboxsmall8"
                                                                       class='form-check-input'>
                                                                <label for="checkboxsmall8"></label>
                                                            </div>
                                                        </div>
                                                        <span class="favorite">

                                                    <svg class="bi" width="1.5em" height="1.5em" fill="currentColor">
                                                        <use
                                                                xlink:href="/static/assets/vendors/bootstrap-icons/bootstrap-icons.svg#star"/>
                                                    </svg>
                                                </span>
                                                    </div>
                                                    <div class="pr-50">
                                                        <div class="avatar">
                                                            <img class="rounded-circle"
                                                                 src="/static/assets/images/faces/8.jpg"
                                                                 alt="Generic placeholder image">
                                                        </div>
                                                    </div>
                                                    <div class="media-body">
                                                        <div class="user-details">
                                                            <div class="mail-items">
                                                        <span class="list-group-item-text text-truncate mb-0">Hypnosis
                                                            12 Steps To Acquire Mind Power</span>
                                                            </div>
                                                            <div class="mail-meta-item">
                                                        <span class="float-right">
                                                            <span class="mail-date">19 Jun</span>
                                                        </span>
                                                            </div>
                                                        </div>
                                                        <div class="mail-message">
                                                            <p class="list-group-item-text mb-0 truncate">
                                                                Monstrous with geared from far and these, morals, phase
                                                                rome;
                                                                Class. Called get amidst of geared from
                                                                next...
                                                            </p>
                                                            <div class="mail-meta-item">
                                                        <span class="float-right">
                                                            <span class="bullet bullet-danger bullet-sm"></span>
                                                        </span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="media mail-read">
                                                    <div class="user-action">
                                                        <div class="checkbox-con me-3">
                                                            <div class="checkbox checkbox-shadow checkbox-sm">
                                                                <input type="checkbox" id="checkboxsmall9"
                                                                       class='form-check-input'>
                                                                <label for="checkboxsmall9"></label>
                                                            </div>
                                                        </div>
                                                        <span class="favorite">

                                                    <svg class="bi" width="1.5em" height="1.5em" fill="currentColor">
                                                        <use
                                                                xlink:href="/static/assets/vendors/bootstrap-icons/bootstrap-icons.svg#star"/>
                                                    </svg>
                                                </span>
                                                    </div>
                                                    <div class="pr-50">
                                                        <div class="avatar">
                                                            <img class="rounded-circle"
                                                                 src="/static/assets/images/faces/6.jpg"
                                                                 alt="Generic placeholder image">
                                                        </div>
                                                    </div>
                                                    <div class="media-body">
                                                        <div class="user-details">
                                                            <div class="mail-items">
                                                        <span class="list-group-item-text text-truncate mb-0">How To
                                                            Stop Living Your Life On Autopilot</span>
                                                            </div>
                                                            <div class="mail-meta-item">
                                                        <span class="float-right">
                                                            <span class="mail-date">2 Jun</span>
                                                        </span>
                                                            </div>
                                                        </div>
                                                        <div class="mail-message">
                                                            <p class="list-group-item-text mb-0 truncate">
                                                                Thanks for your feedback ! Here's a new layout for a new
                                                                Modern Admin theme.
                                                            </p>
                                                            <div class="mail-meta-item">
                                                        <span class="float-right">
                                                            <span class="bullet bullet-info bullet-sm"></span>
                                                        </span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="media">
                                                    <div class="user-action">
                                                        <div class="checkbox-con me-3">
                                                            <div class="checkbox checkbox-shadow checkbox-sm">
                                                                <input type="checkbox" id="checkboxsmall10"
                                                                       class='form-check-input'>
                                                                <label for="checkboxsmall10"></label>
                                                            </div>
                                                        </div>
                                                        <span class="favorite">

                                                    <svg class="bi" width="1.5em" height="1.5em" fill="currentColor">
                                                        <use
                                                                xlink:href="/static/assets/vendors/bootstrap-icons/bootstrap-icons.svg#star"/>
                                                    </svg>
                                                </span>
                                                    </div>
                                                    <div class="pr-50">
                                                        <div class="avatar">
                                                            <img class="rounded-circle"
                                                                 src="/static/assets/images/faces/5.jpg"
                                                                 alt="Generic placeholder image">
                                                        </div>
                                                    </div>
                                                    <div class="media-body">
                                                        <div class="user-details">
                                                            <div class="mail-items">
                                                        <span class="list-group-item-text text-truncate mb-0">
                                                            Invest a few hours contributing to the software
                                                            you use and love. 🍕
                                                        </span>
                                                            </div>
                                                            <div class="mail-meta-item">
                                                        <span class="float-right">
                                                            <span class="mail-date">29 May</span>
                                                        </span>
                                                            </div>
                                                        </div>
                                                        <div class="mail-message">
                                                            <p class="list-group-item-text mb-0 truncate">
                                                                Hope your like it, or feel free to comment, feedback or
                                                                rebound
                                                                !
                                                            </p>
                                                            <div class="mail-meta-item">
                                                        <span class="float-right">
                                                            <span class="bullet bullet-info bullet-sm"></span>
                                                        </span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="media">
                                                    <div class="user-action">
                                                        <div class="checkbox-con me-3">
                                                            <div class="checkbox checkbox-shadow checkbox-sm">
                                                                <input type="checkbox" id="checkboxsmall11"
                                                                       class='form-check-input'>
                                                                <label for="checkboxsmall11"></label>
                                                            </div>
                                                        </div>
                                                        <span class="favorite">

                                                    <svg class="bi" width="1.5em" height="1.5em" fill="currentColor">
                                                        <use
                                                                xlink:href="/static/assets/vendors/bootstrap-icons/bootstrap-icons.svg#star"/>
                                                    </svg>
                                                </span>
                                                    </div>
                                                    <div class="pr-50">
                                                        <div class="avatar">
                                                            <img class="rounded-circle"
                                                                 src="/static/assets/images/faces/1.jpg"
                                                                 alt="Generic placeholder image">
                                                        </div>
                                                    </div>
                                                    <div class="media-body">
                                                        <div class="user-details">
                                                            <div class="mail-items">
                                                        <span class="list-group-item-text text-truncate mb-0">Harness
                                                            The Power Of Words In Your Life</span>
                                                            </div>
                                                            <div class="mail-meta-item">
                                                        <span class="float-right">
                                                            <span class="mail-date">17 May</span>
                                                        </span>
                                                            </div>
                                                        </div>
                                                        <div class="mail-message">
                                                            <p class="list-group-item-text mb-0 truncate">
                                                                Hope your like it, or feel free to comment, feedback or
                                                                rebound
                                                                !.
                                                            </p>
                                                            <div class="mail-meta-item">
                                                        <span class="float-right">
                                                            <span class="bullet bullet-warning bullet-sm"></span>
                                                        </span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="media mail-read">
                                                    <div class="user-action">
                                                        <div class="checkbox-con me-3">
                                                            <div class="checkbox checkbox-shadow checkbox-sm">
                                                                <input type="checkbox" id="checkboxsmall12"
                                                                       class='form-check-input'>
                                                                <label for="checkboxsmall12"></label>
                                                            </div>
                                                        </div>
                                                        <span class="favorite">

                                                    <svg class="bi" width="1.5em" height="1.5em" fill="currentColor">
                                                        <use
                                                                xlink:href="/static/assets/vendors/bootstrap-icons/bootstrap-icons.svg#star"/>
                                                    </svg>
                                                </span>
                                                    </div>
                                                    <div class="pr-50">
                                                        <div class="avatar">
                                                            <img class="rounded-circle"
                                                                 src="/static/assets/images/faces/3.jpg"
                                                                 alt="Generic placeholder image">
                                                        </div>
                                                    </div>
                                                    <div class="media-body">
                                                        <div class="user-details">
                                                            <div class="mail-items">
                                                        <span class="list-group-item-text text-truncate mb-0"> Know
                                                            Yourself Your Inner Power </span>
                                                            </div>
                                                            <div class="mail-meta-item">
                                                        <span class="float-right">
                                                            <span class="mail-date">21 Mar</span>
                                                        </span>
                                                            </div>
                                                        </div>
                                                        <div class="mail-message">
                                                            <p class="list-group-item-text mb-0 truncate">
                                                                Hope your like it, or feel free to comment, feedback or
                                                                rebound
                                                                !
                                                            </p>
                                                            <div class="mail-meta-item">
                                                        <span class="float-right">
                                                            <span class="bullet bullet-warning bullet-sm"></span>
                                                        </span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>

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
