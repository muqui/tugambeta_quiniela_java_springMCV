<%-- 
    Document   : login
    Created on : 7/07/2017, 09:43:39 PM
    Author     : mq12
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%> 
<!DOCTYPE html>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="widht=device-widht, initial-scale=1, maximum-scala=1">
    <title>Responsive Login Form</title>




    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>

    <script type="text/javascript" 
    src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>








</head>

<tiles:insertDefinition name="indexTemplate">
    <tiles:putAttribute name="body">
        <link href='http://fonts.googleapis.com/css?family=Ubuntu:500' rel='stylesheet' type='text/css'>
        <div class="container">
        <div class="card card-container">
             <img id="profile-img" class="profile-img-card" src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" />
            <p id="profile-name" class="profile-name-card"></p>
            <form class="form-signin"  action="<c:url value='/login' />" method='POST' >
                <span id="reauth-email" class="reauth-email"></span>
                <input type="text" id="inputEmail" name="username" class="form-control" placeholder="Usuario" required autofocus>
                <input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password" required>
                <c:if test="${not empty error}">
                    <small id="passwordHelp" class="text-danger">
         ${error}
        </small>  
                
            </c:if>
            <c:if test="${not empty msg}">
                <div class="msg">${msg}</div>
            </c:if>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
               <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Sign in</button>
            </form><!-- /form -->
            <a href="/formulariorecuperarpassword" class="forgot-password">
                Olvidaste la contraseña?
            </a>
        </div><!-- /card-container -->
    </div><!-- /container -->

        





<!--

        <div class="link_mx">
            <a href="/estadisticas"  >Estadisticas liga MX</a>
        </div>
-->
        <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
        <script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js'></script>


    </tiles:putAttribute>
</tiles:insertDefinition>