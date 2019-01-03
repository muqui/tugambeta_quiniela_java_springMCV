<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>

<script type="text/javascript"  src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>

<script
src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>

<link href="<c:url value="/resources/css/estilo.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/normalize.css" />" rel="stylesheet">
<script src="/resources/js/validar.js" type="text/javascript"></script>
<script src="/resources/js/dynamic_list_helper.js" type="text/javascript"></script> <%-- Para crear Quiniela --%>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>JSP Page</title>
<script>
    $(document).ready(function () {
        $("#actquiniela").validate(
                {
                    rules: {
                        nombre: {
                            required: true,
                            minlength: 5
                        },
                        fechaTemporal: {
                            required: true,
                            minlength: 3

                        },
                        email: {
                            required: true,
                            email: true
                        },
                        password: {
                            required: true,
                            minlength: 8
                        },
                        passwordConfirm: {
                            required: true,
                            minlength: 8,
                            equalTo: "#password"
                        }
                    },
                    messages: {
                        nombre: {
                            required: "Nombre es requerido",
                            minlength: "Capture al menos 6 caracteres",
                            remote: "Nombre de usuario ya existe!"
                        },
                        fechaTemporal: {
                            required: "Fecha limite es requerido",
                            minlength: "Capture al menos 6 caracteres"
                        },
                        password: {
                            required: "Contraseña es requerido",
                            minlength: "Capture al menos 8 caracteres"
                        },
                        passwordConfirm: {
                            required: "Confirmacion de contraseña es requerido",
                            minlength: "Capture al menos 8 caracteres"

                        }
                    },
                    highlight: function (element) {
                        $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
                    },
                    unhighlight: function (element) {
                        $(element).closest('.form-group').removeClass('has-error').addClass('has-success');
                    }

                }


        );

    });


</script>
<tiles:insertDefinition name="templateadminadministrar">
    <tiles:putAttribute name="body">

        <h1>Editar quiniela</h1>

      
    </tiles:putAttribute>
</tiles:insertDefinition>
