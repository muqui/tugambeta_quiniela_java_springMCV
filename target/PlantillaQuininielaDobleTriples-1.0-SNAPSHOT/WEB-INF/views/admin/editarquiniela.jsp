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
<script>
    $(document).ready(function () {
        $("#actquiniela").validate(
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
<tiles:insertDefinition name="templateadminadministrar">
    <tiles:putAttribute name="body">



        <div class="body">

            <c:url value="/admin/updatequiniela" var="updatequiniela" />
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
                              <select name="paginaTipo">
                        <option value="q_ligamx" selected >Liga mx</option> 
                                   
                    </select> 
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

        <p align="center">Editar quiniela - ${subpagina}</p>
    </tiles:putAttribute>
</tiles:insertDefinition>
