<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="RoleMenuMapping.aspx.cs" Inherits="ILogisticsApplication.Configuration.RoleMenuMapping" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPanel" runat="server">
    <div class="wrapper wrapper-content fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Role Menu Mapping <small>Manage the roles vs menu mapping</small></h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div class="row">
                            <div class="col-sm-12" id="divEditable" style="margin-bottom: 5px">
                                <h4 style="text-align: right; color: #EC4758" id="headEditable"></h4>
                                <div class="form-group col-sm-4" style="text-align: right;">
                                    <label>Role <span class="text-danger">*</span></label>
                                </div>
                                <div class="form-group  col-sm-4">
                                    <select class="form-control ddlRole" id="ddlRole" clientidmode="static" runat="server">
                                        <option value="0">-- Select Role --</option>
                                    </select>
                                </div>
                                <div class="form-group  col-sm-4">
                                    <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                                    <asp:Button ID="btnShowRole" OnClick="Role_Change" runat="server" Style="display: none;" />
                                    <asp:HiddenField ID="hdnRoleValue" Value="" runat="server" />
                                    <asp:HiddenField ID="hdnRoleText" Value="" runat="server" />
                                    <%--<input type="button" id="btnAddRole class=" btn btn-sm btn-primary col-sm-4" runat="server" value="Show Details" onclick="addMoreRows()" title="Add Role" />--%>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group  col-sm-4"></div>
                                <div class="form-group  col-sm-4">
                                    <asp:TreeView ID="TreeView1" runat="server" ShowCheckBoxes="All"></asp:TreeView>
                                </div>
                                <div class="form-group  col-sm-4"></div>
                            </div>
                            <div class="row">
                                <div class="form-group  col-sm-4"></div>
                                <div class="form-group  col-sm-4">
                                    <button class="btn btn-sm btn-primary m-t-n-xs col-sm-4" id="btnSubmitUp" runat="server" type="button" style="display:none;" onserverclick="Save_Click">Save</button>
                                </div>                            
                                <div class="form-group  col-sm-4"></div>
                            </div><%--onclick="if (!Validate()) {return false;}"--%>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            BindDropdown('AdminRoles', null, 0, '#ddlRole');

            $("select.ddlRole").change(function () {
                var selectedRole = $("#ddlRole option:selected").val();
                var selectedRoleName = $("#ddlRole option:selected").html();
                $("#<%= hdnRoleValue.ClientID %>").val(selectedRole);
                <%--$("#<%= btnSubmitUp.ClientID %>").css("display", "block");--%>
                $("#<%= hdnRoleText.ClientID %>").val(selectedRoleName);
                $("#<%= btnShowRole.ClientID %>").click();
                return false;
            })

            $("[id*=ContentPanel_TreeView1] input[type=checkbox]").bind("click", function () {
                var table = $(this).closest("table");
                if (table.next().length > 0 && table.next()[0].tagName == "DIV") {
                    var childDiv = table.next();
                    var isChecked = $(this).is(":checked");
                    $("input[type=checkbox]", childDiv).each(function () {
                        if (isChecked) {
                            $(this).attr("checked", "checked");
                        } else {
                            $(this).removeAttr("checked");
                        }
                    });
                } else {
                    var parentDIV = $(this).closest("DIV");
                    if ($("input[type=checkbox]", parentDIV).length == $("input[type=checkbox]:checked", parentDIV).length) {
                        $("input[type=checkbox]", parentDIV.prev()).attr("checked", "checked");
                    } else {
                        $("input[type=checkbox]", parentDIV.prev()).attr("checked", "checked");
                        //$("input[type=checkbox]", parentDIV.prev()).removeAttr("checked");
                    }
                }
            }); 
        });

    </script>
</asp:Content>
