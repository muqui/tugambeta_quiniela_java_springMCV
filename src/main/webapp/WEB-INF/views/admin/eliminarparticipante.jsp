<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%> 
 

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<tiles:insertDefinition name="templateadminadministrar">
    <tiles:putAttribute name="body">
 
        <h1> eliminar Participante: ${subpagina} </h1>
        <table class="table footable">  
            <thead>

                <tr>
                    <th >ID.</th>
                    <th >Nombre</th> 
                    <th  data-hide="phone,tablet">Codigo </th>
                    <th  data-hide="phone,tablet">Grupo </th>
                     <th  data-hide="phone,tablet">Eliminar</th>
                 
                </tr>
            </thead> 
        </thead>
        <tbody>
      <c:forEach var="jugador" items="${jugadores}">  
    <tr>  
     <td>${jugador.idjugar}</td>  
      <td>${jugador.jugador}</td> 
     <td >${jugador.codigo}</td>  
       <td >${jugador.users.username}</td>  
         
       <td><a href="/admin/eliminarjugador?id=${jugador.idjugar}">Eliminar</a></td>  
       
    </tr>  
   </c:forEach>  
 </tbody>
    </table>  
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/resources/js/footable.js"></script>
    <script type="text/javascript">
        $(function () {
            $('.footable').footable();
        });
    </script>
    </tiles:putAttribute>
</tiles:insertDefinition>
