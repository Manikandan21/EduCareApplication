<%@ Page Title="" Language="C#" Async="true" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" ValidateRequest="false" CodeBehind="UserEnrollment.aspx.cs" Inherits="ILogisticsApplication.User.UserEnrollment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <style>
        .paddingtop {
            padding-top: 10px;
        }
    </style>
   <%-- <script type="text/javascript" src="http://digitalbush.com/wp-content/uploads/2013/01/jquery.maskedinput-1.3.1.min_.js"></script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPanel" runat="server">
    <div class="wrapper wrapper-content fadeInRight">
        <div class="row">
            <div class="form-group  col-sm-12">
                <div class="col-sm-8"></div>
                <div class="col-sm-4">
                    <div class=" col-sm-3"></div>
                    <button class="btn btn-sm btn-primary m-t-n-xs col-sm-4" id="btnSubmitUp" runat="server" type="button" onclick="if (!Validate()) {return false;}">Save</button>
                    <button class="btn btn-sm btn-danger pull-right m-t-n-xs col-sm-4" onclick="ClearText()" type="button">Clear Data</button>
                </div>
            </div>
            <div class="col-lg-12">

                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Personal Details <small>Manage Personal details</small></h5>
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
                                    <label>First Name <span class="text-danger">*</span></label>
                                    <input type="text" id="txtFirstName" runat="server" placeholder="" maxlength="50" class="form-control CharactersOnly" />
                                </div>
                                <div class="form-group col-sm-4">
                                    <label>Last Name <span class="text-danger">*</span></label>
                                    <input type="text" id="txtLastname" runat="server" placeholder="" maxlength="50" class="form-control CharactersOnly" />
                                </div>

                                <div class="form-group  col-sm-4">
                                    <label>DOB <span class="text-danger">*</span></label>
                                    <input type="text" id="txtDOB" runat="server" class="form-control txtDOB" />
                                </div>
                                <div class="form-group  col-sm-4">
                                    <label>Gender <span class="text-danger">*</span></label>
                                    <select class="form-control" id="ddlGender" clientidmode="static" runat="server">
                                        <option value="0">Unknown</option>
                                        <option value="1">Male</option>
                                        <option value="2">Female</option>
                                    </select>
                                </div>
                                <div class="form-group  col-sm-4">
                                    <label>Blood Group</label>
                                    <select class="form-control" id="ddlBloodgroup" clientidmode="static" runat="server">
                                        <option value="0">Unknown</option>
                                        <option value="1">A+</option>
                                        <option value="2">A-</option>
                                        <option value="3">AB+</option>
                                        <option value="4">AB-</option>
                                        <option value="5">A1+</option>
                                        <option value="6">A1-</option>
                                        <option value="7">A1B+</option>
                                        <option value="8">A1B-</option>
                                        <option value="9">A2+</option>
                                        <option value="10">A2-</option>
                                        <option value="11">A2B+</option>
                                        <option value="12">A2B-</option>
                                        <option value="13">B+</option>
                                        <option value="14">B-</option>
                                        <option value="15">B1+</option>
                                        <option value="16">O+</option>
                                        <option value="17">O-</option>
                                    </select>
                                </div>
                                <div class="form-group  col-sm-4">
                                    <label>Marital Status </label>

                                    <select class="form-control ddlMaritalStatus" id="ddlMaritalStatus" clientidmode="static" runat="server">
                                        <option value="0">Unknown</option>
                                        <option value="1">Single</option>
                                        <option value="2">Married</option>
                                        <option value="3">Divorced</option>

                                    </select>
                                </div>
                                <div class="form-group  col-sm-4">
                                    <label>Father Name <span class="text-danger">*</span></label>
                                    <input type="text" id="txtFatherName" runat="server" class="form-control CharactersOnly" />
                                </div>
                                <div class="form-group  col-sm-4">
                                    <label>Mother Name </label>
                                    <input type="text" id="txtMotherName" runat="server" class="form-control CharactersOnly" />
                                </div>
                                <div class="form-group  col-sm-4">
                                    <label>Spouse Name </label>
                                    <input type="text" id="txtSpouseName" runat="server" class="form-control CharactersOnly" />
                                </div>

                                <div class="form-group  col-sm-4">
                                    <label>Nationality <span class="text-danger">*</span></label>
                                    <select class="form-control ddlNationality" id="ddlNationality" clientidmode="static" runat="server">
                                        <option value="0">--Select--</option>

                                    </select>
                                </div>
                                <div class="form-group col-sm-4">
                                    <label>Address One <span class="text-danger">*</span></label>
                                    <input type="text" id="txtAddressOne" runat="server" placeholder="" maxlength="150" class="form-control" />
                                </div>
                                <div class="form-group col-sm-4">
                                    <label>Address Two <span class="text-danger">*</span></label>
                                    <input type="text" id="txtAddresstwo" runat="server" placeholder="" maxlength="150" class="form-control" />
                                </div>
                                <div class="form-group col-sm-4">
                                    <label>City <span class="text-danger">*</span></label>
                                    <input type="text" id="txtCity" runat="server" placeholder="" maxlength="50" class="form-control CharactersOnly" />
                                </div>
                                <div class="form-group col-sm-4">
                                    <label>State <span class="text-danger">*</span></label>
                                    <input type="text" id="txtState" runat="server" placeholder="" maxlength="50" class="form-control CharactersOnly" />
                                </div>
                                <div class="form-group col-sm-4">
                                    <label>Pincode <span class="text-danger">*</span></label>
                                    <input type="text" id="txtPincode" runat="server" placeholder="" maxlength="6" class="form-control NumbersOnly" />
                                </div>
                                <div class="form-group  col-sm-4">
                                    <label>Mobile Number <span class="text-danger">*</span></label>
                                    <input type="text" id="txtMobileNumber" runat="server" maxlength="10" class="form-control txtMobileNumber" />
                                </div>
                                <div class="form-group  col-sm-4">
                                    <label>Emergency Number</label>
                                    <input type="text" id="txtEmergencyNumber" runat="server" maxlength="20" class="form-control AltPhoneNumber" />
                                </div>

                                <div class="form-group  col-sm-4">
                                    <label>Email Address </label>
                                    <input type="email" id="txtEmail" runat="server" class="form-control" />
                                </div>
                                <div class="form-group  col-sm-4">
                                    <label>Send Credential </label>
                                    <asp:CheckBox ID="chkCredentialSend"  class="form-control" Text=" Is Credential Send" runat="server" Checked="false" />
                                </div>
                                <div class="form-group  col-sm-4">
                                    <label>Employee Image</label>

                                    <asp:FileUpload ID="UploadImage" CssClass="fileupload" runat="server" />
                                </div>
                            </div>
                        </div>


                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Profssional Details <small>Manage Profssional details</small></h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div class="row">
                            <div class="col-sm-12" id="div1" style="margin-bottom: 5px">
                                <h4 style="text-align: center; color: #EC4758" id="h1"></h4>

                                <div class="form-group  col-sm-4">
                                    <label>Department <span class="text-danger">*</span></label>
                                    <select class="form-control ddlDepartment" id="ddlDepartment" clientidmode="static" runat="server">
                                        <option value="0">Select</option>

                                    </select>
                                </div>
                                <div class="form-group  col-sm-4">
                                    <label>Designation <span class="text-danger">*</span></label>
                                    <input type="text" id="txtDesignation" runat="server" class="form-control CharactersOnly" />
                                </div>
                                <div class="form-group  col-sm-4">
                                    <label>Category <span class="text-danger">*</span></label>
                                    <select class="form-control" id="ddlCategory" clientidmode="static" runat="server">
                                        <option value="0">--Select--</option>
                                        <option value="1">Teaching Staff</option>
                                        <option value="2">Non-Teaching Staff</option>

                                    </select>
                                </div>
                                <div class="form-group  col-sm-4">
                                    <label>Qualification <span class="text-danger">*</span></label>
                                    <input type="text" id="txtQualification" runat="server" class="form-control" />
                                </div>
                                <div class="form-group  col-sm-4">
                                    <label>Experience (Month & Year) <span class="text-danger">*</span></label>
                                    <input type="text" id="txtExperience" runat="server" aria-multiline="true" class="form-control" />
                                </div>
                                <div class="form-group  col-sm-4">
                                    <label>Experience Details </label>
                                    <input type="text" id="txtExperienceDetails" runat="server" class="form-control" />
                                </div>



                            </div>
                        </div>


                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Role Mapping <small>Please select atleast one role (If user does not belongs to any role please Add the "Default Role")</small></h5>
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

                                    <select class="form-control ddlRole" id="ddlRole" clientidmode="static" runat="server">
                                        <option value="0">-- Select Role --</option>
                                    </select>
                                </div>
                                <div class="form-group  col-sm-4">
                                    <input type="button" id="btnAddRole" class=" btn btn-sm btn-primary col-sm-4" runat="server" value="Add Role" onclick="addMoreRows()" title="Add Role" />
                                </div>
                                <div class="form-group  col-sm-12">
                                    <table style="text-align: center; width: 100%" id="tableRole" class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th style="text-align: center;">ID</th>
                                                <th style="text-align: center;" class="RoleName">Role Name</th>
                                                <th style="text-align: center;">#</th>

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


            <div class="form-group  col-sm-12">
                <div class="col-sm-8"></div>
                <div class="col-sm-4">
                    <div class=" col-sm-3"></div>
                    <button class="btn btn-sm btn-primary m-t-n-xs col-sm-4" id="btnSubmitDown" runat="server" type="button" onclick="if (!Validate()) {return false;}">Save</button>
                    <button class="btn btn-sm btn-danger pull-right m-t-n-xs col-sm-4" onclick="ClearText()" type="button">Clear Data</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal wrapper wrapper-content  animated fadeInRight" id="UserModal" tabindex="-1" role="dialog" aria-hidden="true">

        <div class="modal-content animated bounceInDown">
            <div class="">
                <div class="row" style="width: auto">
                        
                   

                    <div class="col-sm-12">
                        <div class="ibox">

                            <div class="" style="height: 520px">

                                <h2>&nbsp;&nbsp; Confirmation

                                    <button data-dismiss="modal" style="padding-right: 15px;" class="close pull-right" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                                </h2>

                                <div class="clients-list">
                                  
                                    <div class="tab-content">
                                        <div id="tab-1" class="tab-pane active">

                                            <div class="wrapper wrapper-content animated fadeInUp">
                                                <div class="ibox">
                                                    <div class="">
                                                          <div class="row">
                                                            <div class="col-lg-6">

                                                                <dl class="dl-horizontal">
                                                                    <dt>Is Credential Send:</dt>
                                                                    <dd><span class="label label-primary" id="CredSend"></span></dd>
                                                                </dl>
                                                            </div>
                                                                 <div class="col-lg-6">

                                                                <dl class="dl-horizontal">
                                                                    <dt>Roles:</dt>
                                                                    <dd><span class="label label-primary" id="Roles"></span></dd>
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
                                                                   

                                                                </dl>
                                                            </div>
                                                            <div class="col-lg-6" id="cluster_info">
                                                                <dl class="dl-horizontal">
                                                                     <dt class="paddingtop">City:</dt>
                                                                    <dd class="paddingtop" id="ddCity"></dd>
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

                                                                </dl>
                                                            </div>
                                                        </div>

                                                         <div class="form-group  col-sm-12">
                <div class="col-sm-8"></div>
                <div class="col-sm-4">
                    <div class=" col-sm-3"></div>
                    <button class="btn btn-sm btn-primary m-t-n-xs col-sm-4" id="Button1" runat="server" type="button"  onserverclick="Save_Click">Confirm & Save</button>
                    <button class="btn btn-sm btn-danger pull-right m-t-n-xs col-sm-4"  data-dismiss="modal" type="button">Cancel</button>
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

                </div>
            </div>
        </div>
    </div>

    <input id="hdnCategory" type="hidden" runat="server" />
    <input id="hdnGender" type="hidden" runat="server" />
    <input id="hdnBloodGroup" type="hidden" runat="server" />
    <input id="hdnNationality" type="hidden" runat="server" />
    <input id="hdnDepartment" type="hidden" runat="server" />



    <input id="hdnRoleIDs" type="hidden" runat="server" />
    <input id="hdnIsRoleModified" type="hidden" runat="server" />
    <input id="hdnRoleTable" runat="server" type="hidden" />
    <script src="../Resource/js/plugins/fullcalendar/moment.min.js"></script>
     <script src="../Resource/js/plugins/mask/jquery.maskedinput-1.2.2-co.min.js.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            BindPageLoad();

            $(".ddlNationality").val('19');
            $(".ddlDepartment").val('0');


            //  $(".ddlRole").val('9');
            var length = $('#tableRole tr').length;
            if (length > 1) {
                $("#tableRole").show();
            } else {
                $("#tableRole").hide();
            }

            if ($("#<%=hdnRoleTable.ClientID %>").val() != '') {
                $("#tableRole").show();
                // jQuery('#tableRole').append($("#<%=hdnRoleTable.ClientID %>").val());
                jQuery('#tableRole').children('tbody').append($("#<%=hdnRoleTable.ClientID %>").val());
            }

            if ($("#<%=hdnNationality.ClientID %>").val() == '') {
                $("#<%=hdnNationality.ClientID %>").val($("#<%=ddlNationality.ClientID %>").val());
            } else {
                $("#<%=ddlNationality.ClientID %>").val($("#<%=hdnNationality.ClientID %>").val());
            }
            if ($("#<%=hdnDepartment.ClientID %>").val() == '') {

                $("#<%=hdnDepartment.ClientID %>").val($("#<%=ddlDepartment.ClientID %>").val());
            }
            else {
                $("#<%=ddlDepartment.ClientID %>").val($("#<%=hdnDepartment.ClientID %>").val());
            }
        });
        jQuery(function ($) {
            $.mask.definitions['~'] = '[+-]';
            $('.txtDOB').mask('99/99/9999');
            $('.txtMobileNumber').mask('(999) 999-9999');
            $('.AltPhoneNumber').mask("(999) 999-9999");

            //$("#tin").mask("99-9999999");
            //$("#ssn").mask("999-99-9999");
            //$("#product").mask("a*-999-a999", { placeholder: " ", completed: function () { alert("You typed the following: " + this.val()); } });
            //$("#eyescript").mask("~9.99 ~9.99 999");
        });

        $('.fileupload').change(function () {

            var ext = this.value.match(/\.(.+)$/)[1];
            switch (ext) {
                case 'jpg':
                case 'jpeg':
                case 'png':
                    break;
                default:
                    AppDisplayMessage("Only allowed following file types (jpg, jpeg, png)", 2);

                    this.value = '';
            }

            var filesize = this.files[0].size;

            var sizeInMb = filesize / 1024;
            var sizeLimit = 1024;
            if (sizeInMb > sizeLimit) {
                AppDisplayMessage("Maximum file size is 1 MB", 2);
                this.value = '';
            }
        });

        function isValidEmailAddress(emailAddress) {
            var pattern = new RegExp(/^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/);
            return pattern.test(emailAddress);
        };


        $(".ddlNationality").change(function () {
            var Nationality = $(this).find("option:selected").val();
            $("#<%=hdnNationality.ClientID %>").val(Nationality);
        });
        $(".ddlDepartment").change(function () {
            var Department = $(this).find("option:selected").val();
            $("#<%=hdnDepartment.ClientID %>").val(Department);
        });

        function BindPageLoad() {
            BindDropdown('GetDepartment', null, 0, '#ddlDepartment');
            BindDropdown('AdminRoles', null, 0, '#ddlRole');

            BindDropdown('GetNationality', null, 0, '#ddlNationality');
        }


        var rowCount = 0;
        function addMoreRows() {


            rowCount++;
            var RoleIDs = $("#<%=hdnRoleIDs.ClientID %>").val();

            var RoleId = $('#ddlRole').val();
            if (RoleIDs.indexOf(RoleId) != -1) {
                AppDisplayMessage("Role already exist", 2);
            } else {
                if (RoleId > 0) {
                    $("#tableRole").show();
                    var RoleName = $('#ddlRole').find("option:selected").text();
                    var recRow = '<tr id=rowCount' + RoleId + '><td><label>' + RoleId + '</label></td><td class=RoleName><label class=RoleNameLabel>' + RoleName + '</label></td><td> <a href="javascript:void(0);" onclick="removeRow(' + RoleId + ');"><i class="fa fa-trash"></i></a></td></tr>';
                    jQuery('#tableRole').append(recRow);
                    //   $("#hdnRoleTable").val($('#tableRole').html);
                    AddRemoveRoleId();

                } else {
                    AppDisplayMessage("Please select the Role", 2);
                }
            }
            $(".ddlRole").val('0');
        }

        function removeRow(RoleId) {

            rowCount--;
            if (rowCount == 0) {
                $("#tableRole").hide();
            }
            jQuery('#rowCount' + RoleId).remove();
            //   $("#hdnRoleTable").val($('#tableRole').html);
            AddRemoveRoleId();
        }

        function AddRemoveRoleId() {

            $("#<%=hdnIsRoleModified.ClientID %>").val(1);
            var Id = '';
            var length = $('#tableRole tr').length;
            var RoleID = '';
            if (length > 1) {

                $('#tableRole').find('tr').each(function () {
                    Id = $(this).find('td:first').text();
                    if (Id != "") {
                        if (RoleID == "") {
                            RoleID = Id;
                        } else {
                            RoleID = RoleID + ',' + Id;
                        }
                    }
                });
                $("#<%=hdnRoleIDs.ClientID %>").val(RoleID);

            }

            $("#<%=hdnRoleTable.ClientID %>").val($('#tableRole').children('tbody').html());

        }

        function Validate() {

            var FirstName = $("#<%=txtFirstName.ClientID %>").val(); //Required
            var LastName = $("#<%=txtLastname.ClientID %>").val();//Required
            var DOB = $("#<%=txtDOB.ClientID %>").val(); //Required
            var Gender = $("#<%=ddlGender.ClientID %>").val();//Required
            var BloodGroup = $("#<%=ddlBloodgroup.ClientID %>").val();
            var MaritalStatus = $("#<%=ddlMaritalStatus.ClientID %>").val();

            var FatherName = $("#<%=txtFatherName.ClientID %>").val();//Required
            var MotherName = $("#<%=txtMotherName.ClientID %>").val();
            var SpouseName = $("#<%=txtSpouseName.ClientID %>").val();
            var Nationality = $("#<%=ddlNationality.ClientID %>").val();

            var AddressOne = $("#<%=txtAddressOne.ClientID %>").val(); //Required
            var Addresstwo = $("#<%=txtAddresstwo.ClientID %>").val(); //Required
            var City = $("#<%=txtCity.ClientID %>").val();//Required
            var State = $("#<%=txtState.ClientID %>").val();//Required
            var Pincode = $("#<%=txtPincode.ClientID %>").val();//Required

            var MobileNumber = $("#<%=txtMobileNumber.ClientID %>").val(); //Required
            var EmergencyNumber = $("#<%=txtEmergencyNumber.ClientID %>").val();
            var Email = $("#<%=txtEmail.ClientID %>").val();
            var Department = $("#<%=ddlDepartment.ClientID %>").val();//Required
            var Designation = $("#<%=txtDesignation.ClientID %>").val();//Required
            var Category = $("#<%=ddlCategory.ClientID %>").val();//Required
            var Qualification = $("#<%=txtQualification.ClientID %>").val();//Required
            var Experience = $("#<%=txtExperience.ClientID %>").val();//Required
            var ProfileImage = $("#<%=UploadImage.ClientID %>").val();

            var RoleIds = $("#<%=hdnRoleIDs.ClientID %>").val();
            var EmailAddress;
            if (Email != "") {
                var EmailAddress = isValidEmailAddress(Email);
            }

            //Check Mandatory
            if (FirstName == "" || LastName == "" || DOB == "" || Gender == 0 || FatherName == "" || Nationality == 0 || AddressOne == "" || Addresstwo == "" || City == "" || State == "" || Pincode == "" || MobileNumber == "" || Department == "" || Designation == "" || Category == "" || Qualification == "" || Experience == "") {
                AppDisplayMessage("Please fill the mandatory fields", 2);
                return false;
            }
            if (!moment(DOB, 'DD/MM/YYYY', true).isValid()) {
                AppDisplayMessage("Please enter the valid DOB", 2);
                return false;
            }
            var now = moment().utc().add('year', -18);
            if (moment(DOB, 'DD/MM/YYYY', true).utc() > now) {
                AppDisplayMessage("DOB must be less than 18 years from current day", 2);
                return false;
            }
            if (EmailAddress == false) {
                AppDisplayMessage("Please enter the valid Email Address", 2);
                return false;
            }
            if (RoleIds == "") {
                AppDisplayMessage("Please select the atleast One role", 2);
                return false;
            }
            $('#ddFirstName').text(FirstName);
            $('#ddLastName').text(LastName);
            $('#ddGender').text($("#<%=ddlGender.ClientID %>").find('option:selected').text());
            $('#ddDOB').text(DOB);
            $('#ddBloodGroup').text($("#<%=ddlBloodgroup.ClientID %>").find('option:selected').text());
            $('#ddMaritalStatus').text($("#<%=ddlMaritalStatus.ClientID %>").find('option:selected').text());
            $('#ddFatherName').text(FatherName);
            $('#ddMotherName').text(MotherName);
            $('#ddSpouseName').text(SpouseName);
            $('#ddNationality').text($("#<%=ddlNationality.ClientID %>").find('option:selected').text());
            $('#ddAddressOne').text(AddressOne);
            $('#ddAddressTwo').text(Addresstwo);
            $('#ddCity').text(City);
            $('#ddState').text(State);
            $('#ddPincode').text(Pincode);
            $('#ddPhoneNumber').text(MobileNumber);
            $('#ddEmergencyNumber').text(EmergencyNumber);
            $('#ddEmailID').text(Email);
            $('#ddDepartment').text($("#<%=ddlDepartment.ClientID %>").find('option:selected').text());
            $('#ddDesignation').text(Designation);
            $('#ddCategory').text($("#<%=ddlCategory.ClientID %>").find('option:selected').text());
            $('#ddQualification').text(Qualification);
            $('#ddExperience').text(Experience);
            $('#ddExperience_Details').text($("#<%=txtExperienceDetails.ClientID %>").val());
            if ($("#<%=chkCredentialSend.ClientID %>").is(":checked")) {
                $('#CredSend').text("Yes");
            } else {
                $('#CredSend').text("No");
            }
            var Roles = '';
           
            $('#tableRole').find('tr').each(function () {
                if (Roles == '') {
                    Roles = $(this).find('td:eq(1)').text();
                } else {
                    Roles = Roles+', '+ $(this).find('td:eq(1)').text();
                }
                
            });
            $('#Roles').text(Roles);
            
            $('#UserModal').modal('show');
                return true;
        }

    </script>
</asp:Content>
