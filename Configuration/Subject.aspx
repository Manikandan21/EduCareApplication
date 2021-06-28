<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Subject.aspx.cs" Inherits="ILogisticsApplication.Configuration.Subject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPanel" runat="server">
    <div class="wrapper wrapper-content fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Subjects <small>Manage subject details</small></h5>
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
                                    <label>Subject <span class="text-danger">*</span></label>
                                    <input type="text" id="txtSubject" runat="server" placeholder="Enter subject" maxlength="35" class="form-control" />
                                </div>
                                <div class="form-group col-sm-4">
                                    <label>Short Code <span class="text-danger">*</span></label>
                                    <input type="text" id="txtShortCode" runat="server" style="text-transform:uppercase" placeholder="Enter short code for reference" maxlength="3" class="form-control CharactersOnly" />
                                </div>
                                <div class="form-group col-sm-4">
                                    <label>Subject Type <span class="text-danger">*</span></label>
                                    <select class="form-control ddlSubjectType" id="ddlType" runat="server">
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

                                        <button class="btn btn-sm btn-primary m-t-n-xs col-sm-5" id="btnSubmit" runat="server" type="button" onclick="if (!Validate()) {return false;}" onserverclick="Save_Click"><strong>Save</strong></button><%----%>
                                        <button class="btn btn-sm btn-danger pull-right m-t-n-xs col-sm-6" onclick="ClearText()" type="button"><strong>Clear Data</strong></button>
                                    </div>
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
                                                    <th style="text-align: center;">Id</th>
                                                    <th style="text-align: center;">Subject</th>
                                                    <th style="text-align: center;">Type</th>
                                                    <th style="text-align: center;">Primary Subject</th>
                                                    <th style="text-align: center;">Max.Marks</th>
                                                    <th style="text-align: center;">Min.Marks</th>
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
                    <%--  --%>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" id="hdnId" runat="server" />
    <input type="hidden" id="hdnMode" runat="server" />
    <input type="hidden" id="hdnPrimaryValue" runat="server" />
    <script type="text/javascript">
        $(document).ready(function () {

            BindSubjectData();

            BindDropdown('GetSubject', null, 0, '#ddlPrimarySubject');

            $("#<%=txtSubject.ClientID %>").focus();

            $(".ddlSubjectType").change(function () {
                if ($('#<%=ddlType.ClientID %>').val() == 2) {
                    $("#divPrimarySubject").show();
                    $('#<%=ddlPrimarySubject.ClientID %>').val(0);
                }
                else {
                    $("#divPrimarySubject").hide();
                }
            });

            $(".ddlPrimarySubject").change(function () {
                if ($('#<%=ddlPrimarySubject.ClientID %>').val() != 0) {
                    $('#<%=hdnPrimaryValue.ClientID %>').val($('#<%=ddlPrimarySubject.ClientID %>').val());
                }
            });
        });

        function BindSubjectData() {
            try {
                var JsonData = [];
                var Mode = 'SubjectConfig';
                var GetDataMode = 'SelectAll';
                var Id = 0;
                //Get Json Data from Server

                var Request = new XMLHttpRequest();
                var url = '../Handlers/Configuration.ashx?Mode=' + Mode + '&GetDataMode=' + GetDataMode + '&Id=' + Id;
                Request.open("GET", url, false);
                Request.send();
                var Data = Request.responseText;

                if (Data != undefined) {
                    Data = jQuery.parseJSON(Data);
                    $.each(Data, function (index, PARAM) {
                        JsonData.push([
                           index + 1, PARAM.Subject, PARAM.TypeName, PARAM.Primary_SubName, PARAM.MaxMarks, PARAM.MinMarks,
                           "<a onclick='OnEdit(" + PARAM.Id + ")' ><i class='fa fa-edit scrollToTop'></i></a>",
                           "<a onclick='OnDelete(" + PARAM.Id + ")' data-target=#myModal data-toggle=modal><i class='fa fa-trash'></i></a>",
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
                else {
                }
            }
            catch (e) {
                alert(e.message);
            }
        }
        function OnEdit(id) {
            try {
                $("#<%=txtSubject.ClientID %>").focus();
                $("#<%=btnSubmit.ClientID %>").text("Update");
                $("#divEditable").css("background-color", "#F3F3F4 solid 0.5px");
                BindDropdown('GetSubjectNonID', null, id, '#ddlPrimarySubject');
                var JsonData = [];
                var Mode = 'SubjectConfig';
                var GetDataMode = 'SelectID';
                var Id = id;
                //Get Json Data from Server

                var Request = new XMLHttpRequest();
                var url = '../Handlers/Configuration.ashx?Mode=' + Mode + '&GetDataMode=' + GetDataMode + '&Id=' + Id;
                Request.open("GET", url, false);
                Request.send();
                var Data = Request.responseText;

                if (Data != undefined) {
                    Data = jQuery.parseJSON(Data);
                    $.each(Data, function (index, PARAM) {

                        $('#<%=txtSubject.ClientID %>').val(PARAM.Subject);
                        $('#<%=txtShortCode.ClientID %>').val(PARAM.ShortCode);
                        $('#<%=ddlType.ClientID %>').val(PARAM.Type);
                        $('#<%=txtMaxMarks.ClientID %>').val(PARAM.MaxMarks);
                        $('#<%=txtMinMarks.ClientID %>').val(PARAM.MinMarks);
                        if (PARAM.Type == 2) {
                            $("#divPrimarySubject").show();
                            $('#<%=ddlPrimarySubject.ClientID %>').val(PARAM.Primary_Subject);
                        } else {
                            $("#divPrimarySubject").hide();
                        }

                        $('#<%=hdnId.ClientID %>').val(PARAM.Id);
                        $('#<%=hdnMode.ClientID %>').val('Update');
                        $('#<%=hdnPrimaryValue.ClientID %>').val($('#<%=ddlPrimarySubject.ClientID %>').val());
                    });
                }
                $("#headEditable").text("Currently you are editing the subject is " + $('#<%=txtSubject.ClientID %>').val());
            }

            catch (e) {
                alert(e.message);
            }


        }

        function OnDelete(Id) {
            $('#<%=hdnId.ClientID %>').val(Id);
            $('#<%=hdnMode.ClientID %>').val('Delete');

            $('#<%=txtSubject.ClientID %>').val('');
            $('#<%=txtMaxMarks.ClientID %>').val('');
            $('#<%=txtMinMarks.ClientID %>').val('');
            $('#<%=ddlType.ClientID %>').val(0);
            $('#<%=ddlPrimarySubject.ClientID %>').val(0);
            $("#divEditable").css("background-color", "#FFFFFF solid 0.5px");
            $("#<%=btnSubmit.ClientID %>").text("Save");
            $("#headEditable").text("");
        }

        function Validate() {

            var Subject = $('#<%=txtSubject.ClientID %>').val();
            var Type = $('#<%=ddlType.ClientID %>').val();
            var MaxMarks = $('#<%=txtMaxMarks.ClientID %>').val();
            var MinMarks = $('#<%=txtMinMarks.ClientID %>').val();
            var ShortCode = $('#<%=txtShortCode.ClientID %>').val(); 
            if (Subject == '' || Type == 0 || MaxMarks == '' || MinMarks == '' || ShortCode=='') {
                AppDisplayMessage('Please fill the mandatory fields', 2);
                return false;
            }

            else if (MaxMarks == 0 || MinMarks == 0) {
                AppDisplayMessage('Maximum mark and minimum marks should not be in zero', 2);
                return false;
            }
            else if (Number(MaxMarks) < Number(MinMarks)) {

                AppDisplayMessage('Maximum mark should be greater than minimum marks', 2);
                return false;
            }
            else if (isNaN(MaxMarks) || (isNaN(MinMarks))) {
                AppDisplayMessage('Please enter the valid numbers in Maximum marks and Minimum marks', 2);
                return false;
            }
            else if (Type == 2) {
                var PrimaryType = $('#<%=ddlPrimarySubject.ClientID %>').val();
                    if (PrimaryType == 0) {
                        AppDisplayMessage('Please select the primary subject', 2);
                        return false;
                    }
                    else {
                        return true;
                    }
                }
                else {
                    return true;
                }
}

function ClearText() {
    $('#<%=txtSubject.ClientID %>').val('');
    $('#<%=txtMaxMarks.ClientID %>').val('');
    $('#<%=txtMinMarks.ClientID %>').val('');
    $('#<%=ddlType.ClientID %>').val(0);
    $('#<%=ddlPrimarySubject.ClientID %>').val(0);
    $('#<%=hdnId.ClientID %>').val('');
    $('#<%=hdnMode.ClientID %>').val('');
    $('#<%=hdnPrimaryValue.ClientID %>').val('');
    $('#<%=txtShortCode.ClientID %>').val('');

    $("#divPrimarySubject").hide();
    BindDropdown('GetSubject', null, 0, '#ddlPrimarySubject');

    $("#divEditable").css("background-color", "#FFFFFF solid 0.5px");
    $("#<%=btnSubmit.ClientID %>").text("Save");
    $("#headEditable").text("");
}


    </script>
</asp:Content>
