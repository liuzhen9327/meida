$(function(){

    $('.x-ok-btn').click(function () {
        $('form').append('<input name="confirm" type="hidden" value="confirm"/>').submit();
    });
})