<%-- 
    Document   : jugado
    Created on : 8/07/2017, 01:41:23 PM
    Author     : mq12
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
         <h2>Jugar -   ${userId}</h2>     
        <div class="body">         
  <c:set var="salary" scope="session" value="${vigente}"/>
    <c:if test="${salary == 1}">  
        <h3>El tiempo a expirado. No puedes Jugar</h3>
        <h3> Contacte a su webmaster. </h3>
    </c:if>
<c:if test="${salary == -1}">
     <div id = "jugar" >
        <h2>Gracias por jugar!!!</h2>
        <h2>Nombre: ${jugador.jugador}</h2>
        <h2>Codigo: ${jugador.codigo}</h2>
        <table  id="tableJugar" >
            <tr >
                <th >Resultado</th>
            </tr>
            <c:forEach items="${partidos}" var="partido" varStatus="status">
                <tr>
                    <td>${partido.local}</td>
                     <td>${partido.visitante}</td>
                      <td>${partido.resultado}</td>
                </tr>
            </c:forEach>
        </table>  
    </div>
    </c:if>       
        </div>    
        </tiles:putAttribute>
</tiles:insertDefinition>
