<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="CourseSubjectMapping.aspx.cs" Inherits="ILogisticsApplication.Configuration.CourseSubjectMapping" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
    <style>
        .inlineCheckBox input[type="checkbox"] {
            margin-right: 10px;
        }

        .inlineCheckBox td {
            padding-left: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPanel" runat="server">
    <div class="wrapper wrapper-content fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Courses & Subject Mapping <small>Mapping courses and subjects</small></h5>
                        <div class="btn btn-sm btn-primary m-t-n-xs col-sm-2 pull-right">
                            <a class="collapse-link" style="font-family: open sans,Helvetica Neue,Helvetica,Arial,sans-serif;font-size: 13px;" href="ViewCourseSubjectMapping.aspx?MenuID=47">                                
                               <i class="fa fa-bars" style="color:white;"> View Mapping</i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div class="row">
                            <div class="col-sm-12" id="divEditable" style="margin-bottom: 5px">
                                <h4 style="text-align: center; color: #EC4758" id="headEditable"></h4>
                                <div class="form-group col-sm-3"></div>
                                <div class="form-group col-sm-3">
                                    <label>Course <span class="text-danger">*</span></label>
                                    <asp:DropDownList ID="ddlCourse" runat="server" CssClass="form-control ddlCourse" AutoPostBack="True" OnSelectedIndexChanged="ddlCourse_SelectedIndexChanged">
                                        <asp:ListItem>--Select--</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <asp:Panel ID="pnlAction" runat="server">
                                    <div class="form-group  col-sm-2" runat="server" id="divAction">
                                        <div style="height: 29px; text-align: right"></div>
                                        <asp:Button ID="btnSave" runat="server" Text="Assign" OnClientClick="if (!Validate()) {return false;}" OnClick="Save_Click" CssClass="btn btn-primary m-t-n-xs col-sm-8 btnSave" />
                                    </div>
                                    <div class="form-group  col-sm-2" runat="server" id="divAction1">
                                        <div style="height: 29px; text-align: left"></div>
                                        <asp:Button ID="btnClear" runat="server" Text="Clear Data" OnClick="Clear_Click" CssClass="btn btn-danger m-t-n-xs col-sm-8 btnClear" />
                                    </div>
                                </asp:Panel>
                                <div class="form-group col-sm-2"></div>
                            </div>
                        </div>

                        <div class="row" runat="server" id="divSection" style="border: 1px solid #F3F3F4; padding-top: 5px">
                            <div class="col-sm-12">
                                <div class="ibox">

                                    <h4 style="text-align: center; color: #676D7A" id="h1">Section List</h4>
                                    <asp:CheckBoxList ID="chkSection" CssClass="inlineCheckBox" RepeatDirection="Horizontal" RepeatColumns="8" runat="server"></asp:CheckBoxList>
                                </div>
                            </div>

                        </div>
                        <div class="row" runat="server" id="divSubject" style="border: 1px solid #F3F3F4; padding-top: 5px; margin-top: 25px">
                            <div class="col-sm-12">
                                <div class="ibox">

                                    <h4 style="text-align: center; color: #676D7A" id="h2">Subject List</h4>

                                    <asp:CheckBoxList ID="chkSubject" CssClass="inlineCheckBox" RepeatDirection="Horizontal" RepeatColumns="6" runat="server"></asp:CheckBoxList>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <div class="modal inmodal" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content animated bounceInDown">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <i class="fa fa-question-circle modal-icon"></i>
                    <h1 class="modal-title">Are you sure Do you want delete?</h1>

                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">Close</button>
                    <button class="btn btn-danger" id="btnDelete" runat="server" type="button" onserverclick="Save_Click"><strong>Delete</strong></button>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">

        function Validate() {
         var isValidSection = false;
         var isValidSubject = false;
         if ($('#<%=chkSection.ClientID %> input:checked').length > 0) {
             isValidSection = true;
         }
            if ($('#<%=chkSubject.ClientID %> input:checked').length > 0) {
                isValidSubject = true;
         }
         if (isValidSection == false || isValidSubject == false) {
             AppDisplayMessage('Please select atleast one section & subject', 2);
             return false;
         }
         else {
             return true;
         }
     }
    </script>
</asp:Content>
