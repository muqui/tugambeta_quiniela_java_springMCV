<%-- 
    Document   : admingrupoeditar
    Created on : 14/04/2017, 01:21:39 PM
    Author     : mq12
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

 
<tiles:insertDefinition name="templateadmingrupo">
    <tiles:putAttribute name="body">
 
       
  
          
  <div class="container">
            <div class=" card card-container">
                <p id="profile-name" class="profile-name-card">Editar: ${user}</p>
          <c:url var="update" value="/admingrupo/update" />
      <form:form method="POST" action="${update}"  modelAttribute="partido">
   <table  class="table footable">
    <tr>
        <td> ${partido.local}</td>
                 
         <td><form:input path="goleslocal"  type="number" value="${partido.goleslocal}"/></td>
    </tr>
    <tr>
         <td>${partido.visitante}</td>
         <td><form:input path="golesvisita"  type="number" value="${partido.golesvisita}"/></td>
    </tr>
   
    <tr>
        <td colspan="2">
            <input type="submit" class="btn btn-lg btn-primary btn-block btn-signin" value="Actualizar"/>
        </td>
    </tr>
</table>  
   <form:hidden path="idpartidos" value="${partido.idpartidos}" /> 
   
    <input type="hidden" name="${_csrf.parameterName}"
                   value="${_csrf.token}" />
</form:form>
        
        </div>
       </div>
       
 
    </tiles:putAttribute>
</tiles:insertDefinition>
