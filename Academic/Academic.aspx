<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Academic.aspx.cs" Inherits="ILogisticsApplication.Academic.Academic" %>

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
                                <h5 id="hTag">Academic Management <small>manage academic details</small></h5>
                                <div class="">
                                    <a class="btn btn-sm btn-primary m-t-n-xs col-sm-2 pull-right" style="font-family: open sans,Helvetica Neue,Helvetica,Arial,sans-serif; font-size: 13px;" id="aHomework">
                                        <i class="fa fa-bars" style="color: white;" id="iHomework">View Academic details</i>
                                    </a>
                                </div>
                            </div>
                            <div class="ibox-content">

                                <asp:Panel ID="pnlAction" runat="server">
                                    <div class="row">
                                        <div class="col-sm-12" id="divEditable" style="margin-bottom: 5px">
                                            <h4 style="text-align: center; color: #EC4758" id="headEditable"></h4>

                                            <div class="form-group col-sm-2">
                                                <label>Course <span class="text-danger">*</span></label>
                                                <asp:DropDownList ID="ddlCourse" runat="server" CssClass="form-control ddlCourse" AutoPostBack="True" OnSelectedIndexChanged="ddlCourse_SelectedIndexChanged">
                                                    <asp:ListItem>--Select--</asp:ListItem>
                                                </asp:DropDownList>

                                            </div>
                                            <div class="form-group  col-sm-2">
                                                <label>Section <span class="text-danger">*</span></label>
                                                <asp:DropDownList ID="ddlSection" runat="server" CssClass="form-control ddlSection" AutoPostBack="true" OnSelectedIndexChanged="ddlSection_SelectedIndexChanged">
                                                    <asp:ListItem>--Select--</asp:ListItem>
                                                </asp:DropDownList>

                                            </div>
                                            <div class="form-group col-sm-2">
                                                <label>Select Exam <span class="text-danger">*</span></label>
                                                <asp:DropDownList ID="ddlExam" runat="server" CssClass="form-control ddlExam" AutoPostBack="true"  OnSelectedIndexChanged="ddlExam_SelectedIndexChanged">
                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="form-group col-sm-3">
                                                <label>Select Student <span class="text-danger">*</span></label>
                                                <asp:DropDownList ID="ddlStudent" runat="server" CssClass="form-control ddlExam" AutoPostBack="true"  OnSelectedIndexChanged="ddlStudent_SelectedIndexChanged">
                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div id="Div1" class="form-group  col-sm-3" runat="server">
                                                <div style="height: 29px"></div>

                                                <asp:Button ID="btnGet" runat="server" Text="" OnClientClick="if (!Validate()) {return false;}" OnClick="btnGet_Click" CssClass="btn btn-primary m-t-n-xs col-sm-8 btnGetData" />

                                            </div>

                                        </div>

                                    </div>
                                </asp:Panel>

                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="ibox">

                                            <div class="" style="overflow: auto; width: 100%">
                                                <asp:Panel ID="pnlAcademic" Visible="false" runat="server">
                                                    <asp:GridView ID="grdAcademic" RowStyle-HorizontalAlign="Center" OnRowDataBound="grdAcademic_RowDataBound" AutoGenerateColumns="false" runat="server" EmptyDataText="No Records found" CssClass="table table-bordered grdAcademic">
                                                        <EmptyDataTemplate>
                                                            <p id="pformType1" style="display: none">
                                                                No Records found.
                                                                <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Academic/Academic.aspx?MenuID=17&Response=1" runat="server"><b>Click here</b></asp:HyperLink>
                                                                to Create
                                                            </p>
                                                            <p id="pformType2" style="display: none">
                                                                No Mapping found.
                                                                <asp:HyperLink ID="HyperLink2" NavigateUrl="~/Configuration/ViewCourseSubjectMapping.aspx?MenuID=70" runat="server"><b>Click here</b></asp:HyperLink>
                                                                to Create
                                                            </p>
                                                        </EmptyDataTemplate>
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="S.No" ItemStyle-Width="10%" HeaderStyle-CssClass="header-center" HeaderStyle-HorizontalAlign="Center">
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                <ItemTemplate>
                                                                    <%# Container.DataItemIndex + 1 %>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSubjectId" runat="server" Text='<%# Container.DataItem.GetType().GetProperty("Id") != null ? DataBinder.Eval(Container.DataItem, "Id") :string.Empty  %>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField ItemStyle-Width="30%" HeaderStyle-CssClass="header-center" HeaderStyle-HorizontalAlign="Center" HeaderText="Subject" DataField="Subject" />
                                                            <asp:TemplateField HeaderText="Max.Marks" HeaderStyle-CssClass="header-center" HeaderStyle-HorizontalAlign="Center">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblMaxMarks" CssClass="lblMaxMarks" runat="server" Text='<%# Container.DataItem.GetType().GetProperty("AddParam") != null ? DataBinder.Eval(Container.DataItem, "AddParam") :string.Empty  %>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Mark *" HeaderStyle-CssClass="header-center" ItemStyle-Width="20%" HeaderStyle-HorizontalAlign="Center">
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                <ItemTemplate>
                                                                    <asp:TextBox ID="txtMarks" Text='<%# Container.DataItem.GetType().GetProperty("Marks") != null ? DataBinder.Eval(Container.DataItem, "Marks") :string.Empty  %>' runat="server"  onkeypress="return onlyNos(event,this);"   MaxLength="3" CssClass="form-control txtMarks NumbersOnly" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                        </Columns>
                                                    </asp:GridView>
                                                    <div class="form-group  col-sm-12" style="height:25px;  background-color: #F3F3F4;" runat="server" visible="false" id="divTotal">
                                                        <div class="col-sm-10"></div>
                                                        <div class="col-sm-2"  style="margin-top:5px;font-size:14px">
                                                            <asp:Label ID="lblTotal" runat="server" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group  col-sm-12" runat="server" id="divAction">
                                                        <div class="col-sm-7"></div>
                                                        <div class="col-sm-5">

                                                            <button class="btn btn-sm btn-primary m-t-n-xs col-sm-5 btnSubmit" id="btnSubmit" runat="server" type="button" onclick="if (!gridValidate()) {return false;}" onserverclick="btnSubmit_ServerClick"></button>
                                                            <button class="btn btn-sm btn-danger pull-right m-t-n-xs col-sm-5 btnClear" id="clearData" onclick="ClearData()" type="button"></button>
                                                        </div>
                                                    </div>
                                                </asp:Panel>
                                                <asp:Panel ID="panelDisplayView" runat="server" Visible="false">
                                                    <p id="form">
                                                        No Records found.
                                                                <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Academic/Academic.aspx?MenuID=17&Response=1" runat="server"><b>Click here</b></asp:HyperLink>
                                                        to Create
                                                    </p>
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
        function onlyNos(e, t) {
            try {
                if (window.event) {
                    var charCode = window.event.keyCode;
                }
                else if (e) {
                    var charCode = e.which;
                }
                else { return true; }
                if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                    return false;
                }
                return true;
            }
            catch (err) {
                alert(err.Description);
            }
        }

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
        function gridValidate() {
            try {
                var IsValidate = true;
                $("#<%=grdAcademic.ClientID %>").find("tr").removeClass("selected_row");
                var list = [];

                $("#<%=grdAcademic.ClientID%> tr:has(td)").each(function () {
                    console.log(this.rowIndex);
                    if (!this.rowIndex) return;
                    var Marks = $(this).find("td:eq(3) .txtMarks").val();
                    var MaxMarks = $(this).find("td:eq(2) .lblMaxMarks").text();
                    console.log(MaxMarks);
                    if (Marks == '') {
                        $("#<%=grdAcademic.ClientID %>").find("tr:eq(" + this.rowIndex + ")").addClass("selected_row");
                            AppDisplayMessage('Please fill the Marks', 2);
                            $("#<%=grdAcademic.ClientID %>").find("tr:eq(" + this.rowIndex + ")").find('.NumbersOnly').focus();
                            IsValidate = false;
                            return false;
                        } else if (parseInt(Marks) > parseInt(MaxMarks)) {
                            $("#<%=grdAcademic.ClientID %>").find("tr:eq(" + this.rowIndex + ")").addClass("selected_row");
                            $("#<%=grdAcademic.ClientID %>").find("tr:eq(" + this.rowIndex + ")").find('NumbersOnly').focus();
                                AppDisplayMessage('Obtained Mark is greater than Max Marks. Max.Marks: ' + MaxMarks + '', 2);
                                IsValidate = false;
                                return false;
                            }

                            //else {

                            //    list.push(content);
                            //}
                    });
                    if (IsValidate) {
                        return true;
                    } else {
                        return false;
                    }

                } catch (e) {
                    console.log(e);
                }


            }



            function HideModalBackdrop() {
                $(".modal-backdrop").hide();
            }
            function Validate() {

                var Course = $('#<%=ddlCourse.ClientID %>').val();
    var Section = $('#<%=ddlSection.ClientID %>').val();
    var Exam = $('#<%=ddlExam.ClientID %>').val();
    var student = $('#<%=ddlStudent.ClientID %>').val();
    if (ResponseForm == 1) {
        if (Number(Course) == 0 || Number(Section) == 0 || Number(Exam) == 0 || Number(student) == 0) {
            AppDisplayMessage('Please fill the mandatory fields', 2);
            return false;
        }
        else {
            var CourseText = $(".ddlCourse option:selected").text();
            var SectionText = $(".ddlSection option:selected").text();
            var url = '../Handlers/ManageStudents.ashx?Mode=AcademicCheck&Course=' + CourseText + '&Section=' + SectionText + '&Exam=' + Exam + '&Id=' + student;
            var result = GetJsonResult(url);
            if (result == 'success') {
                setDatepicker();
                return true;
            } else {
                AppDisplayMessage('Already Academic details exists for selected data', 2);
                return false;
            }
        }
    } else {
        if (Number(Course) == 0 || Number(Section) == 0 || Number(Exam) == 0) {
            AppDisplayMessage('Please fill the mandatory fields', 2);
            return false;
        }
        else {
            return true;
        }
    }
}



var ClearData = function () {
    if (ResponseForm == '2') {
        $('#myModal').modal('show');
    } else {
        $("#<%=grdAcademic.ClientID %> tr").each(function () {
                        $(this).find("td:eq(3) .txtMarks").val('');
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
                    $("#aHomework").attr("href", "Academic.aspx?MenuID=23&Response=2");
                    $('#iHomework').text(' View Academic');
                    $('.btnGetData').val('Create Academic');
                    $('.btnSubmit').text('Submit');
                    $('.btnClear').text('Clear Data');
                } else if (formType == '2') {
                    $("#aHomework").attr("href", "Academic.aspx?MenuID=20&Response=1");
                    $('#iHomework').text(' Create Academic');
                    $('.btnGetData').val('View Academic');
                    $('.btnSubmit').text('Save Changes');
                    $('.btnClear').text('Delete');
                } else if (formType == undefined) {
                    $('#aHomework').text(' View Academic');
                    $('.btnGetData').val('View Academic');
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
    </script>


</asp:Content>
