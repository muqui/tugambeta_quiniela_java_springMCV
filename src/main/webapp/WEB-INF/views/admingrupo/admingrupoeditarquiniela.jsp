<%-- 
    Document   : admingrupoeditarquiniela
    Created on : 14/04/2017, 11:18:34 AM
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

<link href="<c:url value="/resources/css/estilo.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/normalize.css" />" rel="stylesheet">
<script src="/resources/js/validar.js" type="text/javascript"></script>
<script src="/resources/js/dynamic_list_helper.js" type="text/javascript"></script> <%-- Para crear Quiniela --%>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">



<tiles:insertDefinition name="templateadmingrupo">
    <tiles:putAttribute name="body">
        <h3>editar quiniela</h3>

       

        <div class="body">

            <c:url value="/admingrupo/updatequiniela" var="updatequiniela" />
            <div id = "actualizarSQ">
                <form:form method="POST" action="${updatequiniela}"  modelAttribute="quiniela" id="actquiniela">

                    <div class="actualizarQ">                       
                             <label for="idquiniela">ID:</label>
                        <div> 
                            <form:input path="idquiniela" readonly="true" disabled="true" value="${quiniela.idquiniela}" />
                        </div>
                    </div>
                    <div class="actualizarQ">                       
                             <label for="nombre" >Nombre:</label>                      
                        <div>                            
                            <form:input path="nombre"  value="${quiniela.nombre}"/>
                        </div>
                    </div>
                         <div class="actualizarQ">                       
                             <label for="nombre" >Nombre:</label>                      
                             
                    </div>
                        
                        
                        
                        
                    <div class="actualizarQ">
                             <label for="nombre" >Fecha Limite:</label>                     
                        <div> 
                           
                            <form:input type="datetime-local"  path="fechaTemporal"  value=""/>
                        </div>
                    </div>
                    <div class="actualizarQ">
                        <div><input type="submit" value="Submit" class="myButton"/></div>
                    </div>













                    <input type="hidden" name="idquiniela" value="${quiniela.idquiniela}">

                    <input type="hidden" name="${_csrf.parameterName}"
                           value="${_csrf.token}" />    

                </form:form>
            </div>

        </div>
    </tiles:putAttribute>
</tiles:insertDefinition>

