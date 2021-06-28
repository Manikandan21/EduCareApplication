<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Timetable.aspx.cs" Inherits="ILogisticsApplication.Academic.Timetable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .header-center {
            text-align: center;
        }

        .selected_row {
            background-color: #F3F3F4;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPanel" runat="server">


    <asp:ScriptManager ID="ScriptMngr" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="updatePanel" runat="server">
        <ContentTemplate>

            <div class="wrapper wrapper-content fadeInRight">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5 id="hTag">Timetable Management <small id="smallText">manage timetable details</small></h5>
                                <div class="">
                                    <a class="btn btn-sm btn-primary m-t-n-xs col-sm-2 pull-right" style="font-family: open sans,Helvetica Neue,Helvetica,Arial,sans-serif; font-size: 13px;" id="aTimetable">
                                        <i class="fa fa-bars" style="color: white;" id="iTimetable">View Mapping</i>
                                    </a>
                                </div>
                            </div>
                            <div class="ibox-content">

                                <asp:Panel ID="pnlAction" runat="server">
                                    <div class="row">
                                        <div class="col-sm-12" id="divEditable" style="margin-bottom: 5px">
                                            <h4 style="text-align: center; color: #EC4758" id="headEditable"></h4>

                                            <div class="form-group col-sm-4">
                                                <label>Course <span class="text-danger">*</span></label>
                                                <asp:DropDownList ID="ddlCourse" runat="server" CssClass="form-control ddlCourse" AutoPostBack="True" OnSelectedIndexChanged="ddlCourse_SelectedIndexChanged">
                                                    <asp:ListItem>--Select--</asp:ListItem>
                                                </asp:DropDownList>

                                            </div>
                                            <div class="form-group  col-sm-4">
                                                <label>Section <span class="text-danger">*</span></label>
                                                <asp:DropDownList ID="ddlSection" runat="server" CssClass="form-control ddlSection" AutoPostBack="true" OnSelectedIndexChanged="ddlSection_SelectedIndexChanged">
                                                    <asp:ListItem>--Select--</asp:ListItem>
                                                </asp:DropDownList>

                                            </div>

                                            <div id="Div1" class="form-group  col-sm-4" runat="server">
                                                <div style="height: 29px"></div>

                                                <asp:Button ID="btnGet" runat="server" Text="" OnClientClick="if (!Validate()) {return false;}" OnClick="btnGet_Click" CssClass="btn btn-primary m-t-n-xs col-sm-8 btnGetData" />

                                            </div>

                                        </div>

                                    </div>
                                </asp:Panel>

                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="ibox">

                                            <div class="" style="overflow: auto;">
                                                <asp:Panel ID="pnlExamSchedule" Visible="false" runat="server">
                                                    <asp:GridView ID="grdHomework" RowStyle-HorizontalAlign="Center"  Width="100%" OnRowDataBound="grdHomework_RowDataBound" DataKeyNames="Day" AutoGenerateColumns="false" runat="server" EmptyDataText="No Records found" CssClass="table table-bordered">
                                                        <EmptyDataTemplate>
                                                            <p id="pformType1" style="display: none">
                                                                No Records found.
                                                                <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Academic/TimeTable.aspx?MenuID=23&Response=1" runat="server"><b>Click here</b></asp:HyperLink>
                                                                to Create
                                                            </p>
                                                            <p id="pformType2" style="display: none">
                                                                No Mapping found.
                                                                <asp:HyperLink ID="HyperLink2" NavigateUrl="~/Configuration/ViewCourseSubjectMapping.aspx?MenuID=70" runat="server"><b>Click here</b></asp:HyperLink>
                                                                to Create
                                                            </p>
                                                        </EmptyDataTemplate>
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="Day" ItemStyle-Width="9%" HeaderStyle-CssClass="header-center" HeaderStyle-HorizontalAlign="Center">
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                
                                                                <ItemStyle Font-Bold="true" />
                                                                <ItemTemplate>
                                                                  <%--  <%# Container.DataItemIndex + 1 %>--%>
                                                                    <asp:Label ID="lblDayByName" runat="server" Text='<%#Eval("DayByName")%>' ></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblDay" runat="server" Text='<%#Eval("Day")%>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="I"><HeaderStyle Width="9%" />
                                                                 <ItemStyle width="9%" Wrap="false"/>
                                                                <ItemTemplate>
                                                                    <asp:DropDownList ID="ddlI"  runat="server" CssClass="form-control ddlSubject">
                                                                        <asp:ListItem>--Select--</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="II"><HeaderStyle Width="9%" />
                                                                <ItemStyle width="9%"  Wrap="false"/>
                                                                <ItemTemplate>
                                                                    <asp:DropDownList ID="ddlII" runat="server" CssClass="form-control ddlSubject">
                                                                        <asp:ListItem>--Select--</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="III"><HeaderStyle Width="9%" />
                                                                <ItemStyle width="9%"  Wrap="false"/>
                                                                <ItemTemplate>
                                                                    <asp:DropDownList ID="ddlIII" runat="server" CssClass="form-control ddlSubject">
                                                                        <asp:ListItem>--Select--</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="IV"><HeaderStyle Width="9%" />
                                                                <ItemStyle width="9%"  Wrap="false"/>
                                                                <ItemTemplate>
                                                                    <asp:DropDownList ID="ddlIV" runat="server" CssClass="form-control ddlSubject">
                                                                        <asp:ListItem>--Select--</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="V"><HeaderStyle Width="9%" />
                                                                <ItemStyle width="9%"  Wrap="false"/>
                                                                <ItemTemplate>
                                                                    <asp:DropDownList ID="ddlV" runat="server" CssClass="form-control ddlSubject">
                                                                        <asp:ListItem>--Select--</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="VI"><HeaderStyle Width="9%" />
                                                                <ItemStyle width="9%" Wrap="false" />
                                                                <ItemTemplate>
                                                                    <asp:DropDownList ID="ddlVI" runat="server" CssClass="form-control ddlSubject">
                                                                        <asp:ListItem>--Select--</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="VII"><HeaderStyle Width="9%" />
                                                                <ItemStyle width="9%"  Wrap="false"/>
                                                                <ItemTemplate>
                                                                    <asp:DropDownList ID="ddlVII" runat="server" CssClass="form-control ddlSubject">
                                                                        <asp:ListItem>--Select--</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="VIII"><HeaderStyle Width="9%" />
                                                                <ItemStyle width="9%"  Wrap="false"/>
                                                                <ItemTemplate>
                                                                    <asp:DropDownList ID="ddlVIII" runat="server" CssClass="form-control ddlSubject">
                                                                        <asp:ListItem>--Select--</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="IX"><HeaderStyle Width="9%" />
                                                                <ItemStyle width="9%"  Wrap="false"/>
                                                                <ItemTemplate>
                                                                    <asp:DropDownList ID="ddlIX" runat="server" CssClass="form-control ddlSubject">
                                                                        <asp:ListItem>--Select--</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="X"><HeaderStyle Width="9%" />
                                                                <ItemStyle width="9%" Wrap="false" />
                                                                <ItemTemplate>
                                                                    <asp:DropDownList ID="ddlX" runat="server" CssClass="form-control ddlSubject">
                                                                        <asp:ListItem>--Select--</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                    <div class="form-group  col-sm-12" runat="server" id="divAction">
                                                        <div class="col-sm-7"></div>
                                                        <div class="col-sm-5">

                                                            <button class="btn btn-sm btn-primary m-t-n-xs col-sm-5 btnSubmit" id="btnSubmit" runat="server" type="button" onclick="if (!gridValidate()) {return false;}" onserverclick="btnSubmit_ServerClick"></button>
                                                            <button class="btn btn-sm btn-danger pull-right m-t-n-xs col-sm-5 btnClear" id="clearData" onclick="ClearData()" type="button"></button>
                                                        </div>
                                                    </div>
                                                </asp:Panel>

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
                            <button class="btn btn-danger" id="btnDelete" runat="server" type="button" onserverclick="btnDelete_ServerClick"><strong>Delete</strong></button>
                        </div>
                    </div>
                </div>
            </div>
            <asp:HiddenField ID="hdnHours" runat="server" />
            <asp:HiddenField ID="hdnID" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
    
    <script src="../Resource/js/plugins/datapicker/bootstrap-datepicker.js"></script>
    <script src="../Resource/js/eduCareCommon.js"></script>
    <script type="text/javascript">
        var ResponseForm = '';
        $(function () {
            $.fn.ForceReadOnly = function () {
                return this.each(function () {
                    $(this).keydown(function (e) {
                        var key = e.charCode || e.keyCode || 0;
                        return (key == 9);
                    });
                });
            };
            BindDataByResponse();
            setDatepicker();
        });
        var setDatepicker = function () {
            $('.date').datepicker({
                todayBtn: "linked",
                keyboardNavigation: false,
                forceParse: false,
                calendarWeeks: false,
                autoclose: true,
                format: "dd/mm/yyyy"
            });
        };
        function Validate() {

            var Course = $('#<%=ddlCourse.ClientID %>').val();
            var Section = $('#<%=ddlSection.ClientID %>').val();
            if (ResponseForm == 1) {
                if (Number(Course) == 0 || Number(Section) == 0) {
                    AppDisplayMessage('Please fill the mandatory fields', 2);
                    return false;
                }
                else {
                    var CourseText = $(".ddlCourse option:selected").text();
                    var SectionText = $(".ddlSection option:selected").text();
                    var url = '../Handlers/ManageStudents.ashx?Mode=TimetableCheck&Course=' + CourseText + '&Section=' + SectionText + '&Date=""';
                    var result = GetJsonResult(url);
                    if (result == 'success') {
                        setDatepicker();
                        return true;
                    } else {
                        AppDisplayMessage('Already Timetable scheduled for selected data', 2);
                        return false;
                    }
                }
            } else {
                if (Number(Course) == 0 || Number(Section) == 0) {
                    AppDisplayMessage('Please fill the mandatory fields', 2);
                    return false;
                }
                else {
                    return true;
                }
            }
        }

        function gridValidate() {
            var RowLength=$("#ContentPanel_grdHomework").find('tr')[0].cells.length;
            var IsValidate = true;
            $("#<%=grdHomework.ClientID %>").find("tr").removeClass("selected_row");
            var list = [];
            $("#<%=grdHomework.ClientID %> tr").each(function () {
                if (!this.rowIndex) return;
                //  var content = $(this).find("td:eq(2) .ddl").val();
                for (i = 0; i < RowLength; i++) {
                    var subjectCode = $(this).find("td:eq(" + (i) + ") .ddlSubject").val();
                    if (subjectCode == "0") {
                       // $("#<%=grdHomework.ClientID %>").find("td:eq(" + i + ")  .ddlSubject").addClass("selected_row");
                        $("#<%=grdHomework.ClientID %>").find("tr:eq(" + this.rowIndex + ")").addClass("selected_row");                       
                        IsValidate = false;                        
                    }
                }
            });
            if (IsValidate) {
                return true;
            } else {
                AppDisplayMessage('Please fill the subject', 2);
                return false;
            }

        }
        var IsDuplicate = function (list) {
            var result = -1;
            var array = list;
            var valuesSoFar = [];
            for (var i = 0; i < array.length; ++i) {
                var value = array[i];
                if (valuesSoFar.indexOf(value) !== -1) {
                    result = i;
                }
                valuesSoFar.push(value);
            }
            return result;


        }
        var ClearData = function () {
            if (ResponseForm == '2') {
                $('#myModal').modal('show');
            } else {
                var RowLength = $("#ContentPanel_grdHomework").find('tr')[0].cells.length;
                $("#<%=grdHomework.ClientID %> tr").each(function () {
                    for (i = 0; i < RowLength; i++) {
                        $(this).find("td:eq(" + (i) + ") .ddlSubject").val(0);
                    }
                });
            }
        }
        var EnableTextBox = function () {
            $(this).find("td:eq(2) .txtContent").attr("disabled", false);
        }
        function BindDataByResponse() {
            var formType = GetParameterValues('Response');
            ResponseForm = formType;
            if (formType == '1') {
                $("#aTimetable").attr("href", "Timetable.aspx?MenuID=23&Response=2");
                $('#iHomework').text(' View Timetable');
                $('.btnGetData').val('Create Timetable');
                $('.btnSubmit').text('Submit');
                $('.btnClear').text('Clear Data');
                $('#smallText').text('Create Timetable details');
                
            } else if (formType == '2') {
                $("#aTimetable").attr("href", "Timetable.aspx?MenuID=20&Response=1");
                $('#iTimetable').text(' Create Timetable');
                $('.btnGetData').val('View Timetable');
                $('.btnSubmit').text('Save Changes');
                $('.btnClear').text('Delete');
                $('#smallText').text('Edit / Delete Timetable details');
            } else if (formType == undefined) {
                $('#aTimetable').text(' View Timetable');
                $('.btnGetData').val('View Timetable');
                $('.btnSubmit').text('Save Changes');
                $('.btnClear').text('Delete');
            } else {
                window.location = '../ErrorPage/404.html';
            }

        }

        //After UpdatePanel Refresh
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        if (prm != null) {
            prm.add_endRequest(function (sender, e) {
                if (sender._postBackSettings.panelsToUpdate != null) {
                    BindDataByResponse();
                    setDatepicker();
                    $(".ForceReadOnly").ForceReadOnly();
                    var formType = GetParameterValues('Response');
                    if (formType == "2") {
                        $("#pformType1").show();
                        $("#pformType2").hide();
                    } else if (formType == "1") {
                        $("#pformType2").show();
                        $("#pformType1").hide();
                    }
                }
            });
        };

        function HideModalBackdrop() {
            $(".modal-backdrop").hide();
        }
    </script>


</asp:Content>
