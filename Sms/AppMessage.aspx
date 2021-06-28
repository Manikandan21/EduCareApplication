<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AppMessage.aspx.cs" Inherits="ILogisticsApplication.Sms.AppMessage" %>
 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPanel" runat="server">
       <asp:ScriptManager ID="ScriptMngr" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="updatepanel" runat="server">
        <ContentTemplate>

              <div class="wrapper wrapper-content fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Student Information <small>Message Send List</small></h5>
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
                                    <label>Message Type</label>
                                    <asp:DropDownList CssClass="form-control" AutoPostBack="true" ID="ddlType" OnSelectedIndexChanged="ddlType_SelectedIndexChanged" runat="server">
                                        <asp:ListItem Value="0">--Select--</asp:ListItem>
                                        <asp:ListItem Value="1">Attendance</asp:ListItem>
                                        <asp:ListItem Value="2">Birthday</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                 <div class="form-group  col-sm-3" runat="server"  id="divAction">
                                         <div style="height:30px"></div>
                                    <button class="btn btn-sm btn-primary m-t-n-xs" id="btnSubmit" runat="server" type="button" onclick="if (!Validate()) {return false;}" onserverclick="btnSubmit_ServerClick"><strong>Send Message</strong></button>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                                    <div class="col-sm-12">
                                        <div class="ibox">

                                            <div class="" style="overflow: auto; width: 100%">
                                                <asp:Panel ID="pnlGrid" runat="server" Visible="false">
                                                    <asp:GridView ID="grdList" runat="server" AutoGenerateColumns="false" RowStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center"
                                                        CssClass="table table-bordered grdList">
                                                     
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="S.No" ItemStyle-Width="10%" HeaderStyle-HorizontalAlign="Center">
                                                                <ItemTemplate>
                                                                    <%# Container.DataItemIndex + 1 %>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField ItemStyle-Width="30%" HeaderStyle-HorizontalAlign="Center" HeaderText="Student Name" DataField="StudentName" />
                                                            <asp:BoundField ItemStyle-Width="20%" HeaderStyle-HorizontalAlign="Center" HeaderText="Course" DataField="Std" />
                                                            <asp:BoundField ItemStyle-Width="20%" HeaderStyle-HorizontalAlign="Center" HeaderText="Section" DataField="Section" /></Columns>
                                                         
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
 <script>
     function Validate() {
         var type = $('#<%=ddlType.ClientID %>').val();
         if (type==0) {
                AppDisplayMessage('Please select the Message type', 2);
                return false;
         }
         return true;
      }
 </script>
</asp:Content>
