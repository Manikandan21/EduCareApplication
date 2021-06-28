<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Noticeboard.aspx.cs" Inherits="ILogisticsApplication.Announcement.Noticeboard" %>

<asp:Content ID="Content" ContentPlaceHolderID="head" runat="server">
   
</asp:Content>
<asp:Content ID="Panel" ContentPlaceHolderID="ContentPanel" runat="server">
    <div class="wrapper wrapper-content fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Noticeboard <small>Manage noticeboard details</small></h5>
                        <div id="divAction" style="display:none">
                            <a class="btn btn-sm btn-primary m-t-n-xs col-sm-2 pull-right" data-toggle="modal" data-target="#modalNoticeboard" onclick="ClearText('true')" data-placement="top" style="font-family: open sans,Helvetica Neue,Helvetica,Arial,sans-serif; font-size: 13px;">
                                <i class="fa fa-edit" style="color: white;">Create New</i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">


                        <div class="row">
                            <div class="col-sm-12">
                                <div class="ibox">

                                    <div class="">

                                        <table style="text-align: center; width: 100%" id="dataTable" class="table table-bordered">
                                            <thead>
                                                <tr>
                                                    <th style="text-align: center;">#</th>
                                                    <th style="text-align: center;">Subject</th>
                                                    <th style="text-align: center;">Created By</th>
                                                    <th style="text-align: center;">Created On</th>
                                                    <th style="text-align: center;">Edit</th>
                                                    <th style="text-align: center;">Delete</th>
                                                    
                                                </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                        </table>

                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <div class="modal inmodal fade" id="modalNoticeboard" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg" style="width: 75%">
            <div class="modal-content">
                <div class="modal-header" style="height: 25px">


                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h3>Noticeboard</h3>

                </div>
                <div class="mail-box">


                    <div class="mail-body">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Subject :</label>

                                <div class="col-sm-10">
                                    <asp:TextBox ID="txtSubject" class="form-control txtSubject" MaxLength="200" runat="server" />

                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="mail-text h-200" style="border: 1px solid #EDEFF1">

                            <div class="summernote" id="DivMessageBody" runat="server">
                            </div>
                            <div class="clearfix"></div>
                        </div>

                        <div class="modal-footer">
                            <%--<button type="button" class="btn btn-white" data-dismiss="modal">Close</button>
                                            <button type="button" class="btn btn-primary">Save changes</button>--%>
                            <button class="btn btn-sm btn-primary" id="btnSubmitUp" runat="server" type="button" onclick="if (!Validate()) {return false;}" onserverclick="Save_Click">Save</button>
                            <a onclick="ClearText('false')" class="btn btn-danger btn-sm"  title="clear data">Clear Data</a>
                        </div>
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
                    <button class="btn btn-danger" id="btnDelete" runat="server" type="button" onserverclick="Save_Click"><strong>Delete</strong></button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal inmodal" id="viewData" tabindex="-1" role="dialog"  aria-hidden="true">
                                <div class="modal-dialog"  style="width:75%;">
                                    <div class="modal-content animated bounceInDown">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                            <h3 class="modal-title" id="hSubject"></h3>
                                            <%--<small class="font-bold">Lorem Ipsum is simply dummy text of the printing and typesetting industry.</small>--%>
                                        </div>
                                        <div class="modal-body" id="divContent">
                                           
                                        </div>

                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-white" data-dismiss="modal">Close</button>                                          
                                        </div>
                                    </div>
                                </div>
                            </div>
    <input type="hidden" id="hdnId" runat="server" />
    <input type="hidden" id="hdnMode" runat="server" />
    <input type="hidden" id="hdnSubject" runat="server" />
    <input type="hidden" id="hdnContent" runat="server" />
    <script type="text/javascript">
        var RoleId = '';
        $(document).ready(function () {
            RoleId = '<%=Convert.ToString(Session["RoleId"]) %>';
            BindData('SelectAll', 0);
            $('.summernote').summernote();
           
            if (RoleId != 1) {
                $("#dataTable tr").each(function () {
                    $("#divAction").hide();
                    $('th:nth-child(5)').hide();
                    $('td:nth-child(5)').hide();
                    $('th:nth-child(6)').hide();
                    $('td:nth-child(6)').hide();
                });
            } else {
                $('th:nth-child(4)').hide();
                $('td:nth-child(4)').hide();
                $("#divAction").show();
            }
        });
        function Validate() {
            
            var message = $('.note-editable').html();
            var Subject = $("#<%=hdnSubject.ClientID %>").val($('.txtSubject').val());
            $("#<%=hdnContent.ClientID %>").val(message);

            if ($('.txtSubject').val() == "") {

                AppDisplayMessage("Subject can not be blank", 2);
                return false;
            } else if (message.length <= 40) {

                AppDisplayMessage("Content can not be blank (Min 50 characters)", 2);
                return false;
            }
            else {
                return true;
            }
        }
        function BindData(type, value) {
            try {
                var JsonData = [];
                var Mode = 'Noticeboard';
                var GetDataMode = type;
                var Id = value;
                //Get Json Data from Server

                var Request = new XMLHttpRequest();
                var url = '../Handlers/Announcement.ashx?Mode=' + Mode + '&GetDataMode=' + GetDataMode + '&Id=' + Id;
                Request.open("GET", url, false);
                Request.send();
                var Data = Request.responseText;

                if (Data != []) {
                    Data = jQuery.parseJSON(Data);
                    $.each(Data, function (index, PARAM) {
                        if (RoleId == 1) {
                            JsonData.push([
                           index + 1,
                           "<a onclick='OnEdit(" + PARAM.Id + ",1)' data-placement=top data-target=#viewData data-toggle=modal>" + PARAM.Subject + "</a>",
                          PARAM.CreatedByName, PARAM.CreatedOnFormat,
                           "<a onclick='OnEdit(" + PARAM.Id + ",2)' data-placement=top data-target=#modalNoticeboard data-toggle=modal><i class='fa fa-edit scrollToTop'></i></a>",
                           "<a onclick='OnDelete(" + PARAM.Id + ")' data-target=#myModal data-toggle=modal><i class='fa fa-trash'></i></a>",
                            ]);
                        } else {
                            JsonData.push([
                           index + 1,
                           "<a  onclick='OnEdit(" + PARAM.Id + ",1)'  data-placement=top data-target=#viewData data-toggle=modal>" + PARAM.Subject + "</a>",
                          PARAM.CreatedByName, PARAM.CreatedOnFormat,
                           "<a data-placement=top data-target=#modalNoticeboard data-toggle=modal><i class='fa fa-edit scrollToTop'></i></a>",
                           "<a data-target=#myModal data-toggle=modal><i class='fa fa-trash'></i></a>",
                            ]);
                        }
                        
                    })

                    $('#dataTable').dataTable({
                        "bSearchable": true,
                        "bSortable": false,
                        "bFilter": true,
                        "bInfo": true,
                        "bLengthChange": false,
                        "bDestroy": true,
                        "bRetrieve": true,
                        "bVisible": false,
                        "sPaginationType": "full_numbers",
                        "sPaging": "pagination",
                        "bProcessing": true,
                        "bPaginate": true,
                        "iDisplayLength": 10,
                        "oLanguage": {
                            "sEmptyTable": "No records found"
                        },
                        "aaData": JsonData,

                    });
                }
                else {

                }
            }
            catch (e) {
                alert(e.message);
            }
        }
        function OnDelete(Id) {
            $('#<%=hdnId.ClientID %>').val(Id);
            $('#<%=hdnMode.ClientID %>').val('Delete');
        }
        function OnEdit(id,type) {
           
            try {
                var JsonData = [];
                var Mode = 'Noticeboard';
                var GetDataMode = 'SelectID';
                var Id = id;
                //Get Json Data from Server

                var Request = new XMLHttpRequest();
                var url = '../Handlers/Announcement.ashx?Mode=' + Mode + '&GetDataMode=' + GetDataMode + '&Id=' + Id;
                Request.open("GET", url, false);
                Request.send();
                var Data = Request.responseText;

                if (Data != undefined) {
                    Data = jQuery.parseJSON(Data);
                    $.each(Data, function (index, PARAM) {
                        if (type == 1) {
                            $('#hSubject').text(PARAM.Subject);
                            $('#divContent').append(PARAM.Content)
                        } else if (type == 2) {
                            $('#<%=txtSubject.ClientID %>').val(PARAM.Subject);
                            $('.note-editable').html(PARAM.Content);
                            $('#<%=hdnId.ClientID %>').val(PARAM.Id);
                            $('#<%=hdnMode.ClientID %>').val('Update');
                            $('#<%=btnSubmitUp.ClientID %>').text('Update');
                        }
                    });
                }
            }

            catch (e) {
                alert(e.message);
            }
            
        }
        function ClearText(type) {
            $('#<%=txtSubject.ClientID %>').val('');
            $('.note-editable').html("");
            if (true) {
                $('#<%=hdnMode.ClientID %>').val('');
                $('#<%=hdnSubject.ClientID %>').val('');
                $('#<%=hdnContent.ClientID %>').val('');
            }
        }
    </script>



</asp:Content>

