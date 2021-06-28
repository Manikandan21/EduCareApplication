<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Department.aspx.cs" Inherits="ILogisticsApplication.Configuration.Department" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPanel" runat="server">
      <div class="wrapper wrapper-content fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Department <small>Manage course details</small></h5>
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
                                    <label>Department <span class="text-danger">*</span></label>
                                    <input type="text" id="txtDepartment" runat="server" placeholder="Enter Department" maxlength="25" class="form-control" />
                                </div>
                                <div class="form-group  col-sm-6">
                                    <label>Description <span class="text-danger">*</span></label>
                                    <input type="text" id="txtDescription" placeholder="Enter Description" runat="server" maxlength="225" class="form-control" />
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
                                                    <th style="text-align: center;">Department</th>
                                                    <th style="text-align: center;">Description</th>
                                                    
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

    <input type="hidden" id="hdnId" runat="server" />
    <input type="hidden" id="hdnMode" runat="server" />
    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%=txtDepartment.ClientID %>").focus();
            BindDepartmentData();

        });

        function BindDepartmentData() {
            try {
                var JsonData = [];
                var Mode = 'DepartmentConfig';
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
                           index + 1, PARAM.DepartmentName, PARAM.Description,
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

            //var Mode = 'CourseConfig';
            //var GetDataMode = 'SelectAll';
            //var Id = 0;
            //$.ajax({  
            //    type: "POST",  
            //    contentType: "application/json; charset=utf-8",  
            //    url: "../Handlers/Configuration.ashx?Mode="+Mode+"&GetDataMode="+GetDataMode+"&Id="+Id,
            //    data: "{}",  
            //    dataType: "json",  
            //    success: function (data) {                    
            //        for (var i = 0; i < data.length; i++) {                        
            //            $("#dataTable").append("<tr><td>" + data[i].Id + "</td><td>" + data[i].Std + "</td><td>" + data[i].Section + "</td><td>" + data[i].Course_code + "</td><td><a onclick='Edit(" + data[i].Id + ")' ><i class='fa fa-edit'></i></a></td><td><a onclick='OnDelete(" + data[i].Id + ")'><i class='fa fa-trash'></i></a></td>  </tr>");
            //        }  
            //    },  
            //    error: function (result) {  
            //        alert("Error");  
            //    }  
            //});           
        }

        function Validate() {

            var Department = $('#<%=txtDepartment.ClientID %>').val();
            var Description = $('#<%=txtDescription.ClientID %>').val();

            if (Department == '' || Description == '') {
                AppDisplayMessage('Please fill the mandatory fields', 2);
                return false;
            }
            else {
                return true;
            }
        }
        function ClearText() {
            $('#<%=txtDepartment.ClientID %>').val('');
            $('#<%=txtDescription.ClientID %>').val('');
            $('#<%=hdnId.ClientID %>').val('');
            $('#<%=hdnMode.ClientID %>').val('');
            $("#divEditable").css("background-color", "#FFFFFF solid 0.5px");
            $("#<%=btnSubmit.ClientID %>").text("Save");
            $("#headEditable").text("");
        }

        function OnEdit(id) {
            $("#<%=txtDepartment.ClientID %>").focus();
            $("#<%=btnSubmit.ClientID %>").text("Update");
            $("#divEditable").css("background-color", "#F3F3F4 solid 0.5px");
            try {
                var JsonData = [];
                var Mode = 'DepartmentConfig';
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
                        $('#<%=txtDepartment.ClientID %>').val(PARAM.DepartmentName);
                        $('#<%=txtDescription.ClientID %>').val(PARAM.Description);
                        $('#<%=hdnId.ClientID %>').val(PARAM.Id);
                        $('#<%=hdnMode.ClientID %>').val('Update');
                    });
                }
            }

            catch (e) {
                alert(e.message);
            }
            $("#headEditable").text("Currently you are editing " + $('#<%=txtDepartment.ClientID %>').val());

        }

        function OnDelete(Id) {
            $('#<%=hdnId.ClientID %>').val(Id);
            $('#<%=hdnMode.ClientID %>').val('Delete');

            $('#<%=txtDepartment.ClientID %>').val('');
            $('#<%=txtDescription.ClientID %>').val('');
            $("#divEditable").css("background-color", "#FFFFFF solid 0.5px");
            $("#<%=btnSubmit.ClientID %>").text("Save");
            $("#headEditable").text("");
        }

    </script>


</asp:Content>
