<%-- 
    Document   : listaQuinielas
    Created on : 15/04/2017, 05:20:24 PM
    Author     : mq12
--%>

<%-- 
    Document   : admin
    Created on : 12/04/2017, 01:22:22 PM
    Author     : mq12
--%>
<%-- 
    Document   : editarquiniela
    Created on : 13/04/2017, 07:28:03 PM
    Author     : mq12
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>

<script type="text/javascript"  src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>

<script
src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>

<link href="<c:url value="/resources/css/estilo.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/normalize.css" />" rel="stylesheet">
<script src="/resources/js/validar.js" type="text/javascript"></script>
<script src="/resources/js/dynamic_list_helper.js" type="text/javascript"></script> <%-- Para crear Quiniela --%>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>JSP Page</title>

<tiles:insertDefinition name="templateadmin">
    <tiles:putAttribute name="body">

        <a  <c:if test="${pageContext.request.userPrincipal.name != null}">href="javascript:formSubmit()"></c:if>Salir </a>
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
     

      
            <table class="table footable">  
                <thead>

                    <tr>
                        <td>ID.</td>
                        <td>Nombre</td> 
                        <td>Fecha</td>
                        <td>Grupo</td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </thead> 

                <tbody>
                    <c:forEach var="user" items="${quiniela}">  
                        <tr>  
                            <td>${user.idquiniela}</td>  
                            <td>${user.nombre}</td> 
                            <td>${user.fechaLimite}</td>  
                            <td>${user.paginaTipo}</td>  


                            <td><a href="/admin/administrarquiniela?id=${user.idquiniela}">Administrar</a></td>  
                            <td><a href="/admin/actualquiniela?id=${user.idquiniela}">Actual</a></td>  
                            <td><a href="/admin/editarquiniela?id=${user.idquiniela}">editar</a></td>  
                        </tr>  
                    </c:forEach>  
                </tbody>
            </table>  
     


 
    </tiles:putAttribute>
</tiles:insertDefinition>

