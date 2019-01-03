<%-- 
    Document   : 403
    Created on : 12/07/2017, 07:40:27 PM
    Author     : mq12
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%> 
<meta name="viewport" content="widht=device-widht, initial-scale=1, maximum-scala=1">
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>

<script type="text/javascript" 
src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>

<script
src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<tiles:insertDefinition name="indexTemplate">
    <tiles:putAttribute name="body">
        <div id="indexLeft">

        </div>
        <div  id="indexCenter">
            <h1>HTTP Status 403 - Access is denied</h1>

            <c:choose>
                <c:when test="${empty username}">
                    <h2>You do not have permission to access this page!</h2>
                </c:when>
                <c:otherwise>
                    <h2>Usuario : ${username} <br/>No tienes permisos para acceder a esta página! </h2>
                    </c:otherwise>
                </c:choose>
            <a  class="myButton"<c:if test="${pageContext.request.userPrincipal.name != null}">href="javascript:formSubmit()"></c:if> Cerrar </a>
                <c:url value="/logout" var="logoutUrl" />
            <form action="${logoutUrl}" method="post" id="logoutForm">
                <input type="hidden" name="${_csrf.parameterName}"
                       value="${_csrf.token}" />
            </form>
        </div>
        <div  id="indexRight">

        </div>
        <script>
            function formSubmit() {
                document.getElementById("logoutForm").submit();
            }
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>