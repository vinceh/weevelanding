//= require jquery

$(window).load( function() {
    var field = $(".subscribe-form-field");

    field.css("color", "#aaa");
    field.val('Your email');

    var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;

    $(".subscribe-submit").click( function() {

        if ( !emailPattern.test(field.val()) ) {
            alert("Please type in a valid email");
            return false;
        }

    });

    field.bind({

        focusin: function() {
            $(this).css("color", "#444");
            if ( $(this).val() == 'Your email')
                $(this).val("");
        },

        focusout: function() {
            $(this).css("color", "#aaa");
            if ( $(this).val() == '')
                $(this).val("Your email");
        }
    });

    $(".flash-close").live( "click", function() {
        $(".flash-msg-wrap").remove();
    });
});
