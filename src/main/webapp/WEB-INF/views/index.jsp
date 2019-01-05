<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib  uri = "http://java.sun.com/jsp/jstl/fmt"  prefix = "fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="widht=device-widht, initial-scale=1, maximum-scala=1">



<tiles:insertDefinition name="indexTemplate">
    <tiles:putAttribute name="body">
        <div class="mt-sm-5">
            <div class="container">
                <div class="container fuente-verde">

                    <div >
                        <h3 >¿Que es  tugambeta?</h3>
                        <p  class="">Es un sitio web donde podrás retar a tus amigos, para saber quién sabe más acerca de futbol.
                            Para poder jugar registre crea un grupo y pásale a tus amigos el nombre de tu grupo  y la contraseña
                            así de fácil podrás jugar quinielas de futbol Mexicano.

                        </p>

                    </div>




                    <h2>Quiniela de la semana</h2>
                    <c:url var="jugar" value="/guardar" />
                    <div id="errores">
                        <%-- 
                               
                        --%>
                    </div>
                    ${error2y3}
                    <fmt:parseNumber var = "dos" type = "number" value = "${pagina.dobles}" />
                    <fmt:parseNumber var = "tres" type = "number" value = "${pagina.triples}" />
                    <c:if test="${(dos >= 1)  || (tres >= 1)}">
                        <form:form method="GET" action="${jugar}" modelAttribute="jugador" id="registerform" onsubmit="return validarFormulario()">

                            <div class="form-group">
                                 <label for="jugador">Nombre</label>
                                <form:input  class="form-control" id="jugador"  path="jugador" placeholder="Nombre" />
                                </br>
                                <form:errors  path="jugador" />
                            </div>

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
                                            <label for="visita${status.index}"> ${partido.visitante} <span></span> <img alt="" src="/resources/images/${partido.visitante}.png" height="35px" width="35px"></label>

                                        </td>
                                    </tr>


                                    <input type="hidden" name="quiniela.partidoses[${status.index}].local" value="${partido.local}">
                                    <input type="hidden" name="quiniela.partidoses[${status.index}].visitante" value="${partido.visitante}">
                                    <input type="hidden" name="quiniela.partidoses[${status.index}].idpartidos" value="${partido.idpartidos}">
                                </c:forEach>

                            </table>  
                            
                                <div class="row">
                                      <div class="col-sm-3 col-sm-offset-5"> 
                                          <input type="submit" class="form-control btn btn-success " value="Enviar"/>
                                      </div>                                                                                    
                                </div>
                           
                               
                               
                            
                           
                            <input type="hidden" name="${_csrf.parameterName}"
                                   value="${_csrf.token}" />



                        </form:form>
                    </c:if>
                    <c:if test="${(dos == 0)  && (tres == 0)}">
                        <c:url var="jugar" value="/guardar" />
                        <form:form method="GET" action="${jugar}" modelAttribute="jugador" id="registerform" onsubmit="return validarFormulario()">

                            </br>
                            <label for="jugador" class=" uk-width-1-2">Nombre:</label>
                            <form:input  id="jugador" path="jugador" class=" uk-width-1-2 uk-input" placeholder="Nombre"  />
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
                    <h3>Tabla General ${nombreliga}</h3>
                    <table class="table footable">  
                        <thead>
                            <tr>
                                <th>POS</th>
                                <th></th>
                                <th>Club</th>
                                <th data-hide="phone,tablet">JJ</th> 
                                <th data-hide="phone,tablet">JG</th>
                                <th data-hide="phone,tablet">JG</th>
                                <th data-hide="phone,tablet">JP</th>
                                <th data-hide="phone,tablet">GF</th>
                                <th data-hide="phone,tablet">GC</th>
                                <th data-hide="phone,tablet" >DIF</th>
                                <th data-hide="phone" >PTS</th>
                            </tr>
                        </thead> 

                        <tbody>
                            <c:forEach var="tablageneral" items="${tablageneral}" varStatus="iterator">  
                                <tr class="clickable" data-toggle="collapse" data-target="#group-of-rows-1" aria-expanded="false" aria-controls="group-of-rows-1"> 
                                    <td>   ${iterator.index +1}</td>
                                    <td> <img alt="" src="/resources/images/${tablageneral.club}.png"  height="35px" width="35px"> </td> 
                                    <td>${tablageneral.club}</td>
                                    <td>${tablageneral.jj}</td> 
                                    <td>${tablageneral.jg}</td> 
                                    <td>${tablageneral.je}</td>
                                    <td>${tablageneral.jp}</td> 
                                    <td>${tablageneral.gf}</td> 
                                    <td>${tablageneral.gc}</td> 
                                    <td>${tablageneral.dif}</td> 
                                    <td>${tablageneral.puntos}</td> 

                                </tr>  
                            </c:forEach>  
                        </tbody>
                    </table>  
                    <%--participantes --%>
                    <c:if test="${fn:length(participantes) > 0 }">


                        <h3>Partidos jugados</h3>

                        <c:forEach items="${partidos}" var="partido" varStatus="status">  
                            <c:if test="${partido.resultado != '-'}">

                                <div id="resultado">             
                                    <img alt="" src="/resources/images/${partido.local}.png" height="30px" width="30px">

                                    <label for="">  ${partido.goleslocal} </label> -   <label for=""> ${partido.golesvisita}</label>


                                    <img alt="" src="/resources/images/${partido.visitante}.png" height="30px" width="30px"> 




                                </div>    
                            </c:if>


                        </c:forEach> 

                        <h1>Participantes</h1> 
                        <form id="formularioimprimir" >

                            <input type="hidden" name="${_csrf.parameterName}"
                                   value="${_csrf.token}" />

                            <P> <input type="submit" value="Imprimir" id="submit"   /></p>

                        </form> 

                        <table class="table footable">  
                            <thead>

                                <tr>
                                    <td>No.</td>
                                    <c:forEach var="cate" items="${participantes[0]}"  varStatus="loop">

                                        <c:choose>
                                            <c:when test="${loop.index == 0}">
                                                <th> <img alt="" src="/resources/images/${cate}.png" height="35px" width="35px">${cate} </th> 
                                                </c:when>
                                                <c:when test="${fn:length(participantes[0]) == loop.index+1}">

                                                <th> <img alt="" src="/resources/images/${cate}.png" height="35px" width="35px">${cate} </th> 
                                                </c:when>
                                                <c:otherwise>
                                                <th  data-hide="phone,tablet"> <img alt="" src="/resources/images/${cate}.png" height="35px" width="35px">${cate} </th> 
                                                </c:otherwise>
                                            </c:choose>


                                    </c:forEach> 
                                </tr>
                            </thead> 
                            </thead>
                            <tbody>
                                <c:forEach var="uri" items="${participantes}" varStatus="iterator"> 

                                    <tr>
                                        <c:choose>
                                            <c:when test="${fn:length(participantes)-1 > (iterator.index)}">

                                                <td>   ${iterator.index +1}</td>
                                            </c:when>
                                            <c:otherwise>

                                            </c:otherwise>
                                        </c:choose>

                                        <c:forEach var="cate" items="${participantes[iterator.index+1]}"  varStatus="it">

                                            <c:set var="title" scope="session" value="${ participantes[0][it.index]}"/>
                                            <td  >  ${cate}  </td>
                                        </c:forEach> 
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>  
                    </c:if>
                    <%-- END Participantes --%>  

                </div>
            </div>

                   

        </div>  



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
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="/resources/js/footable.js"></script>
        <script type="text/javascript">
            $(function () {

                $('.footable').footable();
            });


        </script>


        <!-- DIALOGO IMPRIMIR Participantes -->
        <script src="/resources/js/jquery-ui.js" type="text/javascript"></script>
        <link href="<c:url value="/resources/css/jquery-ui.css" />" rel="stylesheet">
        <div id="dialog-print" style="display:none;">

            <table id="tablaraizcuadrada" class="table tr">

            </table>
        </div>



        <script type="text/javascript">
            $(document).ready(function () {
                //response body 
                $('#formularioimprimir').submit(function (e) {

                    $.post('/quiniela/imprimir', $(this).serialize(), function (tventa) {
                        var modulo = tventa.length % 2;

                        if (modulo == 0) {
                            var mitad = (tventa.length / 2) + 1;
                        } else {
                            var mitad = (tventa.length / 2);
                        }

                        var trHTML = '';
                        $("#tablaraizcuadrada tr").remove();
                        console.log("tamaño " + tventa.length);
                        trHTML += '<tr>';
                        for (var k = 0; k < tventa[0].length; k++) {

                            trHTML += '<th class="rotate" > <div><span>' + tventa[0][k] + '</span> </div></th>';
                            console.log("tama  " + tventa[0][k]);
                        }
                        for (var k = 0; k < tventa[0].length; k++) {

                            trHTML += '<th class="rotate"><div><span>' + tventa[0][k] + '</span> </div></th>';
                            console.log("tama  " + tventa[0][k]);
                        }


                        trHTML += '</tr>';


                        for (var i = 1; i < (mitad); i++) {

                            trHTML += '<tr>';
                            console.log(tventa[i].length);
                            for (var k = 0; k < tventa[i].length; k++) {

                                trHTML += '<td class="imprimir">' + tventa[i][k] + '</td>';

                            }
                            var segunda = parseInt(i + mitad);
                            if (modulo == 0) {
                                var segunda = parseInt(i + mitad) - 1;

                            } else {

                                var segunda = parseInt(i + mitad);
                            }



                            for (var k = 0; k < tventa[i].length; k++) {
                                if (segunda < tventa.length) {

                                    trHTML += '<td class="imprimir" >' + tventa[segunda][k] + '</td>';
                                }

                                /*             
                                 
                                 */


                            }


                            trHTML += '</tr>';
                        }

                        $('#tablaraizcuadrada').append(trHTML);

                        var iprimirr = {
                            'height': '10px',

                            'font-size': '10px',
                            'border': '1px solid black'
                        };
                        $(".imprimir, #tablaraizcuadrada").css(iprimirr);

                        var rotate = {
                            'height': '150px',
                            'white-space': 'nowrap',
                            'font-size': '10px',
                            'border': '1px solid black'
                        };
                        $("th.rotate").css(rotate);

                        var rotateDiv = {
                            'transform': 'translate(2px,150px)  rotate(-90deg)',
                            'width': '30px'
                        };
                        $("th.rotate > div").css(rotateDiv);


                        var rotateDivSpan = {
                            'padding': '5px 17px'
                        };
                        $("th.rotate > div > span").css(rotateDivSpan);



                        $("#dialog-print").dialog({
                            closeOnEscape: false,
                            open: function (event, ui) {
                                $(".ui-dialog-titlebar-close", ui.dialog | ui).hide();
                            },
                            resizable: true,
                            modal: true,
                            title: "Participantes",
                            height: 550,
                            width: 1200,
                            buttons: {

                                "imprimir": function () {

                                    var rotateDiv = {
                                        'transform': 'translate(2px,70px)  rotate(-90deg)',
                                        'width': '30px'
                                    };
                                    $("th.rotate > div").css(rotateDiv);
                                    var divToPrint = $("#dialog-print").html();
                                    var newWin = window.open('', 'Print-Window');
                                    newWin.document.open();
                                    // newWin.document.write('<html><body onload="window.print()">' + divToPrint.innerHTML + '</body></html>');
                                    newWin.document.write('<html><body onload="window.print()">' + divToPrint + '</body></html>');
                                    newWin.document.close();
                                    console.log(divToPrint);
                                    setTimeout(function () {
                                        newWin.close();
                                    }, 10);

                                    var rotateDiv = {
                                        'transform': 'translate(2px,150px)  rotate(-90deg)',
                                        'width': '30px'
                                    };
                                    $("th.rotate > div").css(rotateDiv);
                                },
                                "cerrar": function () {
                                    $(this).dialog('close');
                                }

                            }
                        });
                    });
                    e.preventDefault();
                });
            });


        </script>

    </tiles:putAttribute>
</tiles:insertDefinition>