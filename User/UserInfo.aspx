<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="UserInfo.aspx.cs" Inherits="ILogisticsApplication.User.UserInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  
    <!--Datatable-->
    <style>
        .paddingtop {
            padding-top: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPanel" runat="server">
    <div class="wrapper wrapper-content fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>User Information <small>Manage User details</small></h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div class="row">
                            <div class="col-sm-12" id="div2" style="margin-bottom: 5px">
                                <h4 style="text-align: center; color: #EC4758" id="h2"></h4>
                                <div class="form-group  col-sm-4"></div>
                                <div class="form-group  col-sm-4">
                                    <%--<label>Roles</label>--%>
                                    <select class="form-control ddlCategory" id="ddlCategory" clientidmode="static" runat="server">
                                        <option value="0">-- Select Category --</option>
                                        <option value="1">Teaching Staff</option>
                                        <option value="2">Non-Teaching Staff</option>
                                    </select>
                                </div>
                                <div class="form-group  col-sm-4"></div>
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
                                                    <th style="text-align: center;">Employee Name</th>
                                                    <th style="text-align: center;">Department</th>
                                                    <th style="text-align: center;">Designation</th>
                                                    <th style="text-align: center;">Created By</th>
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
                    <button class="btn btn-danger" id="btnDelete" onclick="OnDelete()" type="button"><strong>Delete</strong></button>
                    <%-- onserverclick="Save_Click"--%>
                </div>
            </div>
        </div>
    </div>

    <div class="modal wrapper wrapper-content  animated fadeInRight" id="NewModal" tabindex="-1" role="dialog" aria-hidden="true">

        <div class="modal-content animated bounceInDown">
            <div class="">
                <div class="row" style="width: auto">

                    <div style="border-right: 1px solid #E7EAEC;" class="col-sm-4">
                        <div class="ibox ">

                            <div class="ibox-content" style="height: 585px">
                                <div class="tab-content">
                                    <div id="contact-1" class="tab-pane active">
                                        <div class="row m-b-lg">
                                            <div class="col-lg-4 text-center">
                                                <div class="m-b-sm">
                                                    <img alt="image" id="profileImage" class="img-rounded" width="80">
                                                </div>
                                            </div>
                                            <div class="col-lg-8">

                                                <div class="form-group">
                                                    <i class="fa fa-user"></i>
                                                    <div class="col-sm-11 pull-right">
                                                        <h4 id="hEmployeeName"></h4>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <i class="fa fa-graduation-cap"></i>
                                                    <div class="col-sm-11 pull-right">
                                                        <h5 id="hDepartment"></h5>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <i class="fa fa-phone-square"></i>
                                                    <div class="col-sm-11  pull-right">
                                                        <h5 id="hMobileNumber"></h5>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <i class="fa fa-envelope"></i>
                                                    <div class="col-sm-11  pull-right">
                                                        <h5 id="hEmail"></h5>
                                                    </div>
                                                </div>
                                            </div>


                                        </div>
                                        <div class="client-detail">
                                            <div class="full-height-scroll">

                                                <ul class="list-group clear-list">

                                                    <li class="list-group-item fist-item">
                                                        <span id="spnLastLogin" class="pull-right label label-primary"><i class="fa fa-clock-o"></i></span>
                                                        Last Login 
                                                    </li>
                                                    <li class="list-group-item">
                                                        <span id="spnUsername" class="pull-right"></span>
                                                        Empolyee portal Username
                                                    </li>
                                                    <li class="list-group-item">
                                                        <span id="spnPassword" class="pull-right"></span>
                                                        Empolyee portal Password
                                                    </li>


                                                    <li class="list-group-item">
                                                        <span id="spnIsPortalUsed" class="label label-primary pull-right"> </span>
                                                        Is portal used? 
                                                    </li>
                                                    <li class="list-group-item">
                                                        <span id="spnCredentialSent" class="label label-primary pull-right"></span>
                                                        Is Credential Sent?
                                                    </li>
                                                    <li class="list-group-item">
                                                        <span id="spnLoginCount" class="label label-primary pull-right"> </span>
                                                        Number of login count? 
                                                    </li>
                                                    <li class="list-group-item">
                                                        <span id="spnEmployeeAccSts" class="pull-right label label-primary"></span>
                                                        Employee Portal Account Status?
                                                    </li>

                                                    <li class="list-group-item">
                                                        <span id="spnProfileModified" class="pull-right label label-primary"></span>
                                                        Is Profile Information Modified?
                                                    </li>

                                                    <li class="list-group-item">
                                                        <span id="spnClassTeacher" class="text-navy  pull-right"></span>
                                                        Class Teacher for  
                                                    </li>
                                                </ul>


                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-8">
                        <div class="ibox">

                            <div class="" style="height: 585px">

                                <h2>Informations & Actions

                                    <button data-dismiss="modal" style="padding-right: 15px;" class="close pull-right" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                                </h2>

                                <div class="clients-list">
                                    <ul class="nav nav-tabs" id="ulTab">
                                        <!-- <span class="pull-right small text-muted">1406 Elements</span>-->
                                        <li id="liProfile" class="active"><a data-toggle="tab" href="#tab-1"><i class="fa fa-user"></i>Profile</a></li>
                                        <li id="liRole" class=""><a data-toggle="tab" href="#tab-2"><i class="fa fa-user"></i>Roles</a></li>
                                     <%--   <li id="liInternalMail" class=""><a data-toggle="tab" href="#tab-4"><i class="fa fa-briefcase"></i>Internal Mail</a></li>
                                        <li id="liMessage" class=""><a data-toggle="tab" href="#tab-5"><i class="fa fa-user"></i>Message</a></li>
                                        <li id="liEMail" class=""><a data-toggle="tab" href="#tab-6"><i class="fa fa-briefcase"></i>E-Mail</a></li>
                                        <li id="liTimeline" class=""><a data-toggle="tab" href="#tab-2"><i class="fa fa-briefcase"></i>Timeline</a></li>--%>
                                    </ul>
                                    <div class="tab-content">
                                        <div id="tab-1" class="tab-pane active">

                                            <div class="wrapper wrapper-content animated fadeInUp">
                                                <div class="ibox">
                                                    <div class="">
                                                        <div class="row">
                                                            <div class="col-lg-12">

                                                                <dl class="dl-horizontal">
                                                                    <dt>User Status:</dt>
                                                                    <dd><span class="label label-primary">Active</span></dd>
                                                                </dl>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-6">
                                                                <dl class="dl-horizontal">

                                                                    <dt class="paddingtop">First Name:</dt>
                                                                    <dd class="paddingtop" id="ddFirstName"></dd>
                                                                    <dt class="paddingtop">Last Name:</dt>
                                                                    <dd class="paddingtop" id="ddLastName"></dd>
                                                                    <dt class="paddingtop">Gender:</dt>
                                                                    <dd class="paddingtop" id="ddGender"></dd>
                                                                    <dt class="paddingtop">DOB:</dt>
                                                                    <dd class="paddingtop" id="ddDOB"></dd>

                                                                    <dt class="paddingtop">BloodGroup:</dt>
                                                                    <dd class="paddingtop" id="ddBloodGroup"></dd>
                                                                    <dt class="paddingtop">MaritalStatus:</dt>
                                                                    <dd class="paddingtop" id="ddMaritalStatus"></dd>

                                                                    <dt class="paddingtop">FatherName:</dt>
                                                                    <dd class="paddingtop" id="ddFatherName"></dd>

                                                                    <dt class="paddingtop">MotherName:</dt>
                                                                    <dd class="paddingtop" id="ddMotherName"></dd>
                                                                    <dt class="paddingtop">SpouseName:</dt>
                                                                    <dd class="paddingtop" id="ddSpouseName"></dd>
                                                                    <dt class="paddingtop">Nationality:</dt>
                                                                    <dd class="paddingtop" id="ddNationality"></dd>
                                                                    <dt class="paddingtop">AddressOne:</dt>
                                                                    <dd class="paddingtop" id="ddAddressOne"></dd>
                                                                    <dt class="paddingtop">AddressTwo:</dt>
                                                                    <dd class="paddingtop" id="ddAddressTwo"></dd>
                                                                    <dt class="paddingtop">City:</dt>
                                                                    <dd class="paddingtop" id="ddCity"></dd>

                                                                </dl>
                                                            </div>
                                                            <div class="col-lg-6" id="cluster_info">
                                                                <dl class="dl-horizontal">
                                                                    <dt class="paddingtop">State:</dt>
                                                                    <dd class="paddingtop" id="ddState"></dd>
                                                                    <dt class="paddingtop">Pincode:</dt>
                                                                    <dd class="paddingtop" id="ddPincode"></dd>
                                                                    <dt class="paddingtop">Phone Number:</dt>
                                                                    <dd class="paddingtop" id="ddPhoneNumber"></dd>
                                                                    <dt class="paddingtop">Emergency Number:</dt>
                                                                    <dd class="paddingtop" id="ddEmergencyNumber"></dd>
                                                                    <dt class="paddingtop">EmailID:</dt>
                                                                    <dd class="paddingtop" id="ddEmailID"></dd>

                                                                    <dt class="paddingtop">Department:</dt>
                                                                    <dd class="paddingtop" id="ddDepartment"></dd>
                                                                    <dt class="paddingtop">Designation:</dt>
                                                                    <dd class="paddingtop" id="ddDesignation"></dd>
                                                                    <dt class="paddingtop">Category:</dt>
                                                                    <dd class="paddingtop" id="ddCategory"></dd>
                                                                    <dt class="paddingtop">Qualification:</dt>
                                                                    <dd class="paddingtop" id="ddQualification"></dd>

                                                                    <dt class="paddingtop">Experience:</dt>
                                                                    <dd class="paddingtop" id="ddExperience"></dd>
                                                                    <dt class="paddingtop">Experience Details:</dt>
                                                                    <dd class="paddingtop" id="ddExperience_Details"></dd>
                                                                    <dt class="paddingtop">CreatedBy:</dt>
                                                                    <dd class="paddingtop" id="ddCreatedBy"></dd>
                                                                    <dt class="paddingtop">CreatedOn:</dt>
                                                                    <dd class="paddingtop" id="ddCreatedOn"></dd>

                                                                </dl>
                                                            </div>
                                                        </div>


                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <div id="tab-2" class="tab-pane">
                                            <div class="wrapper wrapper-content animated fadeInUp">
                                                <div class="ibox">
                                                    <div class="">

                                                        <div class="row">
                                                            <div class="col-lg-12">
                                                                <table style="text-align: center; width: 100%" id="tableRole" class="table table-bordered">
                                                                    <thead>
                                                                        <tr>
                                                                            <th style="text-align: center;">ID</th>
                                                                            <th style="text-align: center;">Role Name</th>


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
                                        <div id="tab-3" class="tab-pane">
                                            <div class="full-height-scroll">
                                                <h2>Internal Mail</h2>

                                            </div>
                                        </div>
                                        <div id="tab-4" class="tab-pane">
                                            <div class="full-height-scroll">
                                                <h2>Message</h2>
                                            </div>
                                        </div>
                                        <div id="tab-5" class="tab-pane">
                                            <div class="full-height-scroll">
                                                <h2>E-Mail</h2>
                                            </div>
                                        </div>
                                        <div id="tab-6" class="tab-pane">
                                            <div class="full-height-scroll">
                                                <h2>Timeline</h2>
                                            </div>
                                        </div>
                                        <%-- <div id="tab-6" class="tab-pane">
                                            <div class="full-height-scroll">
                                                <h2>Email</h2>
                                            </div>

                                        </div>--%>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <input type="hidden" id="hdnId" runat="server" />
    <input type="hidden" id="hdnStudentName" runat="server" />
    <input type="hidden" id="hdnMode" runat="server" />
    <input type="hidden" id="hdnCategory" runat="server" />

    <script type="text/javascript">
        var Category = '';
        $(document).ready(function () {

            $('#dataTable').DataTable({

                "bSearchable": false,
                "bSortable": false,
                "bFilter": true,
                "bInfo": true,
                "bLengthChange": false,
                "bVisible": false,
                "oLanguage": {
                    "sEmptyTable": "No records found"
                },
            });
        });
        $(".ddlCategory").change(function () {
            if ($(this).find("option:selected").val() != 0) {
                Category = $(this).find("option:selected").text();
                $("#<%=hdnCategory.ClientID %>").val(Category);
                BindUserData(Category);
            }

        });

        function BindUserData(Category) {
            try {
                $('#dataTable').dataTable().fnDestroy();
                var JsonData = [];
                var Mode = 'ForGrid';
                var Id = 0;
                //Get Json Data from Server

                var Request = new XMLHttpRequest();
                var url = '../Handlers/manageuser.ashx?Mode=' + Mode + '&Category=' + Category + '&Id=' + Id;
                Request.open("GET", url, false);
                Request.send();
                var Data = Request.responseText;

                if (Data != undefined) {

                    Data = jQuery.parseJSON(Data);
                    $.each(Data, function (index, PARAM) {
                        JsonData.push([
                           index + 1,
                           "<a onclick='OnShow(" + PARAM.User_Id + ")'  data-target=#NewModal data-toggle=modal>" + PARAM.EmployeeName + "</a>",
                           PARAM.Department, PARAM.Designation, PARAM.CreatedByName,
                           "<a onclick='OnEdit(" + PARAM.User_Id + ")' ><i class='fa fa-edit'></i></a>",
                           "<a onclick='OnDeleteId(" + PARAM.User_Id + ")' data-target=#myModal data-toggle=modal><i class='fa fa-trash'></i></a>",
                        ]);
                    })

                    $('#dataTable').dataTable({
                        "bRetrieve": true,
                        "bDestroy": true,
                        "bSearchable": true,
                        "bSortable": false,
                        "bFilter": true,
                        "bInfo": true,
                        "bLengthChange": false,
                        "bVisible": false,
                        "sPaginationType": "full_numbers",
                        "sPaging": "pagination",
                        "bProcessing": true,
                        "bPaginate": true,
                        "iDisplayLength": 10,
                        "oLanguage": {
                            "sEmptyTable": "No records found"
                        },
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

        function OnEdit(Id) {
            window.open('../User/UserEnrollment.aspx?MenuID=6&UserId=' + Id, '_blank');
        }

        function OnDeleteId(Id) {
            $("#<%=hdnId.ClientID %>").val(Id);
        }
        function OnDelete() {
            var Mode = 'DeleteUserById';
            var category = null;

            var Id = $("#<%=hdnId.ClientID %>").val();
            //Get Json Data from Server

            var Request = new XMLHttpRequest();
            var url = '../Handlers/manageUser.ashx?Mode=' + Mode + '&Category=' + category + '&Id=' + Id;
            Request.open("GET", url, false);
            Request.send();
            var Data = Request.responseText;
            $('#myModal').modal('hide');

            if (Data == 'Success') {
                AppDisplayMessage("Employee Information Deleted Successfully", 1);
                BindStudentData($('.ddlCategory').find("option:selected").text());
            }
        }

        function OnShow(Id) {
            $('#tableRole').children('tbody').empty();
            $('#ulTab').children('li').removeClass('active');

            $('#tab-1').addClass('active');
            $('#liProfile').addClass('active');

            var category = null;
            var Mode = 'GetById';
            var Request = new XMLHttpRequest();
            var url = '../Handlers/manageuser.ashx?Mode=' + Mode + '&Category=' + category + '&Id=' + Id;
            Request.open("GET", url, false);
            Request.send();
            var Data = Request.responseText;

            if (Data != undefined) {
                Data = jQuery.parseJSON(Data);
                $('#hEmployeeName').text(Data.EmployeeName);
                $('#hDepartment').text(Data.DepartmentName);
                $('#hMobileNumber').text(Data.PhoneNumber);
                if (Data.EmailID == '') {
                    $('#hEmail').text('N/A');
                } else {
                    $('#hEmail').text(Data.EmailID);
                }



                $('#ddFirstName').text(Data.FirstName);
                $('#ddLastName').text(Data.LastName);
                $('#ddGender').text(Data.Gender);
                $('#ddDOB').text(Data.DOB);
                $('#ddBloodGroup').text(Data.BloodGroup);
                $('#ddMaritalStatus').text(Data.MaritalStatus);
                $('#ddFatherName').text(Data.FatherName);
                $('#ddMotherName').text(Data.MotherName);
                $('#ddSpouseName').text(Data.SpouseName);
                $('#ddNationality').text(Data.NationalityName);
                $('#ddAddressOne').text(Data.AddressOne);
                $('#ddAddressTwo').text(Data.AddressTwo);
                $('#ddCity').text(Data.City);
                $('#ddState').text(Data.State);
                $('#ddPincode').text(Data.Pincode);
                $('#ddPhoneNumber').text(Data.PhoneNumber);
                $('#ddEmergencyNumber').text(Data.EmergencyNumber);
                $('#ddPincode').text(Data.ddPincode);
                $('#ddEmailID').text(Data.EmailID);
                $('#ddDepartment').text(Data.DepartmentName);
                $('#ddDesignation').text(Data.Designation);
                $('#ddCategory').text(Data.Category);
                $('#ddQualification').text(Data.Qualification);
                $('#ddExperience').text(Data.Experience);
                $('#ddExperience_Details').text(Data.Experience_Details);
                $('#ddCreatedBy').text(Data.CreatedByName);
                $('#ddCreatedOn').text(Data.CreatedOn);


                $('#spnUsername').text(Data.EmployeeUserName);
                $('#spnPassword').text(Data.EmployeePassword);
                $('#spnLastLogin').text(Data.LastLogin);
                $('#spnIsPortalUsed').text(Data.LoginCount > 0 ? "Yes" : "No");
                $('#spnLoginCount').text(Data.LoginCount);
                $('#spnClassTeacher').text(Data.ClassTeacher == "" ? "N/A" : Data.ClassTeacher);

                if (Data.IsCredentialSent == 'False') {
                    $('#spnCredentialSent').text('No');
                    $("#spnCredentialSent").removeClass("label label-primary").addClass("label label-danger");

                } else {
                    $('#spnCredentialSent').text('Yes');
                    $("#spnCredentialSent").removeClass("label label-danger").addClass("label label-primary");
                }
                if (Data.PortalStatus == '0') {
                    $('#spnEmployeeAccSts').text('Active');
                    $("#spnEmployeeAccSts").removeClass("label label-danger").addClass("label label-primary");

                } else {
                    $('#spnEmployeeAccSts').text('Locked');
                    $("#spnEmployeeAccSts").removeClass("label label-primary").addClass("label label-danger");
                }

                if (Data.IsModified == '0') {
                    $('#spnProfileModified').text('No');

                    $("#spnProfileModified").removeClass("label label-primary").addClass("label label-danger");
                } else {
                    $('#spnProfileModified').text('Yes');
                    $("#spnProfileModified").removeClass("label label-danger").addClass("label label-primary");
                }


                if (Data.ProfileImage == null) {

                    $('#profileImage').attr('src', '../Resource/img/NoImage.jpg');
                } else {
                    $('#profileImage').attr('src', 'data:image/png;base64,' + Data.ProfileImage);
                }


                var recRow = '';

                for (var i = 0; i <= Data.UserRoleEntity.length - 1; i++) {
                    recRow = '<tr id=rowCount' + Data.UserRoleEntity[i].Id + '><td><label>' + (i + 1) + '</label></td><td><label>' + Data.UserRoleEntity[i].RoleName + '</label></td></tr>';
                    jQuery('#tableRole').children('tbody').append(recRow);

                }


            }
        }
    </script>
</asp:Content>
