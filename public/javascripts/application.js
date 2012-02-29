//Place your application-specific JavaScript functions and classes here
//This file is automatically included by javascript_include_tag :defaults

$(document).ready(function () {
    $("#employee_id").bind("change", function () {
        if ($(this).val() == "3") {
            $("#pro1").slideDown();
            $("#pro2").slideUp();
        }
        else if($(this).val() =="2") {
            $("#pro2").slideDown();
            $("#pro1").slideUp();
        }
    });
});