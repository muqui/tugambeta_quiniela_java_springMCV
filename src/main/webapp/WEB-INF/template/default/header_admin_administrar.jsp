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
    <input type="checkbox" id="btn-menu">
    <label for="btn-menu"><img src="/resources/images/menu.jpg"></label>
    <nav class="menu">
        <ul>




            <li><a href="/admin/resultados">Actualizar resultados</a></li>
            <li><a href="/admin/eliminarparticipante">Eliminar participante </a></li>

            <li><a href="/admin">home </a></li>
            <li><a  <c:if test="${pageContext.request.userPrincipal.name != null}">href="javascript:formSubmit()"></c:if>Salir </a></li>
            </ul>
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