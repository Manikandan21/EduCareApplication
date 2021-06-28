<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="MarkHolidays.aspx.cs" Inherits="ILogisticsApplication.Attendance.MarkHolidays" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="../Resource/css/AjaxCalender.css" rel="stylesheet" />


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPanel" runat="server">
    <ajax:ToolkitScriptManager ID="ScriptManager1" EnableScriptGlobalization="true" EnableScriptLocalization="true"
        EnablePartialRendering="true" runat="server" />

    <asp:UpdatePanel ID="updatePanel" runat="server">
        <ContentTemplate>
            <asp:Panel ID="pnlHolidays" runat="server" Visible="false">
                <div class="wrapper wrapper-content fadeInRight">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <h5>Mark Holidays & WeekEnd <small>Manage holidays and weekends</small></h5>
                                    <div class="ibox-tools">
                                        <a class="collapse-link">
                                            <i class="fa fa-chevron-up"></i>
                                        </a>
                                    </div>
                                </div>
                                <div class="ibox-content">
                                    <div class="row" style="height: 300px">
                                        <div class="col-sm-12" id="divEditable" style="margin-bottom: 5px">
                                            <h4 style="text-align: center; color: #EC4758" id="headEditable"></h4>
                                            <div class="form-group col-sm-3">
                                                <label>Select Date <span class="text-danger">*</span></label>

                                                <div style="height: 0px"></div>
                                                <div>
                                                    <div class="input-group date">
                                                        <span class="input-group-addon" id="spnDate"><i class="fa fa-calendar"></i></span>
                                                        <asp:TextBox ID="txtDate" ReadOnly="true" runat="server" CssClass="form-control" />
                                                        <%--<input type="text" id="txtDate" runat="server" class="form-control" />--%>
                                                        <ajax:CalendarExtender ID="CalenderExtenderDate" runat="server" BehaviorID="Calendar1"
                                                            OnClientHidden="calendarhidden" Format="dd/MM/yyyy" CssClass="black" TargetControlID="txtDate"
                                                            PopupButtonID="spnDate" />
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="form-group col-sm-3">
                                                <label>Type <span class="text-danger">*</span></label>
                                                <asp:DropDownList ID="ddlType" runat="server" CssClass="form-control ddlCourse">
                                                    <asp:ListItem Value="0">--Select--</asp:ListItem> 
                                                    <%--<asp:ListItem Value="1">Present</asp:ListItem>
                                                    <asp:ListItem Value="2">Absent</asp:ListItem> These two item will be used in mark attandance(Absent) so, not required here --%>
                                                    <asp:ListItem Value="3">WeekEnd</asp:ListItem>
                                                    <asp:ListItem Value="4">Holiday</asp:ListItem>
                                                </asp:DropDownList>

                                            </div>
                                            <div class="form-group col-sm-3">
                                                <label>Holiday Description <span class="text-danger">*</span></label>
                                                <asp:TextBox ID="txtHolidayDescription"  runat="server" CssClass="form-control" placeholder="Type holiday description"></asp:TextBox>
                                            </div>
                                           <%--  <div class="form-group col-sm-3">
                                                 <label>*</label>
                                                 <asp:TextBox ID="txtHolidayDescription"  runat="server" CssClass="form-control" placeholder="Type holiday description">
                                             </div>--%>
                                            <div class="form-group  col-sm-3" runat="server" id="divAction">
                                                <div style="height: 29px"></div>
                                                <asp:Button ID="btnMarkHolidays" runat="server" Text="Submit" OnClick="btnMarkHolidays_Click" OnClientClick="if (!Validate()) {return false;}" CssClass="btn btn-danger m-t-n-xs col-sm-8 btnMarkAbsent" />

                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
            <asp:Panel ID="pnlClearData" runat="server" Visible="false">
                <div class="wrapper wrapper-content fadeInRight">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <h5>Clear Attendance Data<small>clear student Attendance details</small></h5>
                                    <div class="ibox-tools">
                                        <a class="collapse-link">
                                            <i class="fa fa-chevron-up"></i>
                                        </a>
                                    </div>
                                </div>
                                <div class="ibox-content">


                                    <div class="row" style="height: 300px">
                                        <div class="col-sm-12" id="div1" style="margin-bottom: 5px">
                                            <h4 style="text-align: center; color: #EC4758" id="h1"></h4>
                                            <div class="form-group col-sm-3">
                                                <label>Select Date <span class="text-danger">*</span></label>

                                                <div style="height: 0px"></div>
                                                <div>
                                                    <div class="input-group date">
                                                        <span class="input-group-addon" id="spnCleardate"><i class="fa fa-calendar"></i></span>
                                                        <asp:TextBox ID="txtClearDate" ReadOnly="true" runat="server" CssClass="form-control" />
                                                        <%--<input type="text" id="txtDate" runat="server" class="form-control" />--%>
                                                        <ajax:CalendarExtender ID="CalendarExtender1" runat="server" BehaviorID="CalendarClear"
                                                            OnClientHidden="calendarhidden1" Format="dd/MM/yyyy" CssClass="black" TargetControlID="txtClearDate"
                                                            PopupButtonID="spnCleardate" />
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="form-group col-sm-3">
                                                <label>Course <span class="text-danger">*</span></label>
                                                <asp:DropDownList ID="ddlCourse" runat="server" CssClass="form-control ddlCourse" AutoPostBack="True" OnSelectedIndexChanged="ddlCourse_SelectedIndexChanged">
                                                    <asp:ListItem>--Select--</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="form-group  col-sm-3" id="divSection" runat="server" visible="false">
                                                <label>Section <span class="text-danger">*</span></label>
                                                <asp:DropDownList ID="ddlSection" runat="server" CssClass="form-control ddlSection" AutoPostBack="True" OnSelectedIndexChanged="ddlSection_SelectedIndexChanged">
                                                    <asp:ListItem>--Select--</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="form-group  col-sm-3" runat="server" id="divClearAction" visible="false">
                                                <div style="height: 29px"></div>
                                                <asp:Button ID="btnClearData" runat="server" Text="Clear Data" OnClientClick="if (!ValidateClear()) {return false;}" OnClick="btnClearData_Click" CssClass="btn btn-danger m-t-n-xs col-sm-8 btnClearData" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </asp:Panel>


        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:HiddenField ID="hdnDate" runat="server" Value="" />

    <script type="text/javascript">
        $(document).ready(function () {

        });
        var tag1 = 0;
        function dateselect(ev) {
            var calendarBehavior1 = $find("Calendar1");
            var date = calendarBehavior1._selectedDate.format("dd/MM/yyyy");
            var hiddencontrol = $get('<%=hdnDate.ClientID %>');
            if (hiddencontrol.value.indexOf(date) == -1)
                hiddencontrol.value += date + ";";
            tag1 = 1;
        }
        function calendarhidden(obj) {
            $("#<%=hdnDate.ClientID %>").val($("#<%=txtDate.ClientID %>").val());
            var calendarBehavior = $find("Calendar1");
            if (tag1 == 1)
                calendarBehavior.show();
            $get('<%=txtDate.ClientID %>').value = $get('<%=hdnDate.ClientID %>').value;
        }
        function dateselect(ev) {
            
            var calendarBehavior1 = $find("CalendarClear");
            var date = calendarBehavior1._selectedDate.format("dd/MM/yyyy");
            var hiddencontrol = $get('<%=hdnDate.ClientID %>');
            if (hiddencontrol.value.indexOf(date) == -1)
                hiddencontrol.value += date + ";";
            tag1 = 1;           
        }
        function calendarhidden1(obj) {
            $("#<%=hdnDate.ClientID %>").val($("#<%=txtClearDate.ClientID %>").val());
            var calendarBehavior = $find("CalendarClear");
            if (tag1 == 1)
                calendarBehavior.show();
            $get('<%=txtClearDate.ClientID %>').value = $get('<%=hdnDate.ClientID %>').value;
            
        }
        function Validate() {

            var Date = $("#<%=txtDate.ClientID %>").val();
            var Type = $("#<%=ddlType.ClientID %>").val();
            var holidayDesc = $("#<%=txtHolidayDescription.ClientID %>").val();
            $("#<%=hdnDate.ClientID %>").val(Date);
            if (Date == '' || Type == '0' || holidayDesc =='') {
                AppDisplayMessage("Please fill the mandatory fields", 2);
                return false;
            } else {
                return true;
            }
        }

        function ValidateClear() {

            var Date = $("#<%=txtClearDate.ClientID %>").val();
            var Course = $("#<%=ddlCourse.ClientID %>").val();
            // var Section = $("#<%=ddlSection.ClientID %>").val();
            
            if (Date == '' || Course == '0') {
                AppDisplayMessage("Please fill the mandatory fields", 2);
                return false;
            } else {
                return true;
            }
        }
        //function changedate(sender, args) {
        //    if (sender._selectedDate  > new Date()) {
        //        AppDisplayMessage("Please select the past or current date.", 2);
        //      sender._selectedDate = new Date();
        //      sender._textbox.set_Value("");
        //       //$("#<%=txtDate.ClientID %>").val("")
        //  }
        // }
    </script>
</asp:Content>
