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

    <head>
         <!-- Codigo se seguimiento -->
        <script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-87354350-1', 'auto');
  ga('send', 'pageview');

</script>
        <!-- FIN Codigo se seguimiento-->
        <meta charset="UTF-8">
        <meta name="viewport" content="widht=device-widht, initial-scale=1, maximum-scala=1">
        <title>Responsive Login Form</title>

       

        <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>

        <script type="text/javascript" 
        src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>

        <script
        src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>


        

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
    </head>

    <tiles:insertDefinition name="indexTemplate">
    <tiles:putAttribute name="body">
        <link href='http://fonts.googleapis.com/css?family=Ubuntu:500' rel='stylesheet' type='text/css'>
         
        <div class="login">
            <div class="login-header">
                <h1>Registro</h1>
            </div>
            <div class="login-form">
                <c:url var="saveuser" value="/saveuser" />
                <form:form method="POST" action="${saveuser}" modelAttribute="user" id="adduser">

                    <h3>Nombre*</h3>
                    <input type="text"  name="username"   id="username" placeholder="nombre" cssClass="form-control"/><br>
                    <h3>Correo:*</h3>
                    <input type="text"  name="email" id="email" placeholder="correo "/>
                    <br>

                   

                    <h3>Contraseña:*</h3>
                    <input type="password"  name="password" id="password"  placeholder="Contraseña"/><br>

                    <h3>Confirmacion de contraseña:*</h3>
                    <input type="password"  name="passwordConfirm" id="passwordConfirm"  placeholder="confirmar Contraseña"/><br>

                    <input type="hidden" name="${_csrf.parameterName}"
                           value="${_csrf.token}" />
                    <input type="submit" value="Registrar" class="login-button"/>


                </form:form>

            </div>
        </div>
        <!-- 
        ESTOS JAVASCRIPT DAR EL ERROR MOSTRADO
          <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
         <script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js'></script>
            registro:35 Uncaught TypeError: $(...).validate is not a function
     at HTMLDocument.<anonymous> (registro:35)
     at j (jquery.min.js:2)
     at Object.fireWith [as resolveWith] (jquery.min.js:2)
     at Function.ready (jquery.min.js:2)
     at HTMLDocument.I (jquery.min.js:2)
        -->



 </tiles:putAttribute>
    </tiles:insertDefinition>
