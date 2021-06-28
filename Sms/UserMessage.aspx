<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="UserMessage.aspx.cs" Inherits="ILogisticsApplication.Sms.UserMessage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPanel" runat="server">
    <%-- <asp:ScriptManager ID="ScriptMngr" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="updatePanel" runat="server">
        <ContentTemplate>--%>
    <div class="wrapper wrapper-content">
        <div class="row">


            <div class="col-lg-12 animated fadeInRight">
                <div class="mail-box-header">
                    <div class="pull-right tooltip-demo">
                        <button class="btn btn-sm btn-primary" id="Button1" runat="server" type="button" onclick="if (!Validate()) {return false;}"><i class="fa fa-reply"></i>Send</button>
                        <a onclick="OnDiscard()" class="btn btn-danger btn-sm" data-toggle="tooltip" data-placement="top" title="Discard"><i class="fa fa-times"></i>Discard</a>

                    </div>
                    <h2>Send Message
                    </h2>
                </div>
                <div class="mail-box">


                    <div class="mail-body">

                        <div id="DivAdminRole" style="display: none">
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Receiver Role:</label>

                                    <div class="col-sm-6">
                                        <asp:DropDownList class="form-control ddlReceiverRole" ID="ddlReceiverRole" runat="server">
                                            <asp:ListItem Value="0">--Select Role--</asp:ListItem>
                                            <asp:ListItem Value="1">All</asp:ListItem>
                                            <asp:ListItem Value="2">Employees</asp:ListItem>
                                            <asp:ListItem Value="3">Students</asp:ListItem>
                                        </asp:DropDownList>

                                    </div>
                                </div>
                                <div class="form-group targetEmployee" style="display: none">
                                    <label class="col-sm-2 control-label">Receiver:</label>

                                    <div class="col-sm-3">
                                        <asp:DropDownList class="form-control ddlAllEmployee" ID="ddlAllEmployee" runat="server">

                                            <asp:ListItem Value="1">All</asp:ListItem>
                                            <asp:ListItem Value="2">Teaching Staff</asp:ListItem>
                                            <asp:ListItem Value="3">Non-Teaching Staff</asp:ListItem>
                                        </asp:DropDownList>

                                    </div>

                                </div>
                                <div class="form-group targetStudent" style="display: none">
                                    <label class="col-sm-2 control-label">Course:</label>

                                    <div class="col-sm-3">
                                        <select class="form-control ddlCourse" id="ddlCourse" clientidmode="static" runat="server">
                                            <option value="-1">--Select Course--</option>
                                        </select>
                                    </div>
                                    <div class="col-sm-3 divSection" id="DivSection" style="display: none">
                                        <select class="form-control ddlSection" id="ddlSection" clientidmode="static" runat="server">
                                            <option value="-1">--Select Section--</option>
                                            <option value="0">All</option>
                                        </select>
                                    </div>
                                    <div class="col-sm-2 divStudent" id="divStudent" style="display: none">
                                        <select class="form-control ddlStudentName" id="ddlStudentName" clientidmode="static" runat="server">
                                            <option value="0">--Select Student--</option>
                                            <option value="1">All</option>
                                            <option value="2">Pick List</option>
                                        </select>
                                    </div>
                                    <div class="col-sm-2 divAction" id="divAction" style="display: none">
                                        <a onclick="OnHandPick()" class="btn btn-success btn-sm"
                                            data-toggle="tooltip" data-placement="top" title="onPick">Hand Pick</a>
                                    </div>
                                </div>

                            </div>
                        </div>
                      
                        <%-- <form class="form-horizontal" method="get">--%>

                        <div class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Subject:</label>

                                <div class="col-sm-6">
                                    <asp:TextBox class="form-control txtMessage" MaxLength="160" onKeyUp="CheckTextLength(this,160)"  ID="txtMessage" TextMode="MultiLine" Height="125px" runat="server" Text="" />
                                </div>
                            </div>
                        </div>
                        <%--   </form>--%>
                    </div>



                    <div class="clearfix"></div>
                    <div class="mail-body text-right tooltip-demo">
                        <button class="btn btn-sm btn-primary" id="btnSubmitUp" runat="server" type="button" onclick="if (!Validate()) {return false;}"><i class="fa fa-reply"></i>Send</button>
                        <a onclick="OnDiscard()" class="btn btn-danger btn-sm" data-toggle="tooltip" data-placement="top" title="Discard email"><i class="fa fa-times"></i>Discard</a>

                    </div>


                </div>
            </div>
        </div>
    </div>
    <%--   </ContentTemplate>
    </asp:UpdatePanel>--%>
    <div class="modal inmodal" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content animated bounceInDown">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h1 id="lstHead" class="modal-title">Hand Pick the Student List</h1>

                </div>

                <table style="text-align: center; max-width: 80%; width: 100%; height: 150px;" id="dataTable" class="table table-bordered">
                    <thead id="thead">
                        <tr>
                            <th style="text-align: center; width: 10%">#
                            </th>
                            <th style="text-align: center; width: 90%" id="tblName">Name
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>

                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">Close</button>
                    <button class="btn btn-primary" id="btnPick" onclick="OnPickData()" type="button"><strong>Confirm</strong></button>
                    <%-- onserverclick="Save_Click"--%>
                </div>
            </div>
        </div>
    </div>
    <div class="modal inmodal" id="ConfirmModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content animated bounceInDown">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>

                    <h1 class="modal-title">Do you want to send the following message?</h1>

                </div>
                <div class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-4 control-label">Role:</label>
                        <div class="col-sm-6" style="margin-top: 8px;">
                            <label class="lblRole" id="lblRole"></label>
                        </div>
                    </div>
                </div>
                 <div class="form-horizontal" id="divReceiverConfirm" style="display: none">
                    <div class="form-group">
                        <label class="col-sm-4 control-label">Receiver:</label>
                        <div class="col-sm-6" style="margin-top: 8px;">
                            <label class="lblReceiver" id="lblReceiver"></label>
                        </div>
                    </div>
                </div>
                  <div class="form-horizontal divShowStudentList"  style="display: none">
                       <div class="form-group">
                        <label class="col-sm-4 control-label">Student List:</label>
                        <div class="col-sm-6" style="margin-top: 8px;">
                            <ul id="ulStudentLst">
                                    </ul>
                        </div>
                    </div>
                 </div>
                <div class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-4 control-label">Message:</label>

                        <div class="col-sm-6" style="margin-top: 8px;">
                            <label class="lblClientMessage" id="lblClientMessage"></label>
                        </div>
                    </div>
                </div>
                <div class="form-horizontal divTnxPanel"  style="display: block">
                    <div class="form-group">
                        <label class="col-sm-4 control-label">Transaction Password:</label>

                        <div class="col-sm-4" style="margin-top: 8px;">
                            <asp:TextBox class="form-control txtTnxPwd" MaxLength="20" ID="txtTnxPwd" TextMode="Password" runat="server" Text="" />
                        </div>
                    </div>
                </div>
                  <div class="form-horizontal divOTPPanel"  style="display: none">
                    <div class="form-group">
                        <label class="col-sm-4 control-label">OTP:</label>

                        <div class="col-sm-4" style="margin-top: 8px;">
                            <asp:TextBox class="form-control pwdOTP" MaxLength="20" ID="txtOtp" TextMode="Password" runat="server" Text="" />
                        </div>
                        <div class="col-sm-4" style="margin-top: 8px;">
                            <button class="btn btn-primary" id="btnResend" onclick="GenerateOTP()" type="button"><strong>Generate OTP</strong></button>
                        </div> </div>
                </div>
                <%-- <div class="form-horizontal">
                 <div class="form-group">
                            <label class="col-sm-4 control-label"></label>

                        <div class="col-sm-8" style="margin-top: 8px;">
                             <label class="col-sm-4 control-label">OTP not received, Please re-generate the OTP</label>
                        </div>
                           </div> </div>--%>
                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">Close</button>
                    <button class="btn btn-primary" id="btnConfirm" runat ="server" onclick="if (!CheckTransactions()) {return false;}"  onserverclick="OnSend_Click" type="button"><strong>Confirm</strong></button>
                    <%-- onserverclick="Save_Click"--%>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" id="HdnReceiverRole" runat="server" />
    <input type="hidden" id="HdnStudentName" runat="server" />
    <input type="hidden" id="hdnCourse" runat="server" />
    <input type="hidden" id="hdnSection" runat="server" />
    <input type="hidden" id="hdnMessageBody" runat="server" />
    <input type="hidden" id="hdnStudentIDs" runat="server" />
    <input type="hidden" id="hdnApprovalConfig" runat="server" />
    <script type="text/javascript">
        window.ArrayData = [];
        window.ArrayDataStuName = [];
        window.ApprovalConfig = 1;
        var IsAdminRole = '<%=Convert.ToString(Session["IsAdminRole"]) %>';
        $(document).ready(function () {
            BindDropdown('GetCourse', null, 0, '#ddlCourse');
            $("<option value=999>All</option>").insertAfter("#ddlCourse option:first");
            $('#DivAdminRole').show();
            checkboxclick();
            GetApprovalConfig();
        });
        function GetApprovalConfig() {
            var url = '../Handlers/ApplicationConfig.ashx?Mode=IsMessageApproval';
            var result = JSON.parse(GetJsonResult(url));
            if (result) {
                ApprovalConfig = parseInt(result[0].Name);
                $("#<%=hdnApprovalConfig.ClientID %>").val(ApprovalConfig);
            } else {
                $("#<%=hdnApprovalConfig.ClientID %>").val(ApprovalConfig);
            }           
        }
        function CheckTransactions() {
            var isValid = false;
            if (ApprovalConfig == 1 || ApprovalConfig == 2 || ApprovalConfig == 3) {
                var TransactionPwd = $('.txtTnxPwd').val();
                if (TransactionPwd == '') {
                    AppDisplayMessage("Please enter the transaction password", 2);
                    return false;
                }
                if (GetTransationStatus('Tnx', TransactionPwd)) {                   
                    isValid = true;
                } else {
                    AppDisplayMessage("Please enter the correct transaction password", 2);
                    return false;
                }
            }
            if (ApprovalConfig == 2 && isValid) {
                var Otp = $('.pwdOTP').val();
                if (Otp == '') {
                    AppDisplayMessage("Please enter the OTP", 2);
                    return false;
                }
                if (GetTransationStatus('Otp', Otp)) {
                    isValid = true;
                } else {
                    AppDisplayMessage("Invalid OTP", 2);
                    return false;
                }
            }
            if (ApprovalConfig == 3) {
                return true;
            }
            if (isValid) {
                AppDisplayMessage("Message sent successfully", 1);
                $('#ConfirmModal').modal('hide');
            }
            return false;
            //return isValid;
        }
        function GetTransationStatus(Mode, Password) {
            var url = '../Handlers/Transactions.ashx?Mode=' + Mode + '&Password=' + Password;
            if (Password == undefined) {
                url = '../Handlers/Transactions.ashx?Mode=' + Mode;
            }
            var result = JSON.parse(GetJsonResult(url));
            return result;
        }
        function GenerateOTP() {
            if (ApprovalConfig == 2) {
                if (!GetTransationStatus('GenerateOtp')) {
                    AppDisplayMessage("OTP is not generated successfully, Please try again later", 2);
                    return false;
                } else {
                    AppDisplayMessage("OTP is generated successfully. Please verify through your Mobile. It will expire in 10 Minutes.", 1);
                    return false;
                }
            } else {
                AppDisplayMessage("You do not have a permission to Generate OTP", 2);
                return;
            }
        }
        $(".ddlCourse").change(function () {
            ArrayData = [];
            ArrayDataStuName = [];
            var Course = $(this).find("option:selected").text();
            $("#<%=hdnCourse.ClientID %>").val(Course);
            //  $("#hdnCourse").val(Course);
            BindDropdown('GetSection', Course, 0, '#ddlSection');
            $("<option value=0>All</option>").insertAfter("#ddlSection option:first");
            // var CourseId = $(this).find("option:selected").val();
            // console.log(CourseId);
            if (Course == '--Select--') {
                $('#DivSection').hide();
                $('#divStudent').hide();
            } else if (Course == 'All') {
                $('#DivSection').hide();
                $('#divStudent').hide();
            } else {
                $('#DivSection').show();
                $('#divStudent').hide();
            }
        });
        $(".ddlSection").change(function () {
            ArrayData = [];
            ArrayDataStuName = [];
            var Std = $("#<%=hdnCourse.ClientID %>").val();
            var Section = $(this).find("option:selected").text();
            $("#<%=hdnSection.ClientID %>").val(Section);
            if (Section == "All") {
                $('#ddlStudentName').children().remove();
                $('#divStudent').hide();
            }
            if ($(this).find("option:selected").val() > 0) {
                BindDropdown('DdlStudent', Std, Section, '#ddlStudentName');
                $('#ddlStudentName').children().remove();
                $('#divStudent').show();
                $('#ddlStudentName').append('<option value=0>--Select--</option>');
                $('#ddlStudentName').append('<option value=1>All</option>');
                $('#ddlStudentName').append('<option value=2>Pick List</option>');
            }

        });
        $(".ddlStudentName").change(function () {
            ArrayData = []; ArrayDataStuName = [];
            var Std = $("#<%=hdnCourse.ClientID %>").val();
            var Section = $('.ddlSection').find("option:selected").text();
            var Option = $(this).find("option:selected").val();
            if (Option > 0) {
                if (Option == 2) {
                    $('#divAction').show();
                    //$('#dataTable').dataTable().fnDestroy();
                    //BindStudentData(Std, Section);                    
                    //$('#myModal').modal('show');
                } else {
                    $('#divAction').hide();
                    // $('#myModal').modal('hide');
                }
            }
        });
        function OnHandPick() {
            var Std = $("#<%=hdnCourse.ClientID %>").val();
            var Section = $('.ddlSection').find("option:selected").text()
            var Option = $('.ddlStudentName').find("option:selected").val();
            if (Option > 0) {
                if (Option == 2) {
                    $('#dataTable').dataTable().fnDestroy();
                    BindStudentData(Std, Section, ArrayData);
                    $('#myModal').modal('show');
                } else {
                    $('#myModal').modal('hide');
                }
            }
        }
        function checkboxclick() {
            $('.i-checks').click(function () {

                if ($(this).is(':checked')) {
                    ArrayData.push($(this).attr("id"));
                    ArrayDataStuName.push($(this).attr("name"));
                    console.log(ArrayData, ArrayDataStuName);
                } else {
                    if (ArrayData.length > 0) {
                        var i = ArrayData.indexOf($(this).attr("id"));
                        if (i != -1) {
                            ArrayData.splice(i, 1);
                            ArrayDataStuName.splice(i, 1);
                        }
                        console.log(ArrayData, ArrayDataStuName);
                    }
                }
            });
        }
        var OnPickData = function () {
            if (ArrayData.length == 0) {
                AppDisplayMessage("Please select the student from the list", 2);
                return false;
            }
            $("#<%=hdnStudentIDs.ClientID %>").val(ArrayData);
            $('#myModal').modal('hide');
        }
        $(".ddlAllEmployee").change(function () {
            //var Option = $(this).find("option:selected").val();
            //if (Option > 0) {
            //    if (Option == 2) {
            //        $('#dataTable').dataTable().fnDestroy();
            //        BindEmployeeData();
            //        $('#myModal').modal('show');
            //    } else {
            //        $('#myModal').modal('hide');
            //    }
            //}
        });

        $(".ddlReceiverRole").change(function () {
            ArrayData = []; ArrayDataStuName = [];
            var Role = $(this).find("option:selected").val();
            console.log(Role);
            if (Role == 1) {
                $('.targetEmployee').hide();
                $('.targetStudent').hide();
            } else if (Role == 2) {
                $('.targetEmployee').show();
                $('.targetStudent').hide();
            } else if (Role == 3) {
                $('.targetEmployee').hide();
                $('.targetStudent').show();
            }
        });
        function Validate() {
            var Role = $('.ddlReceiverRole').val();
            if (Role == 0) {
                AppDisplayMessage("Please select the Receiver role", 2);
                return false;
            } else if (Role == 3) {
                var course = $("#<%=hdnCourse.ClientID %>").val();
                var section = $("#<%=hdnSection.ClientID %>").val();
                var StudentID = $("#<%=ddlStudentName.ClientID %>").val();
                    if (course == "--Select--" || course == "") {
                        AppDisplayMessage("Please select the Receiver", 2);
                        return false;
                    }
                    if (course != "All") {
                        if ((section == "--Select--" || section == "")) {
                            AppDisplayMessage("Please select the Section", 2);
                            return false;
                        }
                        if (section != "All") {
                            var IDs = $("#<%=hdnStudentIDs.ClientID %>").val();
                            if (StudentID == "0") {
                                AppDisplayMessage("Please select the Students", 2);
                                return false;
                            }
                            else if (StudentID == "2" && IDs == "") {
                                AppDisplayMessage("Please select the Students from list", 2);
                                return false;
                            }
                        }

                    }

            }
            if ($('.txtMessage').val() == "") {
                AppDisplayMessage("Message can not be blank", 2);
                return false;
            }
            fillConfirmInfo();
            
            $('#ConfirmModal').modal('show');
         
            // return true;

        }
        function fillConfirmInfo() {
            $('.lblClientMessage').text($('.txtMessage').val());
            $('.lblRole').text($('.ddlReceiverRole').find("option:selected").text());
            $('#divReceiverConfirm').hide();
            if (ApprovalConfig == 2) {
                $('.divOTPPanel').show();
            }
            if ($('.ddlReceiverRole').val() == 2) {
                $('.lblReceiver').text($('.ddlAllEmployee').find("option:selected").text());
                $('#divReceiverConfirm').show();
            } else if ($('.ddlReceiverRole').val() == 3) {
                var Receiver = "";
                var course = $("#<%=hdnCourse.ClientID %>").val();
                var section = $("#<%=hdnSection.ClientID %>").val();
                var StudentID = $("#<%=ddlStudentName.ClientID %>").val();             
                if (course != "All") {
                    Receiver = course;                   
                    if (section != "All") {
                        Receiver += ' - ' + section;
                        if (StudentID == 1) {
                            Receiver += ' (Students)';
                        }
                        var IDs = $("#<%=hdnStudentIDs.ClientID %>").val();
                        if (StudentID == "2" && IDs != "") {
                            var data = "";
                            $("#ulStudentLst").empty();
                            for (var i = 0; i < ArrayDataStuName.length; i++) {
                                data = "<li>";
                                data += ArrayDataStuName[i];
                                data += "</li><br/>";
                                $("#ulStudentLst").append(data);

                            }
                            $('.divShowStudentList').show();
                        }
                    } else {
                        Receiver += ' (Std students)';
                    }
                } else {
                    Receiver="All Students"
                }
                $('#divReceiverConfirm').show();
                $('.lblReceiver').text(Receiver);
               
            }   
        }
        function CheckTextLength(text, long) {
            var maxlength = new Number(long); // Change number to your max length.
            if (text.value.length > maxlength) {
                text.value = text.value.substring(0, maxlength);
                AppDisplayMessage(" Only " + long + " characters allowed", 2);
            }
        }

        function BindStudentData(Course, Section, ArrayData) {
            try {
                var Mode = '';

                var Id = 0;
                var Mode = 'ForGrid';
                var Course = Course;
                var Section = Section;
                var Id = 0;
                $('#dataTable').dataTable().fnDestroy();
                var JsonData = [];


                //Get Json Data from Server

                var Request = new XMLHttpRequest();
                var url = '../Handlers/managestudents.ashx?Mode=' + Mode + '&Course=' + Course + '&Section=' + Section + '&Id=' + Id;
                Request.open("GET", url, false);
                Request.send();
                var Data = Request.responseText;

                if (Data != undefined) {
                    Data = jQuery.parseJSON(Data);
                    $.each(Data, function (index, PARAM) {
                        if (ArrayData.length == 0) {
                            JsonData.push([
                                "<input type=checkbox class=i-checks name=" + PARAM.StudentName+" id=" + PARAM.Student_Id + ">",
                                "<a id=name" + PARAM.Student_Id + ">" + PARAM.StudentName + "</a>",
                            ]);
                        } else {
                            if (ArrayData.indexOf(PARAM.Student_Id.toString()) != -1) {
                                JsonData.push([
                                    "<input type=checkbox checked class=i-checks name=" + PARAM.StudentName +"  id=" + PARAM.Student_Id + ">",
                                    "<a id=name" + PARAM.Student_Id + ">" + PARAM.StudentName + "</a>",
                                ]);
                            } else {
                                JsonData.push([
                                    "<input type=checkbox class=i-checks name=" + PARAM.StudentName +"  id=" + PARAM.Student_Id + ">",
                                    "<a id=name" + PARAM.Student_Id + ">" + PARAM.StudentName + "</a>",
                                ]);
                            }

                        }

                    })

                    $('#dataTable').dataTable({
                        "bRetrieve": true,
                        "bDestroy": true,
                        "bSearchable": true,
                        "bSortable": false,
                        "bFilter": false,
                        "bInfo": false,
                        "bLengthChange": false,
                        "bVisible": false,
                        "sPaginationType": "full_numbers",
                        "sPaging": "pagination",
                        "bProcessing": false,
                        "bPaginate": false,
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

            checkboxclick();


        }

        function BindEmployeeData() {
            try {
                var Mode = '';
                ArrayData = [];

                var Id = 0;
                var Mode = 'GetUserList';
                var Category = "0";
                var Section = Section;
                var Id = 0;
                $('#dataTable').dataTable().fnDestroy();
                var JsonData = [];


                //Get Json Data from Server

                var Request = new XMLHttpRequest();
                var url = '../Handlers/ManageUser.ashx?Mode=' + Mode + '&Category=' + Category + '&Id=' + Id;
                Request.open("GET", url, false);
                Request.send();
                var Data = Request.responseText;

                if (Data != undefined) {
                    Data = jQuery.parseJSON(Data);
                    $.each(Data, function (index, PARAM) {
                        JsonData.push([
                            "<input type=checkbox class=i-checks id=" + PARAM.Id + ">",
                            "<a id=name" + PARAM.Id + ">" + PARAM.Name + "</a>",
                        ]);
                    })

                    $('#dataTable').dataTable({
                        "bRetrieve": true,
                        "bDestroy": true,
                        "bSearchable": true,
                        "bSortable": false,
                        "bFilter": false,
                        "bInfo": false,
                        "bLengthChange": false,
                        "bVisible": false,
                        "sPaginationType": "full_numbers",
                        "sPaging": "pagination",
                        "bProcessing": true,
                        "bPaginate": true,
                        "iDisplayLength": 15,
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

            checkboxclick();


        }
        function OnDiscard() {
            $("#<%=HdnReceiverRole.ClientID %>").val("");
            $("#<%=HdnStudentName.ClientID %>").val("");
            $("#<%=hdnCourse.ClientID %>").val("");
            $("#<%=hdnSection.ClientID %>").val("");
            $("#<%=hdnMessageBody.ClientID %>").val("");
            $("#<%=txtMessage.ClientID %>").val("");
            $("#<%=ddlStudentName.ClientID %>").val(0);
            $("#<%=ddlSection.ClientID %>").val(0);
            $("#<%=ddlCourse.ClientID %>").val(0);
            $("#<%=ddlReceiverRole.ClientID %>").val(0);
            $('.note-editable').html("")
            return false;
        }
    </script>
</asp:Content>
