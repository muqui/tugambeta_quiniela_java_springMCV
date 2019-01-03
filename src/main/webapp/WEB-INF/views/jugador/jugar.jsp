<%-- 
    Document   : jugar
    Created on : 4/11/2016, 10:31:25 AM
    Author     : mq12
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib  uri = "http://java.sun.com/jsp/jstl/fmt"  prefix = "fmt"%>


<head>

    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">

    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>

    <script type="text/javascript" 
    src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>

    <script
    src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>






    <tiles:insertDefinition name="defaultTemplate">
        <tiles:putAttribute name="body">
        <div class="uk-container">
            <div class="uk-flex uk-flex-middle uk-flex-center">
                <div class="cont-login">



                    <c:url var="jugar" value="/quiniela/${userId}/guardado" />
                    <div id="errores">
                        <%-- 
                               
                        --%>
                    </div>
                    ${error2y3}
                    <fmt:parseNumber var = "dos" type = "number" value = "${pagina.dobles}" />
                    <fmt:parseNumber var = "tres" type = "number" value = "${pagina.triples}" />
                    <c:if test="${(dos >= 1)  || (tres >= 1)}">
                        <form:form method="POST" action="${jugar}" modelAttribute="jugador" id="registerform" onsubmit="return validarFormulario()">

                            </br>
                            <form:input  id="jugador" path="jugador" placeholder="Nombre" />
                            </br>
                            <form:errors  path="jugador" />
                            <table id="tableJugar"  >  
                                <tr>  
                                    <td class="locale"> Local</td>  
                                    <td id="empate"> Empate</td>  
                                    <td id="visita">Visita</td>  

                                </tr>  

                                <c:forEach items="${partidos}" var="partido" varStatus="status">
                                    <tr>

                                        <td >


                                            <input type="checkbox" id="local${status.index}" name="quiniela.partidoses[${status.index}].resultado" value="G" >
                                            <label for="local${status.index}"> <span></span>  <img alt="" src="/resources/images/${partido.local}.png" height="35px" width="35px">   ${partido.local} </label>

                                        </td>



                                        <td id="empate" >
                                            <input type="checkbox" id="empate${status.index}" name="quiniela.partidoses[${status.index}].resultado" value="E" >
                                            <label for="empate${status.index}"><span></span></label>
                                        </td>

                                        <td id="visita">
                                            <input type="checkbox" id="visita${status.index}" name="quiniela.partidoses[${status.index}].resultado" value="P" checked >
                                            <label for="visita$${status.index}"> ${partido.visitante} <span></span> <img alt="" src="/resources/images/${partido.visitante}.png" height="35px" width="35px"></label>

                                        </td>
                                    </tr>


                                    <input type="hidden" name="quiniela.partidoses[${status.index}].local" value="${partido.local}">
                                    <input type="hidden" name="quiniela.partidoses[${status.index}].visitante" value="${partido.visitante}">
                                    <input type="hidden" name="quiniela.partidoses[${status.index}].idpartidos" value="${partido.idpartidos}">
                                </c:forEach>

                            </table>  

                            <input type="submit"  class="myButton" value="Enviar"/>
                            <input type="hidden" name="${_csrf.parameterName}"
                                   value="${_csrf.token}" />



                        </form:form>
                    </c:if>
                    <c:if test="${(dos == 0)  && (tres == 0)}">

                        <form:form method="POST" action="${jugar}" modelAttribute="jugador" id="registerform" onsubmit="return validarFormulario()">

                            </br>
                            <form:input  id="jugador" path="jugador" placeholder="Nombre"  />
                            </br>
                            <form:errors  path="jugador" />
                            <table id="tableJugar"  >  
                                <tr>  
                                    <td class="locale"> Local</td>  
                                    <td id="empate"> Empate</td>  
                                    <td id="visita">Visita</td>  

                                </tr>  
                                <c:forEach items="${partidos}" var="partido" varStatus="status">
                                    <tr>

                                        <td >


                                            <input type="radio" id="partidos[${status.index}].local" name="quiniela.partidoses[${status.index}].resultado" value="G" checked>
                                            <label for="partidos[${status.index}].local"> <span></span>   <img alt="" src="/resources/images/${partido.local}.png" height="35px" width="35px"> ${partido.local} </label>

                                        </td>



                                        <td id="empate" >
                                            <input type="radio" id="partidos[${status.index}].idpartidos" name="quiniela.partidoses[${status.index}].resultado" value="E" >
                                            <label for="partidos[${status.index}].idpartidos"><span></span></label>
                                        </td>

                                        <td id="visita">
                                            <input type="radio" id="partidos[${status.index}].visitante" name="quiniela.partidoses[${status.index}].resultado" value="P" >
                                            <label for="partidos[${status.index}].visitante"> ${partido.visitante} <img alt="" src="/resources/images/${partido.visitante}.png"  height="35px" width="35px"><span></span></label>

                                        </td>
                                    </tr>


                                    <input type="hidden" name="quiniela.partidoses[${status.index}].local" value="${partido.local}">
                                    <input type="hidden" name="quiniela.partidoses[${status.index}].visitante" value="${partido.visitante}">
                                    <input type="hidden" name="quiniela.partidoses[${status.index}].idpartidos" value="${partido.idpartidos}">
                                </c:forEach>

                            </table>  

                            <input type="submit"  class="myButton" value="Enviar"/>
                            <input type="hidden" name="${_csrf.parameterName}"
                                   value="${_csrf.token}" />



                        </form:form>
                    </c:if>


                    <p align="center">Jugar  ${userId}</p>
                    <script>
                        function validarFormulario() {
                            $("#errores").empty();
                            var mensaje = "";
                            var ban = true;
                            var dobles = 0;
                            var triples = 0;
                            var contar = 0;
                            var limiteDobles = ${pagina.dobles};
                            var limiteTriples = ${pagina.triples};
                            var partidos = ${fn:length(partidos)};
                            var name = $.trim($('#jugador').val());


                            if (name == "") {
                                mensaje = '<p> Caputure un nombre </p>';
                                ban = false;
                            }
                            for (var i = 0; i < partidos; i++) {

                                if ($('#local' + i).prop('checked') == false && $('#empate' + i).prop('checked') == false && $('#visita' + i).prop('checked') == false) {
                                    mensaje += '<p> Seleccione resultado para cada partido </p>';

                                    ban = false;
                                    break;
                                }
                                if ($('#local' + i).prop('checked') == true) {
                                    contar = contar + 1;
                                }
                                if ($('#empate' + i).prop('checked') == true) {
                                    contar = contar + 1;
                                }
                                if ($('#visita' + i).prop('checked') == true) {
                                    contar = contar + 1;
                                }

                                if (contar == 2) {
                                    dobles = dobles + 1;
                                }
                                if (contar == 3) {
                                    triples = triples + 1;
                                }
                                contar = 0;
                            }

                            if (dobles > limiteDobles) {
                                mensaje += '<p>  dobles permitidos  ' + limiteDobles + ' </p>';
                                ban = false;
                            }
                            if (triples > limiteTriples) {
                                mensaje += '<p> Triples permitidos ' + limiteTriples + ' </p>';
                                ban = false;
                            }
                            if (ban == false) {
                                $("#errores").css("background-color", "red");
                                $("#errores").css("width", "250px");
                                $('#jugador').focus();
                                $("#errores").append(mensaje);

                                return false;

                            }
                        }
                    </script>
                </div>
            </div>      
        </div>
    </tiles:putAttribute>
</tiles:insertDefinition>
