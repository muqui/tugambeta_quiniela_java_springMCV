<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
    <title>Quiniela de futbol</title>
    <meta name="viewport" content="widht=device-widht, initial-scale=1, maximum-scala=1">
   
    <link rel='stylesheet prefetch' href='http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css'>
<!--
    <link href="<c:url value="/resources/css/Q2y3index.css" />" rel="stylesheet">  
-->
    <link href="<c:url value="/resources/css/footable.core.css" />" rel="stylesheet">  
    <script src="resources/js/Q2y3index.js"></script>  

</head>

<nav class="navbar navbar-full   color-azul ">
        <button class="navbar-toggler hidden-lg-up" type="button" data-toggle="collapse" data-target="#mainNavbarCollapse">
            &#9776;
        </button>

        <a class="navbar-brand" href="/"><img  src="/resources/images/logo2.png" ></a>
        <div class="collapse navbar-toggleable-md" id="mainNavbarCollapse">
        <ul class="nav navbar-nav pull-lg-right ">
            <li  class="nav-item active"><a class="nav-link fuente-verde" href="/admingrupo/crearquiniela">Crear quiniela</a></li>
            <li  class="nav-item active"><a class="nav-link fuente-verde" href="/admingrupo/resultados">Actualizar resultados</a></li>
            <li  class="nav-item active"><a class="nav-link fuente-verde" href="/admingrupo/eliminarparticipante">Eliminar participante </a></li>
            <li  class="nav-item active"><a class="nav-link fuente-verde" href="/admingrupo/quinielas">Editar Quiniela </a></li>

            <li  class="nav-item active"><a class="nav-link fuente-verde" href="/admingrupo">home </a></li>
            <li  class="nav-item active"><a class="nav-link fuente-verde"  <c:if test="${pageContext.request.userPrincipal.name != null}">href="javascript:formSubmit()"></c:if>Salir </a></li>
            </ul>
            </div>
        </nav>  



  
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

<P>
    Bienvenido  : ${pageContext.request.userPrincipal.name} 

</p>

<div id="patrocinador">

</div>