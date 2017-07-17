function initializeCharCount() {
    var text_max = 200;
    $('#post_feedback').html(0 + ' / ' + text_max);

    $('#postarea').keyup(function() {
        var text_length = $('#postarea').val().length;

        $('#post_feedback').html(text_length + ' / ' + text_max);
    });
};