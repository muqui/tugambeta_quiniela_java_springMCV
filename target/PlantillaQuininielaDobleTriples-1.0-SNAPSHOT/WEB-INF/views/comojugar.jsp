<%-- 
    Document   : comojugar
    Created on : 11/07/2017, 12:31:17 PM
    Author     : mq12
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib  uri = "http://java.sun.com/jsp/jstl/fmt"  prefix = "fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<head>
    
        <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>

        <script type="text/javascript" 
        src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>

        <script
        src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
</head>
   
        
<tiles:insertDefinition name="indexTemplate">
    <tiles:putAttribute name="body">
      <div id="indexLeft">

        </div>
        <div  id="indexCenter">
            <h3>¿Como jugar?</h3>
            
            <p>
                 Registre y crea un grupo
            </p>
                 
                  <img alt="" src="/resources/images/registro_1.png" class="indexImagen">
                  <p>
                Da de alta tu grupo. Hay dos tipos de grupos Liga MX y personalizada.
                    Liga Mx solo crea tu grupo y listo, todo será actualizado por un administrador.
                    Personalizada si creas una liga personalizada tu deberás  crear la quiniela y actualizar
                    los resultados de cada partido.
                  </p>
                      <img alt="" src="/resources/images/crearGrupo.png" class="indexImagen" >
                      <p>
                Dales a tus amigos el nombre del grupo y la contraseña. Pueden llenar su quiniela directamente 
                 en el inicio al momento de enviar les pedira el nombre del grupo y la contraseña o tambien pueden ingresar
                 previamente para poder jugar.
                      </p>
                   <img alt="" src="/resources/images/plantilla.png" class="indexImagen" >
                   <p>
                Para conecer los ganadores ingresa a grupo y en el apartado participantes o /quiniela/mi_grupo/participantes 
                   </p>
                <img alt="" src="/resources/images/participantes.png"  class="indexImagen">
                
                
           
            
            


           




        </div>
        <div  id="indexRight">

        </div>

    </tiles:putAttribute>
    </tiles:insertDefinition>
