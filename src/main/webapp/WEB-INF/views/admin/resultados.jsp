<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

 
<tiles:insertDefinition name="templateadminadministrar">
    <tiles:putAttribute name="body">
 
        <h1> resultados: ${subpagina} </h1>
      
   
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
 
    </tiles:putAttribute>
</tiles:insertDefinition>
