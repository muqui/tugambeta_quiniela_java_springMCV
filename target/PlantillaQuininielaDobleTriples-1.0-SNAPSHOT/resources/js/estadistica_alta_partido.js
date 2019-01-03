
$(document).ready(function () {

    $('#saveteam').submit(function (e) {

        $.post('/altaequipo', $(this).serialize(), function(contact) {
        	
               $("#mensajepartido").html(contact);
            alert('Local: ' + contact);


        });
        e.preventDefault();
    });

});



