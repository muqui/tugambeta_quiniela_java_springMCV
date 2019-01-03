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
       

        <h1>Crear Quiniela!</h1>

        <div id = "formcrear" >
            <c:url var="crearQ" value="${cp}/admin/editpersonlistcontainer" />
            <form:form action="${crearQ}" modelAttribute="partidoLista" method="post" id="personListForm">

                <div id="campos1">
                    <div> <label for="nombre" >Nombre:</label> </div>
                    <div> <form:input path="nombre"  id="nombre"   /></div>
                    <div> <form:errors path="nombre" /> </div> 

                </div>
                <div id="campos1">
                    <div> <label for="fechaTemporal" >fecha limite:</label></div>
                    <div> <form:input path="fechaTemporal" type="datetime-local"  id="fechaTemporal"   /></div>
                    <div> <form:errors path="fechaTemporal" /></div>

                </div>


                <div id="campos1" >
                    <select name="paginaTipo">
                        <option value="q_ligamx" selected >Liga mx</option> 

                    </select> 
                </div>

                <input id="id" name="pagina.nombre" type="hidden" value="${user}"/>
                <table id="crearquiniela">
                    <thead>
                        <tr>
                            <th>Local</th>
                            <th>Visitante</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody id="personListContainer">
                        <c:forEach items="${partidoLista.partidoses}" var="partidoLista" varStatus="i" begin="0" >
                            <tr  class="person">    
                                <td><form:input path="partidoses[${i.index}].local" id="local${i.index}"  placeholder="Local" /></td>
                                <td><form:input path="partidoses[${i.index}].visitante" id="visitante${i.index}"   placeholder="Visita"/></td>
                                <%--
                                <td><input type="text" name="personList[].name" value="${Person.name}" /></td>
                                <td><input type="text" name="personList[].age" value="${Person.age}" /></td>
                                --%>
                                <td><a href="#" class="removePerson">Quitar partido</a></td>
                            </tr>
                        </c:forEach>
                        <%-- 
                            IMPORTANT 
                            There must always be one row.
                            This is to allow the JavaScript to clone the row.
                            If there is no row at all, it cannot possibly add a new row.
                        
                            If this 'default row' is undesirable 
                                remove it by adding the class 'defaultRow' to the row
                            I.e. in this case, class="person" represents the row.
                            Add the class 'defaultRow' to have the row removed.
                            This may seem weird but it's necessary because 
                            a row (at least one) must exist in order for the JS to be able clone it.
                            <tr class="person"> : The row will be present
                            <tr class="person defaultRow"> : The row will not be present
                        --%>
                        <c:if test="${personListContainer.personList.size() == 0}">
                            <tr class="person defaultRow">    
                                <td><input type="text" name="partidoses[].local" value="" /></td>
                                <td><input type="text" name="partidoses[].visitante" value="" /></td>

                                <td><a href="#" class="removePerson">Remove Person</a></td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
                <div id="botones">
                    <div>   <a href="#" id="addPerson">agregar partido</a>&nbsp;&nbsp;</div>
                    <div>   <a href="?f=">Limpiar lista</a></div>
                    <div> <input type="submit" value="Crear Quiniela" id="submit"  class="myButton" />&nbsp;&nbsp;</div>
                </div>




                <input type="hidden" name="${_csrf.parameterName}"
                       value="${_csrf.token}" />

            </form:form>  

           
            <script type="text/javascript">
                function rowAdded(rowElement) {
                    //clear the imput fields for the row
                    $(rowElement).find("input").val('');
                    //may want to reset <select> options etc

                    //in fact you may want to submit the form
                    saveNeeded();
                }
                function rowRemoved(rowElement) {
                    saveNeeded();

                }

                function saveNeeded() {
                    $('#submit').css('color', 'red');
                    $('#submit').css('font-weight', 'bold');
                    if ($('#submit').val().indexOf('!') != 0) {
                        $('#submit').val('!' + $('#submit').val());
                    }
                }

                function beforeSubmit() {

                    return true;
                }

                $(document).ready(function () {
                    var config = {
                        rowClass: 'person',
                        addRowId: 'addPerson',
                        removeRowClass: 'removePerson',
                        formId: 'personListForm',
                        rowContainerId: 'personListContainer',
                        indexedPropertyName: 'partidoses',
                        indexedPropertyMemberNames: 'local,visitante',
                        rowAddedListener: rowAdded,
                        rowRemovedListener: rowRemoved,
                        beforeSubmit: beforeSubmit
                    };
                    new DynamicListHelper(config);
                });
            </script>


        <p align="center">Editar quiniela - ${subpagina}</p>
    </tiles:putAttribute>
</tiles:insertDefinition>
