<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!doctype html>
<html  >
     <head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <meta name="viewport" content="width=device-width, initial-scale=1">
       <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet"> 
    
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="icon" href='<c:url value="/resources/images/t.png" />' type="image/x-icon">
        
        <title>Tugambeta</title>

    </head>
    <body>
        <div class="uk-offcanvas-content">
        <div class="page">
            <tiles:insertAttribute name="header" />
            <div class="content">

                <tiles:insertAttribute name="body" />
            </div>
            <tiles:insertAttribute name="footer" />
        </div>
        </div>
    </body>
</html>