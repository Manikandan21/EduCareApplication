<%@ Page Title="" Async="true" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="StudentEnrollment.aspx.cs" Inherits="ILogisticsApplication.Students.StudentEnrollment" %>

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
            <div class="form-group  col-sm-12">
                <div class="col-sm-8"></div>
                <div class="col-sm-4">
                    <div class=" col-sm-3"></div>
                    <button class="btn btn-sm btn-primary m-t-n-xs col-sm-4" id="btnSubmitUp" runat="server" type="button" onclick="if (!Validate()) {return false;}" >Save</button>
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
                                    <label>Admission Number</label>
                                    <input type="text" id="txtAdmission" runat="server" placeholder="" maxlength="20" class="form-control AlphaNumeic" />
                                </div>
                                <div class="form-group col-sm-4">
                                    <label>First Name <span class="text-danger">*</span></label>
                                    <input type="text" id="txtFirstName" runat="server" placeholder="" maxlength="50" class="form-control CharactersOnly" />
                                </div>
                                <div class="form-group col-sm-4">
                                    <label>Last Name <span class="text-danger">*</span></label>
                                    <input type="text" id="txtLastname" runat="server" placeholder="" maxlength="50" class="form-control CharactersOnly" />
                                </div>
                                 <div class="form-group col-sm-4">
                                    <label>Academic Year <span class="text-danger">*</span></label>
                                    <select class="form-control ddlAcademicYr" id="ddlAcademicYr" clientidmode="static" runat="server">
                                                                        
                                    </select>
                                </div>
                                <div class="form-group col-sm-4">
                                    <label>Course <span class="text-danger">*</span></label>
                                    <select class="form-control ddlCourse" id="ddlCourse" clientidmode="static" runat="server">
                                        <option value="0">--Select--</option>
                                    </select>
                                </div>
                                <div class="form-group col-sm-4">
                                    <label>Section <span class="text-danger">*</span></label>
                                    <select class="form-control ddlSection" id="ddlSection" clientidmode="static" runat="server">
                                        <option value="0">--Select--</option>
                                    </select>
                                </div>
                                <div class="form-group  col-sm-4">
                                    <label>DOB <span class="text-danger">*</span></label>
                                    <input type="text" id="txtDOB" maxlength="10" runat="server" class="form-control txtDOB" />
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
                                    <label>Birth Place </label>
                                    <input type="text" id="txtBirthPalce" runat="server" class="form-control CharacterWithSpace" />
                                </div>
                                <div class="form-group  col-sm-4">
                                    <label>Nationality <span class="text-danger">*</span></label>
                                    <select class="form-control ddlNationality" id="ddlNationality" clientidmode="static" runat="server">
                                        <option value="0">--Select--</option>

                                    </select>
                                </div>
                                <div class="form-group  col-sm-4">
                                    <label>Mother Tongue </label>
                                    <input type="text" id="txtMotherTongue" runat="server" class="form-control CharactersOnly" />
                                </div>
                                <div class="form-group  col-sm-4">
                                    <label>Religion</label>
                                    <select class="form-control" id="ddlReligion" clientidmode="static" runat="server">
                                        <option value="0">Unknown</option>
                                        <option value="1">Hindu</option>
                                        <option value="2">Christian</option>
                                        <option value="3">Islam</option>
                                        <option value="4">Jain</option>
                                    </select>
                                </div>

                                <div class="form-group  col-sm-4">
                                    <label>Category</label>
                                    <select class="form-control" id="ddlCategory" clientidmode="static" runat="server">
                                        <option value="0">Unknown</option>
                                        <option value="1">BC</option>
                                        <option value="2">MBC</option>
                                        <option value="3">SC / ST</option>
                                    </select>
                                </div>
                                <div class="form-group  col-sm-4">
                                    <label>Caste</label>
                                    <input type="text" id="txtCaste" runat="server" class="form-control CharacterWithSpace" />
                                </div>
                                 <div class="form-group  col-sm-4">
                                    <label>Send Credential </label>
                                    <asp:CheckBox ID="chkCredentialSend"  class="form-control chkCredentialSend" Text=" Is Credential Send" runat="server" Checked="false" />
                                </div>
                                <div class="form-group  col-sm-4">
                                    <label>Student Image</label>
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
                        <h5>Contact Details <small>Manage Contact details</small></h5>
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
                                <div class="form-group col-sm-4">
                                    <label>Country <span class="text-danger">*</span></label>
                                    <select class="form-control ddlCountry" id="ddlCountry" clientidmode="static" runat="server">
                                        <option value="0">--Select--</option>
                                    </select>
                                </div>

                                <div class="form-group  col-sm-4">
                                    <label>Mobile Number <span class="text-danger">*</span></label>
                                    <input type="text" id="txtMobileNumber" runat="server" maxlength="10" class="form-control txtMobileNumber" />
                                </div>
                                <div class="form-group  col-sm-4">
                                    <label>Alternate Mobile Number</label>
                                    <input type="text" id="txtAltMobileNumber" runat="server" maxlength="20" class="form-control AltPhoneNumber" />
                                </div>

                                <div class="form-group  col-sm-4">
                                    <label>Email Address </label>
                                    <input type="email" id="txtEmail" runat="server" class="form-control" />
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
                        <h5>Parent Details <small>Manage Parent & Siblings details</small></h5>
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
                                <div class="form-group  col-sm-4">
                                    <label>Parent Name <span class="text-danger">*</span></label>
                                    <input type="text" id="txtParentName" runat="server" class="form-control CharactersOnly" />
                                </div>
                                <div class="form-group  col-sm-4">
                                    <label>Relationship <span class="text-danger">*</span></label>
                                    <select class="form-control" id="ddlRelationship" clientidmode="static" runat="server">
                                        <option value="0">--Select--</option>
                                        <option value="1">Father</option>
                                        <option value="2">Mother</option>
                                        <option value="3">Guardian</option>
                                        <option value="4">Other</option>
                                    </select>
                                </div>
                                <div class="form-group col-sm-4">
                                    <label>Emergency Contact Number</label>
                                    <input type="text" id="txtEmergencyNumber" runat="server" placeholder="" maxlength="20" class="form-control txtEmergencyNumber" />
                                </div>

                                <div class="form-group  col-sm-4"  style="display: none">
                                    <label>Siblings Studying in Org.</label>
                                    <select class="form-control ddlSiblingDetails" id="ddlSiblingDetails" clientidmode="static" runat="server">
                                        <option value="0">--Select--</option>
                                        <option value="1">Yes</option>
                                        <option value="2">No</option>
                                    </select>
                                </div>
                                <div id="divSiblingsDetails" style="display: none">
                                    <div class="form-group col-sm-4">
                                        <label>Course <span class="text-danger">*</span></label>
                                        <select class="form-control" id="ddlSiblingCourse" clientidmode="static" runat="server">
                                            <option value="0">--Select--</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-sm-4">
                                        <label>Section <span class="text-danger">*</span></label>
                                        <select class="form-control" id="ddlSiblingSection" clientidmode="static" runat="server">
                                            <option value="0">--Select--</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-sm-4">
                                        <label>Sibling Name <span class="text-danger">*</span></label>
                                        <select class="form-control" id="ddlSiblingName" clientidmode="static" runat="server">
                                            <option value="0">--Select--</option>
                                        </select>
                                    </div>
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
    <div class="modal wrapper wrapper-content  animated fadeInRight" id="StudentModal" tabindex="-1" role="dialog" aria-hidden="true">

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
                                                            <div class="col-lg-12">

                                                                <dl class="dl-horizontal">
                                                                    <dt>Is Credential Send:</dt>
                                                                    <dd><span class="label label-primary" id="CredSend"></span></dd>
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
                                                                   
                                                                </dl>
                                                            </div>
                                                            <div class="col-lg-6" id="cluster_info">
                                                                <dl class="dl-horizontal">
                                                                     <dt class="paddingtop">Religion:</dt>
                                                                    <dd class="paddingtop" id="ddReligion"></dd>
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
    <input id="hdnAcademicYear" type="hidden" runat="server" />
    <input id="hdnCourse" type="hidden" runat="server" />
    <input id="hdnSection" type="hidden" runat="server" />
    <input id="hdnCategory" type="hidden" runat="server" />
    <input id="hdnReligion" type="hidden" runat="server" />
    <input id="hdnGender" type="hidden" runat="server" />
    <input id="hdnBloodGroup" type="hidden" runat="server" />
    <input id="hdnNationality" type="hidden" runat="server" />
    <input id="hdnRelation" type="hidden" runat="server" />
    <input id="hdnCountry" type="hidden" runat="server" />
    <input id="hdnSiblingsId" type="hidden" runat="server" />
    


    <%-- Script Files--%>
   <script src="../Resource/js/plugins/fullcalendar/moment.min.js"></script>
     <script src="../Resource/js/plugins/mask/jquery.maskedinput-1.2.2-co.min.js.js"></script>
 
      
    <%-- Script Files--%>

    <%--  Validation--%>
    <script type="text/javascript">
        $(document).ready(function () {
            BindPageLoad();
            $(".ddlCountry").val('99');
            $(".ddlNationality").val('19');
           
            if ($("#<%=hdnCourse.ClientID %>").val() == '') {
                $("#<%=hdnCourse.ClientID %>").val($("#<%=ddlCourse.ClientID %>").text());
            } else {
                $('.ddlCourse option').map(function () {
                    if ($(this).text() == $("#<%=hdnCourse.ClientID %>").val()) return this;
                 }).attr('selected', 'selected');
                //$(".ddlCourse option[(" + $("#<%=hdnCourse.ClientID %>").val() + ")]").attr('selected', 'selected');                
            
                var Course = $('.ddlCourse').find("option:selected").text();            
                $("#<%=hdnCourse.ClientID %>").val(Course);
                BindDropdown('GetSection', Course, 0, '#ddlSection');    
               // $('.ddlSection option').filter(function () { return $.trim($(this).text()) == $("#<%=hdnSection.ClientID %>").val(); })​​​​​​​​.attr('selected', 'selected');​​​​​​​
                $('.ddlSection option').map(function () {
                    if ($(this).text() == $("#<%=hdnSection.ClientID %>").val()) return this;
                }).attr('selected', 'selected');
               
             //   $(".ddlSection").val($("#<%=hdnSection.ClientID %>").val());
                //$(".ddlSection option:contains(" + $("#<%=hdnSection.ClientID %>").val() + ")").attr('selected', 'selected');   
            }
            if ($("#<%=hdnAcademicYear.ClientID %>").val() == '') {
                $('.ddlAcademicYr option').map(function () {
                    if ($(this).val() == 1) return this;
                }).attr('selected', 'selected');
            } else {
                $('.ddlAcademicYr option').map(function () {
                    if ($(this).text() == $("#<%=hdnAcademicYear.ClientID %>").val()) return this;
                }).attr('selected', 'selected');
            }
          

            if ($("#<%=hdnNationality.ClientID %>").val() == '') {
                $("#<%=hdnNationality.ClientID %>").val($("#<%=ddlNationality.ClientID %>").val());
            } else {
                $("#<%=ddlNationality.ClientID %>").val($("#<%=hdnNationality.ClientID %>").val());
            }
            if ($("#<%=hdnCountry.ClientID %>").val() == '') {
                
                $("#<%=hdnCountry.ClientID %>").val($("#<%=ddlCountry.ClientID %>").val());
            }
            else {
                $("#<%=ddlCountry.ClientID %>").val($("#<%=hdnCountry.ClientID %>").val());
            }

            $.mask.definitions['~'] = '[+-]';
            $('.txtDOB').mask('99/99/9999');
            $('.txtMobileNumber').mask('(999) 999-9999');
            $('.AltPhoneNumber').mask("(999) 999-9999");
            $('.txtEmergencyNumber').mask("(999) 999-9999");
        });
        //jQuery(function ($) {
           
        //    //$("#tin").mask("99-9999999");
        //    //$("#ssn").mask("999-99-9999");
        //    //$("#product").mask("a*-999-a999", { placeholder: " ", completed: function () { alert("You typed the following: " + this.val()); } });
        //    //$("#eyescript").mask("~9.99 ~9.99 999");
        //});
        function Validate() {
            var Admission_Number = $("#<%=txtAdmission.ClientID %>").val();
            var FirstName = $("#<%=txtFirstName.ClientID %>").val(); //Required
            var LastName = $("#<%=txtLastname.ClientID %>").val();//Required
            var Course = $("#<%=ddlCourse.ClientID %>").val(); //Required
            var Section = $("#<%=ddlSection.ClientID %>").val();//Required

            var DOB = $("#<%=txtDOB.ClientID %>").val(); //Required
            var Gender = $("#<%=ddlGender.ClientID %>").val();//Required
            var BloodGroup = $("#<%=ddlBloodgroup.ClientID %>").val();
            var BirthPlace = $("#<%=txtBirthPalce.ClientID %>").val();
            var Nationality = $("#<%=ddlNationality.ClientID %>").val();//Required
            var MotherTongue = $("#<%=txtMotherTongue.ClientID %>").val();
            var Category = $("#<%=ddlCategory.ClientID %>").val();
            var Caste = $("#<%=txtCaste.ClientID %>").val();
            var Religion = $("#<%=ddlReligion.ClientID %>").val();
            var AddressOne = $("#<%=txtAddressOne.ClientID %>").val(); //Required
            var Addresstwo = $("#<%=txtAddresstwo.ClientID %>").val(); //Required
            var City = $("#<%=txtCity.ClientID %>").val();//Required
            var State = $("#<%=txtState.ClientID %>").val();//Required
            var Pincode = $("#<%=txtPincode.ClientID %>").val();//Required
            var Country = $("#<%=ddlCountry.ClientID %>").val();//Required
            var MobileNumber = $("#<%=txtMobileNumber.ClientID %>").val(); //Required
            var AltPhoneNumber = $("#<%=txtAltMobileNumber.ClientID %>").val();
            var Email = $("#<%=txtEmail.ClientID %>").val();
            var ParentName = $("#<%=txtParentName.ClientID %>").val();//Required
            var Relationship = $("#<%=ddlRelationship.ClientID %>").val();//Required
            var EmergencyNumber = $("#<%=txtEmergencyNumber.ClientID %>").val();
            var ProfileImage = $("#<%=UploadImage.ClientID %>").val();

            var SiblingsDetails = $("#<%=ddlSiblingDetails.ClientID %>").val();
            var SiblingsId = $("#<%=ddlSiblingName.ClientID %>").val();



            var EmailAddress;
            if (Email != "") {
                var EmailAddress = isValidEmailAddress(Email);
            }
            var date_regex = /^([0-9]{2})\/([0-9]{2})\/([0-9]{4})$/;
            //Check Mandatory
            if (FirstName == "" || LastName == "" || Course == 0 || Section == 0 || DOB == "" || Gender == 0 || Nationality == 0 || AddressOne == "" || Addresstwo == "" || City == "" || State == "" || Country == "" || Pincode == "" || MobileNumber == "" || ParentName == "" || Relationship == "") {
                AppDisplayMessage("Please fill the mandatory fields", 2);
                return false;
            }
           
            if (!moment(DOB,'DD/MM/YYYY',true).isValid()) {
                AppDisplayMessage("Please enter the valid DOB", 2);
                return false;
            }
            var now = moment().utc().add('year', -1);
            if (moment(DOB, 'DD/MM/YYYY', true).utc()>now ) {
                AppDisplayMessage("DOB must be less than a year from current day", 2);
                return false;
            }
            if (EmailAddress == false) {
                    AppDisplayMessage("Please enter the valid Email Address", 2);
                    return false;
            }
            if (SiblingsDetails == 1) {
                if (SiblingsId <= 0) {
                    AppDisplayMessage("Please select the Siblings Name", 2);
                    return false;
                }
            }
            $("#<%=ddlCourse.ClientID %>").val(); //Required
            var Section = $("#<%=ddlSection.ClientID %>").val();

            $('#ddAdmission_Number').text(Admission_Number);
            $('#ddStudentName').text(FirstName + ' ' + LastName);
            $('#ddCourse').text($("#<%=ddlCourse.ClientID %>").find('option:selected').text());
            $('#ddSection').text($("#<%=ddlSection.ClientID %>").find('option:selected').text());
            $('#ddAcademicYear').text($("#<%=ddlAcademicYr.ClientID %>").find('option:selected').text()); 
            $('#ddDOB').text(DOB);
            $('#ddGender').text($("#<%=ddlGender.ClientID %>").find('option:selected').text());
            $('#ddBloodGroup').text($("#<%=ddlBloodgroup.ClientID %>").find('option:selected').text());
            $('#ddBirthPlace').text(BirthPlace);
            $('#ddNationality').text($("#<%=ddlNationality.ClientID %>").find('option:selected').text());
            $('#ddMotherTongue').text(MotherTongue);
            $('#ddCategory').text($("#<%=ddlCategory.ClientID %>").find('option:selected').text());
            $('#ddCaste').text(Caste);
            $('#ddReligion').text($("#<%=ddlReligion.ClientID %>").find('option:selected').text());
            $('#ddAddressOne').text(AddressOne);
            $('#ddAddresstwo').text(Addresstwo);
            $('#ddCity').text(City);
            $('#ddState').text(State);
            $('#ddPincode').text(Pincode);
            $('#ddCountry').text($("#<%=ddlCountry.ClientID %>").find('option:selected').text());
            $('#ddMobileNumber').text(MobileNumber);
            $('#ddAltPhoneNumber').text(AltPhoneNumber);
            $('#ddEmail').text(Email);
            $('#ddParentName').text(ParentName);
            $('#ddRelationship').text($("#<%=ddlRelationship.ClientID %>").find('option:selected').text());
            $('#ddEmergencyNumber').text(EmergencyNumber);
            if ($("#<%=chkCredentialSend.ClientID %>").is(":checked")) {
                
                $('#CredSend').text("Yes");
            } else {
                $('#CredSend').text("No");
            }
            
            
            $('#StudentModal').modal('show');
            return true;
        }
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

        $(".ddlCourse").change(function () {
            var Course = $(this).find("option:selected").text();
            $("#<%=hdnCourse.ClientID %>").val(Course);
            BindDropdown('GetSection', Course, 0, '#ddlSection');
        });
        $(".ddlSection").change(function () {
            var Section = $(this).find("option:selected").text();
            $("#<%=hdnSection.ClientID %>").val(Section);
        });
        $(".ddlAcademicYr").change(function () {
            var AcademicYr = $(this).find("option:selected").text();
            $("#<%=hdnAcademicYear.ClientID %>").val(AcademicYr);
         });
        $(".ddlNationality").change(function () {
            var Nationality = $(this).find("option:selected").val();
            $("#<%=hdnNationality.ClientID %>").val(Nationality);
        });
        $(".ddlCountry").change(function () {
            var Country = $(this).find("option:selected").val();
            $("#<%=hdnCountry.ClientID %>").val(Country);
        });
        $(".ddlSiblingDetails").change(function () {
            var Siblings = $(this).find("option:selected").text();
            if (Siblings == 'Yes') {
                $('#divSiblingsDetails').show();
            } else {
                $('#divSiblingsDetails').hide();
            }

        });
        function BindPageLoad() {

            BindDropdown('GetCourse', null, 0, '#ddlCourse');
            BindDropdown('GetCountry', null, 0, '#ddlCountry');
            BindDropdown('GetNationality', null, 0, '#ddlNationality');
            BindDropdown('GetAcademicYr', null, 0, '#ddlAcademicYr');
        }
    </script>
</asp:Content>
