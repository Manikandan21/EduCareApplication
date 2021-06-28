<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="MarkAttendance.aspx.cs" Inherits="ILogisticsApplication.Attendance.MarkAttendance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Resource/css/AjaxCalender.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPanel" runat="server">
    <ajax:ToolkitScriptManager ID="ScriptManager1" EnableScriptGlobalization="true" EnableScriptLocalization="true"
        EnablePartialRendering="true" runat="server" />
    <asp:UpdatePanel ID="updatePanel" runat="server">
        <ContentTemplate>
            <asp:Panel ID="pnlHolidays" runat="server">
    <div class="wrapper wrapper-content fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Student Attendance <small>Manage student Attendance details</small></h5>
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
                                <div class="form-group col-sm-3">
                                                <label>Select Date <span class="text-danger">*</span></label>

                                                <div style="height: 0px"></div>
                                                <div>
                                                    <div class="input-group date">
                                                        <span class="input-group-addon" id="spnDate"><i class="fa fa-calendar"></i></span>
                                                        <asp:TextBox ID="txtDate" ReadOnly="true" runat="server" CssClass="form-control" />
                                                        <%--<input type="text" id="txtDate" runat="server" class="form-control" />--%>
                                                        <ajax:CalendarExtender ID="CalenderExtenderDate" runat="server" BehaviorID="Calendar1"
                                                            OnClientHidden="calendarhidden" Format="dd/MM/yyyy" CssClass="black" TargetControlID="txtDate"
                                                            PopupButtonID="spnDate" OnClientDateSelectionChanged="changedate" />
                                                    </div>
                                                </div>
                                </div>
                                <div class="form-group col-sm-3">
                                    <label>Course <span class="text-danger">*</span></label>
                                    <select class="form-control ddlCourse" id="ddlCourse" clientidmode="static" runat="server">
                                        <option value="0">--Select--</option>
                                    </select>
                                </div>
                                <div class="form-group  col-sm-3">
                                    <label>Section <span class="text-danger">*</span></label>
                                    <select class="form-control ddlSection" id="ddlSection" clientidmode="static" runat="server">
                                        <option value="0">--Select--</option>
                                    </select>
                                </div>
                                <div class="form-group  col-sm-3" id="divAction" style="display:none">
                                         <div style="height:29px"></div>
                                    <input type="button" id="btnMarkAbsent"  value="Mark Absent" onclick="GetStudentName()" class="btn btn-danger m-t-n-xs col-sm-8 btnMarkAbsent"/>
                                    
                                    <%-- <button class="btn btn-sm btn-danger m-t-n-xs col-sm-5" id="btnSubmit"type="button" onclick="if (!Validate()) {return false;}">Mark Absent</button>--%>
                                      
                                </div>
                                <%--<div class="form-group  col-sm-12">
                                    <div class="col-sm-7"></div>
                                    <div class="col-sm-5">

                                        <button class="btn btn-sm btn-primary m-t-n-xs col-sm-5" id="btnSubmit" runat="server" type="button" onclick="if (!Validate()) {return false;}" onserverclick="Save_Click"><strong>Save</strong></button>
                                        <button class="btn btn-sm btn-danger pull-right m-t-n-xs col-sm-6" onclick="ClearText()" type="button"><strong>Clear Data</strong></button>
                                    </div>
                                </div>--%>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-sm-12">
                                <div class="ibox">

                                    <div class="">

                                        <table style="text-align: center; width: 100%" id="dataTable" class="table table-bordered">
                                            <thead id="thead">
                                                <tr>
                                                    <th style="text-align: center;">
                                                        #
                                                      <%--  <input type="checkbox" id="hCheckbox" />--%>
                                                    </th>
                                                    <th style="text-align: center;">Student Name</th>
                                                    <th style="text-align: center;">Course</th>
                                                    <th style="text-align: center;">Section</th>
                                                    
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
                    <h1 class="modal-title">Do you want to Mark Attendance for following students?</h1>

                </div>
                <div id="divStudentList" style="padding-top:10px">
                    <ul id="ulStudentLst">

                    </ul>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">Close</button>
                    <button class="btn btn-danger" id="btnDelete" onclick="OnMarkAbsent()" type="button"><strong>Confirm</strong></button>
                    <%-- onserverclick="Save_Click"--%>
                </div>
            </div>
        </div>
    </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:HiddenField ID="hdnDate" runat="server" Value="" />
     <input type="hidden" id="hdnIds"/>    
    <input type="hidden" id="hdnMode" runat="server" />
      <!--Datatable-->
    <script src="../Resource/js/plugins/dataTables/datatables.min.js"></script>
    <!--Datatable-->
    <script type="text/javascript">
        $("#tHead").removeClass('sorting_asc');
        var Course = '';
        window.ArrayData = new Array();

        var RoleId = '<%=Convert.ToString(Session["RoleId"]) %>';
        var UserId = '<%=Convert.ToString(Session["UserId"]) %>';
        var tag1 = 0;
        $(document).ready(function () {
           // checkboxclick();
            var d = new Date();
            var strDate = d.getDate() + "/" + (d.getMonth() + 1) + "/" + d.getFullYear();

            //$("#lblDate").text(strDate);

            BindDropdown('GetCourse', null, 0, '#ddlCourse');
            $('#dataTable').DataTable({

                "bSearchable": false,
                "bSortable": false,
                "bFilter": false,
                "bInfo": true,
                "bPaginate": false,
                "bLengthChange": false,
                "bVisible": false,
                "oLanguage": {
                    "sEmptyTable": "No records found"
                },
            });
        });
        $(".ddlCourse").change(function () {
            var DateToBeMarkedAbsent = $get('<%=hdnDate.ClientID %>').value;
            if (DateToBeMarkedAbsent == undefined || DateToBeMarkedAbsent == null || DateToBeMarkedAbsent == "") {
                AppDisplayMessage("Please select the date.", 2);
                return false;
            }
            
            Course = $(this).find("option:selected").text();
            if (Course != "--Select--") {
                BindDropdown('GetSection', Course, 0, '#ddlSection');
                $(".ddlSection").focus();
            }
           
        });
        $(".ddlSection").change(function () {
            var DateToBeMarkedAbsent = $get('<%=hdnDate.ClientID %>').value;
            if (DateToBeMarkedAbsent == undefined || DateToBeMarkedAbsent == null || DateToBeMarkedAbsent == "") {
                AppDisplayMessage("Please select the date.", 2);
                return false;
            }
            var Section = $(this).find("option:selected").text();
            if (Section != "--Select--") {
                BindStudentData(Course, Section, DateToBeMarkedAbsent);
            }
        });
        function BindStudentData(Course, Section,DateToBeMarkedAbsent) {
            try {
                var Mode = '';
                ArrayData = [];

                var Id = 0;
                    Mode = 'GetAttendance';
                    Course = Course;
                    Section = Section;
                $('#dataTable').dataTable().fnDestroy();
                var JsonData = [];
                
                
                //Get Json Data from Server

                var Request = new XMLHttpRequest();
                var url = '../Handlers/Attendance.ashx?Mode=' + Mode + '&Course=' + Course + '&Section=' + Section + '&UserId=' + UserId + '&DateToBeMarkedAbsent=' + DateToBeMarkedAbsent;
                Request.open("GET", url, false);
                Request.send();
                var Data = Request.responseText;

                if (Data != undefined) {
                    $("#divAction").show();
                    Data = jQuery.parseJSON(Data);
                    $.each(Data, function (index, PARAM) {
                        
                        if (PARAM.AttendanceData == '1' || PARAM.AttendanceData == '0') {
                            JsonData.push([
                                "<input type=checkbox class=i-checks id=" + PARAM.studentId + ">",
                               "<a id=name" + PARAM.studentId + ">" + PARAM.StudentName + "</a>",
                               PARAM.Course, PARAM.Section,
                            ]);
                        } else if (PARAM.AttendanceData == '2') {
                            JsonData.push([
                                "<input checked type=checkbox class=i-checks id=" + PARAM.studentId + ">",
                               "<a id=name" + PARAM.studentId + ">" + PARAM.StudentName + "</a>",
                               PARAM.Course, PARAM.Section,
                            ]);
                            ArrayData.push(PARAM.studentId);
                            
                        } else if (PARAM.AttendanceData == '3' || PARAM.AttendanceData == '4') {
                            $("#divAction").hide();
                            JsonData.push([
                                "<input disabled type=checkbox id=" + PARAM.studentId + ">",
                               "<a>" + PARAM.StudentName + "</a>",
                               PARAM.Course, PARAM.Section,
                            ]);
                        }
                    })

                    $('#dataTable').dataTable({
                        "bRetrieve": true,
                        "bDestroy": true,
                        "bSearchable": true,
                        "bSortable": false,
                        "bFilter": false,
                        "bInfo": true,
                        "bLengthChange": false,
                        "bVisible": false,
                        "sPaginationType": "full_numbers",
                        "sPaging": "pagination",
                        "bProcessing": true,
                        "bPaginate": false,
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
           
            checkboxclick();
            
            if (Data =='') {
                $("#divAction").hide();
            }
        }

        function changedate(sender, args) {
            if (sender._selectedDate.toLocaleDateString() > new Date().toLocaleDateString()) {
                AppDisplayMessage("Please select the past or current date.", 2);
                sender._selectedDate = new Date();
                sender._textbox.set_Value("");
                //$("#<%=txtDate.ClientID %>").val("")
            }
        }

        function calendarhidden(obj) {
            $("#<%=hdnDate.ClientID %>").val($("#<%=txtDate.ClientID %>").val());
            var calendarBehavior = $find("Calendar1");
            if (tag1 == 1)
                calendarBehavior.show();
            $get('<%=txtDate.ClientID %>').value = $get('<%=hdnDate.ClientID %>').value;
        }
        function dateselect(ev) {
            var calendarBehavior1 = $find("Calendar1");
            var date = calendarBehavior1._selectedDate.format("dd/MM/yyyy");
            var hiddencontrol = $get('<%=hdnDate.ClientID %>');
            if (hiddencontrol.value.indexOf(date) == -1)
                hiddencontrol.value += date + ";";
            tag1 = 1;

        }
        function OnMarkAbsent() {
            var Mode = '';
                Mode = 'SAdminMarkAbsent';
            var Course = $("#ddlCourse").find("option:selected").text();;
            var Section = $("#ddlSection").find("option:selected").text();;
            var DateToBeMarkedAbsent = $get('<%=hdnDate.ClientID %>').value;
            if (DateToBeMarkedAbsent == undefined || DateToBeMarkedAbsent == null || DateToBeMarkedAbsent == "") {
                AppDisplayMessage("Please fill the all mandatory fields.", 2);
                return false;
            }
            if (ArrayData == '') {
                ArrayData = 0;
            }
            //Get Json Data from Server

            var Request = new XMLHttpRequest();
            var url = '../Handlers/Attendance.ashx?Mode=' + Mode + '&Course=' + Course + '&Section=' + Section + '&UserId=' + UserId + '&Ids=' + ArrayData + '&DateToBeMarkedAbsent=' + DateToBeMarkedAbsent;
            Request.open("GET", url, false);
            Request.send();
            var Data = Request.responseText;
            $('#myModal').modal('hide');

            if (Data == 'Success') {
                AppDisplayMessage("Attendance Marked Successfully", 1);
                BindStudentData($('.ddlCourse').find("option:selected").text(), $('.ddlSection').find("option:selected").text(),$get('<%=hdnDate.ClientID %>').value);
            } else {
                AppDisplayMessage("Error occurred. Please try again later", 2);
            }
            
        }

        function checkboxclick() {
            $('.i-checks').click(function () {
                try {
                   
                    if ($(this).is(':checked')) {
                        //alert(ArrayData);
                        ArrayData.push($(this).attr("id"));
                        //alert(ArrayData);
                } else {
                       
                        if (ArrayData.length > 0) {
                            
                            for (var i = ArrayData.length - 1; i >= 0; i--) {
                                //alert('Array : ' + ArrayData[i]);
                                //alert('id : ' + $(this).attr("id"));
                                if (''+ArrayData[i]+'' ===''+ $(this).attr("id")+'') {
                                    //alert('eql');
                                    ArrayData.splice(i, 1);
                                }
                            }
                    }
                }
               
                }
             catch (e) {
                 alert(e);
                }
            });
        }

        function GetStudentName() {
            var data = "";
            $("#ulStudentLst").empty();
            $(".btnMarkAbsent").attr("data-toggle", "modal");
            $(".btnMarkAbsent").attr("data-placement", "top");
            $(".btnMarkAbsent").attr("data-target", "#myModal");
            if (ArrayData.length != 0) {
                for (var i = 0; i < ArrayData.length; i++) {
                    data = "<li>";
                    data += $("#name" + ArrayData[i]).text();
                    data += "</li><br/>";
                    $("#ulStudentLst").append(data);                    
                }
            } else {
                data = "<li>";
                data += "Nobody is Absent today , Please confirm to mark present for all Students";
                data += "</li><br/>";
                $("#ulStudentLst").append(data);
            }
        }
    </script>
</asp:Content>
