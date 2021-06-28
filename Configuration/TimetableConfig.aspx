<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="TimetableConfig.aspx.cs" Inherits="ILogisticsApplication.Configuration.TimetableConfig" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="../Resource/css/GridPagination.css" rel="stylesheet" />
    <style type="text/css">
        .grdList td, .grdList th {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPanel" runat="server">  <asp:ScriptManager ID="ScriptMngr" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="updatePanel" runat="server">
        <ContentTemplate>

            <div class="wrapper wrapper-content fadeInRight">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>Timetable Config <small>Manage timetable config for coures (Default Hours is 8, Please update if not 8 hours)</small></h5>
                                <div class="ibox-tools">
                                    <a class="collapse-link">
                                        <i class="fa fa-chevron-up"></i>
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
                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="form-group col-sm-3">
                                                <label>Section <span class="text-danger">*</span></label>
                                                <asp:DropDownList ID="ddlSection" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSection_SelectedIndexChanged" CssClass="form-control ddlSection">
                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="form-group  col-sm-3">
                                                <label>Total Hours <span class="text-danger">*</span></label>
                                                <asp:DropDownList ID="ddlHours" runat="server" CssClass="form-control ddlHours">
                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                    <asp:ListItem Value="1">1</asp:ListItem>
                                                    <asp:ListItem Value="2">2</asp:ListItem>
                                                    <asp:ListItem Value="3">3</asp:ListItem>
                                                    <asp:ListItem Value="4">4</asp:ListItem>
                                                    <asp:ListItem Value="5">5</asp:ListItem>
                                                    <asp:ListItem Value="6">6</asp:ListItem>
                                                    <asp:ListItem Value="7">7</asp:ListItem>
                                                    <asp:ListItem Value="8">8</asp:ListItem>
                                                    <asp:ListItem Value="9">9</asp:ListItem>
                                                    <asp:ListItem Value="10">10</asp:ListItem>                                                    
                                                </asp:DropDownList>
                                            </div>
                                            <div class="form-group  col-sm-3" runat="server" id="divAction">
                                                <div style="height: 29px"></div>
                                                <asp:Button ID="btnAssignHours" runat="server" Text="Assign" OnClientClick="if (!Validate()) {return false;}" OnClick="btnAssignHours_Click" CssClass="btn btn-primary m-t-n-xs col-sm-8 btnAssignTeacher" />
                                            </div>
                                        </div>
                                    </div>
                                </asp:Panel>

                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="ibox">

                                            <div class="" style="overflow: auto; width: 100%">
                                                <asp:Panel ID="pnlGrid" runat="server">
                                                    <asp:GridView ID="grdList" runat="server" AutoGenerateColumns="false" PageSize="10" AllowPaging="true" PageIndex="0" RowStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" EmptyDataText="No Records found" CssClass="table table-bordered grdList" OnPageIndexChanging="grdList_PageIndexChanging">
                                                        <PagerSettings FirstPageText="First" LastPageText="Last" Mode="NumericFirstLast" NextPageText="Next" PageButtonCount="4" PreviousPageText="Previous" />
                                                        <PagerStyle CssClass="pagination-ys" />
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="S.No" ItemStyle-Width="10%" HeaderStyle-HorizontalAlign="Center">
                                                                <ItemTemplate>
                                                                    <%# Container.DataItemIndex + 1 %>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField ItemStyle-Width="20%" HeaderStyle-HorizontalAlign="Center" HeaderText="Course" DataField="Std" />
                                                            <asp:BoundField ItemStyle-Width="20%" HeaderStyle-HorizontalAlign="Center" HeaderText="Section" DataField="Section" />
                                                            <asp:BoundField ItemStyle-Width="30%" HeaderStyle-HorizontalAlign="Center" HeaderText="Total Hours" DataField="TotalHours" />
                                                            <asp:TemplateField HeaderText="Edit" ItemStyle-Width="10%" HeaderStyle-HorizontalAlign="Center">
                                                                <ItemTemplate>

                                                                    <%--<asp:Button ID="btnEndit" runat="server" CssClass="fa fa-edit scrollToTop" />--%>
                                                                    <a onclick='OnEdit("<%# Eval("Id")%>")'><i class='fa fa-edit scrollToTop'></i></a>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Delete" ItemStyle-Width="10%" HeaderStyle-HorizontalAlign="Center">
                                                                <ItemTemplate>
                                                                    <a onclick='OnDelete("<%# Eval("Id")%>")' data-target="#myModal" data-toggle="modal"><i class='fa fa-trash'></i></a>
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
            <asp:HiddenField ID="hdnId" runat="server" />
            <asp:HiddenField ID="hdnMode" runat="server" />
            <asp:HiddenField ID="hdnSection" runat="server" />

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
                            <button class="btn btn-danger" id="btnDelete" runat="server" onclick="javascript:if (!Click()) return false;" type="button" onserverclick="btnDelete_ServerClick"><strong>Delete</strong></button>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

 
    <script type="text/javascript">
        function Validate() {
            var Hours = $("#<%=ddlHours.ClientID %>").val();
            var Course = $("#<%=ddlCourse.ClientID %>").val();
            var Section = $("#<%=ddlSection.ClientID %>").val();

            if (Section == '0' || Course == '0' || Hours == '0') {
                AppDisplayMessage("Please select the mandatory fields", 2);
                return false;
            } else {
                return true;
            }
        }

        function OnDelete(Id) {
            $("#<%=hdnId.ClientID %>").val(Id);
            $("#<%=ddlCourse.ClientID %>").val(0);
            $("#<%=ddlSection.ClientID %>").val(0);
            $("#<%=hdnSection.ClientID %>").val('');
            $("#<%=ddlHours.ClientID %>").val(0);
            $("#<%=hdnMode.ClientID %>").val("Delete");
            $('.ddlCourse').attr('disabled', false);
            $('.ddlSection').attr('disabled', false);
            $("#divEditable").css("background-color", "#FFFFFF solid 0.5px");
        }
        function Click() {
            $(".modal-backdrop").hide();
            return true;
        }
        function OnEdit(Id) {
            var Element = '#<%=ddlSection.ClientID %>';
            var Request = new XMLHttpRequest();
            var url = '../Handlers/Timetable.ashx?Mode=GetDataById&Id=' + Id;
            Request.open("GET", url, false);
            Request.send();
            var Data = Request.responseText;

            if (Data != undefined) {
                Data = jQuery.parseJSON(Data);

                $("#<%=ddlCourse.ClientID %>").val(Data[0].Std)
                BindDropdown('ServerElementGetSection', Data[0].Std, 0, Element);
                $('.ddlSection option').map(function () {if ($(this).text() == Data[0].Section) return this;}).attr('selected', 'selected');
                $('.ddlHours option').map(function () { if ($(this).text() == Data[0].TotalHours) return this;}).attr('selected', 'selected');
                $("#<%=hdnId.ClientID %>").val(Data[0].Id);
                $("#<%=hdnSection.ClientID %>").val(Data[0].Section);
                $("#<%=btnAssignHours.ClientID %>").val("Update");
                $("#<%=hdnMode.ClientID %>").val("Update");

                $('.ddlCourse').attr('disabled', true);
                $('.ddlSection').attr('disabled', true);
                $("#divEditable").css("background-color", "#F3F3F4 solid 0.5px");
                $("#headEditable").text("Currently you are editing for " + Data[0].Std + " - " + Data[0].Section);
            }
        }
    </script></asp:Content>
