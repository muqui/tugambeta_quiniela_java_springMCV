<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%> 


<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
        <div class="body">
            <div class="uk-container">
                <div class="uk-flex uk-flex-middle uk-flex-center">
                    <div class="cont-participantes">
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
                    </div>
                </div>
            </div>  

            <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js" type="text/javascript"></script>
            <script type="text/javascript" src="/resources/js/footable.js"></script>

            <script type="text/javascript">
                $(function () {
                    $('.footable').footable();
                });
            </script>
        </div>
    </tiles:putAttribute>
</tiles:insertDefinition>


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