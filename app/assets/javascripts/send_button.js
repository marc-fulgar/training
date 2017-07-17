function initializeSendButton(){
    $('.sendButton').attr('disabled',true);
    
    $('#postarea').keyup(function(){
        if($(this).val().length !=0){
            $('.sendButton').attr('disabled', false);
        }
        else
        {
            $('.sendButton').attr('disabled', true);        
        }
    })
};