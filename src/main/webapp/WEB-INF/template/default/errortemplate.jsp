<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!doctype html>
<html>
    <head>
        <meta charset="UTF-8">    
        <meta name="viewport" content="widht=device-widht, initial-scale=1, maximum-scala=1">
        <link href="<c:url value="/resources/css/estilo.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/css/normalize.css" />" rel="stylesheet">
        <link href='https://fonts.googleapis.com/css?family=Candal' rel='stylesheet' type='text/css'>
        <link href="<c:url value="/resources/css/footable.core.css" />" rel="stylesheet">
        <script src="/js/modernizr-custom.js"></script>   
        <link href="<c:url value="/resources/css/estilo.css" />" rel="stylesheet">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
        <script src="js/dynamic_list_helper.js" type="text/javascript"></script>
        <script src="resources/js/dynamic_list_helper.js" type="text/javascript"></script>
        <title>Chapu Quinielas</title>

    </head>
    <body>
        <div class="page">
            
            <div class="content">

                <tiles:insertAttribute name="body" />
            </div>
            <tiles:insertAttribute name="footer" />
        </div>
    </body>
</html>