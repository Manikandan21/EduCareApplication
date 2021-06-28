<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="InOutManagement.aspx.cs" Inherits="ILogisticsApplication.Attendance.InOutManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link href="../Resource/css/AjaxCalender.css" rel="stylesheet" />
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPanel" runat="server">


    <ajax:ToolkitScriptManager ID="ScriptManager1" EnableScriptGlobalization="true" EnableScriptLocalization="true"
        EnablePartialRendering="true" runat="server" />
    <asp:UpdatePanel ID="updatePanel" runat="server">
        <ContentTemplate>

            <div class="wrapper wrapper-content fadeInRight">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5 id="hTag">In-Out Management <small>manage IN-OUT details</small></h5>
                                <div class="">
                                    <a class="btn btn-sm btn-primary m-t-n-xs col-sm-2 pull-right" style="font-family: open sans,Helvetica Neue,Helvetica,Arial,sans-serif; font-size: 13px;" id="aHomework">
                                        <i class="fa fa-bars" style="color: white;" id="iHomework">View Details</i>
                                    </a>
                                </div>
                            </div>
                            <div class="ibox-content">

                                <asp:Panel ID="pnlAction" runat="server">
                                    <div class="row">
                                        <div class="col-sm-12" id="divEditable" style="margin-bottom: 5px">
                                            <h4 style="text-align: center; color: #EC4758" id="headEditable"></h4>

                                            <div class="form-group col-sm-2">
                                                <label>Course <span class="text-danger">*</span></label>
                                                <asp:DropDownList ID="ddlCourse" runat="server" CssClass="form-control ddlCourse" AutoPostBack="True" OnSelectedIndexChanged="ddlCourse_SelectedIndexChanged">
                                                    <asp:ListItem>--Select--</asp:ListItem>
                                                </asp:DropDownList>

                                            </div>
                                            <div class="form-group  col-sm-2">
                                                <label>Section <span class="text-danger">*</span></label>
                                                <asp:DropDownList ID="ddlSection" runat="server" CssClass="form-control ddlSection" AutoPostBack="true" OnSelectedIndexChanged="ddlSection_SelectedIndexChanged">
                                                    <asp:ListItem>--Select--</asp:ListItem>
                                                </asp:DropDownList>

                                            </div>
                                            <div class="form-group col-sm-3">
                                                <label>Student Name<span class="text-danger">*</span></label>
                                                <asp:DropDownList ID="ddlStudent" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlStudent_SelectedIndexChanged">
                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="form-group col-sm-2">
                                                <label>Type<span class="text-danger">*</span></label>
                                                <asp:DropDownList ID="ddlType" runat="server" CssClass="form-control" AutoPostBack="false">
                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                    <asp:ListItem Value="1">Late Comer's</asp:ListItem>
                                                    <asp:ListItem Value="2">Early Out</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div id="Div1" class="form-group  col-sm-3" runat="server">
                                                <div style="height: 29px"></div>

                                                <asp:Button ID="btnGet" runat="server" Text="Create" OnClientClick="if (!Validate()) {return false;}" OnClick="btnGet_Click" CssClass="btn btn-primary m-t-n-xs col-sm-8 btnGetData" />

                                            </div>

                                        </div>

                                    </div>
                                </asp:Panel>

                                <asp:Panel ID="pnlMngt" runat="server">
                                    <div class="row border">
                            <div class="col-sm-12" id="divEdit" style="margin-bottom: 5px">

                                <div class="form-group col-lg-12">
                                     <label class="col-lg-3 control-label">In / Out Time <span class="text-danger">*</span></label>
                                     <div class="col-lg-4">
                                    <div class="input-group date divDate">
                                    <span class="input-group-addon" id="spnStart"><i class="fa fa-calendar"></i></span>
                                    <asp:TextBox ID="txtStartDate"  ReadOnly="true" style="height:30px;width:150px"  runat="server" class="form-control" />
                                    <ajax:CalendarExtender ID="CalendeStartDate" runat="server" BehaviorID="Calendar1"
                                                            OnClientHidden="calendarhidden1" Format="dd/MM/yyyy" CssClass="black" TargetControlID="txtStartDate"
                                                            PopupButtonID="spnStart" />
                                        </div>
                                    </div>
                                     <div class="col-lg-3">
                                    <select id="ddlStartTime" runat="server" style="height:29px">
                                        <option value="0">--Select Time--</option>
                                        <option value="06:00">06:00</option>
                                        <option value="06:30">06:30</option>
                                        <option value="07:00">07:00</option>
                                        <option value="07:30">07:30</option>
                                        <option value="08:00">08:00</option>
                                        <option value="08:30">08:30</option>
                                        <option value="09:00">09:00</option>
                                        <option value="09:30">09:30</option>
                                        <option value="10:00">10:00</option>
                                        <option value="10:30">10:30</option>
                                        <option value="11:00">11:00</option>
                                        <option value="11:30">11:30</option>
                                        <option value="12:00">12:00</option>
                                        <option value="12:30">12:30</option>
                                        <option value="13:00">13:00</option>
                                        <option value="13:30">13:30</option>
                                        <option value="14:00">14:00</option>
                                        <option value="14:30">14:30</option>
                                        <option value="15:00">15:00</option>
                                        <option value="15:30">15:30</option>
                                        <option value="16:00">16:00</option>
                                        <option value="16:30">16:30</option>
                                        <option value="17:00">17:00</option>
                                        <option value="17:30">17:30</option>
                                        <option value="18:00">18:00</option>
                                        <option value="18:30">18:30</option>
                                        <option value="19:00">19:00</option>
                                        <option value="19:30">19:30</option>
                                        <option value="20:00">20:00</option>
                                        <option value="20:30">20:30</option>
                                        <option value="21:00">21:00</option>
                                        <option value="21:30">21:30</option>
                                        <option value="22:00">22:00</option>
                                    </select>
                                </div>
                                </div>
                                <div class="form-group col-sm-4">
                                    <label>Short Code <span class="text-danger">*</span></label>
                                    <input type="text" id="txtShortCode" runat="server" style="text-transform:uppercase" placeholder="Enter short code for reference" maxlength="3" class="form-control CharactersOnly" />
                                </div>
                                <div class="form-group col-sm-4">
                                    <label>Subject Type <span class="text-danger">*</span></label>
                                    <select class="form-control ddlSubjectType" id="Select1" runat="server">
                                        <option value="0">--Select--</option>
                                        <option value="1">Primary</option>
                                        <option value="2">Secondary</option>
                                        <option value="3">Non-Academic Subject</option>
                                    </select>
                                </div>
                                <div class="form-group col-sm-4" id="divPrimarySubject" style="display: none">
                                    <label>Primary Subject</label>
                                    <select class="form-control ddlPrimarySubject" id="ddlPrimarySubject" clientidmode="static" runat="server">
                                        <option value="0">--Select--</option>
                                    </select>
                                </div>
                                <div class="form-group col-sm-4">
                                    <label>Max Marks <span class="text-danger">*</span></label>
                                    <input type="text" id="txtMaxMarks" title="Only Numbers" runat="server" placeholder="Enter max.Marks" maxlength="3" class="form-control" />
                                </div>
                                <div class="form-group  col-sm-4">
                                    <label>Min Marks <span class="text-danger">*</span></label>
                                    <input type="text" id="txtMinMarks" title="Only Numbers" placeholder="Enter min.Marks" runat="server" maxlength="3" class="form-control" />
                                </div>
                                <div class="form-group  col-sm-12">
                                    <div class="col-sm-7"></div>
                                    <div class="col-sm-5">

                                        <%--<button class="btn btn-sm btn-primary m-t-n-xs col-sm-5" id="btnSubmit" runat="server" type="button" onclick="if (!Validate()) {return false;}" onserverclick="Save_Click"><strong>Save</strong></button>
                                        <button class="btn btn-sm btn-danger pull-right m-t-n-xs col-sm-6" onclick="ClearText()" type="button"><strong>Clear Data</strong></button>--%>
                                    </div>
                                </div>

                            </div>
                        </div>
                                </asp:Panel>
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
                        <%--    <button class="btn btn-danger" id="btnDelete" runat="server" type="button" onserverclick="btnDelete_ServerClick"><strong>Delete</strong></button>--%>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <input type="hidden" id="hdnOutDate" runat="server" />
    <script src="../Resource/js/plugins/datapicker/bootstrap-datepicker.js"></script>
    <script src="../Resource/js/eduCareCommon.js"></script>
    <script type="text/javascript">
        var ResponseForm = '';
        $(function () {
            $.fn.ForceReadOnly = function () {
                return this.each(function () {
                    $(this).keydown(function (e) {
                        var key = e.charCode || e.keyCode || 0;
                        return (key == 9);
                    });
                });
            };
            // BindDataByResponse();
            setDatepicker();

        });
        function onlyNos(e, t) {
            try {
                if (window.event) {
                    var charCode = window.event.keyCode;
                }
                else if (e) {
                    var charCode = e.which;
                }
                else { return true; }
                if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                    return false;
                }
                return true;
            }
            catch (err) {
                alert(err.Description);
            }
        }

        var setDatepicker = function () {
            $('.date').datepicker({
                todayBtn: "linked",
                keyboardNavigation: false,
                forceParse: false,
                calendarWeeks: false,
                autoclose: true,
                format: "dd/mm/yyyy"
            });
        };
        
        function HideModalBackdrop() {
            $(".modal-backdrop").hide();
        }
        function Validate() {

            var Course = $('#<%=ddlCourse.ClientID %>').val();
                var Section = $('#<%=ddlSection.ClientID %>').val();
                var student = $('#<%=ddlStudent.ClientID %>').val();
                var type = $('#<%=ddlType.ClientID %>').val();

                if (Number(Course) == 0 || Number(Section) == 0 || Number(Type) == 0 || Number(student) == 0) {
                    AppDisplayMessage('Please fill the mandatory fields', 2);
                    return false;
                }
                return true;
            }



            var ClearData = function () {
                if (ResponseForm == '2') {
                    $('#myModal').modal('show');
                } else {
                  
                }
            }
          
            function calendarhidden1(obj) {
                $("#<%=hdnOutDate.ClientID %>").val($("#<%=hdnOutDate.ClientID %>").val());
             var calendarBehavior = $find("Calendar1");
             if (tag1 == 1)
                 calendarBehavior.show();
         }

            //After UpdatePanel Refresh
            //var prm = Sys.WebForms.PageRequestManager.getInstance();
            //if (prm != null) {
            //    prm.add_endRequest(function (sender, e) {
            //        if (sender._postBackSettings.panelsToUpdate != null) {

            //            setDatepicker();
            //            $(".ForceReadOnly").ForceReadOnly();
            //            var formType = GetParameterValues('Response');
            //            if (formType == "2") {
            //                $("#pformType1").show();
            //                $("#pformType2").hide();
            //            } else if (formType == "1") {
            //                $("#pformType2").show();
            //                $("#pformType1").hide();
            //            }
            //        }
            //    });
            //};
    </script>


</asp:Content>
