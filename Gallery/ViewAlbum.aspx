<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ViewAlbum.aspx.cs" Inherits="ILogisticsApplication.Gallery.ViewAlbum" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Resource/css/plugins/blueimp/css/blueimp-gallery.min.css" rel="stylesheet" />
    <link href="../Resource/js/plugins/upload/uploadify.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPanel" runat="server">
    <script src="../Resource/js/plugins/upload/jquery.uploadify-3.1.min.js"></script>
    <script src="../Resource/js/eduCareGallery.js"></script>
    <div class="wrapper wrapper-content">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>View Album <small>view Album details</small></h5>
                       <div class="actionManageAlbum">
                            <a class="btn btn-sm btn-primary m-t-n-xs col-sm-2 pull-right" style="font-family: open sans,Helvetica Neue,Helvetica,Arial,sans-serif;font-size: 13px;" href="ManageAlbum.aspx?MenuID=27">                                
                               <i class="fa fa-bars" style="color:white;">&nbsp Manage Album</i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">

                        <asp:ListView ID="lvAlbumGrid" runat="server" GroupItemCount="4" DataKeyNames="AlbumId"
                            InsertItemPosition="FirstItem" OnPagePropertiesChanging="lvAlbumName_PagePropertiesChanging">
                            <LayoutTemplate>
                                <table border="1" style="padding: 20px 20px 20px 20px; border-color: #F3F3F4; border-bottom-color: #F3F3F4; border-left-color: #F3F3F4; border-right-color: #F3F3F4; border-top-color: #F3F3F4" cellpadding="1" cellspacing="1"
                                    width="100%">
                                    <tr id="groupPlaceHolder" runat="server">
                                    </tr>
                                </table>
                                <table id="Table1" runat="server">
                                    <tr id="Tr1" runat="server">
                                        <td id="Td1" runat="server" align="center">
                                            <asp:DataPager ID="Pagination" PagedControlID="lvAlbumGrid" runat="server" PageSize="11">
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
                                <div>
                                    <td align="center" style="border-color: #F3F3F4" id="<%#"tdImage_"+ Eval("AlbumId") %>" class="tdImage">
                                        <div  style="position: relative;width:100%;text-align:center" class="ibox-content">
                                            <div class="<%#"divAlbumAction_"+ Eval("AlbumId") %>" style="float: left; position: relative; display: none">
                                                <a data-toggle="dropdown" class="dropdown-toggle" href="#" style="cursor: pointer">
                                                    <span class="clear"><span class="block m-t-xs" style="font-size: 1.5em;"><span class="text-muted text-xs block">
                                                        <i class="fa fa-edit"></i>
                                                    </span></span></a>

                                                <ul class="dropdown-menu animated fadeInRight m-t-xs">
                                                    <li><a onclick='AddPhotos("<%# Eval("AlbumId")%>")' ><i class="fa fa-plus"></i> Add Photo's</a></li>
                                                    <li><a href="<%#"ManageAlbum.aspx?MenuID=27&AlbumId="+ Eval("AlbumId") %>"><i class="fa fa-edit"></i> Edit</a></li>
                                                    <li><a onclick='OnDelete("<%# Eval("AlbumId")%>")' data-target="#myModal" data-toggle="modal"><i class="fa fa-trash-o"></i> Delete</a></li>
                                                    <li><a onclick='GetInfo("<%# Eval("AlbumId")%>",0, "Album")'  style="margin:0px 0px 0px 8px" data-target="#divAlbumInfo" data-toggle="modal"><i class="fa fa-info"></i> Info</a></li>
                                                </ul>
                                            </div>
                                            <div align="center" style="padding-top: 10px">
                                                <a href='<%# "ViewAlbumImage.aspx?MenuId=78&Album_Id="+Eval("AlbumId") %>' style="padding-top: 5px;" title='<%# Eval("Description") %>'>
                                                    <asp:Image runat="server" ID="imPhoto" ImageUrl='<%# "../Handlers/ImageHandler.ashx?Mode=AlbumThumb&Id="+Eval("AlbumId") %>'
                                                        CssClass="img-responsive" Width="150px" onerror="this.onload = null; this.src='../Resource/img/Album/no_image.png';" />
                                                </a>
                                                <h4>
                                                    <asp:Label ID="lblAlbumName" runat="server" Text='<%# Eval("AlbumName") %>' CssClass="nav-label" ForeColor="#18A689"></asp:Label></h4>
                                                <asp:HiddenField ID="hfPhotoId" runat="server" Value='<%# Eval("AlbumId") %>' />
                                            </div>
                                        </div>
                                    </td>
                                </div>
                                </div>
                            </ItemTemplate>
                            <InsertItemTemplate>
                                <div class="filter-content createNewAlbum">
                                    <td align="center" style="border-color: #F3F3F4">
                                        <div>
                                            <a href='ManageAlbum.aspx?MenuID=27'>
                                                <asp:Image runat="server" ID="imPhoto" ImageUrl="../Resource/img/Album/newalbum.png"
                                                    Width="175px" CssClass="img-responsive" />
                                            </a>
                                            <h4>
                                                <asp:Label ID="lblAlbumNames" runat="server" CssClass="label"></asp:Label></h4>
                                        </div>
                                    </td>
                                </div>
                            </InsertItemTemplate>
                        </asp:ListView>
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
                            <h4 style="text-align: center; height: 10px" id="titleAlbum"></h4>
                        </div>
                    </div>

                </div>
                <div class="row" id="divUpload">
                    <div class="col-sm-1" style="margin-bottom: 5px"></div>
                    <div class="col-sm-8" style="margin-bottom: 5px">

                        <div id="uploadifyHasFlashDiv"  style="margin-left:-20px">
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
                    <h3 class="m-t-none m-b" style="text-align: center">Album Information</h3>
                </div>
                <div class="modal-body"  style="text-align:center;width:75%">
                    <div class="row">
                        <div class="form-horizontal" style="word-wrap: break-word;">
                            <dl class="dl-horizontal">
                                <dt class="paddingtop">Name :</dt>
                                <dd class="paddingtop" id="pName"></dd>
                                <dt class="paddingtop">Description :</dt>
                                <dd class="paddingtop" id="pDescription"></dd>
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
    <input id="hdnId" type="hidden" runat="server" />
    <script type="text/javascript">
        var UserId = '<%=Convert.ToString(Session["UserId"]) %>';
        var RoleID = '<%=Convert.ToString(Session["RoleId"]) %>';
        $(function () {
            if (RoleID == '1') {
                Uploadify('0');
            } else {
                $('.actionManageAlbum').hide();
                $(".createNewAlbum").hide();
                
               // $(".tdImage").hide();
            }
            
        });
        function Uploadify(Id) {
            $("#<%=ImageFileUpload.ClientID %>").uploadify({
                'swf': '../Resource/js/plugins/upload/uploadify.swf',
                'uploader': '../handlers/ImageHandler.ashx?Mode=Upload&Id=' + Id + '&UserId=' + UserId,
                'cancelImg': 'cancel.png',
                'buttonText': 'Browse Image(s)',
                'fileDesc': 'Image Files',
                'fileExt': '*.jpg;*.jpeg;*.png',
                'height': 35,
                'width': 250,
                'multi': true,
                'auto': true,
                onInit: function (instance) {
                    $("#divFlashCheck").hide();
                    $("#divAlbumActionGroup").show();
                },
                'onFallback': function () {
                    $("#divFlashCheck").show();
                    $("#divAlbumActionGroup").hide();
                }
            });
        }
        function confirmDelete() {
            if (confirm('Are you sure, you want to delete this Album?')) {
                return true;
            }
            else {
                return false;
            }
        }
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
        function OnConfirmDelete(){
            OnDeleteImage('Album', $("#<%=hdnId.ClientID%>").val(), 0);
        }
        function AddPhotos(Id) {
            GetInfo(Id, 0, 'GetAlbumName');
            Uploadify(Id);
            $("#<%=hdnId.ClientID%>").val(Id);
            $('#modalUpload').modal('show');
        }
    </script>
</asp:Content>
