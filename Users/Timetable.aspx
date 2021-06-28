<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Timetable.aspx.cs" Inherits="ILogisticsApplication.Users.Timetable" %>

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

                            </div>
                            <div class="ibox-content">



                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="ibox">

                                            <div class="" style="overflow: auto;">
                                                <asp:Panel ID="pnlExamSchedule" Visible="false" runat="server">
                                                    <asp:GridView ID="grdHomework" RowStyle-HorizontalAlign="Center" Width="100%" Height="300px"  DataKeyNames="Day" AutoGenerateColumns="false" runat="server" EmptyDataText="No Records found" CssClass="table table-bordered">
                                                        <EmptyDataTemplate>
                                                        
                                                            <p id="pformType2" >
                                                                No Mapping found.
                                                               
                                                            </p>
                                                        </EmptyDataTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <Columns>
                                                            
                                                            <asp:TemplateField HeaderText="Day" ItemStyle-Width="9%" HeaderStyle-CssClass="header-center" HeaderStyle-HorizontalAlign="Center">
                                                                <HeaderStyle HorizontalAlign="Center" />

                                                                <ItemStyle Font-Bold="true" />
                                                                <ItemTemplate>
                                                                    <%--  <%# Container.DataItemIndex + 1 %>--%>
                                                                    <asp:Label ID="lblDayByName" runat="server" Text='<%#Eval("DayByName")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblDay" runat="server" Text='<%#Eval("Day")%>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="I" HeaderStyle-CssClass="header-center">
                                                                <HeaderStyle Width="9%"  HorizontalAlign="Center" />
                                                                <ItemStyle Width="9%" Wrap="false" />
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblI" runat="server" Text='<%#Eval("I")%>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="II" HeaderStyle-CssClass="header-center">
                                                                <HeaderStyle Width="9%"  HorizontalAlign="Center" />
                                                                <ItemStyle Width="9%" Wrap="false" />
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblII" runat="server" Text='<%#Eval("II")%>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="III" HeaderStyle-CssClass="header-center">
                                                                <HeaderStyle Width="9%"  HorizontalAlign="Center" />
                                                                <ItemStyle Width="9%" Wrap="false" />
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblIII" runat="server" Text='<%#Eval("III")%>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="IV" HeaderStyle-CssClass="header-center">
                                                                <HeaderStyle Width="9%"  HorizontalAlign="Center" />
                                                                <ItemStyle Width="9%" Wrap="false" />
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblIV" runat="server" Text='<%#Eval("IV")%>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="V" HeaderStyle-CssClass="header-center">
                                                                <HeaderStyle Width="9%"  HorizontalAlign="Center" />
                                                                <ItemStyle Width="9%" Wrap="false" />
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblV" runat="server" Text='<%#Eval("V")%>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="VI" HeaderStyle-CssClass="header-center">
                                                                <HeaderStyle Width="9%"  HorizontalAlign="Center" />
                                                                <ItemStyle Width="9%" Wrap="false" />
                                                                <ItemTemplate>
                                                                     <asp:Label ID="lblVI" runat="server" Text='<%#Eval("VI")%>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="VII" HeaderStyle-CssClass="header-center">
                                                                <HeaderStyle Width="9%"  HorizontalAlign="Center" />
                                                                <ItemStyle Width="9%" Wrap="false" />
                                                                <ItemTemplate>
                                                                     <asp:Label ID="lblVII" runat="server" Text='<%#Eval("VII")%>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="VIII" HeaderStyle-CssClass="header-center">
                                                                <HeaderStyle Width="9%"  HorizontalAlign="Center" />
                                                                <ItemStyle Width="9%" Wrap="false" />
                                                                <ItemTemplate>
                                                                     <asp:Label ID="lblVIII" runat="server" Text='<%#Eval("VIII")%>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="IX" HeaderStyle-CssClass="header-center">
                                                                <HeaderStyle Width="9%"  HorizontalAlign="Center" />
                                                                <ItemStyle Width="9%" Wrap="false" />
                                                                <ItemTemplate>
                                                                     <asp:Label ID="lblIX" runat="server" Text='<%#Eval("IX")%>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="X" HeaderStyle-CssClass="header-center">
                                                                <HeaderStyle Width="9%" HorizontalAlign="Center"  />
                                                                <ItemStyle Width="9%" Wrap="false" />
                                                                <ItemTemplate>
                                                                     <asp:Label ID="lblX" runat="server" Text='<%#Eval("X")%>' />
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

            <asp:HiddenField ID="hdnHours" runat="server" />
            <asp:HiddenField ID="hdnID" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>

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
        });

    </script>

</asp:Content>
