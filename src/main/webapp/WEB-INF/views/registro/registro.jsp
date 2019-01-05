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

                <p id="profile-name" class="profile-name-card">Registro</p>
                <c:url var="saveuser" value="/saveuser" />
                <form:form class="form-signin"  method="POST" action="${saveuser}" modelAttribute="user" id="adduser">
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
                                    required: "Contraseña es requerido",
                                    minlength: "Capture al menos 8 caracteres"
                                },
                                email: {
                                    required: "email es requerido",
                                    email: "capture email valido",
                                    remote: "e-mail no disponible!"
                                },
                                passwordConfirm: {
                                    required: "Confirmacion de contraseña es requerido",
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

    </tiles:putAttribute>
</tiles:insertDefinition>
