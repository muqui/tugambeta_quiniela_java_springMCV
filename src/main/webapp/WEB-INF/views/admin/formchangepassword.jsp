<%-- 
    Document   : formchangepassword
    Created on : 17/04/2017, 10:57:46 AM
    Author     : mq12
--%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<link href="<c:url value="/resources/css/index.css" />" rel="stylesheet">
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
 <script>
            $(document).ready(function () {
                $("#adduser").validate(
                        {
                            rules: {
                                username: {
                                    required: true,
                                    minlength: 5,
                                    remote: {
                                        url: "/availableuser.html",
                                        type: "get",
                                        data: {
                                            username: function () {
                                                return $("#username").val();
                                            }
                                        }
                                    }
                                },
                              
                                email: {
                                    required: true,
                                    email: true,
                                    remote: {
                                        url: "/availableemail.html",
                                        type: "get",
                                        data: {
                                            username: function () {
                                                return $("#email").val();
                                            }
                                        }
                                    }
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
                                username: {
                                    required: "Nombre es requerido",
                                    minlength: "Capture al menos 6 caracteres",
                                    remote: "Nombre de usuario NO disponible!"
                                },
                              
                                password: {
                                    required: "Contraseņa es requerido",
                                    minlength: "Capture al menos 8 caracteres"
                                },
                                email: {
                                    required: "email es requerido",
                                    email: "capture email valido",
                                     remote: "e-mail no disponible!"
                                },
                                passwordConfirm: {
                                    required: "Confirmacion de contraseņa es requerido",
                                    minlength: "Capture al menos 8 caracteres",
                                    equalTo: "Capture el mismo valor"

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




        <div class="login">
            <div class="login-header">
                <h1>Cambiar contraseņa</h1>
            </div>
            <div class="login-form">
                <c:url var="creargrupo" value="/admin/changepassword" />
                <form:form method="POST" action="${creargrupo}" modelAttribute="user" id="adduser">


                    <h3>Contraseņa nueva*</h3>
                    <input type="password"  name="password"      id="password" placeholder="Grupo" cssClass="form-control"/><br>
                    <h3>Contraseņa confirmacion*</h3>
                    <input type="password"  name="passwordConfirm"      id="passwordConfirm" placeholder="Grupo" cssClass="form-control"/><br>

                    <input type="hidden" name="username" value="${user.username}">
                    <input type="hidden" name="email" value="${user.email}">
                    <input type="hidden" name="enabled" value="${user.enabled}">

                    <input type="hidden" name="${_csrf.parameterName}"
                           value="${_csrf.token}" />
                    <input type="submit" value="Cambiar" class="login-button"/>


                </form:form>



            </div>
        </div>

    </tiles:putAttribute>
</tiles:insertDefinition>
