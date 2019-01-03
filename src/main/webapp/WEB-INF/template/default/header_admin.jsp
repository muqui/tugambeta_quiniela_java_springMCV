<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<header>

    <head>
     
        <!-- FIN Codigo se seguimiento-->
        <meta name="viewport" content="widht=device-widht, initial-scale=1, maximum-scala=1">
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <meta charset="UTF-8">    
        <meta name="viewport" content="widht=device-widht, initial-scale=1, maximum-scala=1">
        <link href="<c:url value="/resources/css/estilo.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/css/normalize.css" />" rel="stylesheet">
        <link href='https://fonts.googleapis.com/css?family=Candal' rel='stylesheet' type='text/css'>
        <link href="<c:url value="/resources/css/footable.core.css" />" rel="stylesheet">
        <script src="/js/modernizr-custom.js"></script>   
        <link href="<c:url value="/resources/css/estilo.css" />" rel="stylesheet">






        <script src="js/dynamic_list_helper.js" type="text/javascript"></script>
        <script src="resources/js/dynamic_list_helper.js" type="text/javascript"></script>
        <title>${userId}</title>

    </head>
    <input type="checkbox" id="btn-menu">
    <label for="btn-menu"><img src="/resources/images/menu.jpg"></label>
    <nav class="menu">
        <ul>

              <div class="logomenu">
                <a href="/"><img  src="/resources/images/logo.png" height="60px" width="160px"></a></li>


            </div>


            <li><a href="/admin">Crear Quiniela</a></li>
            <li><a href="/admin/quinielas">Quinielas </a></li>
             <li><a href="/admin/grupos">Grupos </a></li>
               <li><a href="/admin/formchangepassword">Cambiar contraseña </a></li>
               <li><a href="/admin/tabla">Tabla General</a></li> 
               <li><a href="/resultadosestadistica">Resultados</a></li>
            <li><a href="/admin">home </a></li>
            <li><a  <c:if test="${pageContext.request.userPrincipal.name != null}">href="javascript:formSubmit()"></c:if>Salir </a></li>
            </ul>
        </nav>  

  <div class="logoheader" >
        <a href="/"><img src="/resources/images/logo.png" height="50px" width="150px"></a>

    </header>
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