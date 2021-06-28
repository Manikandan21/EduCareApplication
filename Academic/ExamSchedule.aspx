<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ExamSchedule.aspx.cs" Inherits="ILogisticsApplication.Academic.ExamSchedule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Resource/css/plugins/datapicker/datepicker3.css" rel="stylesheet" />
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
                                <h5 id="hTag">Exam Schedule <small>manage Exam scheduling details</small></h5>
                                <div class="">
                                    <a class="btn btn-sm btn-primary m-t-n-xs col-sm-2 pull-right" style="font-family: open sans,Helvetica Neue,Helvetica,Arial,sans-serif; font-size: 13px;" id="aExamSchedule">
                                        <i class="fa fa-bars" style="color: white;" id="iExamSchedule">View Mapping</i>
                                    </a>
                                </div>
                            </div>
                            <div class="ibox-content">

                                <asp:Panel ID="pnlAction" runat="server">
                                    <div class="row">
                                        <div class="col-sm-12" id="divEditable" style="margin-bottom: 5px">
                                            <h4 style="text-align: center; color: #EC4758" id="headEditable"></h4>

                                            <div class="form-group col-sm-3">
                                                <label>Course <span class="text-danger">*</span></label>
                                                <asp:DropDownList ID="ddlCourse" runat="server" CssClass="form-control ddlCourse" AutoPostBack="True" OnSelectedIndexChanged="ddlCourse_SelectedIndexChanged">
                                                    <asp:ListItem>--Select--</asp:ListItem>
                                                </asp:DropDownList>

                                            </div>
                                            <div class="form-group  col-sm-3">
                                                <label>Section <span class="text-danger">*</span></label>
                                                <asp:DropDownList ID="ddlSection" runat="server" CssClass="form-control ddlSection" AutoPostBack="True" OnSelectedIndexChanged="ddlSection_SelectedIndexChanged">
                                                    <asp:ListItem>--Select--</asp:ListItem>
                                                </asp:DropDownList>

                                            </div>
                                            <div class="form-group col-sm-3">
                                                <label>Select Exam <span class="text-danger">*</span></label>
                                                <asp:DropDownList ID="ddlExam" runat="server" CssClass="form-control ddlExam">
                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="form-group  col-sm-3" runat="server">
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
                                                <asp:Panel ID="pnlExamSchedule" Visible="false" runat="server">
                                                    <asp:GridView ID="grdExamSchedule" RowStyle-HorizontalAlign="Center" OnRowDataBound="grdExamSchedule_RowDataBound" DataKeyNames="Id" AutoGenerateColumns="false" runat="server" EmptyDataText="No Records found" CssClass="table table-bordered">
                                                        <EmptyDataTemplate>
                                                            <p>
                                                                No Records found.
                                                                <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Academic/ExamSchedule.aspx?MenuID=20&Response=1" runat="server"><b>Click here</b></asp:HyperLink>
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
                                                                    <asp:Label ID="lblSubjectId" runat="server" Text='<%#Eval("Id")%>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField ItemStyle-Width="25%" HeaderStyle-CssClass="header-center" HeaderStyle-HorizontalAlign="Center" HeaderText="Subject" DataField="Name" />
                                                            <asp:TemplateField HeaderText="Date *" HeaderStyle-CssClass="header-center" ItemStyle-Width="20%" HeaderStyle-HorizontalAlign="Center">
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                <ItemTemplate>
                                                                    <div class="input-group date">
                                                                        <span class="input-group-addon" id="spnDate"><i class="fa fa-calendar"></i></span>
                                                                        <asp:TextBox ID="txtDate"  Text='<%# Container.DataItem.GetType().GetProperty("ExamDate") != null ? DataBinder.Eval(Container.DataItem, "ExamDate") :string.Empty  %>' runat="server" CssClass="form-control ForceReadOnly examDatepicker" />
                                                                    </div>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Session *" HeaderStyle-CssClass="header-center" ItemStyle-Width="10%" HeaderStyle-HorizontalAlign="Center">
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSession" runat="server" Text='<%# Container.DataItem.GetType().GetProperty("ExamSession") != null ? DataBinder.Eval(Container.DataItem, "ExamSession") :"0"  %>' Visible="false" />
                                                                    <asp:DropDownList ID="ddlSession" runat="server" CssClass="form-control ddlSession">
                                                                        <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                                        <asp:ListItem Value="1">I</asp:ListItem>
                                                                        <asp:ListItem Value="2">II</asp:ListItem>
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
        </ContentTemplate>
    </asp:UpdatePanel>
    <script src="../Resource/js/plugins/datapicker/bootstrap-datepicker.js"></script>
    <script src="../Resource/js/eduCareCommon.js"></script>
    <script type="text/javascript">
        var ResponseForm = '';
        var RoleId = '';
        $(function () {
            RoleId = '<%=Convert.ToString(Session["RoleId"]) %>';

            $.fn.ForceReadOnly = function () {
                return this.each(function () {
                    $(this).keydown(function (e) {
                        var key = e.charCode || e.keyCode || 0;
                        return (key == 9);
                    });
                });
            };
            BindDataByResponse();
            //if (RoleId == '1') {
            //    if (ResponseForm == 1) {
            //        $('.btnGetData').attr('visible', 'false');
            //    }
            //    $('.btnSubmit').attr('visible', 'false');
            //    $('.btnClear').attr('visible', 'false');
            //}
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
            var Exam = $('#<%=ddlExam.ClientID %>').val();
            if (ResponseForm == 1) {
                if (Number(Course) == 0 || Number(Section) == 0 || Number(Exam) == 0) {
                    AppDisplayMessage('Please fill the mandatory fields', 2);
                    return false;
                }
                else {
                    var CourseText = $(".ddlCourse option:selected").text();
                    var SectionText = $(".ddlSection option:selected").text();
                    var url = '../Handlers/ManageStudents.ashx?Mode=ExamCheck&Course=' + CourseText + '&Section=' + SectionText + '&Id=' + Exam;
                    var result = GetJsonResult(url);
                    if (result == 'success') {
                        setDatepicker();
                        return true;
                    } else {
                        AppDisplayMessage('Already exam scheduled for selected data', 2);
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

        function gridValidate() {

            var IsValidate = true;
            $("#<%=grdExamSchedule.ClientID %>").find("tr").removeClass("selected_row");
            var list = [];
            $("#<%=grdExamSchedule.ClientID %> tr").each(function () {
                if (!this.rowIndex) return;
                var date = $(this).find("td:eq(2) .examDatepicker").val();
                var session = $(this).find("td:eq(3) .ddlSession").val();
                if (date == '' || session == 0) {
                    $("#<%=grdExamSchedule.ClientID %>").find("tr:eq(" + this.rowIndex + ")").addClass("selected_row");
                        AppDisplayMessage('Please fill the exam date and session details', 2);
                        IsValidate = false;
                        return false;
                    }
                    else {
                        list.push(date + '/' + session);
                    }
            });
                if (IsValidate) {
                    if (list != []) {
                        var result = IsDuplicate(list);
                        if (result == -1) {
                            EnableTextBox();
                            return true;
                        } else {
                            result = result + 1;
                            $("#<%=grdExamSchedule.ClientID %>").find("tr:eq(" + result + ")").addClass("selected_row");
                            AppDisplayMessage('Selected details already exist in the grid, please select the different data', 2);
                            return false;
                        }

                    }
                } else {
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
                    $("#<%=grdExamSchedule.ClientID %> tr").each(function () {
                        $(this).find("td:eq(2) .examDatepicker").val('');
                        $(this).find("td:eq(3) .ddlSession").val('0');
                    });
                }
            }
            var EnableTextBox = function () {
                $(this).find("td:eq(2) .examDatepicker").attr("disabled", false);
                $(this).find("td:eq(3) .ddlSession").attr("disabled", false);
            }
            function BindDataByResponse() {
                var formType = GetParameterValues('Response');
                ResponseForm = formType;
                if (formType == '1') {
                    $("#aExamSchedule").attr("href", "ExamSchedule.aspx?MenuID=20&Response=2");
                    $('#iExamSchedule').text(' View Schedule');
                    $('.btnGetData').val('Create Schedule');
                    $('.btnSubmit').text('Submit');
                    $('.btnClear').text('Clear Data');
                } else if (formType == '2') {
                    $("#aExamSchedule").attr("href", "ExamSchedule.aspx?MenuID=20&Response=1");
                    $('#iExamSchedule').text(' Create Schedule');
                    $('.btnGetData').val('View Schedule');
                    $('.btnSubmit').text('Save Changes');
                    $('.btnClear').text('Delete');
                } else if (formType == undefined) {
                    $('#aExamSchedule').text(' View Schedule');
                    $('.btnGetData').val('View Schedule');
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

                        //if (RoleId == '1') {
                        //    if (ResponseForm == 1) {
                        //        $('.btnGetData').attr('visible', 'false');
                        //    }
                        //    $('.btnSubmit').attr('visible', 'false');
                        //    $('.btnClear').attr('visible', 'false');
                        //}
                    }
                });
            };

            function HideModalBackdrop() {
                $(".modal-backdrop").hide();
            }
            
            


          
    </script>
</asp:Content>
