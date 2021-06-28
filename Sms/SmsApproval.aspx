<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="SmsApproval.aspx.cs" Inherits="ILogisticsApplication.Sms.SmsApproval" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPanel" runat="server">
    <div class="wrapper wrapper-content fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>SMS Approval <small>Manage approval details</small></h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                       
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="ibox">

                                    <div class="">

                                        <table style="text-align: center; width: 100%" id="dataTable" class="table table-bordered">
                                            <thead>
                                                <tr>
                                                    <th  class="col-md-1" style="text-align: center;">#</th>
                                                    <th class="col-md-2"  style="text-align: center;">Role Name</th>
                                                    <th class="col-md-4"  style="text-align: center;">Message</th>
                                                    <th class="col-md-1"  style="text-align: center;">Status</th>
                                                    <th class="col-md-1"  style="text-align: center;">Approved By</th>
                                                    <th class="col-md-2"  style="text-align: center;">Approved On</th>
                                                    <th class="col-md-1"  style="text-align: center;">Approve</th>
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
        </div>

    </div>

    <div class="modal inmodal" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content animated bounceInDown">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <i class="fa fa-question-circle modal-icon"></i>
                    <h6 class="modal-title">Are you sure Do you want Approve the template?</h6>

                </div>
                  <div class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-4 control-label">Role:</label>
                        <div class="col-sm-6" style="margin-top: 8px;">
                            <label class="lblRole" id="lblRole"></label>
                        </div>
                    </div>
                </div>
                 <div class="form-horizontal" id="divReceiverConfirm" style="display: none">
                    <div class="form-group">
                        <label class="col-sm-4 control-label">Receiver:</label>
                        <div class="col-sm-6" style="margin-top: 8px;">
                            <label class="lblReceiver" id="lblReceiver"></label>
                        </div>
                    </div>
                </div>
                  <div class="form-horizontal divShowStudentList"  style="display: none">
                       <div class="form-group">
                        <label class="col-sm-4 control-label">Student List:</label>
                        <div class="col-sm-6" style="margin-top: 8px;">
                            <ul id="ulStudentLst">
                                    </ul>
                        </div>
                    </div>
                 </div>
                <div class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-4 control-label">Message:</label>

                        <div class="col-sm-6" style="margin-top: 8px;">
                            <label class="lblClientMessage" id="lblClientMessage"></label>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">Close</button>
                    <button class="btn btn-primary" id="btnSend" runat="server"  onclick='onConfirm()' type="button" ><strong>Confirm</strong></button>
                    <%--  --%>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" id="hdnId" runat="server" />
    <script type="text/javascript">
        $(document).ready(function () {
            BindApprovalData();
           
        });
        function onApprove(id) {
            $("#<%=hdnId.ClientID %>").val(id);
            var url = '../Handlers/SmsApproval.ashx?Mode=ByID&AppID='+id;
            var result = JSON.parse(GetJsonResult(url));
            if (result) {
                if (result.length > 0) {
                    var res = result[0];
                    fillConfirmInfo(res);
                }
            }
            $('#myModal').modal('show');
        }
        function fillConfirmInfo(result) {
            $('.lblClientMessage').text(result.Message);
            $('.lblRole').text(result.RoleName);
            $('#divReceiverConfirm').hide();
            if (result.Role== 2) {
                $('.lblReceiver').text(result.EmployeeType);
                $('#divReceiverConfirm').show();
            } else if (result.Role == 3) {
                var Receiver = "";
                var course = result.Std;
                var section =result.Section;
                var StudentID = result.StudentIDs;
                if (course != "All") {
                    Receiver = course;
                    if (section != "All") {
                        Receiver += ' - ' + section;
                        if (StudentID == "") {
                            Receiver += ' (Students)';
                        } else {
                            Receiver += ' (Hand Pick)';
                        }
                        //var IDs = result.StudentIDs;
                        //if (StudentID == "2" && IDs != "") {
                        //    var data = "";
                        //    $("#ulStudentLst").empty();
                        //    for (var i = 0; i < ArrayDataStuName.length; i++) {
                        //        data = "<li>";
                        //        data += ArrayDataStuName[i];
                        //        data += "</li><br/>";
                        //        $("#ulStudentLst").append(data);

                        //    }
                        //    $('.divShowStudentList').show();
                        //}
                    } else {
                        Receiver += ' (Std students)';
                    }
                } else {
                    Receiver = "All Students"
                }
                $('#divReceiverConfirm').show();
                $('.lblReceiver').text(Receiver);

            }
       }
        function onConfirm() {
            var id = $("#<%=hdnId.ClientID %>").val();
            var url = '../Handlers/SmsApproval.ashx?Mode=SetApproved&ID=' + id;
            var result = JSON.parse(GetJsonResult(url));
            $("#<%=hdnId.ClientID %>").val('');
            $('#myModal').modal('hide');
            if (result.indexOf('success') > -1) {
                AppDisplayMessage(result, 1);
                BindApprovalData();
            } else {
                AppDisplayMessage(result, 2);
            }
        }
        function BindApprovalData() {
            try {
                $('#dataTable').dataTable().fnDestroy();
                var JsonData = [];
                var Mode = 'ApprovalList';
                var Id = 0;
                //Get Json Data from Server

                var Request = new XMLHttpRequest();
                var url = '../Handlers/SmsApproval.ashx?Mode=' + Mode +'&AppID=0';
                Request.open("GET", url, false);
                Request.send();
                var Data = Request.responseText;
                if (Data != undefined) {
                    Data = jQuery.parseJSON(Data);
                    $.each(Data, function (index, PARAM) {
                        if (PARAM.isApproved) {
                            JsonData.push([
                                index + 1, PARAM.RoleName, PARAM.MessagePreview, PARAM.ApprovedStatus, PARAM.ApprovedBy, PARAM.ApprovedOn,
                                "<button disabled class='btn btn-sm btn-primary m-t-n-xs col-sm-12' id=id+" + PARAM.ID + " type=button >Approved</button>",
                            ]);
                        } else {
                            JsonData.push([
                                index + 1, PARAM.RoleName, PARAM.MessagePreview, "<code>" + PARAM.ApprovedStatus + "</code>",  PARAM.ApprovedBy, PARAM.ApprovedOn,
                                "<button class='btn btn-sm btn-primary m-t-n-xs col-sm-12' id=id+" + PARAM.ID + " onclick='onApprove(" + PARAM.ID + ")' type=button >Approve</button>",
                            ]);
                        }
                    });
                    $('#dataTable').dataTable({
                        "bSearchable": true,
                        "bSortable": false,
                        "bFilter": true,
                        "bInfo": true,
                        "bLengthChange": false,
                        "bDestroy": true,
                        "bRetrieve": true,
                        "bVisible": false,
                        "sPaginationType": "full_numbers",
                        "sPaging": "pagination",
                        "bProcessing": true,
                        "bPaginate": true,
                        "iDisplayLength": 10,
                        "aaData": JsonData,
                    });
                }
                else {
                }
            }
            catch (e) {
                alert(e.message);
            }
          
        }
       
       
    </script>
</asp:Content>
