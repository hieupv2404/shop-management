<%--
  Created by IntelliJ IDEA.
  User: Black Diamond
  Date: 07-Sep-21
  Time: 2:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->
</head>
<style>

    .page-header {
        position: relative;
    }

    .reviews {
        color: #555;
        font-weight: bold;
        margin: 10px auto 20px;
    }

    .notes {
        color: #999;
        font-size: 12px;
    }

    .media .media-object {
        max-width: 120px;
    }

    .media-body {
        position: relative;
    }

    .media-date {
        position: absolute;
        right: 25px;
        top: 25px;
    }

    .media-date li {
        padding: 0;
    }

    .media-date li:first-child:before {
        content: '';
    }

    .media-date li:before {
        content: '.';
        margin-left: -2px;
        margin-right: 2px;
    }

    .media-comment {
        margin-bottom: 20px;
    }

    .media-replied .media-heading {
        padding-left: 6px;
    }

    .btn-circle span {
        padding-right: 6px;
    }

    .tab-content {
        border: 1px solid #ddd;
        border-top: 0;
        border-bottom-right-radius: 4px;
        border-bottom-left-radius: 4px;
        margin-right: 100px;
    }

    input[type="file"] {
        z-index: 999;
        line-height: 0;
        font-size: 0;
        position: absolute;
        opacity: 0;
        filter: alpha(opacity=0);
        -ms-filter: "alpha(opacity=0)";
        margin: 0;
        padding: 0;
        left: 0;
    }

    .custom-input-file:hover .uploadPhoto {
        display: block;
    }
</style>
<body>
<div class="container">
    <div class="row">
        <c:forEach items="${reviewList}" var="review">
            <div class="tab-content" style="width: 1005px" id="review${review.id}">
                <ul class="media-list">
                    <li class="media">
                        <div class="media-body">
                            <div class="well well-lg">
                                <h4 class="media-heading text-uppercase reviews">${review.user.username} </h4>
                                <ul class="media-date text-uppercase reviews list-inline">
                                        <%--                                    <li class="dd">22</li>--%>
                                        <%--                                    <li class="mm">09</li>--%>
                                        <%--                                    <li class="aaaa">2014</li>--%>
                                    <li>${review.dateCreate}</li>
                                </ul>
                                <p class="media-comment">
                                        ${review.comment}
                                </p>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </c:forEach>
        <h3>${noComment}</h3>
    </div>
</div>
<c:if test="${endList==false}">
    <button><a href="/review/${productId}?pageIndex=${pageIndex+1}&lastPreviousReviewId=${lastReviewId}">Load more</a>
    </button>
</c:if>
</body>
<script>
    document.getElementById("review${lastPreviousReviewId}").scrollIntoView();
</script>
</html>
