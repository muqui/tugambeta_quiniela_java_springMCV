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
            
              
                     
                       <script src="resources/js/creargrupo.js"></script>  
                <form:form method="POST" class="form-signin"  modelAttribute="jugador" id="addGroup" >


                   
                     <p>Grupo:*</p>
                    <input type="text"  name="username"   id="username" placeholder="Grupo" class="form-control"/><br>
                    <p>Tipo:*</p>
                    <select name="tipoPaguina" class="form-control">
                        <option value="q_ligamx" selected >Liga mx</option> 
                        <option value="q_personal" >personalizada</option>              
                    </select> <br>   
                    <p>Contraseña:*</p>
                    <input type="text"  name="password" id="password" placeholder="contraseña " class="form-control"/> <br>

                    <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Crear</button>
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
                         <td><a href="/admingrupo/eliminargrupo?id=${grupo.nombre}"   >Eliminar</a></td> 

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