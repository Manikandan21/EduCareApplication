<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Academic.aspx.cs" Inherits="ILogisticsApplication.User.Academic" %>

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

                                                <asp:Button ID="btnGet" runat="server" Text="Get Academic" OnClientClick="if (!Validate()) {return false;}" OnClick="btnGet_Click" CssClass="btn btn-primary m-t-n-xs col-sm-8 btnGetData" />

                                            </div>
                                            <div class="form-group col-sm-3"></div>
                                        </div>

                                    </div>
                                </asp:Panel>

                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="ibox">

                                            <div class="" style="overflow: auto; width: 100%">
                                                <asp:Panel ID="pnlAcademic" Visible="false" runat="server">
                                                    <asp:GridView ID="grdAcademic" RowStyle-HorizontalAlign="Center" AutoGenerateColumns="false" runat="server" EmptyDataText="No Records found" CssClass="table table-bordered grdAcademic">
                                                        <EmptyDataTemplate>
                                                            <p id="pformType1" style="display: none">
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
                                                                    <asp:Label ID="lblSubjectId" runat="server" Text='<%# Container.DataItem.GetType().GetProperty("Id") != null ? DataBinder.Eval(Container.DataItem, "Id") :string.Empty  %>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField ItemStyle-Width="30%" HeaderStyle-CssClass="header-center" HeaderStyle-HorizontalAlign="Center" HeaderText="Subject" DataField="Subject" />
                                                            <asp:TemplateField HeaderText="Max.Marks" HeaderStyle-CssClass="header-center" HeaderStyle-HorizontalAlign="Center">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblMaxMarks" CssClass="lblMaxMarks" runat="server" Text='<%# Container.DataItem.GetType().GetProperty("AddParam") != null ? DataBinder.Eval(Container.DataItem, "AddParam") :string.Empty  %>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Mark" HeaderStyle-CssClass="header-center" ItemStyle-Width="20%" HeaderStyle-HorizontalAlign="Center">
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                <ItemTemplate>
                                                                    <asp:Label ID="txtMarks" Text='<%# Container.DataItem.GetType().GetProperty("Marks") != null ? DataBinder.Eval(Container.DataItem, "Marks") :string.Empty  %>' runat="server" onkeypress="return onlyNos(event,this);" MaxLength="3" CssClass="txtMarks NumbersOnly" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                        </Columns>
                                                    </asp:GridView>
                                                    <div class="form-group  col-sm-12" style="height: 25px; background-color: #F3F3F4;" runat="server" visible="false" id="divTotal">
                                                        <div class="col-sm-8"></div>
                                                        <div class="col-sm-4" style="margin-top: 5px; font-size: 14px">
                                                            <asp:Label ID="lblTotal" runat="server" />
                                                        </div>
                                                    </div>

                                                </asp:Panel>
                                                <asp:Panel ID="panelDisplayView" runat="server" Visible="false">
                                                    <p id="form">
                                                        <b>No Records found.</b>
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

        </ContentTemplate>
    </asp:UpdatePanel>
    <script src="../Resource/js/plugins/datapicker/bootstrap-datepicker.js"></script>
    <script src="../Resource/js/eduCareCommon.js"></script>
    <script type="text/javascript">
        var ResponseForm = '';
        $(function () {

        });
        function Validate() {
            var Exam = $('#<%=ddlExam.ClientID %>').val();
            if (Number(Exam) == 0) {
                AppDisplayMessage('Please select the Exam', 2);
                return false;
            }
            return true;
        }

    </script>
</asp:Content>
