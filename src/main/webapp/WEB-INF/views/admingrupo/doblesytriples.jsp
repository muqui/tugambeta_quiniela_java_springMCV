<%-- 
    Document   : doblesytriples
    Created on : 14/07/2017, 11:09:14 AM
    Author     : mq12
--%>
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
                $("#pagina").validate(
                        {
                            rules: {
                               

                                dobles: {
                                    required: true,
                                    number: true
                                },
                                triples: {
                                    required: true,
                                    number: true
                                }
                            },
                            messages: {
                               
                                dobles: {
                                    required: "Dobles es requerido",
                                    number: "Capture un numero"
                                },
                                 triples: {
                                    required: "Triples es requerido",
                                    number: "Capture un numero"
                                },


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
           <div class="login">
            <div class="login-header">
                <h1>Cambio de dobles y triples grupo: ${pagina.nombre}</h1>
            </div>
            <div class="login-form">
                <c:url var="creargrupo" value="/admingrupo/cambiardoblesytriples" />
                <form:form method="POST" action="${creargrupo}" modelAttribute="pagina" id="pagina">
               
                    <h3>Dobles*</h3>
                    <input type="text"  name="dobles"  value="${pagina.dobles}"    id="dobles" placeholder="dobles" cssClass="form-control"/><br>
                      
                    <h3>Triples:*</h3>
                    <input type="text"  name="triples" value="${pagina.triples}"  id="triples" placeholder="triples "/> <br>
                         <input type="hidden" name="id" value="${pagina.id}">
                         
                         
                     

                    <input type="hidden" name="${_csrf.parameterName}"
                           value="${_csrf.token}" />
                    <input type="submit" value="Cambiar" class="login-button"/>


                </form:form>
                    
                              

            </div>
        </div>
   </tiles:putAttribute>
    </tiles:insertDefinition>