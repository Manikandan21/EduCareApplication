<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ExportReport.aspx.cs" Inherits="EduCareApplication.Report.ExportReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Resource/css/AjaxCalender.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPanel" runat="server">
     <ajax:ToolkitScriptManager ID="ScriptManager1" EnableScriptGlobalization="true" EnableScriptLocalization="true"
        EnablePartialRendering="true" runat="server" />
<div class="wrapper wrapper-content fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Export Student Data <small>Download students information</small></h5>                          
                    </div>
                    <div class="ibox-content">
                        <asp:Panel ID="pnlAction" runat="server">
                            <div class="row">
                                <h4 style="text-align: center; color: #EC4758" id="headEditable">Filter</h4>
                                <div class="col-sm-12" id="divEditable" style="margin-bottom: 5px">
                                    
                                    <div class="form-group col-sm-3">
                                        <label>Course <span class="text-danger"></span></label>
                                        <select class="form-control ddlCourse" id="ddlCourse" clientidmode="static" runat="server">
                                            <option value="0">--Select--</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-sm-3 ddlSectionGroup" >
                                        <label>Section <span class="text-danger"></span></label>
                                        <select class="form-control ddlSection" id="ddlSection" clientidmode="static" runat="server">
                                            <option value="0">--Select--</option>
                                        </select>
                                    </div>
                                     <div class="form-group  col-sm-3">
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
                                     <div class="form-group  col-sm-3">
                                    <label>Gender <span class="text-danger"></span></label>
                                    <select class="form-control" id="ddlGender" clientidmode="static" runat="server">
                                        <option value="0">Unknown</option>
                                        <option value="1">Male</option>
                                        <option value="2">Female</option>
                                    </select>
                                </div>
                                   <%-- <div class="form-group  col-sm-3" runat="server" id="divAction">
                                        <div style="height: 29px"></div>
                                        <button class="btn btn-sm btn-primary m-t-n-xs col-sm-8" id="btnSubmit" runat="server" type="button" onclick="BindData()"><strong>Get Data</strong></button>
                                    </div>--%>
                                   
                                </div>
                            </div>
                            <div class="row">
                                      <div class="col-sm-12"  style="margin-bottom: 5px">
                                            <h4 style="text-align: center; color: #EC4758"></h4>
                                            <div class="form-group col-sm-3">
                                                <label>Enrollment Date <span class="text-danger"></span></label>

                                                <div style="height: 0px"></div>
                                                <div>
                                                    <div class="input-group date">
                                                        <span class="input-group-addon" id="spnDate"><i class="fa fa-calendar"></i></span>
                                                        <asp:TextBox ID="txtEnrollDate" ReadOnly="false" runat="server" CssClass="form-control" />
                                                        <%--<input type="text" id="txtDate" runat="server" class="form-control" />--%>
                                                        <ajax:CalendarExtender ID="CalenderExtenderDate" runat="server" BehaviorID="Calendar1"
                                                            OnClientHidden="calendarhidden" Format="dd/MM/yyyy" CssClass="black" TargetControlID="txtEnrollDate"
                                                            PopupButtonID="spnDate" />
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="form-group col-sm-3">
                                                <label>Date Bound <span class="text-danger"></span></label>
                                                <asp:DropDownList ID="ddlBound" runat="server" CssClass="form-control ddlCourse">
                                                    <asp:ListItem Value="0">--Select--</asp:ListItem> 
                                                    <%--<asp:ListItem Value="1">Present</asp:ListItem>
                                                    <asp:ListItem Value="2">Absent</asp:ListItem> These two item will be used in mark attandance(Absent) so, not required here --%>
                                                    <asp:ListItem Value="1">On Date</asp:ListItem>
                                                    <asp:ListItem Value="2">On or Before</asp:ListItem>
                                                    <asp:ListItem Value="2">On or After</asp:ListItem>
                                                </asp:DropDownList>

                                            </div>
                                       <%--   <div class="form-group col-sm-3">
                                                <label>Deleted Date <span class="text-danger"></span></label>

                                                <div style="height: 0px"></div>
                                                <div>
                                                    <div class="input-group date">
                                                        <span class="input-group-addon" ><i class="fa fa-calendar"></i></span>
                                                        <asp:TextBox ID="txtDeleteDate" ReadOnly="false" runat="server" CssClass="form-control" />
                                                        <ajax:CalendarExtender ID="CalendarExtender1" runat="server" BehaviorID="Calendar"
                                                            OnClientHidden="calendarhidden" Format="dd/MM/yyyy" CssClass="black" TargetControlID="txtDeleteDate"
                                                            PopupButtonID="spnDate" />
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="form-group col-sm-3">
                                                <label>Date Bound <span class="text-danger"></span></label>
                                                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control ddlCourse">
                                                    <asp:ListItem Value="0">--Select--</asp:ListItem> 
                                                   
                                                    <asp:ListItem Value="1">On Date</asp:ListItem>
                                                    <asp:ListItem Value="2">On or Before</asp:ListItem>
                                                    <asp:ListItem Value="2">On or After</asp:ListItem>
                                                </asp:DropDownList>

                                            </div>            --%>      

                                      </div>
                            </div>
                            <div class="row">
                                <h4 style="text-align: center; color: #EC4758">Specify Columns</h4>
                                <div class="col-sm-12"  style="margin-bottom: 5px">
                                    
                                   <div class="form-group  col-sm-4">
                                    <label>Select Coulmns </label>
                                    <asp:CheckBox ID="chkSelectALL"  class="form-control chkAll" Text="     Select All" runat="server" Checked="true" />
                                </div>
                                     <div class="col-sm-12 divCheckboxList"  style="margin-bottom: 5px;display:none">
                                    
                                   <div class="form-group  col-sm-12">
                                    <asp:CheckBoxList ID="CheckBoxBind"  runat="Server" DataTextField="Name" DataValueField="ID" RepeatDirection="Horizontal" RepeatColumns="4" RepeatLayout="Table"></asp:CheckBoxList>
                                </div>      
                                </div>
                            </div>
                            <div class="row">
                                <h4 style="text-align: center; color: #EC4758">Order By</h4>
                                <div class="col-sm-12"  style="margin-bottom: 5px">                                   
                                   
                                     <div class="form-group  col-sm-3">
                                    <label>Column Names</label>
                                    <select class="form-control" id="ddlOrder" clientidmode="static" runat="server">
                                        <option value="0">Unknown</option>                                        
                                    </select>
                                </div>
                                     <div class="form-group  col-sm-3">
                                    <label>Direction <span class="text-danger"></span></label>
                                    <select class="form-control" id="ddlDirection" clientidmode="static" runat="server">
                                        <option value="1">ASC</option>
                                        <option value="2">DESC</option>
                                    </select>
                                </div>
                                    <div class="form-group  col-sm-3" runat="server" id="divAction">
                                        <div style="height: 29px"></div>
                                        <asp:Button class="btn btn-sm btn-primary m-t-n-xs col-sm-8" id="btnSubmit" Text="Export Data" runat="server" type="button" onclick="btnSubmit_Click"/>
                                        
                                    </div>
                                   
                                </div>
                            </div>
                        </asp:Panel>

                        
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
                    <button class="btn btn-danger" id="btnDelete" onclick="DeleteConfirm()" runat="server" type="button"><strong>Delete</strong></button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal inmodal" id="AddNew" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content animated bounceInDown">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>

                    <h4 class="modal-title">Add new Subject</h4>
                </div>
                <%-- <div class="row">
                  
                </div>--%>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-sm-12" id="div2" style="margin-bottom: 5px">
                            <h4 style="text-align: center; color: #EC4758" id="h2"></h4>
                            <div class="form-group  col-sm-2"></div>
                            <div class="form-group  col-sm-6">

                                <select class="form-control ddlSubject" id="ddlSubject" runat="server">
                                    <option value="0">-- Select Subject --</option>
                                </select>
                            </div>
                            <div class="form-group  col-sm-4">
                                <button class="btn btn-xl btn-primary col-sm-12" id="btnAddNew" runat="server" type="button" onclick="OnAddNew()">Save</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" id="hdnId" runat="server" />
    <input type="hidden" id="hdnCourse" runat="server" />
    <input type="hidden" id="hdnSection" runat="server" />
    <input type="hidden" runat="server" id="hdnDate" />
    <input type="hidden" runat="server" id="hdnDeleteDate" />
    <input type="hidden" id="hdnMode" runat="server" />
    <script type="text/javascript">
        $(document).ready(function () {
            BindDropdown('GetCourse', null, 0, '#ddlCourse');
            $("<option value=999>All</option>").insertAfter("#ddlCourse option:first");
           
        });
        $('.chkAll').change(function () {
            if (this.checked) {
                //Do stuff
            }
        });
        function dateselect(ev) {
            var calendarBehavior1 = $find("Calendar1");
            var date = calendarBehavior1._selectedDate.format("dd/MM/yyyy");
            var hiddencontrol = $get('<%=hdnDate.ClientID %>');
            if (hiddencontrol.value.indexOf(date) == -1)
                hiddencontrol.value += date + ";";
            tag1 = 1;
        }
        function calendarhidden(obj) {
            $("#<%=hdnDate.ClientID %>").val($("#<%=txtEnrollDate.ClientID %>").val());
            var calendarBehavior = $find("Calendar1");
            if (tag1 == 1)
                calendarBehavior.show();
            $get('<%=txtEnrollDate.ClientID %>').value = $get('<%=hdnDate.ClientID %>').value;
             }
             function dateselect(ev) {

                 var calendarBehavior1 = $find("CalendarClear");
                 var date = calendarBehavior1._selectedDate.format("dd/MM/yyyy");
                 var hiddencontrol = $get('<%=hdnDate.ClientID %>');
            if (hiddencontrol.value.indexOf(date) == -1)
                hiddencontrol.value += date + ";";
            tag1 = 1;
        }
        function calendarhidden1(obj) {
           <%-- $("#<%=hdnDate.ClientID %>").val($("#<%=txtClearDate.ClientID %>").val());
            var calendarBehavior = $find("CalendarClear");
            if (tag1 == 1)
                calendarBehavior.show();
            $get('<%=txtClearDate.ClientID %>').value = $get('<%=hdnDate.ClientID %>').value;--%>

        }
       

        $(".ddlCourse").change(function () {
            $("#hdnCourse").val('');
            var courseIndex = $(".ddlCourse").prop('selectedIndex');
            if (courseIndex == 0) {
                $("#divAddSubject").hide();
            } else {
                Course = $(this).find("option:selected").text();
                if (Course == "All") {
                    $(".ddlSectionGroup").css("display", "none");
                } else {
                    $(".ddlSectionGroup").css("display", "block");
                    BindDropdown('GetSection', Course, 0, '#ddlSection');
                    $("<option value=0>All</option>").insertAfter("#ddlSection option:first");
                    $("#hdnCourse").val(Course);
                    $(".ddlSection").focus();
                }
            }
        });
        $(".ddlSection").change(function () {
            $("#hdnSection").val('');
            var sectionIndex = $(".ddlSection").prop('selectedIndex');
            if (sectionIndex == 0) {
                $("#divAddSubject").hide();
            } else {
                $("#hdnSection").val($(this).find("option:selected").text());
            }
        });
        $(".ddlSubject").change(function () {
            $("#hdnSubject").val($(this).find("option:selected").val());
        });
        function AddNewSubject() {
            var JsonData = [];
            var Mode = 'ExceptCourseSubject';
            var Course = $("#hdnCourse").val();
            var Section = $("#hdnSection").val();
            //Get Json Data from Server

            var Request = new XMLHttpRequest();
            var url = '../Handlers/CourseMapping.ashx?Mode=' + Mode + '&Course=' + Course + '&Section=' + Section + '&Id=0';
            Request.open("GET", url, false);
            Request.send();
            var Data = Request.responseText;

            if (Data != undefined) {
                Data = jQuery.parseJSON(Data);

                $("#<%=ddlSubject.ClientID %>").empty();;
                $("#<%=ddlSubject.ClientID %>").append('<option value=0>--Select Subject--</option>');
                $.each(Data, function (index, PARAM) {
                    $("#<%=ddlSubject.ClientID %>").append('<option value="' + PARAM.Id + '">' + PARAM.Subject + '</option>');
                });

            }

        }
        function BindData() {
            try {
                var courseIndex = $(".ddlCourse").prop('selectedIndex');
                var sectionIndex = $(".ddlSection").prop('selectedIndex');
                if (sectionIndex == 0 && courseIndex == 0) {
                    AppDisplayMessage('Please select the course and section', 2);
                    return false;
                }
                else {
                    $('#dataTable').dataTable().fnDestroy();
                    var JsonData = [];
                    var Mode = 'GetByCourseSubject';
                    var Id = 0;
                    var Course = $("#hdnCourse").val();
                    var Section = $("#hdnSection").val();
                    //Get Json Data from Server

                    var Request = new XMLHttpRequest();
                    var url = '../Handlers/CourseMapping.ashx?Mode=' + Mode + '&Course=' + Course + '&Section=' + Section + '&Id=0';
                    Request.open("GET", url, false);
                    Request.send();
                    var Data = Request.responseText;

                    if (Data != []) {
                        Data = jQuery.parseJSON(Data);
                        $.each(Data, function (index, PARAM) {
                            JsonData.push([
                                index + 1, PARAM.Course, PARAM.Section, PARAM.Subject,
                                "<a onclick='OnDelete(" + PARAM.Id + ")' data-target=#myModal data-toggle=modal><i class='fa fa-trash'></i></a>",
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
                            "bProcessing": true,
                            "bPaginate": false,
                            "iDisplayLength": 100,
                            "oLanguage": {
                                "sEmptyTable": "No records found"
                            },
                            "aaData": JsonData,

                        });

                        $("#divAddSubject").show();
                        AddNewSubject();
                    }
                    else {

                    }
                }
            }
            catch (e) {
                alert(e.message);
            }
            //  clearData();
        }

        function clearData() {
            $("#<%=hdnId.ClientID %>").val('');
                $("#hdnSection").val('');
                $("#hdnSubject").val('');
            }
            function OnAddNew() {
                var subjectIndex = $(".ddlSubject").prop('selectedIndex');

                if (subjectIndex == 0) {
                    AppDisplayMessage('Please select the subject', 2);
                    return false;
                } else {
                    var Id = $("#hdnSubject").val();
                    CallAction(Id, "AddNewSubject");
                }
            }

            function OnDelete(Id) {
                $("#<%=hdnId.ClientID %>").val(Id);
        }
        function DeleteConfirm() {

            CallAction($("#<%=hdnId.ClientID %>").val(), "DeleteSubject");
            }
            function CallAction(Id, type) {
                var JsonData = [];
                var Mode = type;
                var Course = $("#hdnCourse").val();
                var Section = $("#hdnSection").val();
                //Get Json Data from Server

                var Request = new XMLHttpRequest();
                var url = '../Handlers/CourseMapping.ashx?Mode=' + Mode + '&Course=' + Course + '&Section=' + Section + '&Id=' + Id;
                Request.open("GET", url, false);
                Request.send();
                var Data = Request.responseText;

                if (Data != undefined) {
                    if (Data == 'Success') {
                        if (type == 'AddNewSubject') {
                            $('#AddNew').hide();
                            AppDisplayMessage("Course and Subject saved successfully", 1);
                        } else {
                            $('#myModal').hide();
                            AppDisplayMessage("Mapping deleted successfully", 1);
                        }
                        BindData();
                        $(".modal-backdrop").hide();
                    } else {
                        if (type == 'AddNewSubject') {
                            AppDisplayMessage("Course and Subject not saved successfully", 2);
                        } else {
                            if (Data == 'Mapped') {
                                AppDisplayMessage("Mapped with another entity, you can not delete the record", 2);
                            } else {
                                AppDisplayMessage("Mapping not deleted successfully", 2);
                            }
                        }
                    }
                }
            }


    </script>


</asp:Content>
