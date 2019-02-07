<%-- 
    Document   : admingrupocrearquiniela
    Created on : 13/04/2017, 09:31:50 PM
    Author     : mq12
--%>

<%-- 
    Document   : crear
    Created on : 4/11/2016, 11:36:19 AM
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
-->
<link href="<c:url value="/resources/css/normalize.css" />" rel="stylesheet">
<script src="/resources/js/validar.js" type="text/javascript"></script>
<script src="/resources/js/dynamic_list_helper.js" type="text/javascript"></script> <%-- Para crear Quiniela --%>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">



<tiles:insertDefinition name="templateadmingrupo">
    <tiles:putAttribute name="body">
        <script>
            $(document).ready(function () {
                $("#personListForm").validate(
                        {
                            rules: {
                                nombre: {
                                    required: true,
                                    minlength: 5
                                },
                                fechaTemporal: {
                                    required: true,
                                    minlength: 3

                                },
                                email: {
                                    required: true,
                                    email: true
                                },
                                password: {
                                    required: true,
                                    minlength: 8
                                },
                                passwordConfirm: {
                                    required: true,
                                    minlength: 8,
                                    equalTo: "#password"
                                }
                            },
                            messages: {
                                nombre: {
                                    required: "Nombre es requerido",
                                    minlength: "Capture al menos 6 caracteres",
                                    remote: "Nombre de usuario ya existe!"
                                },
                                fechaTemporal: {
                                    required: "Fecha limite es requerido",
                                    minlength: "Capture al menos 6 caracteres"
                                },
                                password: {
                                    required: "Contraseña es requerido",
                                    minlength: "Capture al menos 8 caracteres"
                                },
                                passwordConfirm: {
                                    required: "Confirmacion de contraseña es requerido",
                                    minlength: "Capture al menos 8 caracteres"

                                }
                            },
                            highlight: function (element) {
                                $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
                            },
                            unhighlight: function (element) {
                                $(element).closest('.form-group').removeClass('has-error').addClass('has-success');
                            }

                        }


                );

            });


        </script>



        <div class="container">
            <div class=" card ">
                <p id="profile-name" class="profile-name-card">Crear Quiniela!</p>
                <c:url var="crearQ" value="${cp}/admingrupo/editpersonlistcontainer" />
                <form:form class="form-signin"  action="${crearQ}" modelAttribute="partidoLista" method="post" id="personListForm">


                    <label for="nombre" >Nombre:</label> 
                    <form:input path="nombre"  id="nombre"  class="form-control"  />
                    <form:errors path="nombre" /> 



                    <label for="fechaTemporal" >fecha limite:</label>
                    <form:input path="fechaTemporal" type="datetime-local"  id="fechaTemporal" class="form-control"   />
                    <form:errors path="fechaTemporal" />



                    <input id="id" name="pagina.nombre" type="hidden" value="${user}"/>
                    <table id="crearquiniela" class="table">
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
                                    <td><form:input path="partidoses[${i.index}].local" id="local${i.index}"  placeholder="Local" class="form-control" /></td>
                                    <td><form:input path="partidoses[${i.index}].visitante" id="visitante${i.index}"   placeholder="Visita" class="form-control"  /></td>
                                    <%--
                                    <td><input type="text" name="personList[].name" value="${Person.name}" /></td>
                                    <td><input type="text" name="personList[].age" value="${Person.age}" /></td>
                                    --%>
                                    <td><a href="#" class="removePerson btn btn-danger">Quitar partido</a></td>
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
                    
                          <a href="#" class="btn btn btn-lg btn-primary btn-block btn-signin" id="addPerson">agregar partido</a>
                           <a href="?f=" class="btn btn-lg btn-primary btn-block btn-signin">Limpiar lista</a>
                        <input type="submit" value="Crear Quiniela" id="submit"  class="btn btn-lg btn-primary btn-block btn-signin" />
                   




                    <input type="hidden" name="${_csrf.parameterName}"
                           value="${_csrf.token}" />

                </form:form>   
            </div>
        </div>
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


    </tiles:putAttribute>
</tiles:insertDefinition>

