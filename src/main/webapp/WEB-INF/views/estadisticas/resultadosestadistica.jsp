<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

 <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>

        <script type="text/javascript" 
        src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
       <script src="resources/js/estadistica_alta_partido.js" type="text/javascript"></script>
    <tiles:insertDefinition name="templateadmin">
    <tiles:putAttribute name="body">
       
               <form id="saveteam">
                    <h2>Resultados estadisticas</h2>
            <div >
                <input  name="jornada"  placeholder="jornada" class="capturarresultado"  />                                 
            </div>
            <div>
                <select name="torneo" class="capturarresultado">
                    <c:forEach items="${torneos}" var="torneo" varStatus="status">
                          <option value="${torneo.id}">${ torneo.nombre}</option>
                       
                    </c:forEach>
                   
                </select>
            </div>    
            <div >
                <input  name="local"  placeholder="local" id="w-input-search1" class="capturarresultado" />                                 
            </div>
            <div >
                <input  name="goleslocal"  placeholder="goles local"  class="capturarresultado"/>                                 
            </div>

            <div >
                <input  name="visita"  placeholder="visita" id="w-input-search" class="capturarresultado" />                                 
            </div>
            <div >
                <input  name="golesvisita"  placeholder="goles visita"  class="capturarresultado" />                                 
            </div>
             <div >
                <input  name="estadio"  placeholder="estadio" class="capturarresultado" />                                 
            </div>
            <div >
                <input  name="fechaCadena" type="date"  placeholder="fecha"  class="capturarresultado" />                                 
            </div>
           
            <div > 
                <input type="submit" value="OK" >
            </div>


            <input type="hidden" name="${_csrf.parameterName}"
                   value="${_csrf.token}" />    
        </form>
            <span id="mensajepartido"></span>
        </div>
        <script src="<c:url value="/resources/js/jquery.autocomplete.min.js" />"></script>
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
         </tiles:putAttribute>
</tiles:insertDefinition>