<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="ILogisticsApplication.Users.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>User Login</title>

    <link href="../Resource/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link href="../Resource/font-awesome/css/font-awesome.css" type="text/css" rel="stylesheet" />

    <link href="../Resource/css/animate.css" type="text/css" rel="stylesheet" />
    <link href="../Resource/css/style.css" type="text/css" rel="stylesheet" />
      <link href="../Resource/css/plugins/ladda/ladda-themeless.min.css" rel="stylesheet"/>
    <!-- Mainly scripts -->
    <script src="../Resource/js/jquery-2.1.1.js" type="text/javascript"></script>
    <script src="../Resource/js/LoginAuthentication.js" type="text/javascript"></script>
    <script src="../Resource/js/eduCareCommon.js"></script>
    <!-- Mainly scripts -->
    <!-- Ladda -->
    <script src="../Resource/js/plugins/ladda/spin.min.js"></script>
    <script src="../Resource/js/plugins/ladda/ladda.min.js"></script>
    <script src="../Resource/js/plugins/ladda/ladda.jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#txtUsername').focus();
            $('#btnSubmit').click(function (e) {
                Authentication();               
            });

        });
        var Authentication = function () {
            //var EndUser = GetParameterValues('EndUser');
            //if (EndUser != undefined) {
            //    if (EndUser == '1') {
            //        CheckAuthentication('ParentLoginCheck');
            //    } else if (EndUser == '2') {
            //        CheckAuthentication('StudentLoginCheck');
            //    }
            //} else {
                //CheckAuthentication('ParentLoginCheck');
               // $('#ErrorMsg').text('Please login through appropriate portal');
            //}
            CheckAuthentication('StudentParentLogin');
        }
        $("body").keypress(function (event) {
            if (event.which == 13) {
                Authentication();
            }
        });

        function ShowPwdMsg() {
            $('#ErrorMsg').text('Service is not currently available');
        }
    </script>
</head>
<body class="gray-bg">

    <div class="loginColumns">
        <div class="row">

            <div class="col-md-6">
                <h2 class="font-bold">Welcome to User Portal</h2>

               <p>
                   IEducare cloud is a school management software. It’s an Timetable manager, Fees manager, Academic manager,
                    ...
                    all in one bundle. So your people, academics, admissions, billing, scheduling, 
                    and communications all work together.
                </p>
                <p>
                     Your whole school can use it— Staff, faculty,
                    parents and students. And your information is more accessible and useful than ever.
                </p>
                <p>
                   Thanks for choosing IEducare cloud !!!
                </p>
            </div>
            <div class="col-md-6">
                <div class="ibox-content">

                    <div class="form-group">
                        <input type="text" class="form-control" id="txtUsername" value="PAR_11" tabindex="1" maxlength="20" placeholder="Username" />
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" id="txtPassword" value="142999" tabindex="2" maxlength="20" placeholder="Password" />
                    </div>
                     <button  type="submit" id="btnSubmit" tabindex="3"  class="ladda-button ladda-button-demo btn btn-primary btn btn-primary block full-width m-b" data-style="expand-left">
                        <span class="ladda-label">Login</span>
                        <span class="ladda-spinner"></span>
                    </button>
                  <%--  <button type="submit" id="btnSubmit" tabindex="3" class="btn btn-primary block full-width m-b">Login</button>--%>

                    <a href="#" onclick="ShowPwdMsg()">
                        <small>Forgot password?</small>
                    </a>

                    <p style="display: none" class="text-muted text-center">
                        <small>Do not have an account?</small>
                    </p>
                    <a style="display: none" class="btn btn-sm btn-white btn-block" href="register.html">Create an account</a>

                    <p class="m-t">
                        <small>
                            <label id="ErrorMsg" style="color: red"></label>
                        </small>
                    </p>
                </div>
            </div>
        </div>
        <hr />
        <div class="row">
            <div class="col-md-6">
                <asp:Label runat="server" Text="<%$ AppSettings: CopyRight %>" />                
            </div>
            <div class="col-md-6 text-right">
                <small>© <script>document.write(new Date().getFullYear());</script></small>
            </div>
        </div>
    </div>

</body>
</html>
