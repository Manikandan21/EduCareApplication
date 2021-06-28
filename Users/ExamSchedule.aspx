<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ExamSchedule.aspx.cs" Inherits="ILogisticsApplication.Users.ExamSchedule" %>

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
                                <h5 id="hTag">Exam Schedule <small>view Exam scheduling details</small></h5>

                            </div>
                            <div class="ibox-content">

                                <asp:Panel ID="pnlAction" runat="server">
                                    <div class="row">
                                        <div class="col-sm-12" id="divEditable" style="margin-bottom: 5px">
                                            <h4 style="text-align: center; color: #EC4758" id="headEditable"></h4>
                                             <div class="form-group col-sm-3"></div>

                                            <div class="form-group col-sm-3">
                                                <label>Select Exam <span class="text-danger">*</span></label>
                                                <asp:DropDownList ID="ddlExam" runat="server" CssClass="form-control ddlExam">
                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="form-group  col-sm-3" runat="server">
                                                <div style="height: 29px"></div>

                                                <asp:Button ID="btnGet" runat="server" Text="Get Exam Details" OnClientClick="if (!Validate()) {return false;}" OnClick="btnGet_Click" CssClass="btn btn-primary m-t-n-xs col-sm-8 btnGetData" />

                                            </div>
                                            <div class="form-group col-sm-3"></div>
                                        </div>

                                    </div>
                                </asp:Panel>

                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="ibox">

                                            <div class="" style="overflow: auto; width: 100%">
                                                <asp:Panel ID="pnlExamSchedule" Visible="false" runat="server">
                                                    <asp:GridView ID="grdExamSchedule" RowStyle-HorizontalAlign="Center"  DataKeyNames="Id" AutoGenerateColumns="false" runat="server" EmptyDataText="No Records found" CssClass="table table-bordered">
                                                        <EmptyDataTemplate>
                                                            <p>
                                                                No Records found.
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
                                                             <asp:BoundField ItemStyle-Width="25%" HeaderStyle-CssClass="header-center" HeaderStyle-HorizontalAlign="Center" HeaderText="Exam Date" DataField="ExamDate" />
                                                           
                                                            <asp:TemplateField HeaderText="Session" HeaderStyle-CssClass="header-center" ItemStyle-Width="10%" HeaderStyle-HorizontalAlign="Center">
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSession" runat="server" Text='<%# Container.DataItem.GetType().GetProperty("ExamSessionString") != null ? DataBinder.Eval(Container.DataItem, "ExamSessionString") :"0"  %>' />
                                                                   
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                        </Columns>
                                                    </asp:GridView>
                                                    
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


            var Exam = $('#<%=ddlExam.ClientID %>').val();

            if (Number(Exam) == 0) {
                AppDisplayMessage('Please fill the mandatory fields', 2);
                return false;
            }
            else {
                return true;
            }
        }



    </script>
</asp:Content>
