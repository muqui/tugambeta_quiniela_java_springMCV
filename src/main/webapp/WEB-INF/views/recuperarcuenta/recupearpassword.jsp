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
<html>
    <head>
        <!-- Codigo se seguimiento -->
        <script>
            (function (i, s, o, g, r, a, m) {
                i['GoogleAnalyticsObject'] = r;
                i[r] = i[r] || function () {
                    (i[r].q = i[r].q || []).push(arguments)
                }, i[r].l = 1 * new Date();
                a = s.createElement(o),
                        m = s.getElementsByTagName(o)[0];
                a.async = 1;
                a.src = g;
                m.parentNode.insertBefore(a, m)
            })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');

            ga('create', 'UA-87354350-1', 'auto');
            ga('send', 'pageview');

        </script>
        <!-- FIN Codigo se seguimiento-->
        <meta charset="UTF-8">
        <meta name="viewport" content="widht=device-widht, initial-scale=1, maximum-scala=1">
        <title>Recupear Contraseña</title>

        <link rel="stylesheet"
              href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

        <link rel="stylesheet"
              href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">

        <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>

        <script type="text/javascript" 
        src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>

        <script
        src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>


        <link href="<c:url value="/resources/css/index.css" />" rel="stylesheet">

        <script>
            $(document).ready(function () {
                $("#formrecupearpass").validate(
                        {
                            rules: {

                                password: {
                                    required: true,
                                    minlength: 8
                                },
                                email: {
                                    required: true,
                                    email: true,
                                    remote: {
                                        url: "/availableemailrecuperar.html",
                                        type: "get",
                                        data: {
                                            username: function () {
                                                return $("#email").val();
                                            }
                                        }
                                    }
                                }
                            },
                            messages: {

                                password: {
                                    required: "Contraseña es requerido",
                                    minlength: "Capture al menos 8 caracteres"
                                }, email: {
                                    required: "email es requerido",
                                    email: "capture email valido",
                                    remote: "correo no registrado!"
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
        
        
                  $('#formrecupearpass').submit(function(e) {

        $.post('/recuperarpassword', $(this).serialize(), function(tventa) {
             var mensaje = tventa + " <a href='/'> regresar</a> ";
            
              $("#mensajerecuperarpassword").html(mensaje);
            alert(tventa);

        });
        e.preventDefault();
    });
        
        
      

            });


        
      
    

        </script>
    </head>
    <body>
         <div class="logo_tugambeta">
       <a href="/"><img src="/resources/images/tugambeta.png"  height="90" width="800"></a>
  </div>
        <div class="login">
            <div class="login-header">
                <h1>Recuperar cuenta</h1>
            </div>
            <div class="login-form">
                <!-- 
               
                       <form id="formrecupearpass" >
                
                -->


                <form id="formrecupearpass" >

                    <h3>email*</h3>
                    <input type="text"  name="email"      id="email" placeholder="Grupo" cssClass="form-control"/><br>
                    <input type="hidden" name="username" value="x">
                    <input type="hidden" name="password" value="x">
                    <input type="hidden" name="enabled" value="true">



                    <input type="hidden" name="${_csrf.parameterName}"
                           value="${_csrf.token}" />
                    <input type="submit" value="Cambiar" id="buttonC"  class="login-button"/>


                </form>

                     <span id="mensajerecuperarpassword"></span>

            </div>
        </div>
    </body>
    <script src="/resources/js/recuperarpassword.js" type="text/javascript"></script>
</html>
