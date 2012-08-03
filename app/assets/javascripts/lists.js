$(function() {
    $('.list ul').hide();
    $('.list a.show').toggle(function(){
        $(this).removeClass('icon-chevron-up').addClass('icon-chevron-down');
        $(this).siblings('ul').show();
    },
    function(){
        $(this).removeClass('icon-chevron-down').addClass('icon-chevron-up');
        $(this).siblings('ul').hide();
    });

    $('.create_task').click(function (){
        $(this).siblings('.icon-chevron-down').trigger('click');
    });
});
