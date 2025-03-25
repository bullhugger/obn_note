"use strict";

var KTDatePicker = function() {
    var e, t;

    return {
        init: function() {
            (() => {
                $(".date-picker").flatpickr({
                    altInput: true,
                    altFormat: "d F, Y",
                    dateFormat: "Y-m-d"
                });
            })();
        }
    };
};

$(document).ready(function() {
    KTDatePicker.init();
});
