<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
  <head>
   
    <meta name="viewport" content="widht=device-widht, initial-scale=1, maximum-scala=1">
    <link rel='stylesheet prefetch' href='http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css'>

    <title>Quiniela de futbol</title>

    <link href="<c:url value="/resources/css/Q2y3index.css" />" rel="stylesheet">  


    <link href="<c:url value="/resources/css/footable.core.css" />" rel="stylesheet">  
    <script src="resources/js/Q2y3index.js"></script>   

</head>
        
 <nav class="navbar navbar-full navbar-dark navbar-fixed-top color-azul ">
	<button class="navbar-toggler hidden-lg-up" type="button" data-toggle="collapse" data-target="#mainNavbarCollapse">
	&#9776;
	</button>
	<a class="navbar-brand" href="/"><img  src="/resources/images/logo.png" ></a>
	<div class="collapse navbar-toggleable-md" id="mainNavbarCollapse">
		 <ul class="nav navbar-nav pull-lg-right">
                                  <li  class="nav-item"><a href="/quiniela/${userId}/historial">Historial</a></li>
            <li  class="nav-item"><a href="/quiniela/${userId}/participantes">Participantes</a></li>
            <li  class="nav-item"><a href="/quiniela/${userId}/jugar">Jugar</a></li>
             <li  class="nav-item"><a  <c:if test="${pageContext.request.userPrincipal.name != null}">href="javascript:formSubmit()"></c:if>Cerrar </a></li>
           <!--  <li><a href="/quiniela/${userId}/admin">Administrador</a></li> -->
            
                            </ul> 
	</div>
</nav>
    
    <!--Menú desktop-->
    <!--
   <div class="tm-header uk-visible@m tm-header-transparent uk-position-relative" uk-header="">
        <div class="uk-position-top">
            <div uk-sticky="bottom: true; animation: uk-animation-slide-top; sel-target: .uk-navbar-container; cls-active: uk-navbar-sticky; cls-inactive: uk-navbar-transparent uk-light; top: 200" class="uk-sticky">
                <div class="uk-navbar-container uk-navbar-transparent uk-light">
                    <div class="uk-container">
                        <nav class="uk-navbar-transparent uk-light" uk-navbar>
                            <div class="uk-navbar-left">
                                 <a class="uk-navbar-item uk-logo" href="/"><img  src="/resources/images/logo.png" class="uk-responsive-height"></a></li>
                            <ul class="uk-navbar-nav">
                                  <li><a href="/quiniela/${userId}/historial">Historial</a></li>
            <li><a href="/quiniela/${userId}/participantes">Participantes</a></li>
            <li><a href="/quiniela/${userId}/jugar">Jugar</a></li>
             <li><a  <c:if test="${pageContext.request.userPrincipal.name != null}">href="javascript:formSubmit()"></c:if>Cerrar </a></li>
           <!--  <li><a href="/quiniela/${userId}/admin">Administrador</a></li> -->
        <!--    
                            </ul> 
                            </div>
     
    </nav> 
                    </div>
                </div>
            </div>
        </div>
    </div>
     
  -->   
    

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
      <!--
		<P>
			Grupo  : ${pageContext.request.userPrincipal.name} 
				
		</p>
-->