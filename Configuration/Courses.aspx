<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage/AdminMaster.Master" CodeBehind="Courses.aspx.cs" Inherits="ILogisticsApplication.Configuration.Courses" %>

<asp:Content ID="Content" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function BindCourseData() {
            try {
                var JsonData = [];
                var Mode = 'CourseConfig';
                var GetDataMode = 'SelectAll';
                var Id = 0;
                $('#dataTable').dataTable().fnDestroy();
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
                            index + 1, PARAM.Std, PARAM.Section, PARAM.Course_code,
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
                                <h5>Courses <small>Manage course details</small></h5>
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

                                        <div class="form-group col-sm-6">
                                            <label>Course <span class="text-danger">*</span></label>
                                            <input type="text" id="txtCourse" runat="server" placeholder="Enter course" maxlength="15" class="form-control" />
                                        </div>
                                        <div class="form-group  col-sm-6">
                                            <label>Section <span class="text-danger">*</span></label>
                                            <input type="text" id="txtSection" placeholder="Enter section" runat="server" maxlength="15" class="form-control" />
                                        </div>
                                        <div class="form-group  col-sm-12">
                                            <div class="col-sm-7"></div>
                                            <div class="col-sm-5">

                                                <button class="btn btn-sm btn-primary m-t-n-xs col-sm-5" id="btnSubmit" runat="server" type="button" onclick="if (!Validate()) {return false;}" onserverclick="Save_Click"><strong>Save</strong></button>
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
                                                            <th style="text-align: center;">#</th>
                                                            <th style="text-align: center;">Course</th>
                                                            <th style="text-align: center;">Section</th>
                                                            <th style="text-align: center;">Code</th>
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
            $("#<%=txtCourse.ClientID %>").focus();
            BindCourseData();

        });

       

        function Validate() {

            var Std = $('#<%=txtCourse.ClientID %>').val();
            var Section = $('#<%=txtSection.ClientID %>').val();

            if (Std == '' || Section == '') {
                AppDisplayMessage('Please fill the mandatory fields', 2);
                return false;
            }
            else {
                return true;
            }
        }
        function ClearText() {
            $('#<%=txtCourse.ClientID %>').val('');
            $('#<%=txtSection.ClientID %>').val('');
            $('#<%=hdnId.ClientID %>').val('');
            $('#<%=hdnMode.ClientID %>').val('');
            $("#divEditable").css("background-color", "#FFFFFF solid 0.5px");
            $("#<%=btnSubmit.ClientID %>").text("Save");
            $("#headEditable").text("");
        }

        function OnEdit(id) {
            $("#<%=txtCourse.ClientID %>").focus();
            $("#<%=btnSubmit.ClientID %>").text("Update");
            $("#divEditable").css("background-color", "#F3F3F4 solid 0.5px");
            try {
                var JsonData = [];
                var Mode = 'CourseConfig';
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
                        $('#<%=txtCourse.ClientID %>').val(PARAM.Std);
                        $('#<%=txtSection.ClientID %>').val(PARAM.Section);
                        $('#<%=hdnId.ClientID %>').val(PARAM.Id);
                        $('#<%=hdnMode.ClientID %>').val('Update');
                    });
                }
            }

            catch (e) {
                alert(e.message);
            }
            $("#headEditable").text("Currently you are editing " + $('#<%=txtCourse.ClientID %>').val() + " - " + $('#<%=txtSection.ClientID %>').val());

        }

        function OnDelete(Id) {
            $('#<%=hdnId.ClientID %>').val(Id);
            $('#<%=hdnMode.ClientID %>').val('Delete');

            $('#<%=txtCourse.ClientID %>').val('');
            $('#<%=txtSection.ClientID %>').val('');
            $("#divEditable").css("background-color", "#FFFFFF solid 0.5px");
            $("#<%=btnSubmit.ClientID %>").text("Save");
            $("#headEditable").text("");
        }

    </script>



</asp:Content>
