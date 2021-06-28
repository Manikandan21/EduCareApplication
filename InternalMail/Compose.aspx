<%@ Page Title="" Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage/AdminMaster.Master" ValidateRequest="false" CodeBehind="Compose.aspx.cs" Inherits="ILogisticsApplication.InternalMail.Compose" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPanel" runat="server">
    <div class="wrapper wrapper-content">
        <div class="row">
            <div class="col-lg-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-content mailbox-content">
                        <div class="file-manager">
                            <a class="btn btn-block btn-primary compose-mail" href="../InternalMail/Compose.aspx?MenuID=40">Compose Mail</a>
                            <div class="space-25"></div>
                            <h5>Folders</h5>
                            <ul class="folder-list m-b-md" style="padding: 0">
                                <li><a href="../InternalMail/Inbox.aspx?MenuID=41&Mode=Ibx" onclick="OnShow('inbox')"><i class="fa fa-inbox "></i>Inbox <span class="label label-warning pull-right" id="spnInboxCount"></span></a></li>
                                <li><a href="../InternalMail/Inbox.aspx?MenuID=41&Mode=Snt" onclick="OnShow('sent')"><i class="fa fa-envelope-o"></i>Send Mail</a></li>
                                <%--  <li><a href="../InternalMail/Inbox.aspx?MenuID=41&Mode=Imp" onclick="OnShow('important')"><i class="fa fa-certificate"></i>Important</a></li>
                                <li><a href="../InternalMail/Inbox.aspx?MenuID=41&Mode=Dft" onclick="OnShow('Draft')"><i class="fa fa-file-text-o"></i>Drafts <span class="label label-danger pull-right" id="spnDraftCount">2</span></a></li>--%>
                                <li><a href="../InternalMail/Inbox.aspx?MenuID=41&Mode=Tsh" onclick="OnShow('trash')"><i class="fa fa-trash-o"></i>Trash</a></li>
                            </ul>
                            <h5>Categories</h5>
                            <ul class="category-list" style="padding: 0">
                                <li><a href="#"><i class="fa fa-circle text-navy"></i>Parent </a></li>
                                <li><a href="#"><i class="fa fa-circle text-danger"></i>Student</a></li>
                                <li><a href="#"><i class="fa fa-circle text-primary"></i>Admin</a></li>
                                <li><a href="#"><i class="fa fa-circle text-info"></i>Class Teacher</a></li>
                                <%--<li><a href="#"><i class="fa fa-circle text-warning"></i>Clients</a></li>--%>
                            </ul>

                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-9 animated fadeInRight">
                <div class="mail-box-header">
                    <div class="pull-right tooltip-demo">
                        <button class="btn btn-sm btn-primary" id="Button1" runat="server" type="button" onclick="if (!Validate()) {return false;}" onserverclick="Save_Click"><i class="fa fa-reply"></i>Send</button>
                        <a onclick="OnDiscard()" class="btn btn-danger btn-sm" data-toggle="tooltip" data-placement="top" title="Discard email"><i class="fa fa-times"></i>Discard</a>
                        <%--  <button class="btn btn-white btn-sm" id="Button3" runat="server" type="button" onclick="if (!Validate()) {return false;}" onserverclick="Save_Click"><i class="fa fa-pencil"></i>Draft</button>--%>

                        <%-- <a href="mailbox.html" class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="Move to draft folder"><i class="fa fa-pencil"></i>Draft</a>
                        <a href="mailbox.html" class="btn btn-danger btn-sm" data-toggle="tooltip" data-placement="top" title="Discard email"><i class="fa fa-times"></i>Discard</a>--%>
                    </div>
                    <h2>Compse mail
                    </h2>
                </div>
                <div class="mail-box">


                    <div class="mail-body">

                        <div id="DivAdminRole" style="display: none">
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Receiver Role:</label>

                                    <div class="col-sm-6">
                                        <select class="form-control ddlReceiverRole" id="ddlReceiverRole" clientidmode="static" runat="server">
                                            <option value="0">--Select Role--</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Receiver:</label>

                                    <div class="col-sm-3">
                                        <select class="form-control ddlCourse" id="ddlCourse" clientidmode="static" runat="server">
                                            <option value="0">--Select Course--</option>
                                        </select>
                                    </div>
                                    <div class="col-sm-3">
                                        <select class="form-control ddlSection" id="ddlSection" clientidmode="static" runat="server">
                                            <option value="0">--Select Section--</option>
                                        </select>
                                    </div>
                                    <div class="col-sm-4">
                                        <select class="form-control ddlStudentName" id="ddlStudentName" clientidmode="static" runat="server">
                                            <option value="0">--Select Student--</option>
                                        </select>
                                    </div>
                                </div>

                            </div>
                        </div>


                        <%-- <form class="form-horizontal" method="get">--%>
                        <div id="DivParentRole" style="display: none">
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">To:</label>

                                    <div class="col-sm-6">
                                        <select class="form-control ddlReceiverRole" id="ddlRole" clientidmode="static" runat="server">
                                            <option value="0">--Select--</option>
                                        </select>
                                    </div>
                                    <div class="col-sm-4"></div>
                                </div>

                            </div>
                        </div>
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Subject:</label>

                                <div class="col-sm-10">
                                    <input type="text" class="form-control txtSubject" id="txtSubject" runat="server" value="" />
                                </div>
                            </div>
                        </div>
                        <%--   </form>--%>
                    </div>

                    <div class="mail-text h-200">

                        <div class="summernote" id="DivMessageBody" runat="server">
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="mail-body text-right tooltip-demo">
                        <button class="btn btn-sm btn-primary" id="btnSubmitUp" runat="server" type="button" onclick="if (!Validate()) {return false;}" onserverclick="Save_Click"><i class="fa fa-reply"></i>Send</button>
                        <a onclick="OnDiscard()" class="btn btn-danger btn-sm" data-toggle="tooltip" data-placement="top" title="Discard email"><i class="fa fa-times"></i>Discard</a>
                        <%--<button class="btn btn-white btn-sm" id="Button2" runat="server" type="button" onclick="if (!Validate()) {return false;}" onserverclick="Save_Click"><i class="fa fa-pencil"></i>Draft</button>--%>
                    </div>
                    <div class="clearfix"></div>



                </div>
            </div>
        </div>
    </div>
    <input type="hidden" id="HdnReceiverRole" runat="server"/>
    <input type="hidden" id="HdnStudentName" runat="server"/>
    <input type="hidden" id="hdnCourse" runat="server"/>
    <input type="hidden" id="hdnMessageBody" runat="server"/>
  


    <script type="text/javascript">
        var IsAdminRole = '<%=Convert.ToString(Session["IsAdminRole"]) %>';
        $(document).ready(function () {
            if (IsAdminRole == 'True') {
                BindDropdown('NonAdminRoles', null, 0, '#ddlReceiverRole');
                BindDropdown('GetCourse', null, 0, '#ddlCourse');
                $('#DivAdminRole').show();
                $('#DivParentRole').hide();
            } else {
                BindDropdown('AdminMailRoles', null, 0, '#ddlRole');
                $('#DivParentRole').show();
                $('#DivAdminRole').hide();
            }

            $('#divTitle').hide();
            $('.summernote').summernote();

        });
        var edit = function () {
            $('.click2edit').summernote({ focus: true });
        };
        var save = function () {
            var aHTML = $('.click2edit').code(); //save HTML If you need(aHTML: array).
            $('.click2edit').destroy();
        };
        $(".ddlCourse").change(function () {
            var Course = $(this).find("option:selected").text();
            $("#<%=hdnCourse.ClientID %>").val(Course);
          //  $("#hdnCourse").val(Course);
            BindDropdown('GetSection', Course, 0, '#ddlSection');
        });
        $(".ddlSection").change(function () {
            var Std = $("#<%=hdnCourse.ClientID %>").val();
            var Section = $(this).find("option:selected").text();
            if ($(this).find("option:selected").val() > 0) {
                BindDropdown('DdlStudent', Std, Section, '#ddlStudentName');
            }
        });
        $(".ddlStudentName").change(function () {            
            var Name = $(this).find("option:selected").val();
            if (Name > 0) {
                $("#<%=HdnStudentName.ClientID %>").val(Name);
            }
        });
        $(".ddlReceiverRole").change(function () {
            
            var Role = $(this).find("option:selected").val();
           // alert(Role);
            if (Role > 0) {
                $("#<%=HdnReceiverRole.ClientID %>").val(Role);
            }
        });
       
        
        function Validate() {
        
            if (IsAdminRole == 'False') {
                var Role = $('.ddlRole').val();
                var message = $('.note-editable').html();
                $("#<%=hdnMessageBody.ClientID %>").val(message);
                if (Role == 0) {
                    AppDisplayMessage("Please select the Receiver", 2);
                    return false;
                }else if ($('.txtSubject').val() == "") {
                    AppDisplayMessage("Subject can not be blank", 2);
                    return false;
                } else if (message.length <= 40) {
                    AppDisplayMessage("Message can not be blank (Min 50 characters)", 2);
                    return false;
                } else {
                    return true;
                }
            } else {
                var message = $('.note-editable').html();
                $("#<%=hdnMessageBody.ClientID %>").val(message);
                
                if ($('.ddlReceiverRole').val() == 0) {
                    AppDisplayMessage("Please select the Role", 2);
                    return false;
                }
                else if ($('.ddlStudentName').val() == 0) {
                    AppDisplayMessage("Please select the Student Name", 2);
                    return false;
                }
                else if ($('.txtSubject').val() == "" ) {
                    AppDisplayMessage("Subject can not be blank", 2);
                    return false;
                } else if (message.length <= 40) {
                    AppDisplayMessage("Message can not be blank (Min 50 characters)", 2);
                    return false;
                }
                else {
                    return true;
                }
            }

           // return true;
        }

        function OnDiscard()
        {
            $("#<%=HdnReceiverRole.ClientID %>").val("");
            $("#<%=HdnStudentName.ClientID %>").val("");
            $("#<%=hdnCourse.ClientID %>").val("");
            $("#<%=hdnMessageBody.ClientID %>").val("");
            $("#<%=txtSubject.ClientID %>").val("");
            $("#<%=ddlRole.ClientID %>").val(0);
            $("#<%=ddlStudentName.ClientID %>").val(0);
            $("#<%=ddlSection.ClientID %>").val(0);
            $("#<%=ddlCourse.ClientID %>").val(0);
            $("#<%=ddlReceiverRole.ClientID %>").val(0);
            $('.note-editable').html("")
            return false;
        }
    </script>
</asp:Content>

