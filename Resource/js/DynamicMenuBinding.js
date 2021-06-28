

function BindMenuData(Mode) {
    try {
        var JsonData = [];
        //Get Json Data from Server
        var Request = new XMLHttpRequest();
        var url = '../handlers/masters.ashx?Mode=MenuDetails&GetDataMode=getmenu&Id=0';
        Request.open("GET", url, false);
        Request.send();
        var DataString = Request.responseText;
        if (DataString != undefined) {
            Data = jQuery.parseJSON(DataString);
            var html = '';
            $.each(Data, function (index, PARAM) {
                if (Data[index].ListMenu.length > 0) {
                    html += '<li id=MenuList' + Data[index].MenuId + ' class=>';
                    html += '<a href=' + Data[index].Url + ' onclick=OpenSubmenu(' + Data[index].MenuId + ')><i class="' + Data[index].ClassName + '"></i> <span class=nav-label>' + Data[index].MenuName + '</span> <span class="fa arrow"></span></a>';
                    html += '<ul id=SecondLevelMenu' + Data[index].MenuId + ' class="nav nav-second-level collapse">';
                    for (var i = 0; i < Data[index].ListMenu.length; i++) {
                        //  alert(Data[index].ListMenu[i].MenuName); + Data[index].ListMenu[i].url +
                        html += '<li><a href=' + Data[index].ListMenu[i].Url + '>' + Data[index].ListMenu[i].MenuName + '</a></li>';
                    }
                    html += '</ul>';
                    html += '</li>';
                }
                else {
                    html += '<li>';
                    html += '<a href=' + Data[index].Url + '><i class="' + Data[index].ClassName + '"></i> <span class=nav-label>' + Data[index].MenuName + '</span> <span class=""></span></a>';
                    html += '</li>';
                }
            }
                );
        }
        else {
        }
        $('#side-menu').append(html);
    }
    catch (e) {
        alert(e.message);
    }
}

function OpenSubmenu(id) {
    var elementid = $('.active').attr('id');
    var SubElementId = $('.mmTransitionEnd').attr('id');

    if ($('#MenuList' + id).hasClass("active")) {

        $('#MenuList' + id).removeClass("active");
        $('#MenuList' + id).addClass("");
        $('#SecondLevelMenu' + id).removeClass("collapse in mmTransitionEnd");
        $('#SecondLevelMenu' + id).addClass("collapse");
    }
    else {
        if (elementid != 'undefined') {
            $('#' + elementid).removeClass("active");
            $('#' + elementid).addClass("");
            $('#' + SubElementId).removeClass("collapse in mmTransitionEnd");
            $('#' + SubElementId).addClass("collapse");
        }
        $('#MenuList' + id).addClass("active");
        $('#SecondLevelMenu' + id).addClass("collapse in mmTransitionEnd");
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
        } else {

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


}
