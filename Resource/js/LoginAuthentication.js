
function CheckAuthentication(Mode) {
    try {
       
        var uid = $('#txtUsername').val();
        var pwd = $('#txtPassword').val();
        //var uid = document.getElementById('txtUsername');
        //var pwd = document.getElementById('txtPassword');
        if (uid != '' && pwd != '') {
            var l = $('.ladda-button-demo').ladda();
            l.ladda('start');
            var Message = '';
            $.ajax({
                type: "POST",
                url: "../Handlers/LoginAuthenticate.ashx?Mode=" + Mode + "&Uid=" + uid + "&pwd=" + pwd + "",
                contentType: "text/plain",
                processdata: true,
                async: false,
                success: function (data) {
                    Message = data;
                }
            });
            
            if ((Message.indexOf("Alert") != -1)) {
                //alert(Message);
                if (Message == 'Alert: Username does not belongs to any Account') {
                    $('#txtUsername').val('');
                    $('#txtPassword').val('');
                }
                else {
                    $('#txtPassword').val('');
                }

                $('#ErrorMsg').text(Message);
                l.ladda('stop');
                return false;
            }
            else {
                var RedirectUrl = GetParameterValues('RedirectUrl');

                if (RedirectUrl != undefined) {
                    RedirectUrl = decodeURIComponent(RedirectUrl);
                    window.location.href = '..' + RedirectUrl;
                }
                else {
                    if (Mode == 'ParentLoginCheck' || Mode == 'StudentLoginCheck') {
                        if (Message == null || Message == undefined || Message == '') {
                            window.location.href = '../Users/Dashboard.aspx?MenuID=83';
                        } else {
                            window.location.href = Message;
                        }
                    } else {
                        window.location.href = Message;
                    }
                    
                }
               
            }
        }
        else {
            $('#ErrorMsg').text('Username and Password can not be Empty');
            return false;
        }
    } catch (e) {
        alert(e);
    }

}

