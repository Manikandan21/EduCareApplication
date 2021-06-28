<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="ILogisticsApplication.LandingPage.ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPanel" runat="server">
    <div class="wrapper wrapper-content fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Manage your Password information</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div class="row" style="height: auto">
                            <div class="col-sm-12" id="divEditable1" style="margin-bottom: 5px">
                                <h4 style="text-align: center; color: #EC4758" id="headEditable1"></h4>
                                <div class="form-group col-sm-4">
                                </div>
                                <div class="form-group col-sm-4">
                                    <label>Old Password *</label>
                                    <asp:TextBox ID="txtOldPawd" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group col-sm-4">
                                </div>
                            </div>
                        </div>
                        <div class="row" style="height: auto">
                            <div class="col-sm-12" id="divEditable2" style="margin-bottom: 5px">
                                <h4 style="text-align: center; color: #EC4758" id="headEditable2"></h4>
                                <div class="form-group col-sm-4">
                                </div>
                                <div class="form-group col-sm-4">
                                    <label>New Password *</label>
                                    <asp:TextBox ID="txtNewPawd" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group col-sm-4">
                                    <p><b>Note</b> : The new password should have 8 charecters, Atleast one number between(0-9), One upper case(A-Z). And one lower case(a-z).
                                     </p>
                                </div>
                            </div>
                        </div>
                        <div class="row" style="height: auto">
                            <div class="col-sm-12" id="divEditable3" style="margin-bottom: 5px">
                                <h4 style="text-align: center; color: #EC4758" id="headEditable3"></h4>
                                <div class="form-group col-sm-4">
                                </div>
                                <div class="form-group col-sm-4">
                                    <label>Confirm New Password *</label>
                                    <asp:TextBox ID="txtConfNewPwd" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group col-sm-4">
                                    <%--<p>Must match with new password.</p>--%>
                                </div>
                            </div>
                        </div>
                        <div class="row" style="height: auto">
                            <div class="col-sm-4"></div>
                            <div class="col-sm-4" id="divEditable4" style="margin-bottom: 5px">
                                <h4 style="text-align: center; color: #EC4758" id="headEditable4"></h4>

                                <div class="form-group col-sm-6">
                                    <asp:Button ID="btnChange" runat="server" Text="Save" CssClass="btn btn-primary m-t-n-xs col-sm-8 btnChange" />
                                </div>
                                <div class="form-group col-sm-6">
                                    <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn btn-danger m-t-n-xs col-sm-8 btnReset" />
                                </div>

                            </div>
                            <div class="col-sm-4"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".btnReset").click(function () {
                $("#<%=txtOldPawd.ClientID %>").val("");
                $("#<%=txtNewPawd.ClientID %>").val("");
                $("#<%=txtConfNewPwd.ClientID %>").val("");
                return false;
            })
            $(".btnChange").click(function () {
                var oldPaswrd = $("#<%=txtOldPawd.ClientID %>").val();
                var NewPaswrd = $("#<%=txtNewPawd.ClientID %>").val();
                var ConfNewPaswrd = $("#<%=txtConfNewPwd.ClientID %>").val();

                if (oldPaswrd == undefined || oldPaswrd == null || oldPaswrd.trim() == "") {
                    AppDisplayMessage("Please enter the old password, Also please check all the mandatory fields.", 2);
                    return false;
                }
                if (NewPaswrd == undefined || NewPaswrd == null || NewPaswrd.trim() == "") {
                    AppDisplayMessage("Please enter the new password, Also please check all the mandatory fields.", 2);
                    return false;
                }

                if (ConfNewPaswrd == undefined || ConfNewPaswrd == null || ConfNewPaswrd.trim() == "") {
                    AppDisplayMessage("Please enter the confirm new password, Also please check all the mandatory fields.", 2);
                    return false;
                }

                if (NewPaswrd.length >= 8) {
                    //var regex = new RegExp("/^.*(?=.{8,})(?=.*\d)(?=.*[a-z]).*$/");
                    var regex = /(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).*$/;
                    if (!regex.test(NewPaswrd)) {
                        //AppDisplayMessage("Please check the new password constraints. Atleast 1 charecter or 1 number should be in password.", 2);
                        AppDisplayMessage("Password strength is very week. Please check the new password constraints.", 2);
                        return false;
                    }
                }
                else {
                    AppDisplayMessage("The password must contains 8 charecter.", 2);
                    return false;
                }
                if (NewPaswrd.length != ConfNewPaswrd.length) {
                    AppDisplayMessage("Didn't match new password and confirm password.", 2);
                    return false;
                }
                else if (NewPaswrd != ConfNewPaswrd) {
                    AppDisplayMessage("Didn't match new password and confirm password.", 2);
                    return false;
                }

                //call the ajax method to pass the information.

                var RoleId = '<%=Convert.ToString(Session["RoleId"]) %>';
                var UserName = '<%=Convert.ToString(Session["UserName"]) %>';
                var Request = new XMLHttpRequest();
                var url = '../Handlers/ChangePassword.ashx?RoleID=' + RoleId + '&OldPassword=' + oldPaswrd + '&NewPassword=' + NewPaswrd + '&UserName=' + UserName ;
                Request.open("POST", url, false);
                Request.send();
                var Data = Request.responseText;
                if (Data != undefined) {
                    //Data = jQuery.parseJSON(Data);
                    var msg = "";
                    var msgCode;

                    if (Data == 0) {
                        msg = "Something went wrong. Please conatct administrator.";
                        msgCode = 2;
                    }
                    if (Data == 1) {
                        msg = "Password changed successfully.";
                        msgCode = 1;
                    }
                    if (Data == 2) {
                        msg = "Your old password is incorrect.";
                        msgCode = 2;
                    }
                    AppDisplayMessage(msg, msgCode);
                    $(".btnReset").click();
                    return false;
                }
            });
        });
    </script>
</asp:Content>
