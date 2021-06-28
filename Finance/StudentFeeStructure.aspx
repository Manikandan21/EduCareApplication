<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="StudentFeeStructure.aspx.cs" Inherits="ILogisticsApplication.Finance.StudentFeeStructure" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPanel" runat="server">
    <div class="wrapper wrapper-content fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Detailed Fee structure </h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div class="row">
                            <div class="col-sm-12" id="divEditable" style="margin-bottom: 5px">
                                <h4 style="text-align: center; color: #EC4758" id="headEditable"></h4>
                                <div class="form-group col-sm-4">
                                    <label>Total Amount</label>
                                    <asp:TextBox ID="txtTotalFeeAmt" TextMode="Number" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group  col-sm-4">
                                    <label>Paid Amount</label>
                                    <asp:TextBox ID="txtPaidAmount" TextMode="Number" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group  col-sm-4">
                                    <label>Pending Amount</label>
                                    <asp:TextBox ID="txtPendingAmount" TextMode="Number" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row" id="FeeMappingDetails">
                            <div class="col-sm-12">
                                <div class="ibox">
                                    <div class="" id="divFeeMappingDeatils">
                                        <table></table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <input type="hidden" id="hdnRole" value="" />
        <input type="hidden" id="hdnUserName" value="" />
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#hdnRole").val('<%=Convert.ToString(Session["RoleId"]) %>');
            $("#hdnUserName").val('<%=Convert.ToString(Session["UserName"]) %>');

            onMapFee("", $("#hdnRole").val(), $("#hdnUserName").val(), "");
            GetDetailedFeeAmount($("#hdnUserName").val(), $("#hdnRole").val());
        });
        function GetDetailedFeeAmount(UserName, RoleId) {
            var Request = new XMLHttpRequest();
            var url = '../Handlers/FinanceDetailedStudentFeeAmount.ashx?UserName=' + UserName + '&RoleId=' + RoleId;
            Request.open("GET", url, false);
            Request.send();
            var Data = Request.responseText;
            if (Data != undefined) {
                Data = jQuery.parseJSON(Data);
                if (Data.length > 0) {
                    $.each(Data, function (index, PARAM) {
                        $("#<%= txtTotalFeeAmt.ClientID %>").val(PARAM.TotalAmt);
                        $("#<%= txtPaidAmount.ClientID %>").val(PARAM.PaidAmt);
                        $("#<%= txtPendingAmount.ClientID %>").val(PARAM.PendingAmt);
                    });

                }
            }
        }
    </script>
</asp:Content>
