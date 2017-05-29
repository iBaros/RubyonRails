$(document).ready(function () {
    
    var index_temp = -1;

    $(".accordion-toggle-styled").on('click', function () {
        var index = $(".accordion-toggle-styled").index(this);
        var $obj = $(".panel-collapse:eq("+index+")").slideToggle();
    });

    $(".button-next").on('click', function () {
        $("#tab3").removeClass("active");
        $("#tab4").addClass("active");
        $(".progress-bar-success").css("width", "100%");
    });

    $(".button-previous").on('click', function () {
        $("#tab4").removeClass("active");
        $("#tab3").addClass("active");
        $(".progress-bar-success").css("width", "50%");       
    });
});