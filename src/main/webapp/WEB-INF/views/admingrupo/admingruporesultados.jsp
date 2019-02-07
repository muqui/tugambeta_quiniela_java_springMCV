<%-- 
    Document   : admingruporesultados
    Created on : 14/04/2017, 12:55:46 PM
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
<link href="<c:url value="/resources/css/estilox.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/normalize.css" />" rel="stylesheet">
-->

<script src="/resources/js/validar.js" type="text/javascript"></script>
<script src="/resources/js/dynamic_list_helper.js" type="text/javascript"></script> <%-- Para crear Quiniela --%>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">



<tiles:insertDefinition name="templateadmingrupo">
    <tiles:putAttribute name="body">
        <div class="container">
            <div class=" card">
                <p id="profile-name" class="profile-name-card">resultados</p>

                <table class="table footable" >  
                    <tr id="HeadRow">
                        <th> Local</th> 
                        <th> G </th> 
                        <th> Visita</th> 
                        <th> G </th> 
                        <th> Act</th>
                    </tr>
                    <c:forEach items="${partidos}" var="partido" varStatus="status">
                        <tr>


                            <td tableHeadData='Local'>
                                <label for="${partido.local}">${partido.local}</label>                
                            </td>
                            <td tableHeadData='Goles Local'>
                                ${partido.goleslocal}  
                            </td>
                            <td tableHeadData='Visita'>
                                <label for="${partido.visitante}">${partido.visitante}</label>
                            </td>
                            <td tableHeadData='Goles Visita'>

                                ${partido.golesvisita}
                            </td>
                            <td tableHeadData='Actualizar'><a href="editar?id=${partido.idpartidos}">Actualizar</a></td>  
                        </tr>

                    </c:forEach>

                </table>  
                </div>
                </div>
            </tiles:putAttribute>
        </tiles:insertDefinition>


