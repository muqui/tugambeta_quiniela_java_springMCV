
$(function () {
    $('button[type=submit]').click(function (e) {
        
        // get the form values
    var username = $('#username').val();
    var email = $('#email').val();
    var form = $('#adduser');
        //Prevent default submission of form
      e.preventDefault();
      //Remove all errors
     //Remove all errors
      $('span').remove();
      $.ajax({
        type: "POST",
        url:  "/saveuser",
        //data: "username=" + username + "&email=" + email,
        data: form.serialize(),
            success: function(response){
            // we have the response
            if(response.status == "SUCCESS"){
               
             }else{
                //Set error messages
                 errorInfo = "";
                 for(i =0 ; i < response.result.length ; i++){
                    // errorInfo += "<br>" + (i + 1) +". " + ;
                     $('input[name='+response.result[i].field+']').after('<span class="error">'+response.result[i].code+'</span>');
                 }
                
             }
          
         },
         error: function(e){
             alert('Error: ' + e);
         }
    });
       
     
    });
});