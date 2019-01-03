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
        <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
         <script src="<c:url value="/resources/js/estadistica_alta_partido.js"/>"></script> 
        <script type="text/javascript" 
        src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>

        <script
        src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
       <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        
<tiles:insertDefinition name="indexTemplate">
    <tiles:putAttribute name="body">
       
         <div  id="estadistica">
            <div id="estadisticaFormulario"> 
               

                    <h1>
                        <table>
                            <tbody>
                                <tr>
                                    <th id="estadisticasTitulo">Compara equipos</th>
                                </tr>


                            </tbody>
                        </table>
                        <small>captura 2 equipos y obten sus estadisticas</small>
                    </h1>
                
                <c:url var="estadisticapost" value="/estadisticas" />
                <form:form method="POST" action="${estadisticapost}" modelAttribute="estadisticaPartido">

                    <div class="camposformularioestadistica">
                        <input  name="local"  placeholder="local"   id="w-input-search" class="estadisticaText"/>

                        <span class="imageversus">
                            <img src="/resources/images/versus.png" alt="Smiley face"  >
                        </span>



                        <input  name="visita"  placeholder="visita"   id="w-input-search1" class="estadisticaText"/>


                    </div>
                    <div class="camposformularioestadistica"> 
                        <input type="submit" value="Estadisticas" class="myButton">
                    </div>

                    <input type="hidden" name="${_csrf.parameterName}"
                           value="${_csrf.token}" />    
                </form:form>
            </div>

            <!--Si hay informacion muestra las tablas -->
            <c:if test="${fn:length(estadisticas.localvsvisita) gt 0}">
              
            
            <h1 id="estadisticaTitulo">Estadisticas  ${estadisticas.local} vs ${estadisticas.visita}</h1>
            <h2 class="estadisticaH2">Ultimos encuentros entre  ${estadisticas.local} vs ${estadisticas.visita}</h2>

            <table  class="table footable">  
                <thead>

                    <tr>
                        <th >Jornada</th>
                        <th data-hide="phone">Fecha</th> 
                        <th>Local</th>
                        <th></th>
                        <th>Visita</th>
                        <th data-hide="phone"> Torneo</th>
                        <th data-hide="phone">Estadio</th>
                    </tr>
                </thead> 
                </thead>
                <tbody>
                    <c:forEach var="partido" items="${estadisticas.localvsvisita}">  
                        <tr>  
                            <td>${partido.jornada}</td>  
                            <td>${partido.fecha}</td> 
                            <td>${partido.local}</td>  
                            <td>${partido.goleslocal} -  ${partido.golesvisita}</td> 
                            <td>${partido.visita}</td>  

                            <td>${partido.torneo}</td>  
                            <td>${partido.estadio}</td>  


                        </tr>  
                    </c:forEach>  
                </tbody>

            </table >  
            <div id="piechart"></div>

            <h2 class="estadisticaH2">Ultimos encuentros   ${estadisticas.local} como local vs ${estadisticas.visita}</h2>
            <table class="table footable">  
                <thead>

                    <tr>
                        <th >Jornada</th>
                        <th data-hide="phone">Fecha</th> 
                        <th>Local</th>
                        <th></th>
                        <th>Visita</th>
                        <th data-hide="phone"> Torneo</th>
                        <th data-hide="phone">Estadio</th>
                    </tr>
                </thead> 
                </thead>
                <tbody>
                    <c:forEach var="partido" items="${estadisticas.localvsvisital}">  
                        <tr>  
                            <td>${partido.jornada}</td>  
                            <td>${partido.fecha}</td> 
                            <td>${partido.local}</td>  
                            <td>${partido.goleslocal} -  ${partido.golesvisita}</td> 
                            <td>${partido.visita}</td>  

                            <td>${partido.torneo}</td>  
                            <td>${partido.estadio}</td>  


                        </tr>  
                    </c:forEach>  
                </tbody>
            </table>  
            <div id="piechartsololocal"></div>  
            <h2 class="estadisticaH2">Ultimos encuentros:   ${estadisticas.local}</h2>
            <table class="table footable">  
                <thead>

                    <tr>
                        <th >Jornada</th>
                        <th data-hide="phone">Fecha</th> 
                        <th>Local</th>
                        <th></th>
                        <th>Visita</th>
                        <th data-hide="phone"> Torneo</th>
                        <th data-hide="phone">Estadio</th>
                    </tr>
                </thead> 
                </thead>
                <tbody>
                    <c:forEach var="partido" items="${estadisticas.localvstodos}">  
                        <tr>  
                            <td>${partido.jornada}</td>  
                            <td>${partido.fecha}</td> 
                            <td>${partido.local}</td>  
                            <td>${partido.goleslocal} -  ${partido.golesvisita}</td> 
                            <td>${partido.visita}</td>  

                            <td>${partido.torneo}</td>  
                            <td>${partido.estadio}</td>  


                        </tr>  
                    </c:forEach>  
                </tbody>
            </table>  
            <div id="piechartlocalvstodos"></div>
            <h2 class="estadisticaH2">Ultimos partidos: ${estadisticas.local} como local.</h2>
            <table class="table footable">  
                <thead>

                    <tr>
                        <th >Jornada</th>
                        <th data-hide="phone">Fecha</th> 
                        <th>Local</th>
                        <th></th>
                        <th>Visita</th>
                        <th data-hide="phone"> Torneo</th>
                        <th data-hide="phone">Estadio</th>
                    </tr>
                </thead> 
                </thead>
                <tbody>
                    <c:forEach var="partido" items="${estadisticas.localvstodosl}">  
                        <tr>  
                            <td>${partido.jornada}</td>  
                            <td>${partido.fecha}</td> 
                            <td>${partido.local}</td>  
                            <td>${partido.goleslocal} -  ${partido.golesvisita}</td> 
                            <td>${partido.visita}</td>  

                            <td>${partido.torneo}</td>  
                            <td>${partido.estadio}</td>  


                        </tr>  
                    </c:forEach>  
                </tbody>
            </table>  
            <div id="piechartlocalvstodosl"></div>  
            <h2 class="estadisticaH2">Ultimos encuentros: ${estadisticas.visita}</h2>
            <table class="table footable">  
                <thead>

                    <tr>
                        <th >Jornada</th>
                        <th data-hide="phone">Fecha</th> 
                        <th>Local</th>
                        <th></th>
                        <th>Visita</th>
                        <th data-hide="phone"> Torneo</th>
                        <th data-hide="phone">Estadio</th>
                    </tr>
                </thead> 
                </thead>
                <tbody>
                    <c:forEach var="partido" items="${estadisticas.visitavstodos}">  
                        <tr>  
                            <td>${partido.jornada}</td>  
                            <td>${partido.fecha}</td> 
                            <td>${partido.local}</td>  
                            <td>${partido.goleslocal} -  ${partido.golesvisita}</td> 
                            <td>${partido.visita}</td>  

                            <td>${partido.torneo}</td>  
                            <td>${partido.estadio}</td>  


                        </tr>  
                    </c:forEach>  
                </tbody>
            </table>  
            <div id="piechartvisitavstodos"></div> 
            <h2 class="estadisticaH2">Ultimos encuentros: ${estadisticas.visita} como visita</h2>
            <table class="table footable">  
                <thead>

                    <tr>
                        <th >Jornada</th>
                        <th data-hide="phone">Fecha</th> 
                        <th>Local</th>
                        <th></th>
                        <th>Visita</th>
                        <th data-hide="phone"> Torneo</th>
                        <th data-hide="phone">Estadio</th>
                    </tr>
                </thead> 
                </thead>
                <tbody>
                    <c:forEach var="partido" items="${estadisticas.visitavstodosv}">  
                        <tr>  
                            <td>${partido.jornada}</td>  
                            <td>${partido.fecha}</td> 
                            <td>${partido.local}</td>  
                            <td>${partido.goleslocal} -  ${partido.golesvisita}</td> 
                            <td>${partido.visita}</td>  

                            <td>${partido.torneo}</td>  
                            <td>${partido.estadio}</td>  


                        </tr>  
                    </c:forEach>  
                </tbody>
            </table>  
            <div id="piechartvisitavstodosv"></div>

           </c:if>


