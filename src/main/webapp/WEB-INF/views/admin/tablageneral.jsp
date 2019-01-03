<%-- 
    Document   : tablageneral
    Created on : 13/07/2017, 03:48:46 PM
    Author     : mq12
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<tiles:insertDefinition name="templateadmin">
    <tiles:putAttribute name="body">

        <h1> Calcular tabla General</h1>

        <c:url value="/admin/calctablageneral" var="jordana" />
        <form:form method="POST" action="${jordana}" modelAttribute="liga">
             <form:select path="id" id="liga" >
                <c:forEach items="${ligas}" var="l" varStatus="status">
                    <option value="${l.id}" selected="true">${l.nombre}</option>
                </c:forEach>
            </form:select>
                    </br>
            <input type="submit" value="Generar" class="myButton" />
            <input type="hidden" name="${_csrf.parameterName}"
                   value="${_csrf.token}" />
        </form:form>
    </tiles:putAttribute>
</tiles:insertDefinition>