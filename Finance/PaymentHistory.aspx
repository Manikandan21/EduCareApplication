<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="PaymentHistory.aspx.cs" Inherits="ILogisticsApplication.Finance.PaymentHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPanel" runat="server">
    <div class="wrapper wrapper-content fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Payment history of the current academic year</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="row" id="PaymentHistoryDetails">
                         <div class="col-sm-12">
                             <label> This is your payment history so far. Please check and revert us, If anything need.</label>
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

             $('#PayHistorydataTable').DataTable({

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
            onPaymentHistory("", $("#hdnRole").val(), $("#hdnUserName").val(), "");
        });
    </script>
</asp:Content>
