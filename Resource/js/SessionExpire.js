var redirectURL = '../Login.aspx';
//var IsAdminRole = '<%=Convert.ToString(Session["IsAdminRole"]) %>';

//if (IsAdminRole !== "True") {
//    redirectURL = '../Users/Login.aspx'
//} else {
//    redirectURL = '../Login/AdminLogin.aspx'
//}
//  setTimeout(TimeOut, _displayTimeInMiliSec);
function Timer(_displayTimeInMiliSec) {
    setTimeout(TimeOut, _displayTimeInMiliSec);
}

function TimeOut() {
    $.timeoutDialog({
        timeout: 1,
        countdown: 60,
        keep_alive_url: window.location.pathname,
        logout_url: '../Handlers/SessionExtend.ashx?Mode=Logout',
        logout_redirect_url: redirectURL,
        restart_on_yes: true
    });
}