<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
   
    <meta name="viewport" content="widht=device-widht, initial-scale=1, maximum-scala=1">
    <link rel='stylesheet prefetch' href='http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css'>

    <title>Quiniela de futbol</title>

    <link href="<c:url value="/resources/css/Q2y3index.css" />" rel="stylesheet">  


    <link href="<c:url value="/resources/css/footable.core.css" />" rel="stylesheet">  
    <script src="resources/js/Q2y3index.js"></script>   

</head>


<!--Menú móviles-->
<div class="tm-header-mobile uk-hidden@m tm-header-transparent uk-position-relative uk-header" >
    <div class="uk-position-top">
        <div uk-sticky="bottom: true; animation: uk-animation-slide-top; sel-target: .uk-navbar-container; cls-active: uk-navbar-sticky; cls-inactive: uk-navbar-transparent uk-light; top: 400">
            <div class="uk-navbar-container uk-navbar-transparent uk-light">
                <div class="uk-container">
                    <nav class="uk-navbar-transparent uk-light uk-navbar" >
                        <div class="uk-navbar-left">
                            <a class="uk-navbar-toggle" uk-navbar-toggle-icon uk-toggle="target: #tm-mobile"></a>
                        </div>
                        <div class="uk-navbar-center">
                            <a class="uk-navbar-item uk-logo" href="/">
                                <img src="/resources/images/logo.png" class="uk-responsive-height" alt="tugambeta">
                            </a>
                        </div>
                        <div class="uk-navbar-right">
                              <ul class="uk-navbar-nav">
         <c:if test="${pageContext.request.userPrincipal.name == null}">            
                                    <li><a href="/entrar" uk-icon="icon: sign-in"></a></li>
                                    <li><a href="/registro" uk-icon="icon: user"></a></li>               
                                    </c:if>  


                                <c:if test="${role == 'ROLE_JUGADOR'}">
                                    <li><a  href="/quiniela/${pageContext.request.userPrincipal.name}">Mi grupo</a></li>                       
                                    </c:if>
                                    <c:if test="${role == 'ROLE_ADMIN'}">
                                    <li><a  href="/admin">Administrar</a></li>                       
                                    </c:if>
                                    <c:if test="${role == 'ROLE_ADMIN_GRUPO'}">
                                    <li><a  href="/admingrupo">Administrar</a></li>                       
                                    </c:if>
                                    <c:if test="${pageContext.request.userPrincipal.name != null}">            
                                    <li><a  href="javascript:formSubmit()" uk-icon="icon: sign-out"> </a></li>              
                                    </c:if>  
    </ul>
                        </div>
                    </nav>
                    <div id="tm-mobile" uk-offcanvas="flip: false; overlay: true">
                        <div class="uk-offcanvas-bar">
                            <button class="uk-offcanvas-close" type="button" uk-close></button>
                            <ul class="uk-nav uk-nav-primary">                                                            
                                <li><a href="#">Screenshot</a></li>
                                    <li><a href="/comojugar">¿Como jugar?</a></li>
                                    <!--
                                    <li><a href="/estadisticas">Estadisticas MX</a></li>
                                    -->
                            </ul>
                           
                        </div>  
                    </div> 
                </div>
            </div>
        </div>
    </div>
</div>
<!--Menú desktop-->
    <div class="tm-header uk-visible@m tm-header-transparent uk-position-relative" uk-header="">
        <div class="uk-position-top">
            <div uk-sticky="bottom: true; animation: uk-animation-slide-top; sel-target: .uk-navbar-container; cls-active: uk-navbar-sticky; cls-inactive: uk-navbar-transparent uk-light; top: 200" class="uk-sticky">
                <div class="uk-navbar-container uk-navbar-transparent uk-light">
                    <div class="uk-container">
                        <nav class="uk-navbar-transparent uk-light" uk-navbar>
                            
                                <div class="uk-navbar-left">
                                    <a class="uk-navbar-item uk-logo" href="/"><img  src="/resources/images/logo.png" class="uk-responsive-height"></a></li>
                                <ul class="uk-navbar-nav">    
                                <li><a href="#">Screenshot</a></li>
                                    <li><a href="/comojugar">¿Como jugar?</a></li>
                                    <!--
                                    <li><a href="/estadisticas">Estadisticas MX</a></li>
                                    -->
                                    </ul>
                                </div>
                                <div class="uk-navbar-center">

                                </div>
<div class="uk-navbar-right">
    <ul class="uk-navbar-nav">
         <c:if test="${pageContext.request.userPrincipal.name == null}">            
                                    <li><a href="/entrar">Entrar</a></li>
                                    <li><a href="/registro">Registro</a></li>               
                                    </c:if>  


                                <c:if test="${role == 'ROLE_JUGADOR'}">
                                    <li><a  href="/quiniela/${pageContext.request.userPrincipal.name}">Mi grupo</a></li>                       
                                    </c:if>
                                    <c:if test="${role == 'ROLE_ADMIN'}">
                                    <li><a  href="/admin">Administrar</a></li>                       
                                    </c:if>
                                    <c:if test="${role == 'ROLE_ADMIN_GRUPO'}">
                                    <li><a  href="/admingrupo">Administrar</a></li>                       
                                    </c:if>
                                    <c:if test="${pageContext.request.userPrincipal.name != null}">            
                                    <li><a  href="javascript:formSubmit()">Salir </a></li>              
                                    </c:if>  
    </ul>
</div>
                               
                            
                        </nav>
                    </div>
                </div>   
            </div>
        </div>
    </div>









<c:url value="/logout" var="logoutUrl" />
<form action="${logoutUrl}" method="post" id="logoutForm">
    <input type="hidden" name="${_csrf.parameterName}"
           value="${_csrf.token}" />
</form>
<script>
        function formSubmit() {
            document.getElementById("logoutForm").submit();
        }
</script>


