<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ViewAlbumImage.aspx.cs" Inherits="ILogisticsApplication.Gallery.ViewAlbumImage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Resource/css/plugins/blueimp/css/blueimp-gallery.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPanel" runat="server">
    <script src="../Resource/js/eduCareCommon.js"></script>
    <script src="../Resource/js/eduCareGallery.js"></script>
    <div class="wrapper wrapper-content">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Album <small>Manage Album details</small></h5>
                        <div class="actionManageAlbum">
                            <a class="btn btn-sm btn-primary m-t-n-xs col-sm-2 pull-right" style="font-family: open sans,Helvetica Neue,Helvetica,Arial,sans-serif; font-size: 13px;" href="ViewAlbum.aspx?MenuID=30">
                                <i class="fa fa-bars" style="color: white;">&nbsp View Album</i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">

                        <h2 id="titleAlbum"></h2>
                        <p>
                        </p>
                        <asp:Panel ID="pnlAlbumData" Visible="false" runat="server">

                            <asp:ListView ID="lvAlbumGrid" runat="server" GroupItemCount="4" DataKeyNames="Id"
                                OnPagePropertiesChanging="lvAlbumName_PagePropertiesChanging">
                                <LayoutTemplate>
                                    <table border="1" style="padding: 20px 20px 20px 20px; border-color: #F3F3F4; border-bottom-color: #F3F3F4; border-left-color: #F3F3F4; border-right-color: #F3F3F4; border-top-color: #F3F3F4" cellpadding="1" cellspacing="1" width="100%">
                                        <tr id="groupPlaceHolder" runat="server">
                                        </tr>
                                    </table>
                                    <table id="Table1" runat="server">
                                        <tr id="Tr1" runat="server">
                                            <td id="Td1" runat="server" align="center">
                                                <asp:DataPager ID="Pagination" PagedControlID="lvAlbumGrid" runat="server" PageSize="12">
                                                    <Fields>
                                                        <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="false" ShowPreviousPageButton="true"
                                                            ShowNextPageButton="false" />
                                                        <asp:NumericPagerField ButtonType="Link" />
                                                        <asp:NextPreviousPagerField ButtonType="Link" ShowNextPageButton="true" ShowLastPageButton="false"
                                                            ShowPreviousPageButton="false" />
                                                    </Fields>
                                                </asp:DataPager>
                                            </td>
                                        </tr>
                                    </table>
                                </LayoutTemplate>
                                <GroupTemplate>
                                    <tr>
                                        <td id="itemplaceHolder" runat="server"></td>
                                    </tr>
                                </GroupTemplate>
                                <ItemTemplate>
                                   
                                        <td align="center" style="border-color: #F3F3F4; " id='<%#"tdImage_"+ Eval("Id") %>' class="tdImage">
                                            <div style="position: relative; width: 100%; text-align: center" class="ibox-content">
                                                <div class="<%#"divAlbumAction_"+ Eval("Id") %>" style="float: left; position: relative; display: none">
                                                    <a data-toggle="dropdown" class="dropdown-toggle" href="#" style="cursor: pointer">
                                                        <span class="clear"><span class="block m-t-xs" style="font-size: 1.5em;"><span class="text-muted text-xs block">
                                                            <i class="fa fa-edit"></i>
                                                        </span></span></a>

                                                    <ul class="dropdown-menu animated fadeInRight m-t-xs">
                                                        <li><a onclick='OnDelete("<%# Eval("Id")%>")' data-target="#myModal" data-toggle="modal"><i class="fa fa-trash-o"></i>&nbsp Delete</a></li>
                                                        <li><a onclick='GetInfo(0,"<%# Eval("Id")%>", "Gallery")' data-target="#divAlbumInfo" data-toggle="modal"><i class="fa fa-info"></i>&nbsp Info</a></li>
                                                        <li><a onclick='OnDownloadImage("<%# Eval("Id")%>")' style="margin: 0px 0px 0px 0px"><i class="fa fa-download"></i>&nbsp Download</a></li>
                                                    </ul>
                                                </div>
                                                <div align="center" style="padding-top: 20px;" class="lightBoxGallery">
                                                    <a href='<%# "../Handlers/ImageHandler.ashx?Mode=ViewImageByIdThumb&Id="+Eval("Id") %>' data-gallery="">
                                                        <asp:Image runat="server" ID="imPhoto" ToolTip="Click here to view Image" ImageUrl='<%# "../Handlers/ImageHandler.ashx?Mode=GetImageByIdThumb&Id="+Eval("Id") %>'
                                                            CssClass="img-responsive" Width="150px" onerror="this.onload = null; this.src='../Resource/img/Album/no_image.png';" />
                                                    </a>
                                                    <%--<h4><asp:Label ID="lblAlbumName" runat="server" Text='<%# Eval("ImageName") %>' style="margin-left:-80px" CssClass="nav-label" ForeColor="#18A689"></asp:Label></h4>--%>
                                                    <asp:HiddenField ID="hfPhotoId" runat="server" Value='<%# Eval("Id") %>' />
                                                    <div id="blueimp-gallery" class="blueimp-gallery" data-toggle="tooltip" data-placement="top" title="Click here to more option">
                                                        <div class="slides"></div>
                                                        <h3 class="title" title=""></h3>
                                                        <a class="prev">‹</a>
                                                        <a class="next">›</a>
                                                        <a class="close">×</a>
                                                        <a class="play-pause"></a>
                                                        <ol class="indicator"></ol>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>

                                  
                                   
                                </ItemTemplate>
                                <InsertItemTemplate></InsertItemTemplate>
                            </asp:ListView>
                        </asp:Panel>
                        <asp:Panel ID="pnlNoRecord" runat="server" Visible="false">
                            <div id="divNoAlbum" class="ibox-content">
                                <div class="row">
                                    <div id="NoAlbum">
                                        <div class="alert alert-danger">
                                            <p style="font-weight: bold; color: Black; font-size: 16px; text-align: center; padding-bottom: 10px;">No Images found for selected Album</p>

                                            <p style="padding-bottom: 5px">Please add photo's using the following link  <a href="ViewAlbum.aspx?MenuID=30">Add photo's</a> </p>
                                            <br />
                                            <p style="padding-bottom: 5px">Note: Use Add photo's option for upload photo's </p>
                                            <br />
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <input id="hdnId" type="hidden" runat="server" />
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
                    <button class="btn btn-danger" id="btnDelete" runat="server" onclick="OnConfirmDelete()" type="button"><strong>Delete</strong></button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal  wrapper wrapper-content  animated fadeInRight" id="modalUpload" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="false">
        <div class="modal-dialog">
            <div class="modal-content animated bounceInDown">
                <div class="modal-header" style="border-bottom: none">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>

                    <div class="col-sm-10" style="margin-bottom: 5px">
                        <div class="alert alert-success">
                            <h4 style="text-align: center; height: 10px" id="hAlbumName">Album Name</h4>
                        </div>
                    </div>

                </div>
                <div class="row" id="divUpload">
                    <div class="col-sm-1" style="margin-bottom: 5px"></div>
                    <div class="col-sm-8" style="margin-bottom: 5px">

                        <div id="uploadifyHasFlashDiv">
                            <asp:FileUpload ID="ImageFileUpload" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-2" style="margin-bottom: 5px"></div>
                </div>
            </div>
        </div>
    </div>

    <div id="divAlbumInfo" class="modal fade" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content  animated bounceInRight">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h3 class="m-t-none m-b" style="text-align: center">Image Information</h3>
                </div>
                <div class="modal-body" style="text-align: center; width: 75%">
                    <div class="row">
                        <div class="form-horizontal" style="word-wrap: break-word;">
                            <dl class="dl-horizontal">
                                <dt class="paddingtop">Name :</dt>
                                <dd class="paddingtop" id="pName"></dd>
                                <dt class="paddingtop">Created By :</dt>
                                <dd class="paddingtop" id="pCreatedBy"></dd>
                                <dt class="paddingtop">Created On :</dt>
                                <dd class="paddingtop" id="pCreatedOn"></dd>
                            </dl>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="../Resource/js/plugins/blueimp/jquery.blueimp-gallery.min.js"></script>
    <script type="text/javascript">
        var AlbumId = GetParameterValues('Album_Id');
        var RoleID = '<%=Convert.ToString(Session["RoleId"]) %>';
        $(function () {
            GetInfo(AlbumId, 0, 'GetAlbumName');
            if (RoleID == '1') {
                $('.actionManageAlbum').hide();
            }
        });

        $(".tdImage").on({
            mouseenter: function () {
                if (RoleID == '1') {
                    var Id = this.id;
                    var Ids = Id.split("_");
                    Id = Ids[1];
                    $(".divAlbumAction_" + Id).show();
                }
            },
            mouseleave: function () {
                if (RoleID == '1') {
                    var Id = this.id;
                    var Ids = Id.split("_");
                    Id = Ids[1];
                    $(".divAlbumAction_" + Id).hide();
                }
            }
        });

        function OnDelete(Id) {
            $("#<%=hdnId.ClientID%>").val(Id);
        }
        function OnConfirmDelete() {
            if (RoleID == '1') {
                OnDeleteImage('Gallery', 0, $("#<%=hdnId.ClientID%>").val());
            }
        }

    </script>
</asp:Content>
