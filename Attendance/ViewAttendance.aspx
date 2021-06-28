<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ViewAttendance.aspx.cs" Inherits="ILogisticsApplication.Attendance.ViewAttendance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="../Resource/css/plugins/datapicker/datepicker3.css" rel="stylesheet" />

    <style type="text/css">
        .AbsentView {
            background: url("../Resource/img/attendance/absent.png") no-repeat center;
            width: 20px;
            height: 20px;
        }

        .PresentView {
            background: url("../Resource/img/attendance/present.png") no-repeat center;
            width: 20px;
            height: 20px;
        }

        .WeekEndView {
            background: url("../Resource/img/attendance/WeekEnd.png") no-repeat center;
            width: 20px;
            height: 20px;
        }

        .HolidayView {
            background: url("../Resource/img/attendance/Holiday.png") no-repeat center;
            width: 20px;
            height: 20px;
        }

        .Null {
            background: url("../../images/attendance/null.png") no-repeat center;
            width: 20px;
            height: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPanel" runat="server">
    <asp:ScriptManager ID="ScriptMngr" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="updatePanel" runat="server">
        <ContentTemplate>

            <div class="wrapper wrapper-content fadeInRight">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>View Student Attendance <small>View student Attendance details</small></h5>
                                <div class="ibox-tools">
                                    <a class="collapse-link">
                                        <i class="fa fa-chevron-up"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="ibox-content">

                                <asp:Panel ID="pnlAction" runat="server">
                                    <div class="row">
                                        <div class="col-sm-12" id="divEditable" style="margin-bottom: 5px">
                                            <h4 style="text-align: center; color: #EC4758" id="headEditable"></h4>
                                            <div class="form-group col-sm-3">
                                                <label>Select Month <span class="text-danger">*</span></label>
                                                <asp:DropDownList ID="ddlMonth" runat="server" CssClass="form-control ddlMonth">
                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                    <asp:ListItem Value="1">January</asp:ListItem>
                                                    <asp:ListItem Value="2">February</asp:ListItem>
                                                    <asp:ListItem Value="3">March</asp:ListItem>
                                                    <asp:ListItem Value="4">April</asp:ListItem>
                                                    <asp:ListItem Value="5">May</asp:ListItem>
                                                    <asp:ListItem Value="6">June</asp:ListItem>
                                                    <asp:ListItem Value="7">July</asp:ListItem>
                                                    <asp:ListItem Value="8">August</asp:ListItem>
                                                    <asp:ListItem Value="9">September</asp:ListItem>
                                                    <asp:ListItem Value="10">October</asp:ListItem>
                                                    <asp:ListItem Value="11">November</asp:ListItem>
                                                    <asp:ListItem Value="12">December</asp:ListItem>
                                                </asp:DropDownList>
                                                <%-- <div style="height: 23px"></div>
                                    <div id="data_1">
                                        <div class="input-group date">
                                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                            <input type="text" runat="server" class="form-control" />
                                        </div>
                                    </div>--%>
                                            </div>
                                            <div class="form-group col-sm-3">
                                                <label>Course <span class="text-danger">*</span></label>
                                                <asp:DropDownList ID="ddlCourse" runat="server" CssClass="form-control ddlCourse" AutoPostBack="True" OnSelectedIndexChanged="ddlCourse_SelectedIndexChanged">
                                                    <asp:ListItem>--Select--</asp:ListItem>
                                                </asp:DropDownList>

                                            </div>
                                            <div class="form-group  col-sm-3">
                                                <label>Section <span class="text-danger">*</span></label>
                                                <asp:DropDownList ID="ddlSection" runat="server" CssClass="form-control ddlSection" AutoPostBack="True" OnSelectedIndexChanged="ddlSection_SelectedIndexChanged">
                                                    <asp:ListItem>--Select--</asp:ListItem>
                                                </asp:DropDownList>

                                            </div>
                                            <div class="form-group  col-sm-3" runat="server" id="divAction" visible="false">
                                                <div style="height: 29px"></div>

                                                <asp:Button ID="btnGetAttendance" runat="server" Text="Get Data" OnClientClick="if (!Validate()) {return false;}" OnClick="btnGetAttendance_Click" CssClass="btn btn-danger m-t-n-xs col-sm-8 btnMarkAbsent" />

                                            </div>

                                        </div>

                                    </div>
                                </asp:Panel>

                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="ibox">

                                            <div class="" style="overflow: auto; width: 100%">
                                                <asp:Panel ID="pnlAttendance" Visible="false" runat="server">
                                                    <asp:GridView ID="grdAttendance" runat="server" OnDataBound="grdAttendance_DataBound" OnRowDataBound="grdAttendance_RowDataBound" EmptyDataText="No Records found" CssClass="table table-bordered"></asp:GridView>
                                                </asp:Panel>

                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <!-- Data picker -->
    <script src="../Resource/js/plugins/datapicker/bootstrap-datepicker.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
        });
        $('#data_1 .input-group.date').datepicker({
            todayBtn: "linked",
            keyboardNavigation: false,
            forceParse: false,
            calendarWeeks: true,
            autoclose: true,
            format: "dd/mm/yyyy"
        });

        function Validate() {
            var Month = $("#<%=ddlMonth.ClientID %>").val();
            var Course = $("#<%=ddlCourse.ClientID %>").val();
            var Section = $("#<%=ddlSection.ClientID %>").val()

            if (Month == '0' || Course == '0' || Section == '0') {
                AppDisplayMessage("Please select the mandatory fields to get Attendance Data", 2);
                return false;
            } else {
                return true;
            }
        }
    </script>
</asp:Content>
