<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib  uri = "http://java.sun.com/jsp/jstl/fmt"  prefix = "fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%> 


<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>

<script type="text/javascript" 
src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>

<script
src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<tiles:insertDefinition name="indexadmingrupotemplate">
    <tiles:putAttribute name="body">
        <title>${userId}</title>


        <script>
            $(document).ready(function () {
                $("#adduser").validate(
                        {
                            rules: {
                                username: {
                                    required: true,
                                    minlength: 5,
                                    remote: {
                                        url: "/availablegroup.html",
                                        type: "get",
                                        data: {
                                            username: function () {
                                                return $("#username").val();
                                            }
                                        }
                                    }
                                },

                                password: {
                                    required: true,
                                    minlength: 5
                                }
                            },
                            messages: {
                                username: {
                                    required: "Nombre es requerido",
                                    minlength: "Capture al menos 5 caracteres",
                                    remote: "Nombre de GRUPO NO disponible!"
                                },

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



        <div class="container">
            <div class="card card-container">
                 <p id="profile-name" class="profile-name-card">Crear Grupo</p>
            
              
                      <c:url var="jugar" value="/creargrupo" />
                <form:form method="POST" class="form-signin" action="${jugar}" modelAttribute="jugador" id="registerform" onsubmit="return validarFormulario()">


                   
                     <p>Grupo:*</p>
                    <input type="text"  name="username"   id="username" placeholder="Grupo" class="form-control"/><br>
                    <p>Tipo:*</p>
                    <select name="passwordConfirm" class="form-control">
                        <option value="q_ligamx" selected >Liga mx</option> 
                        <option value="q_personal" >personalizada</option>              
                    </select> <br>   
                    <p>Contraseña:*</p>
                    <input type="text"  name="password" id="password" placeholder="contraseña " class="form-control"/> <br>

                    <input type="submit"  class="btn btn-lg btn-primary btn-block btn-signin" value="Enviar"/>
                    <input type="hidden" name="${_csrf.parameterName}"
                           value="${_csrf.token}" />



                </form:form>


            </div>
        </div>
        <table class="table footable">  
            <thead>

                <tr>
                    <th>ID.</th>
                    <th>Grupo</th> 
                    <th data-hide="phone">Tipo</th> 
                    <th data-hide="phone"></th>
                    <th data-hide="phone"></th>
                    <th data-hide="phone"></th>
                </tr>
            </thead> 

            <tbody>
                <c:forEach var="grupo" items="${grupos}">  
                    <tr>  
                        <td>${grupo.id}</td>  
                        <td>${grupo.nombre}</td> 
                        <td>${grupo.tipo}</td>




                        <c:choose>
                            <c:when test="${grupo.tipo eq 'q_personal'}">
                                <td><a href="/admingrupo/administrargrupo?id=${grupo.id}"   >Administrar</a></td>  

                            </c:when>

                            <c:otherwise>
                                <td>No administrable</td>  
                            </c:otherwise>
                        </c:choose>



                        <th><a href="/admingrupo/formulariocambiarclavegrupo?nombre=${grupo.nombre}">Cambiar clave</a></td>
                        <td><a href="/admingrupo/doblesytriples?id=${grupo.id}"   >dobles y triples</a></td>  

                    </tr>  
                </c:forEach>  
            </tbody>
        </table>  

        <script type="text/javascript" src="/resources/js/footable.js"></script>
        <script type="text/javascript">
            $(function () {

                $('.footable').footable();
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>