/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/*Dropdown sidebar Function*/
function sideBarDropdown(id) {
    var element = document.getElementsByClassName(id);
    var stringmanager = id.split('-');
    var dropdown_btn = "." + stringmanager[1];
    $(dropdown_btn + ' .fa-angle-left').toggleClass("down");
    if ($(dropdown_btn + ' #arrow').hasClass('down')) {
        $("." + id).addClass('show');
    } else {
        $("." + id).removeClass('show');
    }
}
/*Validation Function*/
$.validator.addMethod("validateDate", function (value, element) {
    return this.optional(element) || /^(\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01]))$/i.test(value);
}, "Must be dd/mm/yyyy format");

$.validator.addMethod("validateEmail", function (value, element) {
    return this.optional(element) || /^[a-zA-Z0-9]+@[a-zA-Z0-9]+.[a-zA-Z]+.[a-zA-Z]+$/i.test(value);
}, "Must be asd@asd.asd format");

$.validator.addMethod("validateTime", function (value, element) {
    return this.optional(element) || /^([0-1]?[0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9]$/i.test(value);
}, "Must be hh:mm:ss format");

$.validator.addMethod('dateBefore', function (value, element, params) {
    // if end date is valid, validate it as well
    var end = $(params);
    if (!end.data('validation.running')) {
        $(element).data('validation.running', true);
        setTimeout($.proxy(
                function () {
                    this.element(end);
                }, this), 0);
        // Ensure clearing the 'flag' happens after the validation of 'end' to prevent endless looping
        setTimeout(function () {
            $(element).data('validation.running', false);
        }, 0);
    }
    return this.optional(element) || this.optional(end[0]) || new Date(value) < new Date(end.val());

}, 'Must be before corresponding end date');

$.validator.addMethod('dateAfter', function (value, element, params) {
    // if start date is valid, validate it as well
    var start = $(params);
    if (!start.data('validation.running')) {
        $(element).data('validation.running', true);
        setTimeout($.proxy(
                function () {
                    this.element(start);
                }, this), 0);
        setTimeout(function () {
            $(element).data('validation.running', false);
        }, 0);
    }
    return this.optional(element) || this.optional(start[0]) || new Date(value) > new Date($(params).val());

}, 'Must be after corresponding start date');

$.validator.addMethod("greaterThanToday", function (value) {
    var datetime = value;
    var date = new Date();
    var parts = datetime.split('-');
    var day = parseInt(parts[2]);
    var month = parseInt(parts[1]);
    var year = parseInt(parts[0]);
    var maxyear = date.getFullYear();
    var maxDay = date.getDate();
    var maxMonth = date.getMonth() + 1;
    var enteredDate = new Date(year, month, day);
    var maxDate = new Date(maxyear, maxMonth, maxDay);
    if (enteredDate < maxDate) {
        isValid = true;
    } else {
        isValid = false;
    }
    return isValid;
}, "Cannot exceed Current date");

$.validator.addMethod("smallerThanToday", function (value) {
    var datetime = value;
    var date = new Date();
    var parts = datetime.split('-');
    var day = parseInt(parts[2]);
    var month = parseInt(parts[1]);
    var year = parseInt(parts[0]);
    var maxyear = date.getFullYear();
    var maxDay = date.getDate();
    var maxMonth = date.getMonth() + 1;
    var enteredDate = new Date(year, month, day);
    var maxDate = new Date(maxyear, maxMonth, maxDay);
    if (enteredDate >= maxDate) {
        isValid = true;
    } else {
        isValid = false;
    }
    return isValid;
}, "Cannot before date of Current Date");
/*Form validation Function*/
$().ready(function () {
    $("#form").validate({
        onfocusout: false,
        onkeyup: false,
        onclick: false,
        rules: {
            /*Validation for Employee Form*/
            "name": {
                required: true,
                maxlength: 50
            },
            "phone": {
                required: true,
                number: true,
                maxlength: 10
            },
            "birthdate": {
                required: true,
                validateDate: true,
                greaterThanToday: true
            },
            "email": {
                validateEmail: true
            },
            "account": {
                required: true,
                maxlength: 50
            },
            "password": {
                required: true,
                maxlength: 20
            },
            /*Validation for Trip Form*/
            "destination": {
                required: true,
                maxlength: 50
            },
            "departureTime": {
                required: true,
                validateTime: true
            },
            "driver": {
                required: true,
                maxlength: 11
            },
            "carType": {
                required: true,
                maxlength: 50
            },
            "maximumOnlineTicketNumber": {
                required: true,
                number: true,
                maxlength: 50
            },
            "departureDate": {
                required: true,
                validateDate: true,
                smallerThanToday: true
            },
            /*Validation for Booking Form*/
            "officeName": {
                required: true,
                maxlength: 50
            },
            "tripId": {
                required: true
            },
            "officePhone": {
                required: true,
                number: true,
                maxlength: 11
            },
            "officePlace": {
                required: true
            },
            "officePrice": {
                required: true,
                number: true,
                maxlength: 20
            },
            "startContractDeadline": {
                required: true,
                validateDate: true,
                dateBefore: '#endDate'
            },
            "endContractDeadline": {
                required: true,
                validateDate: true,
                dateAfter: '#startDate'
            },
            /*Validation for Parking Lot Form*/
            "parkName": {
                required: true,
                maxlength: 50
            },
            "parkPlace": {
                required: true
            },
            "parkArea": {
                required: true,
                number: true,
                maxlength: 50
            },
            "parkPrice": {
                required: true,
                number: true,
                maxlength: 10
            },
            /*Validation for Car Form*/
            "licensePlate": {
                required: true,
                maxlength: 50
            },
            "company": {
                required: true
            },
            "parkId": {
                required: true
            }
        },
        highlight: function (element) {
            $(element).addClass('has-error');
        },
        unhighlight: function (element) {
            $(element).removeClass('has-error');
        },
        errorPlacement: function (error, element) {
            var a = element.parent();
            if (a[0].nodeName === "DIV") {
                error.appendTo(element.parent().parent().next());
            } else {
                error.appendTo(element.parent().next());
            }
        }
    });
});
/*Reset button function*/
function resetfunction() {
    $("#form").validate().resetForm();
}

/*Pagination function*/
$(document).ready(function () {
    if ($('.tablesearch table')[0]) {
        $('.tablesearch table').DataTable({
            "ordering": false,
            "info": false,
            "searching": false,
            "pageLength": 10,
            "lengthChange": false,
            "pagingType": "simple_numbers"
        });
    }
});
/*Delele confirmation function*/
function confirm_del() {
    if (!confirm('Are you sure you want do delete this item ?')) {
        return false;
    }
}

function delete_btn(link) {
    if (confirm('Are you sure you want do delete this item ?')) {
        window.location.href = link;
    }
}