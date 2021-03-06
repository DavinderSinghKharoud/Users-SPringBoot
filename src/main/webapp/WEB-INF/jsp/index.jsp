<!DOCTYPE html >
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="sat, 01 Dec 2001 00:00:00 GMT">
    <title>Users</title>
    <link href="webjars/bootstrap/3.3.6/css/bootstrap.min.css"
          rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->


</head>
<body>

<div role="navigation">
    <div class="navbar navbar-inverse">
        <a href="/index" class="navbar-brand">Home</a>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li><a href="/login">Login</a></li>
                <li><a href="/register">Register</a></li>
                <li><a href="/showUsers">All Users</a></li>
            </ul>
        </div>
    </div>
</div>
<c:choose>

    <c:when test="${mode=='AllUsers' }">
        <div class="container text-center" id="tasksDiv">
            <h3>All Users</h3>
            <hr>
            <div class="table-responsive">
                <table class="table table-striped table-bordered">
                    <thead>
                    <tr>
                        <th>Id</th>
                        <th>UserName</th>
                        <th>First Name</th>
                        <th>LastName</th>
                        <th>Age</th>
                        <th>Delete</th>
                        <th>Edit</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="user" items="${users }">
                        <tr>
                            <td>${user.id}</td>
                            <td>${user.username}</td>
                            <td>${user.firstname}</td>
                            <td>${user.lastname}</td>
                            <td>${user.age}</td>
                            <td><a href="/deleteUser?id=${user.id }"><span
                                    class="glyphicon glyphicon-trash"></span></a></td>
                            <td><a href="/editUser?id=${user.id }"><span
                                    class="glyphicon glyphicon-pencil"></span></a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </c:when>

    <c:when test="${mode == 'ModeHome'}">

        <div class="container" id="homediv">
            <div class="jumbotron text-center">
                <h1>Users</h1>
                <h3>SpringBoot</h3>
            </div>
        </div>

    </c:when>

    <c:when test="${mode=='ModeRegister' }">
        <div class="container text-center">
            <h3>New Registration</h3>
            <hr>
            <div id="error">
                <h4 id="errorsDisplay"></h4>
            </div>
            <form id="register" class="form-horizontal" method="POST" action="save_user">
                <input type="hidden" name="id" value="${user.id }"/>
                <div class="form-group">
                    <label class="control-label col-md-3">Username</label>
                    <div class="col-md-7">
                        <input id="name" type="text" class="form-control"  name="username"
                               value="${user.username }" required/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">First Name</label>
                    <div class="col-md-7">
                        <input type="text" class="form-control" id="firstName1" name="firstname"
                               value="${user.firstname } "required/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">Last Name</label>
                    <div class="col-md-7">
                        <input type="text" class="form-control" id="lastName1" name="lastname"
                               value="${user.lastname }" required/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">Age </label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" name="age"
                               value="${user.age }" required/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">Password</label>
                    <div class="col-md-7">
                        <input type="password" class="form-control" id="pass" name="password"
                               value="${user.password }" required/>
                    </div>
                </div>
                <div class="form-group ">
                    <input type="submit" class="btn btn-primary" value="Register"/>
                </div>
            </form>
        </div>
    </c:when>


    <c:when test="${mode=='ModeUpdate' }">
        <div class="container text-center">
            <h3>Update User</h3>
            <hr>
            <form class="form-horizontal" method="POST" action="save_user">
                <input type="hidden" name="id" value="${user.id }"/>
                <div class="form-group">
                    <label class="control-label col-md-3">Username</label>
                    <div class="col-md-7">
                        <input type="text" class="form-control" name="username"
                               value="${user.username }"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">First Name</label>
                    <div class="col-md-7">
                        <input type="text" class="form-control" name="firstname"
                               value="${user.firstname }"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">Last Name</label>
                    <div class="col-md-7">
                        <input type="text" class="form-control" name="lastname"
                               value="${user.lastname }"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">Age </label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" name="age"
                               value="${user.age }"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">Password</label>
                    <div class="col-md-7">
                        <input type="password" class="form-control" id="password" name="password"
                               value="${user.password }"/>
                    </div>
                </div>
                <div class="form-group ">
                    <input type="submit" class="btn btn-primary" value="Update"/>
                </div>
            </form>
        </div>
    </c:when>

    <c:when test="${mode=='ModeLogin' }">
        <div class="container text-center">
            <h3>Update User</h3>
            <hr>
            <form class="form-horizontal" method="POST" action="loginUser">
                <c:if test="${not empty error}">
                    <div class="alert alert-danger">
                        <c:out value="${error}"></c:out>
                    </div>
                </c:if>
                <div class="form-group">
                    <label class="control-label col-md-3">Username</label>
                    <div class="col-md-7">
                        <input type="text" class="form-control" name="username"
                               value="${user.username }"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">Password</label>
                    <div class="col-md-7">
                        <input type="password" class="form-control" name="password"
                               value="${user.password }"/>
                    </div>
                </div>

                <div class="form-group ">
                    <input type="submit" class="btn btn-primary" value="Login"/>
                </div>

            </form>
        </div>
    </c:when>

</c:choose>
<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
<script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<%--<div><script src="js/script.js"></script></div>--%>
<%--<script>const username = document.getElementById("name").value;--%>
<%--const pass = document.getElementById("pass").value;--%>


<%--const error = document.getElementById("errorsDisplay");--%>
<%--const form = document.getElementById("register");--%>


<%--form.addEventListener('submit', (e) => {--%>

<%--    let message = [];--%>
<%--    if (username.length < 6) {--%>
<%--        message.push("Username must be longer than 6 characters");--%>
<%--        console.log(message)--%>
<%--        console.log( username);--%>

<%--    }--%>
<%--    // if( pass.length < 6){--%>
<%--    //     message.push("Password must be longer than 6 characters");--%>
<%--    // }--%>
<%--    // if( pass.length>15){--%>
<%--    //     message.push("Password must be shorter than 15 characters");--%>
<%--    //--%>
<%--    // }--%>

<%--    if (message.length > 0) {--%>
<%--        e.preventDefault()--%>
<%--        error.innerText = message.join('\n');--%>
<%--        console.log("stop")--%>
<%--        console.log(message)--%>
<%--    }--%>


<%--})</script>--%>
</body>
</html>