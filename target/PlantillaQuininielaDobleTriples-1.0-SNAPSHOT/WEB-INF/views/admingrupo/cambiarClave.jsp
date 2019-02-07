<%-- 
    Document   : cambiarClave
    Created on : 16/04/2017, 12:59:19 PM
    Author     : mq12
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@page session="true"%>
<!DOCTYPE html>

        <meta charset="UTF-8">
        <meta name="viewport" content="widht=device-widht, initial-scale=1, maximum-scala=1">
        <title>Responsive Login Form</title>


        <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>

        <script type="text/javascript" 
        src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>

        <script
        src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>

<tiles:insertDefinition name="indexadmingrupotemplate">
    <tiles:putAttribute name="body">
      

        <script>
            $(document).ready(function () {
                $("#adduser").validate(
                        {
                            rules: {
                               

                                password: {
                                    required: true,
                                    minlength: 5
                                }
                            },
                            messages: {
                               
                                password: {
                                    required: "Contraseña es requerido",
                                    minlength: "Capture al menos 5 caracteres"
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
    </head>
    <body>
           <div class="container">
            <div class="card card-container">
                <p id="profile-name" class="profile-name-card">Cambiar clave Grupo</p>
            
                <c:url var="creargrupo" value="/admingrupo/cambiarclave" />
                <form:form method="POST" class="form-signin" action="${creargrupo}" modelAttribute="user" id="adduser">

                    <p>Grupo:*</p>
                    <input type="text"  name="username"  value="${user.username}"  readonly   id="username" placeholder="Grupo" class="form-control"/><br>
                      
                    <p>Contraseña:*</p>
                    <input type="text"  name="password" id="password" placeholder="contraseña " class="form-control"/> <br>
                      
                     <input type="hidden" name="enabled" value="${user.enabled}">
                      <input type="hidden" name="email" value="x">

                    <input type="hidden" name="${_csrf.parameterName}"
                           value="${_csrf.token}" />
                    <input type="submit" value="Cambiar" class="btn btn-lg btn-primary btn-block btn-signin"/>


                </form:form>
                    
                              

            </div>
        </div>
    </tiles:putAttribute>
    </tiles:insertDefinition>