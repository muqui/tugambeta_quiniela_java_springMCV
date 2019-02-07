<%-- 
    Document   : admingrupoquinielas
    Created on : 14/04/2017, 11:37:25 AM
    Author     : mq12
--%>




<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>

<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">


<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>

<script type="text/javascript"  src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>

<script
src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<!--
<link href="<c:url value="/resources/css/estilo.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/normalize.css" />" rel="stylesheet">
-->
<script src="/resources/js/validar.js" type="text/javascript"></script>
<script src="/resources/js/dynamic_list_helper.js" type="text/javascript"></script> <%-- Para crear Quiniela --%>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">



<tiles:insertDefinition name="templateadmingrupo">
    <tiles:putAttribute name="body">
        <h3> quinielas</h3>

       
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
                    <c:forEach var="q" items="${quinielas}">  
                        <tr>  
                            <td>${q.idquiniela}</td>  
                            <td>${q.nombre}</td> 
                            <td>${q.fechaLimite}</td>  
                            <td>${q.paginaTipo}</td>  


                           
                            <td><a href="/admingrupo/actualquiniela?id=${q.idquiniela}">Actual</a></td>  
                            <td><a href="/admingrupo/editarquiniela?id=${q.idquiniela}">editar</a></td>  
                        </tr>  
                    </c:forEach>  
                </tbody>
            </table>  
    </tiles:putAttribute>
</tiles:insertDefinition>


