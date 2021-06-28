<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AppMessageUC.ascx.cs" Inherits="ILogisticsApplication.AppMessage" %>
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
                                                            <asp:BoundField ItemStyle-Width="30%" HeaderStyle-HorizontalAlign="Center" HeaderText="Student Name" DataField="StudentName" />
                                                            <asp:BoundField ItemStyle-Width="20%" HeaderStyle-HorizontalAlign="Center" HeaderText="Course" DataField="Std" />
                                                            <asp:BoundField ItemStyle-Width="20%" HeaderStyle-HorizontalAlign="Center" HeaderText="Section" DataField="Section" />
                                                            
                                                           
                                                        </Columns>
                                                    </asp:GridView>

                                                </asp:Panel>

                                            </div>
                                        </div>
                                    </div>

                                </div>
