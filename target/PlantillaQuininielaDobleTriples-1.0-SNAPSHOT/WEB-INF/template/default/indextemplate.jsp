<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!doctype html>
<html >
    <head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet"> 
        
       
      
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
     
       
         <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>

        <script type="text/javascript" 
        src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>

        <script
        src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
        <title>Tugambeta</title>

    </head>
    <body class="" >

        <tiles:insertAttribute name="header" />
        <div class="">

            <tiles:insertAttribute name="body" />
        </div>
        <tiles:insertAttribute name="footer" />


    </body>
</html>