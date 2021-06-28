<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage/AdminMaster.Master" CodeBehind="Branches.aspx.cs" Inherits="ILogisticsApplication.Configuration.Branches" %>

<asp:Content ID="Content" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function BindBranchesData() {
            try {
                var JsonData = [];
                var Mode = 'BranchConfig';
                var GetDataMode = 'SelectAll';
                var Id = 0;
                $('#dataTable').dataTable().fnDestroy();
                //Get Json Data from Server
                var url = '../Handlers/Configuration.ashx?Mode=' + Mode + '&GetDataMode=' + GetDataMode + '&Id=' + Id;
                
                fetch(url)
                    .then((response) => response.json())
                    .then((Data) => {
                        if (Data !== []) {
                            $.each(Data, function (index, PARAM) {
                                JsonData.push([
                                    index + 1, PARAM.branchName,
                                    '<a onclick=OnEdit(' + PARAM.branchID + ')><i class="fa fa-edit scrollToTop"></i></a>',
                                    "<a onclick='OnDelete(" + PARAM.branchID + ")' data-target=#myModal data-toggle=modal><i class='fa fa-trash'></i></a>",
                                ]);
                            })

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
                    });
            }
            catch (e) {
                alert(e.message);
            }   
            $(".modal-backdrop").hide();
        }
    </script>
</asp:Content>
<asp:Content ID="Panel" ContentPlaceHolderID="ContentPanel" runat="server">
     <asp:ScriptManager ID="ScriptMngr" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="updatepanel" runat="server">
        <ContentTemplate>
            <div class="wrapper wrapper-content fadeInRight">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>Branches <small>Manage branch details</small></h5>
                                <div class="ibox-tools">
                                    <a class="collapse-link">
                                        <i class="fa fa-chevron-up"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="ibox-content">
                                <div class="form-horizontal">
                                    <div class="col-sm-12" id="divEditable" style="margin-bottom: 5px">
                                        <h4 style="text-align: center; color: forestgreen; padding: 10px" id="headEditable"></h4>

                                        <div class="form-group">
                                            <label class="col-lg-2 control-label">Branch Name <span class="text-danger">*</span></label>
                                            <div class="col-lg-4"><input type="text" id="txtBranchName" runat="server" placeholder="Enter Branch" maxlength="50" class="form-control" /></div>
                                            <div class="col-lg-3">
                                                <button class="btn btn-primary" id="btnSubmit" runat="server" type="button" onclick="if (!Validate()) {return false;}" onserverclick="Save_Click"><strong>Create</strong></button>
                                                <button class="btn btn-danger pull-right" onclick="ClearText()" type="button"><strong>Clear Data</strong></button>
                                            </div>
                                            <div class="col-lg-3"></div>
                                        </div>
                                    </div>

                                </div>

                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="ibox">

                                            <div class="">

                                                <table style="text-align: center; width: 100%" id="dataTable" class="table table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th style="text-align: center;">#</th>
                                                            <th style="text-align: center;">Branch Name</th>
                                                            <th style="text-align: center;">Edit</th>
                                                            <th style="text-align: center;">Delete</th>
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
                            <h1 class="modal-title">Are you sure Do you want delete?</h1>

                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-white" data-dismiss="modal">Close</button>
                            <button class="btn btn-danger" id="btnDelete" runat="server" type="button" onserverclick="Save_Click"><strong>Delete</strong></button>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <input type="hidden" id="hdnId" runat="server" />
    <input type="hidden" id="hdnMode" runat="server" />
    <script type="text/javascript">

        $(document).ready(function () {
            $("#<%=txtBranchName.ClientID %>").focus();
            BindBranchesData();
        });      

        function Validate() {

            var branchName = $('#<%=txtBranchName.ClientID %>').val();;

            if (branchName == '') {
                AppDisplayMessage('Please fill the mandatory fields', 2);
                return false;
            }
            else {
                return true;
            }
        }
        function ClearText() {
            $('#<%=txtBranchName.ClientID %>').val('');
            $('#<%=hdnId.ClientID %>').val('');
            $('#<%=hdnMode.ClientID %>').val('');
            $("#divEditable").css("background-color", "#FFFFFF solid 0.5px");
            $("#<%=btnSubmit.ClientID %>").text("Save");
            $("#headEditable").text("");
        }

        function OnEdit(branchID) {
            if ($('#<%=hdnId.ClientID %>').val() == branchID) {
                return;
            }
            var url = '../Handlers/Configuration.ashx?Mode=BranchConfig&GetDataMode=SelectID&Id=' + branchID;
            fetch(url)
                .then((response) => response.json())
                .then((Data) => {
                    $('#<%=txtBranchName.ClientID %>').val(Data[0].branchName);
                    $("#headEditable").text("Right now you are editing " + Data[0].branchName +" branch");
                });
            $("#<%=txtBranchName.ClientID %>").focus();
            $("#<%=btnSubmit.ClientID %>").text("Update");
            $("#divEditable").css("background-color", "#F3F3F4 solid 0.5px");
            $('#<%=hdnId.ClientID %>').val(branchID);
            $('#<%=hdnMode.ClientID %>').val('Update');
        }

        function OnDelete(branchID) {
            $('#<%=hdnId.ClientID %>').val(branchID);
            $('#<%=hdnMode.ClientID %>').val('Delete');

            $('#<%=txtBranchName.ClientID %>').val('');
            $("#divEditable").css("background-color", "#FFFFFF solid 0.5px");
            $("#<%=btnSubmit.ClientID %>").text("Save");
            $("#headEditable").text("");
        }

    </script>



</asp:Content>
