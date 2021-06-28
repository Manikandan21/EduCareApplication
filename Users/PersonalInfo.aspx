<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="PersonalInfo.aspx.cs" Inherits="ILogisticsApplication.Users.PersonalInfo" %>
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
                        <div id="contact-1" class="tab-panel">
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
                                                <h5 id="hStudentName"></h5>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <i class="fa fa-graduation-cap"></i>
                                            <div class="col-sm-11 pull-right">
                                                <h5 id="hCourseSection"></h5>
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

                            </div>
                            <div class="client-detail" style="height: auto">
                                <div class="fullspnLastLogin-height-scroll">

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
                                            <span id="spnLoginCount" class="label label-primary pull-right"></span>
                                            Login count?
                                        </li>
                                     
                                        <li class="list-group-item">
                                            <span id="spnProfileModified" class="pull-right label label-primary"></span>
                                            Is Information Modified?
                                        </li>
                                         <li class="list-group-item">
                                                        <a class="text-navy" href="#"><span id="spnClassTeacher" class="pull-right"></span></a>

                                                        Class Teacher 
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
                                    <ul class="nav nav-tabs">
                                        <!-- <span class="pull-right small text-muted">1406 Elements</span>-->
                                        <li id="liProfile" class="active"><a data-toggle="tab" href="#tab-1"><i class="fa fa-user"></i>Profile</a></li>
                                        <%--<li id="liAttendance" class=""><a data-toggle="tab" href="#tab-2"><i class="fa fa-briefcase"></i>Attendance</a></li>--%>
                                      <%--  <li id="liAcademic" class=""><a data-toggle="tab" href="#tab-3"><i class="fa fa-user"></i>Academic</a></li>--%>
                                        <%--<li id="liInternalMail" class=""><a data-toggle="tab" href="#tab-4"><i class="fa fa-briefcase"></i>Internal Mail</a></li>--%>
                                        <%--<li id="liMessage" class=""><a data-toggle="tab" href="#tab-5"><i class="fa fa-user"></i>Message</a></li>--%>
                                     <%--   <li id="liEMail" class=""><a data-toggle="tab" href="#tab-6"><i class="fa fa-briefcase"></i>E-Mail</a></li>--%>
                                    </ul>
                                    <div class="tab-content">
                                        <div id="tab-1" class="tab-pane active">

                                            <div class="wrapper wrapper-content animated fadeInUp">
                                                <div class="ibox">
                                                    <div class="">
                                                        <div class="row">
                                                            <div class="col-lg-12">

                                                                <dl class="dl-horizontal">
                                                                    <dt>Student Status:</dt>
                                                                    <dd><span class="label label-primary">Active</span></dd>
                                                                </dl>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-6">
                                                                <dl class="dl-horizontal">

                                                                    <dt class="paddingtop">Admission Number:</dt>
                                                                    <dd class="paddingtop" id="ddAdmission_Number"></dd>
                                                                    <dt class="paddingtop">Student Name:</dt>
                                                                    <dd class="paddingtop" id="ddStudentName"></dd>
                                                                    <dt class="paddingtop">Course:</dt>
                                                                    <dd class="paddingtop" id="ddCourse"></dd>
                                                                    <dt class="paddingtop">Section:</dt>
                                                                    <dd class="paddingtop" id="ddSection"></dd>

                                                                    <dt class="paddingtop">Academic Year:</dt>
                                                                    <dd class="paddingtop" id="ddAcademicYear"></dd>
                                                                    <dt class="paddingtop">DOB:</dt>
                                                                    <dd class="paddingtop" id="ddDOB"></dd>
                                                                    <dt class="paddingtop">Gender:</dt>
                                                                    <dd class="paddingtop" id="ddGender"></dd>
                                                                    <dt class="paddingtop">BloodGroup:</dt>
                                                                    <dd class="paddingtop" id="ddBloodGroup"></dd>

                                                                    <dt class="paddingtop">Birth Place:</dt>
                                                                    <dd class="paddingtop" id="ddBirthPlace"></dd>
                                                                    <dt class="paddingtop">Nationality:</dt>
                                                                    <dd class="paddingtop" id="ddNationality"></dd>
                                                                    <dt class="paddingtop">Mother Tongue:</dt>
                                                                    <dd class="paddingtop" id="ddMotherTongue"></dd>
                                                                    <dt class="paddingtop">Category:</dt>
                                                                    <dd class="paddingtop" id="ddCategory"></dd>
                                                                    <dt class="paddingtop">Caste:</dt>
                                                                    <dd class="paddingtop" id="ddCaste"></dd>
                                                                    <dt class="paddingtop">Religion:</dt>
                                                                    <dd class="paddingtop" id="ddReligion"></dd>
                                                                </dl>
                                                            </div>
                                                            <div class="col-lg-6" id="cluster_info">
                                                                <dl class="dl-horizontal">

                                                                    <dt class="paddingtop">AddressOne:</dt>
                                                                    <dd class="paddingtop" id="ddAddressOne"></dd>
                                                                    <dt class="paddingtop">Addresstwo:</dt>
                                                                    <dd class="paddingtop" id="ddAddresstwo"></dd>
                                                                    <dt class="paddingtop">City:</dt>
                                                                    <dd class="paddingtop" id="ddCity"></dd>
                                                                    <dt class="paddingtop">State:</dt>
                                                                    <dd class="paddingtop" id="ddState"></dd>

                                                                    <dt class="paddingtop">Pincode:</dt>
                                                                    <dd class="paddingtop" id="ddPincode"></dd>
                                                                    <dt class="paddingtop">Country:</dt>
                                                                    <dd class="paddingtop" id="ddCountry"></dd>
                                                                    <dt class="paddingtop">MobileNumber:</dt>
                                                                    <dd class="paddingtop" id="ddMobileNumber"></dd>
                                                                    <dt class="paddingtop">AltPhoneNumber:</dt>
                                                                    <dd class="paddingtop" id="ddAltPhoneNumber"></dd>

                                                                    <dt class="paddingtop">Email:</dt>
                                                                    <dd class="paddingtop" id="ddEmail"></dd>
                                                                    <dt class="paddingtop">ParentName:</dt>
                                                                    <dd class="paddingtop" id="ddParentName"></dd>
                                                                    <dt class="paddingtop">Relationship:</dt>
                                                                    <dd class="paddingtop" id="ddRelationship"></dd>
                                                                    <dt class="paddingtop">EmergencyNumber:</dt>
                                                                    <dd class="paddingtop" id="ddEmergencyNumber"></dd>
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
                                            <div class="full-height-scroll">
                                                <h2>Attendance</h2>

                                            </div>
                                        </div>
                                        <div id="tab-3" class="tab-pane">
                                            <div class="full-height-scroll">
                                                <h2>Academic</h2>
                                            </div>
                                        </div>
                                        <div id="tab-4" class="tab-pane">
                                            <div class="full-height-scroll">
                                                <h2>Internal Mail</h2>
                                            </div>
                                        </div>
                                        <div id="tab-5" class="tab-pane">
                                            <div class="full-height-scroll">
                                                <h2>Message</h2>
                                            </div>
                                        </div>
                                        <div id="tab-6" class="tab-pane">
                                            <div class="full-height-scroll">
                                                <h2>Email</h2>
                                            </div>

                                        </div>
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

            var Mode = 'ByStudent';
            var Request = new XMLHttpRequest();
            var url = '../Handlers/managestudents.ashx?Mode=' + Mode + '&Course=1&Section=A&Id=' + Id;
            Request.open("GET", url, false);
            Request.send();
            var Data = Request.responseText;

            if (Data != undefined) {
                Data = jQuery.parseJSON(Data);
                $('#hStudentName').text(Data[0].StudentName);
                $('#hCourseSection').text(Data[0].Course + ' - ' + Data[0].Section);
                $('#hMobileNumber').text(Data[0].MobileNumber);
                if (Data[0].Email == '') {
                    $('#hEmail').text('N/A');
                } else {
                    $('#hEmail').text(Data[0].Email);
                }


                $('#ddAdmission_Number').text(Data[0].Admission_Number);
                $('#ddStudentName').text(Data[0].StudentName);
                $('#ddCourse').text(Data[0].Course);
                $('#ddSection').text(Data[0].Section);
                $('#ddAcademicYear').text(Data[0].AcademicYear);
                $('#ddDOB').text(Data[0].DOB);
                $('#ddGender').text(Data[0].Gender);
                $('#ddBloodGroup').text(Data[0].BloodGroup);
                $('#ddBirthPlace').text(Data[0].BirthPlace);
                $('#ddNationality').text(Data[0].Nationalityname);
                $('#ddMotherTongue').text(Data[0].MotherTongue);
                $('#ddCategory').text(Data[0].Category);
                $('#ddCaste').text(Data[0].Caste);
                $('#ddReligion').text(Data[0].Religion);
                $('#ddAddressOne').text(Data[0].AddressOne);
                $('#ddAddresstwo').text(Data[0].Addresstwo);
                $('#ddCity').text(Data[0].City);
                $('#ddState').text(Data[0].State);
                $('#ddPincode').text(Data[0].Pincode);
                $('#ddCountry').text(Data[0].CountryName);
                $('#ddMobileNumber').text(Data[0].MobileNumber);
                $('#ddAltPhoneNumber').text(Data[0].AltPhoneNumber);
                $('#ddEmail').text(Data[0].Email);
                $('#ddParentName').text(Data[0].ParentName);
                $('#ddRelationship').text(Data[0].Relationship);
                $('#ddEmergencyNumber').text(Data[0].EmergencyNumber);
                $('#ddCreatedBy').text(Data[0].CreatedByName);
                $('#ddCreatedOn').text(Data[0].CreatedDate);

                $('#spnLastLogin').text(Data[0].LastLogin);
                $('#spnUsername').text(Data[0].ParentUserName);
                $('#spnPassword').text(Data[0].parentPassword);
                //$('#spnStuUsername').text(Data[0].StudentUserName);
              //  $('#spnStuPassword').text(Data[0].StudentPassword);
                $('#spnIsPortalUsed').text(Data[0].LoginCount > 0 ? "Yes" : "No");
                $('#spnLoginCount').text(Data[0].LoginCount);
                $('#spnClassTeacher').text(Data[0].ClassTeacher);
                if (Data[0].IsCredentialSent == 'No') {
                    $('#spnCredentialSent').text('No');
                    $("#spnCredentialSent").removeClass("label label-primary").addClass("label label-danger");

                } else {
                    $('#spnCredentialSent').text('Yes');
                    $("#spnCredentialSent").removeClass("label label-danger").addClass("label label-primary");
                }
                if (Data[0].ParentPortalStatus == '0') {
                    $('#spnParentAccSts').text('Active');
                    $("#spnParentAccSts").removeClass("label label-danger").addClass("label label-primary");

                } else {
                    $('#spnParentAccSts').text('Locked');
                    $("#spnParentAccSts").removeClass("label label-primary").addClass("label label-danger");
                }
                if (Data[0].StudentPortalStatus == '0') {
                    $('#spnStuAccountSts').text('Active');
                    $("#spnStuAccountSts").removeClass("label label-danger").addClass("label label-primary");

                } else {
                    $('#spnStuAccountSts').text('Locked');
                    $("#spnStuAccountSts").removeClass("label label-primary").addClass("label label-danger");
                }
                if (Data[0].IsModified == '0') {
                    $('#spnProfileModified').text('No');

                    $("#spnProfileModified").removeClass("label label-primary").addClass("label label-danger");
                } else {
                    $('#spnProfileModified').text('Yes');
                    $("#spnProfileModified").removeClass("label label-danger").addClass("label label-primary");
                }


                if (Data[0].ProfileImage == null) {

                    $('#profileImage').attr('src', '../Resource/img/NoImage.jpg');
                } else {
                    $('#profileImage').attr('src', 'data:image/png;base64,' + Data[0].ProfileImage);
                }

            }
        }
     
    </script>
</asp:Content>
