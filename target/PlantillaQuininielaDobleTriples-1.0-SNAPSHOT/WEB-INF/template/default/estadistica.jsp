<%-- 
    Document   : estadistica
    Created on : 16/12/2016, 01:51:24 PM
    Author     : mq12
--%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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


        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <meta charset="UTF-8">    
        <meta name="viewport" content="widht=device-widht, initial-scale=1, maximum-scala=1">
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <!-- Autocompleta-->
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
        <script src="http://cdn.jsdelivr.net/jquery.validation/1.15.0/jquery.validate.min.js"></script>
        <script src="http://cdn.jsdelivr.net/jquery.validation/1.15.0/additional-methods.min.js"></script>  
      


        <link href="<c:url value="/resources/css/normalize.css" />" rel="stylesheet">
        <link href='https://fonts.googleapis.com/css?family=Candal' rel='stylesheet' type='text/css'>
        <link href="<c:url value="/resources/css/footable.core.css" />" rel="stylesheet">
        <script src="/js/modernizr-custom.js"></script>   
        
        <script src="<c:url value="/resources/js/estadistica_alta_partido.js"/>"></script> 
        <title>Estadisticas Futbol</title>

    </head>
    <body>
        <div class="pagewrap">
            <tiles:insertAttribute name="encabezado" />
            <tiles:insertAttribute name="izquierdo" />
            <div class="content">
                <tiles:insertAttribute name="informacion" />
            </div>
            <tiles:insertAttribute name="derecho" />
            <tiles:insertAttribute name="pie" />
        </div>
    </body>
</html>