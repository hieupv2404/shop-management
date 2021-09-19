<%--
  Created by IntelliJ IDEA.
  User: Black Diamond
  Date: 14-Sep-21
  Time: 5:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" isELIgnored="false" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Index</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

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

        function connect() {
            let socket = new SockJS('/ws');
            let href = "/topic/chat/" + "<%=session.getAttribute("sessionId")%>";
            stompClient = Stomp.over(socket);
            stompClient.connect({}, function (frame) {
                setConnected(true);
                console.log('Connected: ' + frame);
                stompClient.subscribe(href, function (greeting) {
                    if (sessionStorage.getItem("list")==null){
                        let list=[JSON.parse(greeting.body).id.toString()];
                        sessionStorage.setItem("list",JSON.stringify(list));
                    }
                    else {
                        let list = JSON.parse(sessionStorage.getItem("list"));
                        list.push(JSON.parse(greeting.body).id.toString());
                        sessionStorage.setItem("list",JSON.stringify(list));
                    }
                    sessionStorage.setItem(JSON.parse(greeting.body).id, greeting.body);
                    showGreeting(greeting.body);
                });
            });
        }

        function disconnect() {
            if (stompClient !== null) {
                stompClient.disconnect();
            }
            setConnected(false);
            console.log("Disconnected");
        }

        function sendName() {
            let href = "/app/say/admin/"+ "<%=session.getAttribute("sessionId")%>";
            console.log(href);
            stompClient.send(href, {}, JSON.stringify({
                'name': $("#name").val()
            }));
        }

        function showGreeting(message) {
            $("#greetings").append("<tr><td>" + JSON.parse(message).name + "</td></tr>");
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

        });
    </script>
</head>
<body>

<div id="main-content" class="container">
    <div class="row">
        <div class="col-md-6">
            <form class="form-inline">
                <div class="form-group">
                    <label for="connect">WebSocket connection:</label>
                    <button id="connect" class="btn btn-default" type="submit">Connect</button>
                    <button id="disconnect" class="btn btn-default" type="submit"
                            disabled="disabled">Disconnect
                    </button>
                </div>
            </form>
        </div>

    </div>
    <div class="row">
        <div class="col-md-6">
            <form class="form-inline">
                <div class="form-group">
                    <input type="text" id="name" class="form-control"
                           placeholder="Input...">
                </div>
                <button id="send" class="btn btn-default" type="submit">Send</button>
            </form>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table id="conversation" class="table table-striped">
                <thead>
                <tr>
                    <th>Messages</th>
                </tr>
                </thead>
                <tbody id="greetings">
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>
