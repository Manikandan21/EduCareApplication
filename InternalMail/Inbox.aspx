<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" ValidateRequest="false" CodeBehind="Inbox.aspx.cs" Inherits="ILogisticsApplication.InternalMail.Inbox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPanel" runat="server">
    <div class="wrapper wrapper-content">
        <div class="row">
            <div class="col-lg-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-content mailbox-content">
                        <div class="file-manager">
                            <a class="btn btn-block btn-primary compose-mail" href="../InternalMail/Compose.aspx?MenuID=40">Compose Mail</a>
                            <div class="space-25"></div>
                            <h5>Folders</h5>
                            <ul class="folder-list m-b-md" style="padding: 0">
                                <li><a onclick="GetOperation('Ibx')"><i class="fa fa-inbox "></i>Inbox <span class="label label-warning pull-right" id="spnInboxCount"></span> </a></li>
                                <li><a onclick="GetOperation('Snt')"><i class="fa fa-envelope-o"></i>Send Mail</a></li>
                                <%--<li><a href="javascript:void(0)" onclick="OnShow('important')"><i class="fa fa-certificate"></i>Important</a></li>
                                <li><a href="javascript:void(0)" onclick="OnShow('Draft')"><i class="fa fa-file-text-o"></i>Drafts <span class="label label-danger pull-right" id="spnDraftCount">2</span></a></li>--%>
                                <li><a onclick="GetOperation('Tsh')"><i class="fa fa-trash-o"></i>Trash</a></li>
                            </ul>
                            <h5>Categories</h5>
                            <ul class="category-list" style="padding: 0">
                                <li><a href="#"><i class="fa fa-circle text-primary"></i>P- Parent </a></li>
                                <li><a href="#"><i class="fa fa-circle text-primary"></i>S- Student</a></li>
                                <li><a href="#"><i class="fa fa-circle text-danger"></i>SA- Super Admin</a></li>
                                <li><a href="#"><i class="fa fa-circle text-danger"></i>CA- Class Teacher</a></li>
                                <%--<li><a href="#"><i class="fa fa-circle text-warning"></i>Clients</a></li>--%>
                            </ul>

                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-9 animated fadeInRight" id="divMailContent">
                <div id="DivInbox">
                    <div class="mail-box-header">


                        <div class="input-group col-lg-6 pull-right" style="display:none">
                            <input type="text" class="form-control input-sm" name="search" placeholder="Search email" />
                            <div class="input-group-btn">
                                <button type="button" onclick="if (!OnSearch()) {return false;}" class="btn btn-sm btn-primary">
                                    Search
                                </button>
                            </div>
                        </div>

                        <h2 id="hTitleMsg">Inbox
                        </h2>
                        <div class="mail-tools m-t-md" id="divOperation">
                            <%--<div class="btn-group pull-right">
                                <button class="btn btn-white btn-sm" onclick="if (!OnPrevious('Previous')) {return false;}"><i class="fa fa-arrow-left"></i></button>
                                <button class="btn btn-white btn-sm" onclick="if (!OnNext('Next')) {return false;}"><i class="fa fa-arrow-right"></i></button>

                            </div>--%>
                            <%--  <i class="fa fa-refresh"></i>--%>

                            <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="left" onclick="if (!GetOperation('Ibx')) {return false;}" id="btnRefresh" title="Refresh inbox" data-original-title="Move to draft folder"><i class="fa fa-refresh"></i>&nbsp&nbsp Refresh</button>
                            <%--  <button class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="Mark as read"><i class="fa fa-eye"></i></button>--%>
                            <button class="btn btn-primary btn-sm" data-toggle="tooltip" data-placement="top" onclick="if (!OnOperation('Restore')) {return false;}" id="btnRestore" title="Move to Restore"><i class="fa fa-exclamation"></i>&nbsp&nbsp Restore</button>
                            <button class="btn btn-danger btn-sm" data-toggle="tooltip" data-placement="top" onclick="if (!OnOperation('Trash')) {return false;}" id="btnTrash" title="Move to trash"><i class="fa fa-trash-o"></i>&nbsp&nbsp Trash</button>

                        </div>
                    </div>
                    <div class="mail-box" id="divMailBox">
                        <table class="table table-hover table-mail" id="tblMailBox">
                           
                            <tbody id="tblBody">
                                
                            </tbody>
                        </table>
                    </div>

                    <div class="mail-box" id="divEmptybox" style="padding-top: 50px;display:none">
                        <p style="padding-left: 25px;">No Message found <span><a href="Compose.aspx?MenuId=40">Click here to Compose new Message</a></span></p>
                    </div>
                </div>

                <div id="DivDetails" style="display: none">
                    <div class="mail-box-header">
                        <div class="pull-right tooltip-demo">
                            <a class="btn btn-white btn-sm btnPnlReply" data-toggle="modal" data-target="#myModal5" data-placement="top" title="Reply" onclick="if (!OnReply('')) {return false;}"><i class="fa fa-reply"></i>Reply</a>
                            <%--<a href="#" class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="Print email"><i class="fa fa-print"></i></a>--%>
                            <button title="" data-placement="top" id="BtnTrash1" data-toggle="tooltip" data-original-title="Trash" onclick="if (!OnOperation('Trash')) {return false;}" class="btn btn-sm btn-white btnPnlTrash"><i class="fa fa-trash-o"></i>Remove</button>
                        </div>
                        <h2>View Message
                        </h2>
                        <div class="mail-tools tooltip-demo m-t-md">


                            <h3>
                                <span class="font-noraml">Subject: </span>
                                <span id="spnSubject"></span>

                            </h3>
                            <h5>
                                <span class="pull-right font-noraml" id="spnUpdatedOn"></span>
                                <span class="font-noraml" id="lblFrom">From: </span>
                                <span id="spnFrom"></span>

                            </h5>
                        </div>
                    </div>
                    <div class="mail-box">


                        <div class="mail-body" style="height:450px;overflow-y:scroll;width:100%;overflow-x:scroll" id="DivMailBody">
                        </div>
                        <%--<div class="mail-attachment">
                            <p>
                                <span><i class="fa fa-paperclip"></i>2 attachments - </span>
                                <a href="#">Download all</a>
                                |
                            <a href="#">View all images</a>
                            </p>

                            <div class="attachment">
                                <div class="file-box">
                                    <div class="file">
                                        <a href="#">
                                            <span class="corner"></span>

                                            <div class="icon">
                                                <i class="fa fa-file"></i>
                                            </div>
                                            <div class="file-name">
                                                Document_2014.doc
                                            <br />
                                                <small>Added: Jan 11, 2014</small>
                                            </div>
                                        </a>
                                    </div>

                                </div>
                                <div class="file-box">
                                    <div class="file">
                                        <a href="#">
                                            <span class="corner"></span>

                                            <div class="image">
                                                <img alt="image" class="img-responsive" src="img/p1.jpg">
                                            </div>
                                            <div class="file-name">
                                                Italy street.jpg
                                            <br />
                                                <small>Added: Jan 6, 2014</small>
                                            </div>
                                        </a>

                                    </div>
                                </div>
                                <div class="file-box">
                                    <div class="file">
                                        <a href="#">
                                            <span class="corner"></span>

                                            <div class="image">
                                                <img alt="image" class="img-responsive" src="img/p2.jpg">
                                            </div>
                                            <div class="file-name">
                                                My feel.png
                                            <br />
                                                <small>Added: Jan 7, 2014</small>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>--%>
                        <div class="mail-body text-right tooltip-demo">
                            <a class="btn btn-sm btn-white btnPnlReply" id="btnPnlReply" data-toggle="modal" data-target="#myModal5" onclick="if (!OnReply('')) {return false;}"><i class="fa fa-reply"></i>Reply</a>
                            <%--  <a class="btn btn-sm btn-white" href="mail_compose.html"><i class="fa fa-arrow-right"></i>Forward</a>
                            <button title="" data-placement="top" data-toggle="tooltip" type="button" data-original-title="Print" class="btn btn-sm btn-white"><i class="fa fa-print"></i>Print</button>--%>
                            <button title="" data-placement="top" id="btnPnlTrash" data-toggle="tooltip" data-original-title="Trash" onclick="if (!OnOperation('Trash')) {return false;}" class="btn btn-sm btn-white btnPnlTrash"><i class="fa fa-trash-o"></i>Remove</button>
                        </div>
                        <div class="clearfix"></div>


                    </div>
                </div>
            </div>




        </div>
    </div>


    <div class="modal inmodal fade" id="myModal5" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg"  style="width:75%">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title" id="headReply"></h4>
                  
                </div>
            <div class="mail-box">


                    <div class="mail-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Subject:</label>

                            <div class="col-sm-10">
                                <input type="text" class="form-control txtSubject" id="txtSubject" runat="server"/>
                            </div>
                        </div>
                    </div>
                 <div class="clearfix"></div>
                <div class="mail-text h-200" style="border:1px solid #EDEFF1">

                    <div class="summernote" id="DivMessageBody" runat="server">
                    </div>
                    <div class="clearfix"></div>
                </div>

                <div class="modal-footer">
                    <%--<button type="button" class="btn btn-white" data-dismiss="modal">Close</button>
                                            <button type="button" class="btn btn-primary">Save changes</button>--%>
                    <button class="btn btn-sm btn-primary" id="btnSubmitUp" runat="server" type="button" onclick="if (!Validate()) {return false;}" onserverclick="Save_Click"><i class="fa fa-reply"></i>Send</button>
                    <a onclick="OnDiscard()"  data-dismiss="modal" class="btn btn-danger btn-sm" data-toggle="tooltip" data-placement="top" title="Discard email"><i class="fa fa-times"></i>Discard</a>
                </div>
            </div></div></div>
        </div>
    </div>
    <input id="hdnMode" type="hidden" />
    <input id="hdnIds" type="hidden" />

    <input type="hidden" id="HdnReceiverRole" runat="server"/>
    <input type="hidden" id="HdnReceiverId" runat="server"/>
    <input type="hidden" id="hdnMessageBody" runat="server"/>
    <input type="hidden" id="hdnSubject" runat="server"/>
   
    <script type="text/javascript">
        var ArrayData = [];
        $("#hdnIds").val('');
        var IsAdminRole = '<%=Convert.ToString(Session["IsAdminRole"]) %>';
        $(document).ready(function () {
            $('#divTitle').hide();
            GetOperation("");
            $("#tblMailBox tbody").on('click', 'tr td:not(:first-child)', function () {
                var ID = $('td:first input:checkbox', $(this).parents('tr')).attr('id');
                fnOnShowMessage(ID);
            });
            checkboxclick();
            $('.summernote').summernote();
        });

        function checkboxclick() {
            $('.i-checks').click(function () {
                if ($(this).is(':checked')) {
                    ArrayData.push($(this).attr("id"));
                    //alert(ArrayData);
                } else {
                    if (ArrayData.length > 0) {
                        var i = ArrayData.indexOf($(this).attr("id"));
                        if (i != -1) {
                            ArrayData.splice(i, 1);
                        }
                        //alert(ArrayData);
                    }
                }
            });
        }
       
        var onDisplayMessage = function () {
            var Mode = $("#hdnMode").val();
            if (Mode == 'Ibx') {
                Mode = 'MsgByInbox';
                $(".btnPnlReply").show();
                $(".btnPnlTrash").show();
            } else if (Mode == 'Snt') {
                Mode = 'MsgBySent';
                $(".btnPnlReply").hide();
                $(".btnPnlTrash").show();
            } else {
                Mode = 'MsgByTrash';
                $("#lblFrom").hide();
                $(".btnPnlReply").hide();
                $(".btnPnlTrash").hide();
            }
            BindMessageInPanel(Id, Mode)
            $('#DivDetails').show();
            $('#DivInbox').hide();
            checkboxclick();
        }
        var fnOnShowMessage = function (Id) {
            var Mode = $("#hdnMode").val();
            if (Mode == 'Ibx') {
                Mode = 'MsgByInbox';
                $(".btnPnlReply").show();
                $(".btnPnlTrash").show();
            } else if (Mode == 'Snt') {
                Mode = 'MsgBySent';
                $(".btnPnlReply").hide();
                $(".btnPnlTrash").show();
            } else {
                Mode = 'MsgByTrash';
                $("#lblFrom").hide();
                $(".btnPnlReply").hide();
                $(".btnPnlTrash").hide();
            }
            BindMessageInPanel(Id, Mode)
            $('#DivDetails').show();
            $('#DivInbox').hide();
            checkboxclick();
        }
        function OnShow(Id) {
          
            return;
        }
        function GetOperation(Type) {
            GetCount('GetCount');
            ArrayData = [];
            $("#hdnIds").val('');
            if (Type == '') {
                Type = GetParameterValues('Mode');
                if (Type == '') {
                    Type == 'Ibx';
                }
            }
            
            if (Type == 'Ibx') {
                $("#btnTrash").show();
                $("#btnRefresh").show();
                $("#btnRestore").hide();
                $("#hTitleMsg").text('Inbox');
                BindMessage('InboxByUser');
            } else if (Type == 'Snt') {
                $("#btnTrash").show();
                $("#hTitleMsg").text('Sentbox');
                $("#btnRefresh").hide();
                $("#btnRestore").hide();
                BindMessage('SentByUser');

            } else if (Type == 'Imp') {

            } else if (Type == 'Tsh') {
                $("#hTitleMsg").text('Trash');
                $("#btnRefresh").hide();
                $("#btnTrash").hide();
                $("#btnRestore").show();
                BindMessage('TrashByUser');
            } else {
                $("#divMailContent").hide();
            }
            $("#hdnMode").val(Type);
            $('#DivDetails').hide();
            $('#DivInbox').show();

            $("#hdnMode").val(Type);

            return false;
        }
        function BindMessage(Mode) {
            ArrayData = [];
            $("#hdnIds").val('');
            $('#tblBody').empty();
            var Id = '<%=Convert.ToString(Session["UserId"]) %>';
            var Role = '<%=Convert.ToString(Session["RoleId"]) %>';
            try {
                var Request = new XMLHttpRequest();
                var url = '../Handlers/Communication.ashx?Mode=' + Mode + '&Id=' + Id + '&Role=' + Role + '&Type=Grid';
                Request.open("GET", url, false);
                Request.send();
                var Data = Request.responseText;

                if (Data != undefined) {

                    Data = jQuery.parseJSON(Data);
                    if (Data != '') {
                        $.each(Data, function (index, PARAM) {
                            if (Mode == 'InboxByUser') {
                                var senderRole = fnGetSenderRole(PARAM.SenderRole);
                                if (PARAM.IsRead == true) {
                                    if (PARAM.SenderRole == 6 || PARAM.SenderRole == 7) {
                                        Tr = "<tr style=cursor:pointer class=read><td class=check-mail><input id=" + PARAM.Id + " type=checkbox  class=i-checks></td><td class=mail-ontact><a>" + PARAM.SenderName + "</a><span  class='label label-primary pull-right'>" + senderRole + "</span></td><td class=mail-subject><a>" + PARAM.Subject + "</a></td>  <td class=></td><td class=text-right mail-date>" + PARAM.TimeFormat + "</td></a></tr>";
                                    } else {
                                        Tr = "<tr style=cursor:pointer class=read><td class=check-mail><input id=" + PARAM.Id + " type=checkbox  class=i-checks></td><a><td class=mail-ontact><a>" + PARAM.SenderName + "</a><span class='label label-danger pull-right'>" + senderRole + "</span></td><td class=mail-subject><a>" + PARAM.Subject + "</a></td>  <td class=></td><td class=text-right mail-date>" + PARAM.TimeFormat + "</td></a></tr>";
                                    }
                                } else {
                                    if (PARAM.SenderRole == 6 || PARAM.SenderRole == 7) {
                                        Tr = "<tr style=cursor:pointer class=unread><td class=check-mail><input id=" + PARAM.Id + " type=checkbox  class=i-checks></td><a><td class=mail-ontact><a>" + PARAM.SenderName + "</a><span class='label label-primary pull-right'>" + senderRole + "</span></td><td class=mail-subject><a>" + PARAM.Subject + "</a></td>  <td class=></td><td class=text-right mail-date>" + PARAM.TimeFormat + "</td></a></tr>";
                                    } else {
                                        Tr = "<tr style=cursor:pointer class=unread><td class=check-mail><input id=" + PARAM.Id + " type=checkbox class=i-checks></td><a><td class=mail-ontact><a>" + PARAM.SenderName + "</a><span class='label label-danger pull-right'>" + senderRole + "</span></td><td class=mail-subject><a>" + PARAM.Subject + "</a></td>  <td class=></td><td class=text-right mail-date>" + PARAM.TimeFormat + "</td></a></tr>";
                                    }

                                }
                            } else if (Mode == 'SentByUser') {
                                var senderRole = fnGetSenderRole(PARAM.ReceiverRole);
                                if (PARAM.IsRead == true) {
                                    if (PARAM.SenderRole == 6 || PARAM.SenderRole == 7) {
                                        Tr = "<tr style=cursor:pointer class=read><td class=check-mail><input id=" + PARAM.Id + " type=checkbox  class=i-checks></td><td class=mail-ontact><a>" + PARAM.SenderName + "</a><span  class='label label-primary pull-right'>" + senderRole + "</span></td><td class=mail-subject><a>" + PARAM.Subject + "</a></td>  <td class=></td><td class=text-right mail-date>" + PARAM.TimeFormat + "</td></a></tr>";
                                    } else {
                                        Tr = "<tr style=cursor:pointer class=read><td class=check-mail><input id=" + PARAM.Id + " type=checkbox  class=i-checks></td><a><td class=mail-ontact><a>" + PARAM.SenderName + "</a><span class='label label-danger pull-right'>" + senderRole + "</span></td><td class=mail-subject><a>" + PARAM.Subject + "</a></td>  <td class=></td><td class=text-right mail-date>" + PARAM.TimeFormat + "</td></a></tr>";
                                    }
                                } else {
                                    if (PARAM.SenderRole == 6 || PARAM.SenderRole == 7) {
                                        Tr = "<tr style=cursor:pointer class=unread><td class=check-mail><input id=" + PARAM.Id + " type=checkbox  class=i-checks></td><a><td class=mail-ontact><a>" + PARAM.SenderName + "</a><span class='label label-primary pull-right'>" + senderRole + "</span></td><td class=mail-subject><a>" + PARAM.Subject + "</a></td>  <td class=></td><td class=text-right mail-date>" + PARAM.TimeFormat + "</td></a></tr>";
                                    } else {
                                        Tr = "<tr style=cursor:pointer class=unread><td class=check-mail><input id=" + PARAM.Id + " type=checkbox class=i-checks></td><a><td class=mail-ontact><a>" + PARAM.SenderName + "</a><span class='label label-danger pull-right'>" + senderRole + "</span></td><td class=mail-subject><a>" + PARAM.Subject + "</a></td>  <td class=></td><td class=text-right mail-date>" + PARAM.TimeFormat + "</td></a></tr>";
                                    }

                                }
                            } else if (Mode == 'TrashByUser') {
                                var senderRole = fnGetSenderRole(PARAM.SenderRole);
                                if (PARAM.IsRead == true) {
                                    if (PARAM.SenderRole == 6 || PARAM.SenderRole == 7) {
                                        Tr = "<tr style=cursor:pointer class=read><td class=check-mail><input id=" + PARAM.Id + " type=checkbox  class=i-checks></td><td class=mail-ontact><a>" + PARAM.SenderName + "</a><span  class='label label-primary pull-right'></span></td><td class=mail-subject><a>" + PARAM.Subject + "</a></td>  <td class=></td><td class=text-right mail-date>" + PARAM.TimeFormat + "</td></a></tr>";
                                    } else {
                                        Tr = "<tr style=cursor:pointer class=read><td class=check-mail><input id=" + PARAM.Id + " type=checkbox  class=i-checks></td><a><td class=mail-ontact><a>" + PARAM.SenderName + "</a><span class='label label-danger pull-right'></span></td><td class=mail-subject><a>" + PARAM.Subject + "</a></td>  <td class=></td><td class=text-right mail-date>" + PARAM.TimeFormat + "</td></a></tr>";
                                    }
                                } else {
                                    if (PARAM.SenderRole == 6 || PARAM.SenderRole == 7) {
                                        Tr = "<tr style=cursor:pointer class=unread><td class=check-mail><input id=" + PARAM.Id + " type=checkbox  class=i-checks></td><a><td class=mail-ontact><a>" + PARAM.SenderName + "</a><span class='label label-primary pull-right'></span></td><td class=mail-subject><a>" + PARAM.Subject + "</a></td>  <td class=></td><td class=text-right mail-date>" + PARAM.TimeFormat + "</td></a></tr>";
                                    } else {
                                        Tr = "<tr style=cursor:pointer class=unread><td class=check-mail><input id=" + PARAM.Id + " type=checkbox class=i-checks></td><a><td class=mail-ontact><a>" + PARAM.SenderName + "</a><span class='label label-danger pull-right'></span></td><td class=mail-subject><a>" + PARAM.Subject + "</a></td>  <td class=></td><td class=text-right mail-date>" + PARAM.TimeFormat + "</td></a></tr>";
                                    }

                                }
                            }

                            $('#tblBody').append(Tr);

                        })
                        $('#divEmptybox').hide();
                        $('#divMailBox').show();
                        $('#divOperation').show();
                    } else {

                        $('#divEmptybox').show();
                        $('#divMailBox').hide();
                        $('#divOperation').hide();

                    }
                }


            } catch (e) {

            }
            checkboxclick();
        }
        var fnGetSenderRole = function (roleID) {
            var role = '';
            if (roleID == 6) {
                role = 'P';
            } else if (roleID == 7) {
                role = 'S';
            } else if (roleID == 1) {
                role = 'SA';
            } else if (roleID == 2) {
                role = 'CA';
            } else {
                role = 'NA';
            }
            return role;
        }
        function BindMessageInPanel(Id, Mode) {
            try {
                //   alert(Id);
                $("#hdnIds").val(Id);
                var Request = new XMLHttpRequest();
                var url = '../Handlers/Communication.ashx?Mode=' + Mode + '&Id=0&Role=0&Type=Grid&MsgId=' + Id;
                Request.open("GET", url, false);
                Request.send();
                var Data = Request.responseText;

                if (Data != undefined) {
                    Data = jQuery.parseJSON(Data);
                    $("#spnSubject").text(Data.Subject);
                    $("#spnFrom").text(Data.SenderName);
                    $("#spnUpdatedOn").text(Data.TimeFormat);
                    $("#DivMailBody").empty();
                    $("#DivMailBody").append(Data.MessageBody);

                    if (Data.Subject.indexOf('RE: ') == -1) {
                        $("#<%=txtSubject.ClientID %>").val('RE: ' + Data.Subject);
                    } else {
                        $("#<%=txtSubject.ClientID %>").val(Data.Subject);
                    }

                    
                    $("#<%=HdnReceiverRole.ClientID %>").val(Data.SenderRole);
                    $("#<%=HdnReceiverId.ClientID %>").val(Data.SenderId);
                    $("#headReply").text('Reply to : '+Data.SenderName);
                    
                }
            } catch (e) { }
            ArrayData = [];
            $("#hdnIds").val('');
            // GetOperation($("#hdnMode").val());
        }


        function GetParameterValues(param) {

            var url = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
            for (var i = 0; i < url.length; i++) {
                var urlparam = url[i].split('=');
                if (urlparam[0] == param) {
                    return urlparam[1];
                }
            }
            $("#hdnMode").val(urlparam[1])
        }

        //function AddIds(Id)
        //{

        //}

        function OnPrevious() {

            return false;
        }
        function OnNext() {

            return false;
        }
        function OnRestore() {

            return false;
        }
        function OnOperation(Operation) {
            var Mode = Operation;
            var Ids = '';
            if (ArrayData != '') {
                Ids = ArrayData;
            } else {
                Ids = $("#hdnIds").val();
            }

            var Message = '';
            if (Ids != []) {
                $.ajax({
                    type: "GET",
                    url: "../Handlers/CommunicationOperation.ashx?Mode=" + Mode + "&Ids=" + Ids,
                    contentType: "text/plain",
                    processdata: true,
                    async: false,
                    success: function (data) {
                        Message = data;
                    }
                });

                if (Message == 'Success') {
                    if (Operation == 'Restore') {
                        AppDisplayMessage("Message Restored Successfully", 1);
                    } else if (Operation == 'Trash') {
                        AppDisplayMessage("Message Trashed Successfully", 1);
                    }
                    GetOperation($("#hdnMode").val());
                } else {
                    AppDisplayMessage("Error occurred. Please contact system Administrator", 2);
                }


            } else {
                AppDisplayMessage("Please select atleast one Message", 2);
            }
            ArrayData = [];
            $("#hdnIds").val('');
            return false;
        }
        function OnReply() {
            //alert();
            return false;
        }
        function OnSearch() {

            return false;
        }


        function Validate() {

            if (IsAdminRole == 'False') {
                var Role = $('.ddlRole').val();
                var message = $('.note-editable').html();
                $("#<%=hdnMessageBody.ClientID %>").val(message);
                
                var Subject = $("#<%=hdnSubject.ClientID %>").val($('.txtSubject').val());
                if (Role == 0) {
                    AppDisplayMessage("Please select the Receiver", 2);
                    return false;
                } else if ($('.txtSubject').val() == "") {
                    AppDisplayMessage("Subject can not be blank", 2);
                    return false;
                } else if (message.length <= 40) {
                    AppDisplayMessage("Message can not be blank (Min 50 characters)", 2);
                    return false;
                } else {
                    return true;
                }
            } else {
                var message = $('.note-editable').html();
                var Subject = $("#<%=hdnSubject.ClientID %>").val($('.txtSubject').val());
                $("#<%=hdnMessageBody.ClientID %>").val(message);
                
                if ($('.txtSubject').val() == "") {
                    
                    AppDisplayMessage("Subject can not be blank", 2);
                    return false;
                } else if (message.length<=40) {
                    
                    AppDisplayMessage("Message can not be blank (Min 50 characters)", 2);
                    return false;
                }
                else {
                    return true;
                }
            }

             // return true;
        }
        function OnDiscard() {                
            $('.note-editable').html("");
             return false;
        }
        

    </script>
</asp:Content>
