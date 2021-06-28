<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="UnlockUser.aspx.cs" Inherits="ILogisticsApplication.Configuration.UnlockUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPanel" runat="server">
    <div class="wrapper wrapper-content fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Manage locked user's to unlock</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div class="row" style="height: auto">
                            <div class="col-sm-3" id="divSearchAreaAll" style="margin-bottom: 5px">
                                <h4 style="text-align: center; color: #EC4758" id="headEditable3"></h4>
                                <div class="form-group col-sm-12">
                                    <label>User Type *</label>
                                    <select class="form-control ddlUserType" id="ddlUserType" clientidmode="static" runat="server">
                                        <option value="0">--Select--</option>
                                        <option value="Parent">Parent</option>
                                        <option value="Staff">Staff</option>
                                        <option value="Student">Student</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-3" id="divSearchArea" style="margin-bottom: 5px">
                                <h4 style="text-align: center; color: #EC4758" id="headEditable2"></h4>
                                <div class="form-group col-sm-12">
                                    <label>User Name</label>
                                    <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-sm-3" id="divlabel" style="margin-bottom: 5px">
                                <h4 style="text-align: center; color: #EC4758" id="headlabel1"></h4>
                                <div class="form-group col-sm-12">
                                    <div style="height: 29px"></div>
                                    <input type="button" id="btnSearch" value="Search" onclick="return false;" class="btn btn-primary m-t-n-xs col-sm-8 btnSearch" />
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <h4 style="text-align: center; color: #EC4758" id="headlabel3"></h4>
                                <div class="form-group col-sm-12 divlabelbtn" style="display: none;">
                                    <div style="height: 29px"></div>
                                    <input type="button" id="btnUnlock" value="Unlock User" onclick="return false;" class="btn btn-primary m-t-n-xs col-sm-8 btnUnlock" />
                                </div>
                            </div>
                        </div>
                        <div class="row" style="height: auto">
                            <div class="col-sm-12">
                                <div class="ibox">
                                    <div class="">
                                        <table style="text-align: center; width: 100%" id="dataTable" class="table table-bordered">
                                            <thead id="thead">
                                                <tr>
                                                    <th style="text-align: center;">#
                                                    </th>
                                                    <th style="text-align: center;">User Name</th>
                                                    <th style="text-align: center;">User Type</th>
                                                    <th style="text-align: center;">Status</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row" style="height: auto">
                            <div class="col-sm-3">
                            </div>
                            <div class="col-sm-3">
                            </div>
                            <div class="col-sm-3">
                            </div>
                            <div class="col-sm-3">
                                <h4 style="text-align: right; color: #EC4758" id="headlabel4"></h4>
                                <div class="form-group col-sm-12 divlabelbtn" style="display: none;">
                                    <div style="height: 29px"></div>
                                    <input type="button" id="btnUnlock1" value="Unlock User" onclick="return false;" class="btn btn-primary m-t-n-xs col-sm-8 btnUnlock" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <input type="hidden" id="hdnUserType" value="" />
        <input type="hidden" id="hdnUserName" value="" />
    </div>
    <div class="modal inmodal" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content animated bounceInDown">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <i class="fa fa-question-circle modal-icon"></i>
                    <h1 class="modal-title">Do you want to unlock following user(s)?</h1>

                </div>
                <div id="divStudentList" style="padding-top: 10px">
                    <ul id="ulStudentLst">
                    </ul>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">Close</button>
                    <button class="btn btn-danger" id="btnDelete" onclick="UnlockUsers()" type="button"><strong>Confirm</strong></button>
                    <%-- onserverclick="Save_Click"--%>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        window.ArrayData = new Array();
        $(document).ready(function () {
            $('#dataTable').DataTable({

                "bSearchable": false,
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

            $(".btnSearch").on("click", function () {
                var UserType = $("#ddlUserType").find("option:selected").text();
                if (UserType == undefined || UserType == "" || UserType == null || UserType == '--Select--') {
                    AppDisplayMessage("Please select the User Type", 2);
                    return false;
                }

                var TxtUserName = $('#<%= txtUserName.ClientID %>').val();
                if (TxtUserName == undefined || TxtUserName.trim() == "") {
                    TxtUserName = "";
                }
                else if (TxtUserName.trim() != "") {
                    if (TxtUserName.length < 4) {
                        AppDisplayMessage("Search criteria should be atleast 4 charecters.", 2);
                        return false;
                    }
                }
                $("#hdnUserType").val(UserType);
                $("#hdnUserName").val(TxtUserName);
                BindDataToTable("search", TxtUserName, UserType, "");
            });
            $('.btnUnlock').click(function () {
                GetUserName();
            });
        });

        function UnlockUsers() {
            var userType = $("#hdnUserType").val();
            var userName = $("#hdnUserName").val();
            BindDataToTable("unlock", userName, userType, ArrayData);
            //$("#myModal").hide();
        }
        function BindDataToTable(Mode, UserName, UserType, UnlockUsers) {
            ArrayData = [];
            $('#dataTable').dataTable().fnDestroy();
            var JsonData = [];

            var Request = new XMLHttpRequest();
            var url = '../Handlers/UnlockUser.ashx?UserName=' + UserName + '&Mode=' + Mode + '&UserType=' + UserType + '&UnlockUsers=' + UnlockUsers;
            Request.open("GET", url, false);
            Request.send();
            var Data = Request.responseText;

            if (Data != undefined) {
                Data = jQuery.parseJSON(Data);
                $.each(Data, function (index, PARAM) {
                    if (index == 0 && Mode == "unlock") {
                        if (PARAM.UserName == "SUCCESS") {
                            $('#myModal').modal('hide');
                            AppDisplayMessage("All the selected users has been unlocked successfully.", 1);
                        }
                    }
                    else {
                        JsonData.push([
                            "<input type=checkbox class=i-checks id=" + PARAM.UserName + ">",
                            PARAM.UserName, PARAM.UserType, PARAM.Status
                        ]);
                    }
                });

                $('#dataTable').dataTable({
                    "bRetrieve": true,
                    "bDestroy": true,
                    "bSearchable": true,
                    "bSortable": true,
                    "bFilter": true,
                    "bInfo": true,
                    "bLengthChange": false,
                    "bVisible": false,
                    "sPaginationType": "full_numbers",
                    "sPaging": "pagination",
                    "bProcessing": true,
                    "bPaginate": true,
                    "iDisplayLength": 100,
                    "oLanguage": {
                        "sEmptyTable": "No records found"
                    },
                    "aaData": JsonData,

                });
                $(".divlabelbtn").hide();
                checkboxclick();
            }
        }
        function checkboxclick() {
            $('.i-checks').click(function () {
                try {

                    if ($(this).is(':checked')) {
                        //alert(ArrayData);
                        ArrayData.push($(this).attr("id"));
                        //alert(ArrayData);
                    } else {

                        if (ArrayData.length > 0) {

                            for (var i = ArrayData.length - 1; i >= 0; i--) {
                                //alert('Array : ' + ArrayData[i]);
                                //alert('id : ' + $(this).attr("id"));
                                if ('' + ArrayData[i] + '' === '' + $(this).attr("id") + '') {
                                    //alert('eql');
                                    ArrayData.splice(i, 1);
                                }
                            }
                        }
                    }
                    //Show the shuffle button.
                    if (ArrayData.length > 0) {
                        $(".divlabelbtn").show();
                    }
                    else {
                        $(".divlabelbtn").hide();
                    }

                }
                catch (e) {
                    alert(e);
                }
            });
        }
        function GetUserName() {
            var data = "";
            $("#ulStudentLst").empty();
            $(".btnUnlock").attr("data-toggle", "modal");
            $(".btnUnlock").attr("data-placement", "top");
            $(".btnUnlock").attr("data-target", "#myModal");
            if (ArrayData.length != 0) {
                for (var i = 0; i < ArrayData.length; i++) {
                    data = "<li>";
                    //data += $("#name" + ArrayData[i]).text();
                    data += ArrayData[i]
                    data += "</li><br/>";
                    $("#ulStudentLst").append(data);
                }
            }
        }
    </script>
</asp:Content>
