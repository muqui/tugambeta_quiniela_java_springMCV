<%-- 
    Document   : indexadmingrupo
    Created on : 14/07/2017, 07:23:09 PM
    Author     : mq12
--%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!doctype html>
<html>
   
    <body>
        <div class="page">
            <tiles:insertAttribute name="header" />
            <div class="content">

                <tiles:insertAttribute name="body" />
            </div>
            <tiles:insertAttribute name="footer" />
        </div>
    </body>
</html>