
function ServerDisplay(Msg, Type) {

    if (Type == 1) {
        swal({
            title: "Success",
            text: Msg,
            confirmButtonColor: "#18A689",
            //timer: 5000,
        });
    }
    else if (Type == 2) {
        swal({
            title: "Error",
            text: Msg,
            confirmButtonColor: "#EC4758",
            timer: 5000,
        });
    }
    if (Type == 3) {
        swal({
            title: "Info",
            text: Msg,
            confirmButtonColor: "#1A7BB9",
            timer: 5000,
        });
    }
    if (Type == 4) {
        swal({
            title: "Warning",
            text: Msg,
            confirmButtonColor: "#F7A54A",
            timer: 5000,
        });
    }
}

function AppDisplayMessage(Message, Type) {

    var i = -1;
    var toastCount = 0;
    var $toastlast;
    var shortCutFunction = '';
    if (Type == '1') {
        shortCutFunction = 'success';
    }
    else if (Type == '2') {
        shortCutFunction = 'error';
    } else if (Type == '3') {
        shortCutFunction = 'info ';
    } else if (Type == '4') {
        shortCutFunction = 'warning';
    }
    // alert(shortCutFunction);
    var msg = Message;
    var title = '';
    var $showDuration = '400';
    var $hideDuration = '1000';
    var $timeOut = '7000';
    var $extendedTimeOut = '1000';
    var $showEasing = 'swing';
    var $hideEasing = 'linear';
    var $showMethod = 'fadeIn';
    var $hideMethod = 'fadeOut';
    var toastIndex = toastCount++;
    toastr.options = {
        closeButton: true,
        debug: false,
        progressBar: true,
        preventDuplicates: false,
        positionClass: 'toast-bottom-right',
        onclick: null
    };

    $("#toastrOptions").text("Command: toastr["
            + shortCutFunction
            + "](\""
            + msg
            + (title ? "\", \"" + title : '')
            + "\")\n\ntoastr.options = "
            + JSON.stringify(toastr.options, null, 2)
    );
    var $toast = toastr[shortCutFunction](msg, title); // Wire up an event handler to a button in the toast, if it exists
    $toastlast = $toast;
}