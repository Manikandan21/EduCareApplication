<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ManageAlbum.aspx.cs" Inherits="ILogisticsApplication.Gallery.ManageAlbum" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Resource/js/plugins/upload/uploadify.css" rel="stylesheet" />


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPanel" runat="server">
    <script src="../Resource/js/plugins/upload/jquery.uploadify-3.1.min.js"></script>
    <script src="../Resource/js/eduCareCommon.js"></script>
    <div class="wrapper wrapper-content fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Album <small>Manage Album details</small></h5>
                       <div class="">
                            <a class="btn btn-sm btn-primary m-t-n-xs col-sm-2 pull-right" style="font-family: open sans,Helvetica Neue,Helvetica,Arial,sans-serif;font-size: 13px;" href="ViewAlbum.aspx?MenuID=30">                                
                               <i class="fa fa-bars nav-label" style="color:white;">&nbsp View Album</i>
                            </a>
                        </div>
                    </div>

                    <div id="divFlashCheck" class="ibox-content" style="display: none">
                        <div class="row">
                            <div id="uploadifyNoFlashDiv">
                                <div class="alert alert-danger">
                                    <p style="font-weight: bold; color: Black; font-size: 16px; text-align: center; padding-bottom: 10px;">Flash is not installed or is not enabled</p>

                                    <p style="padding-bottom: 5px">File upload requires Flash to be installed and enabled in Browser.  Click <a href="https://get.adobe.com/flashplayer/" target="_blank">here</a> to download !!!</p>
                                    <br />
                                    <p>You will need to <a href="javascript:window.location.href=window.location.href">refresh</a> the page when installation is completed</p>
                                </div>

                            </div>
                        </div>
                    </div>

                    <div id="divAlbumActionGroup" class="ibox-content" style="display: none">

                        <div class="row" id="divAlbumAction">
                            <div class="col-sm-12" id="divEditable" style="margin-bottom: 5px">
                                <h4 style="text-align: center; color: #EC4758" id="headEditable"></h4>

                                <div class="form-group col-sm-6">
                                    <label>Album Name <span class="text-danger">*</span></label>
                                    <input type="text" id="txtAlbumName" runat="server" placeholder="Enter Album Name" maxlength="100" class="form-control CharactersOnly" />
                                </div>
                                <div class="form-group col-sm-6">
                                    <label>Description <span class="text-danger">*</span></label>
                                    <textarea type="text" id="txtDescription" runat="server" placeholder="Enter Album Description" maxlength="500" class="form-control CharactersOnly" />
                                </div>

                                <div class="form-group col-sm-6">
                                    <label>Target Course <span class="text-danger">*</span></label>
                                    <asp:DropDownList class="form-control ddlCourse" ID="ddlTargetCourse" runat="server">
                                        <asp:ListItem>--Select--</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group  col-sm-6" id="divSection" style="display: none" runat="server">
                                    <label>Section <span class="text-danger">*</span></label>
                                    <asp:DropDownList class="form-control ddlSection" ID="ddlSection" runat="server">
                                        <asp:ListItem>--Select--</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group  col-sm-12">
                                    <div class="col-sm-7"></div>
                                    <div class="col-sm-5">

                                        <button class="btn btn-sm btn-primary m-t-n-xs col-sm-5" id="btnSubmit" type="button" onclick="OnSave()"><strong>Create</strong></button><%----%>
                                        <button class="btn btn-sm btn-danger pull-right m-t-n-xs col-sm-6" onclick="ClearData('1')" type="button"><strong>Clear Data</strong></button>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>



    <div class="modal  wrapper wrapper-content  animated fadeInRight" id="myModal" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="false">
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

                        <div id="uploadifyHasFlashDiv"  style="margin-left:-20px">
                            <asp:FileUpload ID="ImageFileUpload" runat="server" />
                        </div>
                    </div>
                    <div class="col-sm-2" style="margin-bottom: 5px"></div>
                </div>
            </div>
        </div>
    </div>

    <input type="hidden" id="hdnId" runat="server" />
    <input type="hidden" id="hdnMode" runat="server" />
    <input type="hidden" id="hdnStd" runat="server" />
    <input type="hidden" id="hdnSection" runat="server" />



    <script type="text/javascript">
        var UserId = '<%=Convert.ToString(Session["UserId"]) %>';
        var AlbumId = GetParameterValues('AlbumId');
        
        $(function () {
            if (AlbumId != undefined && AlbumId != "")
            {
                $("#btnSubmit").text("Update");
            }
            Uploadify('0');
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


        $(".ddlCourse").change(function () {
            var Course = $(this).find("option:selected").text();
            if (Course == "All") {
                $("#<%=divSection.ClientID %>").hide();
                $('#<%=hdnStd.ClientID %>').val('All');
                $('#<%=hdnSection.ClientID %>').val('');
            } else if (Course != "--Select Course--") {
                var Element = '#<%=ddlSection.ClientID %>';
                BindDropdown('ServerElementGetSection', Course, 0, Element);
                $("#<%=divSection.ClientID %>").show();
                $('#<%=hdnStd.ClientID %>').val(Course);
            }
        });
    $(".ddlSection").change(function () {
        var Section = $(this).find("option:selected").val();
        if (Section != "0") {
            $('#<%=hdnSection.ClientID %>').val($(this).find("option:selected").text());
        }
    });

        function Validate() {

        $('#<%=hdnId.ClientID %>').val('')
        var Course = $('#<%=hdnStd.ClientID %>').val();
        var Section = $('#<%=hdnSection.ClientID %>').val();
        var AlbumName = $('#<%=txtAlbumName.ClientID %>').val();
        var Desctiption = $('#<%=txtDescription.ClientID %>').val();

        if (AlbumName == '' || Desctiption == '' || Course == 0) {
            AppDisplayMessage('Please fill the mandatory fields', 2);
            return false;
        }

        else if ((Course != 0 && Course != "All") && Section == 0) {
            AppDisplayMessage('Please fill the mandatory fields', 2);
            return false;
        }
        else {
            return true;
        }
    }

    function OnSave() {
        try {

            var validate = Validate();

            if (validate == true) {
                var Course = $('#<%=hdnStd.ClientID %>').val();
                var Section = $('#<%=hdnSection.ClientID %>').val();
                var AlbumName = $('#<%=txtAlbumName.ClientID %>').val();
                var Desctiption = $('#<%=txtDescription.ClientID %>').val();
                var target = "1";
                if (Course != "All") {
                    target = "2";
                }
                var Mode = "AlbumCreate";
                var Id = 0;
                if (AlbumId != undefined && AlbumId != "") {
                    Id = AlbumId;
                } 
                var Request = new XMLHttpRequest();
                var url = '../Handlers/ImageHandler.ashx?Id='+Id+'&Mode=' + Mode + '&target=' + target + '&Course=' + Course + '&Section=' + Section + '&Name=' + encodeURIComponent(AlbumName) + '&Desc=' + encodeURIComponent(Desctiption) + '&UserId=' + UserId;
                Request.open("GET", url, false);
                Request.send();
                var Data = Request.responseText;

                if (Data != undefined && Data != '') {
                    var parsedData = JSON.parse(Data);
                    if (parsedData.Status == true) {
                        if (parsedData.Message == "Success") {
                            if (Id == 0) {
                                AppDisplayMessage('Album created successfully', 1);
                            } else {
                                AppDisplayMessage('Album updated successfully', 1);
                            }
                            $("#hAlbumName").text('Album Name: ' + AlbumName);
                            $('#<%=hdnId.ClientID %>').val(parsedData.AlbumId);
                            Uploadify(parsedData.AlbumId);
                            ClearData('');
                            $('#myModal').modal('show');
                        }
                    } else {
                        if (parsedData.Message == "Exist") {
                            AppDisplayMessage('Album already exist', 2);
                        } else {
                            AppDisplayMessage('Error occured please try again later', 2);
                        }
                    }
                }
            }
        } catch (e) {
            AppDisplayMessage('Error: ' + e, 2);
        }
    }
    function ClearData(Mode) {
        $('#<%=txtAlbumName.ClientID %>').val('');
        $('#<%=txtDescription.ClientID %>').val('');
        $('#<%=hdnStd.ClientID %>').val('');
        $('#<%=hdnSection.ClientID %>').val('');
        $('#<%=ddlTargetCourse.ClientID %>').val('0');
        $('#<%=ddlSection.ClientID %>').val('0');
        $('#<%=hdnMode.ClientID %>').val('');
        $("#<%=divSection.ClientID %>").hide();
        if (Mode == '1') {
            $('#<%=hdnId.ClientID %>').val('');
    }

}
    </script>
</asp:Content>
