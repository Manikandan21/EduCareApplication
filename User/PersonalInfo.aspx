<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="PersonalInfo.aspx.cs" Inherits="ILogisticsApplication.User.PersonalInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .paddingtop {
            padding-top: 10px;
        }

        .paddingLeft {
            padding-top: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPanel" runat="server">
    <div class="row wrapper">

        <div class="col-sm-3">
            <div class="ibox">

                <div class="ibox-content" style="height: 100%;">
                    <div class="tab-content">
                        <div id="contact-1" class="tab-panel ">
                            <div class="row m-b-lg">
                                <div class="col-lg-12 text-center">
                                    <div class="m-b-sm">
                                        <img alt="image" id="profileImage" class="img-rounded" width="80">
                                    </div>
                                </div>

                                <div class="row m-b-lg">
                                    <div style="padding-left: 18px;" class="col-lg-12">

                                        <div class="form-group">
                                            <i class="fa fa-user"></i>
                                            <div class="col-sm-11 pull-right">
                                                <h5 id="hEmployeeName"></h5>
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
                                            <div class="col-sm-11 col-lg-11 pull-right">
                                                <h5 id="hEmail"></h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="client-detail" style="height: auto">
                                <div class="full-height-scroll">

                                    <ul class="list-group clear-list">

                                        <li class="list-group-item fist-item">
                                            <span id="spnLastLogin" class="pull-right label label-primary"><i class="fa fa-clock-o"></i></span>
                                            Last Login 
                                        </li>
                                        <li class="list-group-item">
                                            <span id="spnUsername" class="pull-right"></span>
                                            Portal Username
                                        </li>
                                        <li class="list-group-item">
                                            <span id="spnPassword" class="pull-right"></span>
                                            Portal Password
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
                                            Login count? 
                                        </li>
                                        <li class="list-group-item">
                                            <span id="spnEmployeeAccSts" class="pull-right label label-primary"></span>
                                            Portal Account Status?
                                        </li>

                                        <li class="list-group-item">
                                            <span id="spnProfileModified" class="pull-right label label-primary"></span>
                                            Is Information Modified?
                                        </li>

                                        <li class="list-group-item">
                                            <span id="spnClassTeacher" class="text-navy pull-right"></span>

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

        <div class="col-sm-9" style="background-color: #FFFFFF;">
            <div class="ibox">

                <div class="">

                    <h2>Informations

                                   <%-- <button data-dismiss="modal" style="padding-right: 15px;" class="close pull-right" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>--%>
                    </h2>

                    <div class="clients-list">
                        <ul class="nav nav-tabs" id="ulTab">
                            <!-- <span class="pull-right small text-muted">1406 Elements</span>-->
                            <li id="liProfile" class="active"><a data-toggle="tab" href="#tab-1"><i class="fa fa-user"></i>Profile</a></li>
                            <li id="liRole" class=""><a data-toggle="tab" href="#tab-2"><i class="fa fa-user"></i>Roles</a></li>
                           <%-- <li id="liTimeline" class=""><a data-toggle="tab" href="#tab-2"><i class="fa fa-briefcase"></i>Timeline</a></li>--%>
                        </ul>
                        <div class="tab-content">
                            <div id="tab-1" class="tab-pane active">

                                <div class="wrapper wrapper-content animated fadeInUp">
                                    <div class="ibox">
                                        <div class="" style="height: 100%; width: 100%">
                                            <div class="row">
                                                <div class="col-lg-12">

                                                    <dl class="dl-horizontal">
                                                        <dt>User Status:</dt>
                                                        <dd><span class="label label-primary">Active</span></dd>
                                                    </dl>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-6  paddingLeft">
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
                                                <div class="col-lg-6 paddingLeft">
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
                            <%--<div id="tab-3" class="tab-pane">
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
                            </div>--%>
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
    <input id="hdnId" runat="server" type="hidden" />
    <script type="text/javascript">
        $(document).ready(function () {

            var id = $("#<%=hdnId.ClientID %>").val();
            //   alert(id);
            if (id != '') {
                OnShow(id);
            }
        });
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
                $('#spnIsPortalUsed').text(Data.LoginCount>0?"Yes":"No");
                $('#spnLoginCount').text(Data.LoginCount);
                $('#spnClassTeacher').text(Data.ClassTeacher);



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
                    recRow = '<tr id=rowCount' + Data.UserRoleEntity[i].Id + '><td><label>' + (i+1) + '</label></td><td><label>' + Data.UserRoleEntity[i].RoleName + '</label></td></tr>';
                    jQuery('#tableRole').children('tbody').append(recRow);

                }


            }
        }
    </script>
</asp:Content>
