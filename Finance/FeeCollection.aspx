<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="FeeCollection.aspx.cs" Inherits="ILogisticsApplication.Finance.FeeCollection" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Resource/css/AjaxCalender.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPanel" runat="server">
    <ajax:ToolkitScriptManager ID="ScriptManager1" EnableScriptGlobalization="true" EnableScriptLocalization="true"
        EnablePartialRendering="true" runat="server" />

    <div class="wrapper wrapper-content fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Fee Collection Master <small>Student Fee Management System.</small></h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div class="row" id="SearchCriteria">
                            <div class="col-sm-12" id="divEditable" style="margin-bottom: 5px">
                                <h4 style="text-align: center; color: #EC4758" id="headEditable"></h4>
                                <div class="form-group col-sm-3">
                                    <label>Course <span class="text-danger">*</span></label>
                                    <select class="form-control ddlCourse" id="ddlCourse" clientidmode="static" runat="server">
                                        <option value="0">--Select--</option>
                                    </select>
                                </div>
                                <div class="form-group  col-sm-3">
                                    <label>Section <span class="text-danger">*</span></label>
                                    <select class="form-control ddlSection" id="ddlSection" clientidmode="static" runat="server">
                                        <option value="0">--Select--</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row" id="StudentListData">
                            <div class="col-sm-12">
                                <div class="ibox">
                                    <div class="">
                                        <table style="text-align: center; width: 100%" id="dataTable" class="table table-bordered">
                                            <thead id="thead">
                                                <tr>
                                                    <th style="text-align: center;">#
                                                      <%--  <input type="checkbox" id="hCheckbox" />--%>
                                                    </th>
                                                    <th style="text-align: center;">Student Name</th>
                                                    <th style="text-align: center;">Course</th>
                                                    <th style="text-align: center;">Section</th>
                                                    <th style="text-align: center;">Status</th>
                                                    <th style="text-align: center;">Assign Fee</th>
                                                    <th style="text-align: center;">Collect Fee</th>
                                                    <th style="text-align: center;">Payment History</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row" id="PaymentHistoryDetails" style="display: none;">
                            <div class="col-sm-12">
                                Payment History of :
                                <label class="StudentName"></label>
                            </div>
                            <div class="col-sm-12">
                                <div class="ibox">
                                    <div class="">
                                        <table style="text-align: center;" id="PayHistorydataTable" class="table table-bordered">
                                            <thead id="thead">
                                                <tr>
                                                    <th style="text-align: center;">#
                                                    </th>
                                                    <th style="text-align: center;">Payment Mode</th>
                                                    <th style="text-align: center;">Payment Amount</th>
                                                    <th style="text-align: center;">Cheque or DD Number</th>
                                                    <th style="text-align: center;">Cheque or DD Date</th>
                                                    <th style="text-align: center;">Bank Chellan Number</th>
                                                    <th style="text-align: center;">Online Txn. Number</th>
                                                    <th style="text-align: center;">Online Txn. Date</th>
                                                    <th style="text-align: center;">Payment Paid Date</th>
                                                    <th style="text-align: center;">Entry Date</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-9">
                            </div>
                            <div class="col-sm-3">
                                <input type="button" id="btnPaymentHistGoBack" value="Go Back" onclick="return false;" class="btn btn-danger m-t-n-xs col-sm-8 btnPaymentHistGoBack" />
                            </div>
                        </div>
                        <div class="row" id="FeeMappingDetails" style="display: none;">
                            <div class="col-sm-4">
                                Fee structure of :
                                <label class="StudentName"></label>
                            </div>
                            <div class="col-sm-2">
                                <span>Total Fee Amount to be Paid : </span>
                            </div>
                            <div class="col-sm-2">
                                <asp:TextBox ID="txtTotMappedFeeAmt" TextMode="Number" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-sm-2">
                                <input type="button" id="btnGobackMappedFee" value="Go Back" onclick="return false;" class="btn btn-danger m-t-n-xs col-sm-8 btnGobackMappedFee btnPaymentHistGoBack" />
                            </div>
                            <div class="col-sm-2 SaveDiv " style="display: none;">
                                <input type="button" id="btnSaveMappedFee" value="Save" onclick="return false;" class="btn btn-primary m-t-n-xs col-sm-8 btnSaveMappedFee" />
                            </div>
                            <div class="col-sm-12">
                                <div class="ibox">
                                    <div class="" id="divFeeMappingDeatils">
                                        <table></table>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-8">
                            </div>
                            <div class="col-sm-2">
                                <input type="button" id="btnGobackMappedFee1" value="Go Back" onclick="return false;" class="btn btn-danger m-t-n-xs col-sm-8 btnGobackMappedFee btnPaymentHistGoBack" />
                            </div>
                            <div class="col-sm-2 SaveDiv" style="display: none;">
                                <input type="button" id="btnSaveMappedFee1" value="Save" onclick="return false;" class="btn btn-primary m-t-n-xs col-sm-8 btnSaveMappedFee" />
                            </div>
                        </div>
                        <div class="row" id="PaymentCollectionDetails" style="display: none;">
                            <div class="col-sm-12">
                                Payment of :
                                <label class="StudentName"></label>
                            </div>
                            <div class="col-sm-12" id="divEditable1" style="margin-bottom: 5px">
                                <h4 style="text-align: center; color: #EC4758" id="headEditable1"></h4>
                                <div class="form-group col-sm-3">
                                    <label>Total Amount</label>
                                    <asp:TextBox ID="txtTotalFeeAmt" TextMode="Number" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group  col-sm-3">
                                    <label>Paid Amount</label>
                                    <asp:TextBox ID="txtPaidAmount" TextMode="Number" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group  col-sm-3">
                                    <label>Pending Amount</label>
                                    <asp:TextBox ID="txtPendingAmount" TextMode="Number" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group  col-sm-3">
                                    <label>Refund Amount</label>
                                    <asp:TextBox ID="txtRefundAmount" TextMode="Number" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-sm-12" id="divEditable2" style="margin-bottom: 5px">
                                <h4 style="text-align: center; color: #EC4758" id="headEditable2"></h4>
                                <div class="form-group col-sm-3">
                                    <label>Payment mode <span class="text-danger">*</span></label>
                                    <select class="form-control ddlPayMode" id="ddlPayMode" clientidmode="static" runat="server">
                                        <option value="0">--Select--</option>
                                        <option value="CASH">Cash</option>
                                        <option value="CHQDD">Cheque or DD</option>
                                        <option value="ONLINE">Online Payment</option>
                                        <option value="BANK">Bank Payment</option>
                                        <option value="REFUND">Refund Payment</option>
                                    </select>
                                </div>
                                <div class="form-group  col-sm-3">
                                    <label>Amount to Pay <span class="text-danger">*</span></label>
                                    <asp:TextBox ID="txtInputAmount" TextMode="Number" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group  col-sm-3 ddlchqtxnbankpay" style="display: none;">
                                    <label id="lblpayDate">Cheque Date <span class="text-danger">*</span></label>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <asp:Panel ID="pnlHolidays" runat="server">
                                                <div style="height: 0px"></div>
                                                <div>
                                                    <div class="input-group date">
                                                        <span class="input-group-addon" id="spnDate"><i class="fa fa-calendar"></i></span>
                                                        <asp:TextBox ID="txtPayDate" ReadOnly="true" runat="server" CssClass="form-control" />
                                                        <%--<input type="text" id="txtDate" runat="server" class="form-control" />--%>
                                                        <ajax:CalendarExtender ID="CalendarExtender1" runat="server" BehaviorID="Calendar1"
                                                            OnClientHidden="calendarhidden" Format="dd/MM/yyyy" CssClass="black" TargetControlID="txtPayDate"
                                                            PopupButtonID="spnDate" />
                                                    </div>
                                                </div>
                                            </asp:Panel>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                                <div class="form-group  col-sm-3 ddlchqtxnbankpay" style="display: none;">
                                    <label id="lblUniqueNumber">Cheque Number <span class="text-danger">*</span></label>
                                    <asp:TextBox ID="txtPayNumber" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-sm-3">
                            </div>
                            <div class="col-sm-3">
                                <input type="button" id="btnPrintPaymentCollect" style="display: none;" value="Print" onclick="return false;" class="btn btn-danger m-t-n-xs col-sm-8 btnPrintPayment" />
                            </div>
                            <div class="col-sm-3">
                                <input type="button" id="btnPaymentCollect" value="Go Back" onclick="return false;" class="btn btn-danger m-t-n-xs col-sm-8  btnPaymentHistGoBack" />
                            </div>
                            <div class="col-sm-3">
                                <input type="button" id="btnSavePayment" value="Save" onclick="return false;" class="btn btn-primary m-t-n-xs col-sm-8 btnSavePayment" />
                            </div>
                            <div class="col-sm-12" id="divPrintDetails">
                                <div class="ibox">
                                    <div class="">
                                        <table style="text-align: center;" id="CollectedPaymentTable" class="table table-bordered">
                                            <thead id="thead">
                                                <tr>
                                                    <th style="text-align: center;">#
                                                    </th>
                                                    <th style="text-align: center;">Payment Mode</th>
                                                    <th style="text-align: center;">Payment Amount</th>
                                                    <th style="text-align: center;">Cheque/DD/Bank Chellan/Online Txn. Number</th>
                                                    <th style="text-align: center;">Cheque/DD/Bank Chellan/Online Txn. Date</th>
                                                    <th style="text-align: center;">Payment Entry Date</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <%--<iframe name="print_frame" width="0" height="0" frameborder="0" src="about:blank"></iframe>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <input type="hidden" id="hdnCourse" value="" />
        <input type="hidden" id="hdnSection" value="" />
        <input type="hidden" id="hdnStudentId" value="" />
        <asp:HiddenField ID="hdnDate" runat="server" Value="" />
    </div>
    <style>
        .btnGobackMappedFee {
            margin-top: 0px !important;
        }

        .btnSaveMappedFee {
            margin-top: 0px !important;
        }
    </style>
    <script type="text/javascript">
        var tag1 = 0;
        $(document).ready(function () {

            ////Date control binding.
            //Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

            //function EndRequestHandler(sender, args) {
            //    $('.classTarget').datepicker({ dateFormat: 'dd/mm/yy' });
            //}
            BindDropdown('GetCourse', null, 0, '#ddlCourse');
            $('#dataTable').DataTable({

                "bSearchable": true,
                "bSortable": false,
                "bFilter": false,
                "bInfo": true,
                "bPaginate": false,
                "bLengthChange": false,
                "bVisible": false,
                "oLanguage": {
                    "sEmptyTable": "No records found"
                },
            });

           <%-- $("#hdnRole").val('<%=Convert.ToString(Session["RoleName"]) %>');
            $("#hdnUserName").val('<%=Convert.ToString(Session["UserName"]) %>');--%>
        });
        $(".ddlCourse").change(function () {
            Course = $(this).find("option:selected").text();
            BindDropdown('GetSection', Course, 0, '#ddlSection');
            $(".ddlSection").focus();
        });
        $(".ddlSection").change(function () {
            var Section = $(this).find("option:selected").text();
            //if (Section == undefined || Section == null || Section == "--Select--") {
            //    AppDisplayMessage("Please select the section.", 2);
            //    return false;
            //}
            BindStudentData(Course, Section);
            $("#hdnCourse").val(Course);
            $("#hdnSection").val(Section);
            <%--$("#<%= txtTotMappedFeeAmt.ClientID %>").val(0);--%>
        });

        $(".btnPaymentHistGoBack").click(function () {
            $("#SearchCriteria").attr("style", "display:block");
            $("#PaymentHistoryDetails").attr("style", "display:none");
            $("#FeeMappingDetails").attr("style", "display:none");
            $("#PaymentCollectionDetails").attr("style", "display:none");
            $("#StudentListData").attr("style", "display:block");
            BindStudentData($("#hdnCourse").val(), $("#hdnSection").val());
        });

        $(".btnSaveMappedFee").click(function () {
            SaveMappedFeeDetail();
        });

        function SaveMappedFeeDetail() {
            var FeeIds = new Array;
            $.each($("#divFeeMappingDeatils").find('table td').find('input[type=checkbox]:checked'), function () {
                FeeIds.push($(this)[0].id);
            });
            if (FeeIds.length == 0) {
                AppDisplayMessage("Please select the fee(s) to proceed.", 2);
                return false;
            }
            else {
                var UserID = '<%=Convert.ToString(Session["UserId"]) %>';
                var studentId = $("#hdnStudentId").val();
                if (studentId != undefined && UserID != undefined) {

                    var Request = new XMLHttpRequest();
                    var url = '../Handlers/FinanceStudentFeeMappingSave.ashx?Mode=MAP&FeeIds=' + FeeIds + '&studentID=' + studentId + '&UserId=' + UserID;
                    Request.open("GET", url, false);
                    Request.send();
                    var Data = Request.responseText;
                    if (Data != undefined) {
                        if (Data == 1) {
                            console.log("1");
                            AppDisplayMessage("Saved details successfully.", 1);
                        }
                    }
                }
            }
        }
        $(".ddlPayMode").change(function () {
            var payMode = $(this).find("option:selected").val();
            $('#<%=txtPayDate.ClientID %>').val("");
            $('#<%=txtPayNumber.ClientID %>').val("");
            $(".ddlchqtxnbankpay").attr("style", "display:block");
            $('#CollectedPaymentTable').dataTable().fnDestroy();
            $('#CollectedPaymentTable').DataTable({

                "bSearchable": true,
                "bSortable": false,
                "bFilter": false,
                "bInfo": true,
                "bPaginate": false,
                "bLengthChange": false,
                "bVisible": false,
                "oLanguage": {
                    "sEmptyTable": "No records found"
                },
            });
            if (payMode == "0" || payMode == "REFUND" || payMode == "CASH") {
                $(".ddlchqtxnbankpay").attr("style", "display:none");
                $("#lblpayDate").text("Cheque Date");
                $("#lblUniqueNumber").text("Cheque Number");
            }
            else if (payMode == "CHQDD") {
                $("#lblpayDate").text("Cheque Date *");
                $("#lblUniqueNumber").text("Cheque Number *");
            }
            else if (payMode == "ONLINE") {
                $("#lblpayDate").text("Transaction Date *");
                $("#lblUniqueNumber").text("Transaction Number *");
            }
            else if (payMode == "BANK") {
                $("#lblpayDate").text("Paid Date *");
                $("#lblUniqueNumber").text("Chellan Number *");
            }
        });

        //Date Control 
        function calendarhidden(obj) {
            $("#<%=hdnDate.ClientID %>").val($("#<%=txtPayDate.ClientID %>").val());
            var calendarBehavior = $find("Calendar1");
            if (tag1 == 1)
                calendarBehavior.show();
            $get('<%=txtPayDate.ClientID %>').value = $get('<%=hdnDate.ClientID %>').value;
        }
        function dateselect(ev) {

            var calendarBehavior1 = $find("CalendarClear");
            var date = calendarBehavior1._selectedDate.format("dd/MM/yyyy");
            var hiddencontrol = $get('<%=hdnDate.ClientID %>');
            if (hiddencontrol.value.indexOf(date) == -1)
                hiddencontrol.value += date + ";";
            tag1 = 1;
        }
        function ClearControlsAfterPayment() {
            $(".ddlPayMode").val("CASH");
            $(".ddlchqtxnbankpay").attr("style", "display:none");
            $('#<%=txtPayDate.ClientID %>').val("");
            $('#<%=txtPayNumber.ClientID %>').val("");
            $('#<%=txtInputAmount.ClientID %>').val(0);
            $('#<%=txtInputAmount.ClientID %>').focus();
        }
        function AssignValuetoCaontrol(Data) {
            $.each(Data, function (index, PARAM) {
                $('#<%=txtTotalFeeAmt.ClientID %>').val(PARAM.TotalAmt);
                $('#<%=txtPaidAmount.ClientID %>').val(PARAM.PaidAmt);
                $('#<%=txtPendingAmount.ClientID %>').val(PARAM.PendingAmt);
                $('#<%=txtRefundAmount.ClientID %>').val(PARAM.RefundAmt);
            });
        }
        $(".btnSavePayment").click(function () {
            var UserID = '<%=Convert.ToString(Session["UserId"]) %>';
            var studentId = $("#hdnStudentId").val();
            if (studentId != undefined && studentId != 0) {
                var PaymentMode = $(".ddlPayMode").find("option:selected").val();
                var PaymentAmount = $('#<%=txtInputAmount.ClientID %>').val();
                var PaymentDate = $('#<%=txtPayDate.ClientID %>').val();
                var PaymentNumber = $('#<%=txtPayNumber.ClientID %>').val();
                if (PaymentMode == "0") {
                    AppDisplayMessage("Please select the payment mode.", 2);
                    $(".ddlPayMode").focus();
                    return false;
                }                
                if (PaymentAmount <= 0) {
                    AppDisplayMessage("Please enter the amount.", 2);
                    $('#<%=txtInputAmount.ClientID %>').focus();
                    return false;
                }
                if (PaymentMode != "REFUND" && PaymentMode != "CASH") {
                    if (PaymentDate.trim() == "") {
                        AppDisplayMessage("Please select the date.", 2);
                        $('#<%=txtPayDate.ClientID %>').focus();
                        return false;
                    }
                    if (PaymentNumber.trim() == "") {
                        AppDisplayMessage("Please enter the cheque/DD/Transaction/Chellan number.", 2);
                        $('#<%=txtPayNumber.ClientID %>').focus();
                        return false;
                    }
                }
                if (PaymentMode == "REFUND") {
                    var RefundAmount = $('#<%=txtRefundAmount.ClientID %>').val();
                    if (RefundAmount > 0) {
                        if (PaymentAmount > RefundAmount) {
                            AppDisplayMessage("Refund amount is not equal to pay.", 2);
                            $('#<%=txtInputAmount.ClientID %>').focus();
                            return false;
                        }
                    }
                    else {
                        AppDisplayMessage("Refund is not applicable.", 2);
                        return false;
                    }
                }                
                savePaymentDetails(PaymentMode, PaymentAmount, PaymentDate, PaymentNumber, studentId, UserID);
            }
        });
        $(".btnPrintPayment").click(function () {
            PrintPayment("divPrintDetails");
        });
    </script>
</asp:Content>


