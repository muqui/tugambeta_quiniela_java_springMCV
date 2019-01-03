<%-- 
    Document   : login
    Created on : 7/07/2017, 09:43:39 PM
    Author     : mq12
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%> 
<!DOCTYPE html>
<head>
    <!-- Codigo se seguimiento -->
    <script>
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r;
            i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date();
            a = s.createElement(o),
                    m = s.getElementsByTagName(o)[0];
            a.async = 1;
            a.src = g;
            m.parentNode.insertBefore(a, m)
        })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');

        ga('create', 'UA-87354350-1', 'auto');
        ga('send', 'pageview');

    </script>
    <!-- FIN Codigo se seguimiento-->
    <meta charset="UTF-8">
    <meta name="viewport" content="widht=device-widht, initial-scale=1, maximum-scala=1">
    <title>Responsive Login Form</title>




    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>

    <script type="text/javascript" 
    src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>

    <script
    src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>







</head>

<tiles:insertDefinition name="indexTemplate">
    <tiles:putAttribute name="body">
        <link href='http://fonts.googleapis.com/css?family=Ubuntu:500' rel='stylesheet' type='text/css'>




        <div class="uk-section uk-section-primary uk-preserve-color uk-padding-small sect-listado-producto">
            <div class="uk-container">
                <div class="uk-flex uk-flex-middle uk-flex-center">
                    <div class="cont-loginn">
                        <div class="login-form">
                            <form  action="<c:url value='/login' />" method='POST'>
                                <div class="uk-grid-small" uk-grid>
                                    <div class="uk-width-1-1">
                                        <h3>usuario/grupo:*</h3>
                                        <input type="text"  name="username"  class="uk-width-1-1 uk-input" placeholder="usuario/grupo"/><br>
                                    </div>
                                    <div class="uk-width-1-1">
                                        <h3>contraseña:*</h3>
                                    <input type="password"  class="uk-width-1-1 uk-input" name="password" placeholder="contraseña"/>
                                    </div>
                                    
                                    
                                    <c:if test="${not empty error}">
                                        <div class="error">${error}</div>
                                    </c:if>
                                    <c:if test="${not empty msg}">
                                        <div class="msg">${msg}</div>
                                    </c:if>

                                    <input type="hidden" name="${_csrf.parameterName}"
                                           value="${_csrf.token}" />
                                    <input type="submit" value="Entrar" class="login-button"/>
                                    <br>
                                    <a href="/registro"class="sign-up">Registrate!</a>
                                    <br>
                                    <h6 class="no-access">  <a href="/formulariorecuperarpassword" >¿Olvidaste tu contraseña?</a></h6>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>    



        <div class="link_mx">
            <a href="/estadisticas"  >Estadisticas liga MX</a>
        </div>

        <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
        <script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js'></script>


    </tiles:putAttribute>
</tiles:insertDefinition>