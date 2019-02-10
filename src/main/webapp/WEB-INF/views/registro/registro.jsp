<%-- 
    Document   : index3
    Created on : 16/12/2016, 02:25:19 PM
    Author     : mq12
--%>

<%-- 
    Document   : index4
    Created on : 7/04/2017, 07:05:18 PM
    Author     : mq12
--%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html>









<tiles:insertDefinition name="indexTemplate">
    <tiles:putAttribute name="body">
        <link href='http://fonts.googleapis.com/css?family=Ubuntu:500' rel='stylesheet' type='text/css'>

        <div class="container">
            <div class="card card-container">
                <script src="resources/js/registro.js"></script>   
                <p id="profile-name" class="profile-name-card">Registro</p>
                <c:url var="saveuser" value="/saveuser" />
                
                <form:form class="form-signin"  method="POST" modelAttribute="user" id="adduser" name="adduser">
                    <input type="text"  name="username"   id="username" placeholder="nombre" class="form-control"/>
                    <input type="text"  name="email" id="email" placeholder="correo " class="form-control"/>
                    <input type="password"  name="password" id="password"  placeholder="Contraseña" class="form-control"/>
                    <input type="password"  name="passwordConfirm" id="passwordConfirm"  placeholder="confirmar Contraseña" class="form-control"/>
                    <input type="hidden" name="${_csrf.parameterName}"
                           value="${_csrf.token}" />
                    <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Registro</button>
                </form:form>
            </div>
        </div>



    </tiles:putAttribute>
</tiles:insertDefinition>