<script src="<c:url value="/resources/js/jquery.autocomplete.min.js" />"></script>





        </div> 

       
<script>
	$(document).ready(function() {

		$('#w-input-search').autocomplete({
			serviceUrl: '${pageContext.request.contextPath}/getTags',
			paramName: "nombre",
			delimiter: ",",
		    transformResult: function(response) {
		    	
		        return {
		        	
		            suggestions: $.map($.parseJSON(response), function(item) {
		            	
		                return { value: item.nombre, data: item.id };
		            })
		            
		        };
		        
		    }
		    
		});
                $('#w-input-search1').autocomplete({
			serviceUrl: '${pageContext.request.contextPath}/getTags',
			paramName: "nombre",
			delimiter: ",",
		    transformResult: function(response) {
		    	
		        return {
		        	
		            suggestions: $.map($.parseJSON(response), function(item) {
		            	
		                return { value: item.nombre, data: item.id };
		            })
		            
		        };
		        
		    }
		    
		});
		
		
	});
	</script>
        
        <script type="text/javascript" src="/resources/js/footable.js"></script>
        <script type="text/javascript">
            $(function () {
                $('.footable').footable();
            });
        </script>
        
        <script type="text/javascript">
            google.charts.load('current', {'packages': ['corechart']});
            google.charts.setOnLoadCallback(drawChart);
            //uno
            function drawChart() {

                var data = google.visualization.arrayToDataTable([
                    ['Equipos', 'Evento'],
                    ['${estadisticas.local}', ${estadisticas.localvsvisitalocal}],
                    ['${estadisticas.visita}', ${estadisticas.localvsvisitavisita}],
                    ['Empate', ${estadisticas.localvsvisitaempate}]
                ]);

                var options = {
                    title: '${estadisticas.local} vs ${estadisticas.visita}'
                            };

                            var chart = new google.visualization.PieChart(document.getElementById('piechart'));

                            chart.draw(data, options);
                        }
                        //dos
                        google.charts.load('current', {'packages': ['corechart']});
                        google.charts.setOnLoadCallback(drawChart1);
                        function drawChart1() {

                            var data = google.visualization.arrayToDataTable([
                                ['Equipos', 'Evento'],
                                ['${estadisticas.local}', ${estadisticas.localvsvisitallocal}],
                                ['${estadisticas.visita}', ${estadisticas.localvsvisitalvisita}],
                                ['Empate', ${estadisticas.localvsvisitalempate}]
                            ]);

                            var options = {
                                title: '${estadisticas.local} vs ${estadisticas.visita}'
                                        };

                                        var chart = new google.visualization.PieChart(document.getElementById('piechartsololocal'));

                                        chart.draw(data, options);
                                    }
                                    //tres
                                    google.charts.load('current', {'packages': ['corechart']});
                                    google.charts.setOnLoadCallback(drawChart2);
                                    function drawChart2() {

                                        var data = google.visualization.arrayToDataTable([
                                            ['Equipos', 'Evento'],
                                            ['${estadisticas.local}', ${estadisticas.localvstodoslocal}],
                                            ['Otros', ${estadisticas.localvstodosvisita}],
                                            ['Empate', ${estadisticas.localvstodosempate}]
                                        ]);

                                        var options = {
                                            title: '${estadisticas.local} vs Otros'
                                        };

                                        var chart = new google.visualization.PieChart(document.getElementById('piechartlocalvstodos'));

                                        chart.draw(data, options);
                                    }
                                    //cuatro
                                    google.charts.load('current', {'packages': ['corechart']});
                                    google.charts.setOnLoadCallback(drawChart3);
                                    function drawChart3() {

                                        var data = google.visualization.arrayToDataTable([
                                            ['Equipos', 'Evento'],
                                            ['${estadisticas.local}', ${estadisticas.localvstodosllocal}],
                                            ['${estadisticas.visita}', ${estadisticas.localvstodoslvisita}],
                                            ['Empate', ${estadisticas.localvstodoslempate}]
                                        ]);

                                        var options = {
                                            title: '${estadisticas.local} vs ${estadisticas.visita}'
                                                    };

                                                    var chart = new google.visualization.PieChart(document.getElementById('piechartlocalvstodosl'));

                                                    chart.draw(data, options);
                                                }
                                                //cinco
                                                google.charts.load('current', {'packages': ['corechart']});
                                                google.charts.setOnLoadCallback(drawChart4);
                                                function drawChart4() {

                                                    var data = google.visualization.arrayToDataTable([
                                                        ['Equipos', 'Evento'],
                                                        ['${estadisticas.visita}', ${estadisticas.visitavstodosvisita}],
                                                        ['Otros', ${estadisticas.visitavstodoslocal}],

                                                        ['Empate', ${estadisticas.visitavstodosempate}]
                                                    ]);

                                                    var options = {
                                                        title: '${estadisticas.visita} vs Otros'
                                                    };

                                                    var chart = new google.visualization.PieChart(document.getElementById('piechartvisitavstodos'));

                                                    chart.draw(data, options);
                                                }
                                                //seis
                                                google.charts.load('current', {'packages': ['corechart']});
                                                google.charts.setOnLoadCallback(drawChart5);
                                                function drawChart5() {

                                                    var data = google.visualization.arrayToDataTable([
                                                        ['Equipos', 'Evento'],
                                                        ['${estadisticas.visita}', ${estadisticas.visitavstodosvvisita}],
                                                        ['Otros', ${estadisticas.visitavstodosvlocal}],
                                                        ['Empate', ${estadisticas.visitavstodosvempate}]
                                                    ]);

                                                    var options = {
                                                        title: '${estadisticas.visita} vs Otros'
                                                    };

                                                    var chart = new google.visualization.PieChart(document.getElementById('piechartvisitavstodosv'));

                                                    chart.draw(data, options);
                                                }
        </script>

   
       
    

    </tiles:putAttribute>
    </tiles:insertDefinition>