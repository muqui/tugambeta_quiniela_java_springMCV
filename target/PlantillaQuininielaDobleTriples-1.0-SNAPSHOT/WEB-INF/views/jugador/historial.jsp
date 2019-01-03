<%-- 
    Document   : historial
    Created on : 8/11/2016, 11:15:38 AM
    Author     : mq12
--%>

<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
        <div class="body">
            <div class="uk-container">
                <div class="uk-flex uk-flex-middle uk-flex-center">
                    <div class="cont-participantes">
                         <h3>historial</h3>
       
      <c:url value="/quiniela/${userId}/jornada" var="jordana" />
        <form:form method="POST" action="${jordana}" modelAttribute="quiniela">
            <form:select path="idquiniela" id="selecthistorial" >
                
                 
                <c:forEach items="${quinielas}" var="quiniela" varStatus="status">
                     <c:choose>
            <c:when test="${quiniela.idquiniela eq historial}">
                <option value="${quiniela.idquiniela}" selected="true">${quiniela.nombre}</option>
            </c:when>
            <c:otherwise>
               <option value="${quiniela.idquiniela}">${quiniela.nombre}</option>
            </c:otherwise>
        </c:choose> 

                   



                </c:forEach>
            </form:select>
               <input type="submit" value="Ver" class="myButton" />
             <input type="hidden" name="${_csrf.parameterName}"
                   value="${_csrf.token}" />
        </form:form>
      <h3>  Nombre: ${nombrequiniela}</h3>
        <c:forEach items="${partidos}" var="partido" varStatus="status">  
               <c:if test="${partido.resultado != '-'}">
                
                 <div id="resultado">             
                    <img alt="" src="/resources/images/${partido.local}.png" height="30px" width="30px">
                   
                    <label for="">  ${partido.goleslocal} </label> -   <label for=""> ${partido.golesvisita}</label>

                   
                    <img alt="" src="/resources/images/${partido.visitante}.png" height="30px" width="30px"> 
                  
                  


                </div>    
         </c:if>
        

        </c:forEach> 
 
 <h1>Participantes</h1> 

        <table class="table footable">  
            <thead>

                <tr>
                    <th> No. </th> 
                    <c:forEach var="cate" items="${participantes[0]}"  varStatus="loop">

                        <c:choose>
                            <c:when test="${loop.index == 0}">
                                <th >  ${cate} </th> 
                                </c:when>
                                <c:when test="${fn:length(participantes[0]) == loop.index+1}">

                                <th > ${cate} </th> 
                                </c:when>
                                <c:otherwise>
                                <th  data-hide="phone,tablet" >  ${cate}</th> 
                                </c:otherwise>
                            </c:choose>


                    </c:forEach> 
                </tr>
            </thead> 
        </thead>
        <tbody>
            <c:forEach var="uri" items="${participantes}" varStatus="iterator"> 
           
                <tr>
                    <c:choose>
                        <c:when test="${fn:length(participantes)-1 > (iterator.index)}">
                            
                            <td >   ${iterator.index +1}</td>
                            </c:when>
                            <c:otherwise>
                            
                            </c:otherwise>
                        </c:choose>
                 
                    <c:forEach var="cate" items="${participantes[iterator.index+1]}"  varStatus="it">

                        <c:set var="title" scope="session" value="${ participantes[0][it.index]}"/>
                        <td  >  ${cate}  </td>
                    </c:forEach> 
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
     <P align="center"> Historial - ${userId} </p>
                    </div>
                </div>
            </div>
        </div>    
       
    </tiles:putAttribute>
    
</tiles:insertDefinition>

