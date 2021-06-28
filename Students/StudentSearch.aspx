<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="StudentSearch.aspx.cs" Inherits="ILogisticsApplication.Students.StudentSearch" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                        <h5>Student Search Information <small>Search/Manage student details</small></h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <%--<div class="row">
                            <div class="col-sm-12" id="divEditable" style="margin-bottom: 5px">
                                <h4 style="text-align: center; color: #EC4758" id="headEditable"></h4>

                                <div class="form-group col-sm-6">
                                    <label>Course <span class="text-danger">*</span></label>
                                    <select class="form-control ddlCourse" id="ddlCourse" clientidmode="static" runat="server">
                                        <option value="0">--Select--</option>
                                    </select>
                                </div>
                                <div class="form-group  col-sm-6">
                                    <label>Section <span class="text-danger">*</span></label>
                                    <select class="form-control ddlSection" id="ddlSection" clientidmode="static" runat="server">
                                        <option value="0">--Select--</option>
                                    </select>
                                </div>
                           
                            </div>

                        </div>--%>

                        <div class="row">
                            <div class="col-sm-12">
                                <div class="ibox">

                                    <div class="">

                                        <table style="text-align: center; width: 100%" id="dataTable" class="table table-bordered">
                                            <thead>
                                                <tr>
                                                    <th style="text-align: center;">#</th>
                                                    <th style="text-align: center;">Student Name</th>
                                                    <th style="text-align: center;">Course</th>
                                                    <th style="text-align: center;">Section</th>
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
                                                        <h4 id="hStudentName"></h4>
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
                                        <div class="client-detail">
                                            <div class="full-height-scroll">

                                                <ul class="list-group clear-list">

                                                    <li class="list-group-item fist-item">
                                                        <span id="spnLastLogin" class="pull-right label label-primary"><i class="fa fa-clock-o"></i>2:10 pm - 12.06.2014</span>
                                                        Last Login ****
                                                    </li>
                                                    <li class="list-group-item">
                                                        <span id="spnUsername" class="pull-right"></span>
                                                        Parent portal Username
                                                    </li>
                                                    <li class="list-group-item">
                                                        <span id="spnPassword" class="pull-right"></span>
                                                        Parent portal Password
                                                    </li>
                                                    <li class="list-group-item">

                                                        <span id="spnStuUsername" class="pull-right"></span>
                                                        Student portal Username
                                                    </li>
                                                    <li class="list-group-item">
                                                        <span id="spnStuPassword" class="pull-right"></span>
                                                        Student portal  Password
                                                    </li>

                                                    <li class="list-group-item">
                                                        <span id="spnIsPortalUsed" class="label label-primary pull-right">Yes </span>
                                                        Is portal used? ****
                                                    </li>
                                                    <li class="list-group-item">
                                                        <span id="spnCredentialSent" class="label label-primary pull-right"></span>
                                                        Is Credential Sent?
                                                    </li>
                                                    <li class="list-group-item">
                                                        <span id="spnLoginCount" class="label label-primary pull-right">50 </span>
                                                        Number of login count? *****
                                                    </li>
                                                    <li class="list-group-item">
                                                        <span id="spnParentAccSts" class="pull-right label label-primary"></span>
                                                        Parent portal Account Status?
                                                    </li>
                                                    <li class="list-group-item">
                                                        <span id="spnStuAccountSts" class="pull-right label label-danger"></span>
                                                        Student portal Account Status?
                                                    </li>
                                                    <li class="list-group-item">
                                                        <span id="spnProfileModified" class="pull-right label label-primary"></span>
                                                        Is Profile Information Modified?
                                                    </li>

                                                    <li class="list-group-item">
                                                        <a class="text-navy" href="#"><span id="spnClassTeacher" class="pull-right">Robin Williams </span></a>

                                                        Class Teacher ****
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
                                    <ul class="nav nav-tabs">
                                        <!-- <span class="pull-right small text-muted">1406 Elements</span>-->
                                        <li id="liProfile" class="active"><a data-toggle="tab" href="#tab-1"><i class="fa fa-user"></i>Profile</a></li>
                                        <li id="liAttendance" class=""><a data-toggle="tab" href="#tab-2"><i class="fa fa-briefcase"></i>Attendance</a></li>
                                        <li id="liAcademic" class=""><a data-toggle="tab" href="#tab-3"><i class="fa fa-user"></i>Academic</a></li>
                                        <li id="liInternalMail" class=""><a data-toggle="tab" href="#tab-4"><i class="fa fa-briefcase"></i>Internal Mail</a></li>
                                        <li id="liMessage" class=""><a data-toggle="tab" href="#tab-5"><i class="fa fa-user"></i>Message</a></li>
                                        <li id="liEMail" class=""><a data-toggle="tab" href="#tab-6"><i class="fa fa-briefcase"></i>E-Mail</a></li>
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
            </div>
        </div>
    </div>

    <input type="hidden" id="hdnId" runat="server" />
    <input type="hidden" id="hdnStudentName" runat="server" />
    <input type="hidden" id="hdnMode" runat="server" />
       <!--Datatable-->
    <script src="../Resource/js/plugins/dataTables/datatables.min.js"></script>
    <!--Datatable-->
    <script type="text/javascript">
        var Course = '';
        $(document).ready(function () {
            var StudentName = GetParameterValues('StudentName');

            if (StudentName != undefined) {

            } else {

            }
            BindDropdown('GetCourse', null, 0, '#ddlCourse');
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
        $(".ddlCourse").change(function () {
            Course = $(this).find("option:selected").text();
            BindDropdown('GetSection', Course, 0, '#ddlSection');
            $(".ddlSection").focus();
        });
        $(".ddlSection").change(function () {
            var Section = $(this).find("option:selected").text();
            BindStudentData(Course, Section);
        });
        function BindStudentData(Course, Section) {
            try {
                $('#dataTable').dataTable().fnDestroy();
                var JsonData = [];
                var Mode = 'ForGrid';
                var Course = Course;
                var Section = Section;
                var Id = 0;
                //Get Json Data from Server

                var Request = new XMLHttpRequest();
                var url = '../Handlers/managestudents.ashx?Mode=' + Mode + '&Course=' + Course + '&Section=' + Section + '&Id=' + Id;
                Request.open("GET", url, false);
                Request.send();
                var Data = Request.responseText;

                if (Data != undefined) {

                    Data = jQuery.parseJSON(Data);
                    $.each(Data, function (index, PARAM) {
                        JsonData.push([
                           index + 1,
                           "<a onclick='OnShow(" + PARAM.Student_Id + ")'  data-target=#NewModal data-toggle=modal>" + PARAM.StudentName + "</a>",
                           PARAM.Course, PARAM.Section,
                           "<a onclick='OnEdit(" + PARAM.Student_Id + ")' ><i class='fa fa-edit'></i></a>",
                           "<a onclick='OnDeleteId(" + PARAM.Student_Id + ")' data-target=#myModal data-toggle=modal><i class='fa fa-trash'></i></a>",
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
                        "iDisplayLength": 100,
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
            window.open('../Students/StudentEnrollment.aspx?MenuID=58&StudentId=' + Id, '_blank');
        }

        function OnDeleteId(Id) {

            $("#<%=hdnId.ClientID %>").val(Id);
        }
        function OnDelete() {
            var Mode = 'DeleteStuById';
            var Course = null;
            var Section = null;
            var Id = $("#<%=hdnId.ClientID %>").val();
            //Get Json Data from Server

            var Request = new XMLHttpRequest();
            var url = '../Handlers/managestudents.ashx?Mode=' + Mode + '&Course=' + Course + '&Section=' + Section + '&Id=' + Id;
            Request.open("GET", url, false);
            Request.send();
            var Data = Request.responseText;
            $('#myModal').modal('hide');

            if (Data == 'Success') {
                AppDisplayMessage("Student Information Deleted Successfully", 1);
                BindStudentData($('.ddlCourse').find("option:selected").text(), $('.ddlSection').find("option:selected").text());
            }
        }

        function OnShow(Id) {
            var Course = $('.ddlCourse').find("option:selected").text();
            var Section = $('.ddlSection').find("option:selected").text();
            var Mode = 'ByStudent';
            var Request = new XMLHttpRequest();
            var url = '../Handlers/managestudents.ashx?Mode=' + Mode + '&Course=' + Course + '&Section=' + Section + '&Id=' + Id;
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
                $('#ddCreatedOn').text(Data[0].CreatedOn);


                $('#spnUsername').text(Data[0].ParentUserName);
                $('#spnPassword').text(Data[0].parentPassword);
                $('#spnStuUsername').text(Data[0].StudentUserName);
                $('#spnStuPassword').text(Data[0].StudentPassword);

                if (Data[0].IsCredentialSent == 'False') {
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
