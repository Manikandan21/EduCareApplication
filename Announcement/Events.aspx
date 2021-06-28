<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="ILogisticsApplication.Announcement.Events" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
    <link href="../Resource/css/AjaxCalender.css" rel="stylesheet" />
    <link href="../Resource/css/plugins/fullcalendar/fullcalendar.css" rel="stylesheet" />
    <link href="../Resource/css/plugins/fullcalendar/fullcalendar.print.css" rel="stylesheet" media="print" />
    
   
    <style>
        .paddingtop {
            padding-top: 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Panel" ContentPlaceHolderID="ContentPanel" runat="server">
    <ajax:ToolkitScriptManager ID="ScriptManager1" EnableScriptGlobalization="true" EnableScriptLocalization="true"
        EnablePartialRendering="true" runat="server" />
    <div class="wrapper wrapper-content fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Events <small>Manage events details</small></h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="ibox float-e-margins">

                            <div class="ibox-content">
                                <div id="calendar"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <div id="modal-form" class="modal fade" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content  animated bounceInRight">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h3 class="m-t-none m-b" style="text-align: center">Events</h3>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-horizontal">

                            <div class="form-group">
                                <label class="col-lg-3 control-label">Title <span class="text-danger">*</span></label>
                                <div class="col-lg-8">
                                    <input type="text" placeholder="Enter title" id="txtTitle" runat="server" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">Event Type <span class="text-danger">*</span></label>
                                <div class="col-lg-8">
                                    <input type="text" placeholder="Enter event type" id="txtType" runat="server" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">Content <span class="text-danger">*</span></label>
                                <div class="col-lg-8">
                                    <textarea placeholder="Enter content" id="txtContent" runat="server" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">Start Date <span class="text-danger">*</span></label>
                                <div class="col-lg-4">
                                    <div class="input-group date divDate">
                                    <span class="input-group-addon" id="spnStart"><i class="fa fa-calendar"></i></span>
                                    <asp:TextBox ID="txtStartDate"  ReadOnly="true" style="height:30px;width:150px"  runat="server" class="form-control" />
                                    <ajax:CalendarExtender ID="CalendeStartDate" runat="server" BehaviorID="Calendar1"
                                                            OnClientHidden="calendarhidden1" Format="dd/MM/yyyy" CssClass="black" TargetControlID="txtStartDate"
                                                            PopupButtonID="spnStart" />
                                        </div>
                                    </div>
                                <div class="col-lg-3">
                                    <select id="ddlStartTime" runat="server" style="height:29px">
                                        <option value="0">--Select Time--</option>
                                        <option value="06:00">06:00</option>
                                        <option value="06:30">06:30</option>
                                        <option value="07:00">07:00</option>
                                        <option value="07:30">07:30</option>
                                        <option value="08:00">08:00</option>
                                        <option value="08:30">08:30</option>
                                        <option value="09:00">09:00</option>
                                        <option value="09:30">09:30</option>
                                        <option value="10:00">10:00</option>
                                        <option value="10:30">10:30</option>
                                        <option value="11:00">11:00</option>
                                        <option value="11:30">11:30</option>
                                        <option value="12:00">12:00</option>
                                        <option value="12:30">12:30</option>
                                        <option value="13:00">13:00</option>
                                        <option value="13:30">13:30</option>
                                        <option value="14:00">14:00</option>
                                        <option value="14:30">14:30</option>
                                        <option value="15:00">15:00</option>
                                        <option value="15:30">15:30</option>
                                        <option value="16:00">16:00</option>
                                        <option value="16:30">16:30</option>
                                        <option value="17:00">17:00</option>
                                        <option value="17:30">17:30</option>
                                        <option value="18:00">18:00</option>
                                        <option value="18:30">18:30</option>
                                        <option value="19:00">19:00</option>
                                        <option value="19:30">19:30</option>
                                        <option value="20:00">20:00</option>
                                        <option value="20:30">20:30</option>
                                        <option value="21:00">21:00</option>
                                        <option value="21:30">21:30</option>
                                        <option value="22:00">22:00</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">End Date <span class="text-danger">*</span></label>
                                <div class="col-lg-4">
                                    <div class="input-group date divDate">
                                    <span class="input-group-addon" id="spnEnd"><i class="fa fa-calendar"></i></span>
                                     <asp:TextBox ID="txtEndDate" ReadOnly="true" style="height:30px;width:150px"  runat="server" class="form-control" />
                                   <%--<input type="text" id="txtEndDate" style="height:23px"  disabled="disabled" runat="server" class="form-control" />--%>
                                    <ajax:CalendarExtender ID="CalendarEndDate" runat="server" BehaviorID="Calendar2"
                                                            OnClientHidden="calendarhidden2" Format="dd/MM/yyyy" CssClass="black" TargetControlID="txtEndDate"
                                                            PopupButtonID="spnEnd" />
                                        </div>
                                    </div>
                                <div class="col-lg-3">                               
                                    <select id="ddlEndTime" runat="server" style="height:29px">
                                        <option value="0">--Select Time--</option>
                                        <option value="06:00">06:00</option>
                                        <option value="06:30">06:30</option>
                                        <option value="07:00">07:00</option>
                                        <option value="07:30">07:30</option>
                                        <option value="08:00">08:00</option>
                                        <option value="08:30">08:30</option>
                                        <option value="09:00">09:00</option>
                                        <option value="09:30">09:30</option>
                                        <option value="10:00">10:00</option>
                                        <option value="10:30">10:30</option>
                                        <option value="11:00">11:00</option>
                                        <option value="11:30">11:30</option>
                                        <option value="12:00">12:00</option>
                                        <option value="12:30">12:30</option>
                                        <option value="13:00">13:00</option>
                                        <option value="13:30">13:30</option>
                                        <option value="14:00">14:00</option>
                                        <option value="14:30">14:30</option>
                                        <option value="15:00">15:00</option>
                                        <option value="15:30">15:30</option>
                                        <option value="16:00">16:00</option>
                                        <option value="16:30">16:30</option>
                                        <option value="17:00">17:00</option>
                                        <option value="17:30">17:30</option>
                                        <option value="18:00">18:00</option>
                                        <option value="18:30">18:30</option>
                                        <option value="19:00">19:00</option>
                                        <option value="19:30">19:30</option>
                                        <option value="20:00">20:00</option>
                                        <option value="20:30">20:30</option>
                                        <option value="21:00">21:00</option>
                                        <option value="21:30">21:30</option>
                                        <option value="22:00">22:00</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">Organizer Type <span class="text-danger">*</span></label>
                                <div class="col-lg-8">
                                    <select id="ddlOrganizer" runat="server">
                                        <option value="0">--Select--</option>
                                        <option value="1">Internal</option>
                                        <option value="2">External</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">Organizer Name <span class="text-danger">*</span></label>
                                <div class="col-lg-8">
                                    <input type="text" placeholder="Enter organizer Name and Number" id="txtOrganizer" runat="server" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-lg-offset-3 col-lg-8">
                                    <button class="btn btn-sm btn-primary m-t-n-xs col-sm-4" id="btnSubmit" runat="server" type="button" onclick="if (!Validate()) {return false;}" onserverclick="Save_Click"><strong>Save</strong></button>
                                    <button class="btn btn-sm btn-danger pull-right m-t-n-xs col-sm-4" id="btnDelete" onclick="if (!ConfirmDelete()) {return false;}" runat="server" type="button"><strong>Delete</strong></button>
                                    <button class="btn btn-sm btn-danger pull-right m-t-n-xs col-sm-4" id="btnClearData" onclick="ClearText()" runat="server" type="button"><strong>Clear Data</strong></button>

                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <div id="divNonAdminUser" class="modal fade" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content  animated bounceInRight">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h3 class="m-t-none m-b" style="text-align: center">Events</h3>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-horizontal" style="word-wrap: break-word;">
                            <dl class="dl-horizontal">

                                <dt class="paddingtop">Title :</dt>
                                <dd class="paddingtop" id="pTitle"></dd>
                                <dt class="paddingtop">Event Type :</dt>
                                <dd class="paddingtop" id="pEventType"></dd>
                                <dt class="paddingtop">Content :</dt>
                                <dd class="paddingtop" id="pContent"></dd>
                                <dt class="paddingtop">Start Date & Time :</dt>
                                <dd class="paddingtop" id="pStartDateTime"></dd>
                                <dt class="paddingtop">End Date & Time :</dt>
                                <dd class="paddingtop" id="pEndDateTime"></dd>
                                <dt class="paddingtop">Organizer Type :</dt>
                                <dd class="paddingtop" id="pOrganizerType"></dd>
                                <dt class="paddingtop">Organizer Name :</dt>
                                <dd class="paddingtop" id="pOrganizerName"></dd>


                            </dl>

                            <%-- <div class="form-group">
                                <label class="col-lg-3 control-label">Title </label>
                                <div class="col-lg-8">
                                    <p id="pTitle"  />                                    
                                </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">Event Type </label>
                                <div class="col-lg-8">
                                    <input id="pEventType" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">Content </label>
                                <div class="col-lg-8">
                                    <input id="pContent" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">Start Date & Time </label>
                                <div class="col-lg-8">
                                   <input id="pStartDateTime" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">End Date & Time  </label>
                                <div class="col-lg-8">
                                    <input id="pEndDateTime" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">Organizer Type </label>
                                <div class="col-lg-8">
                                     <input id="pOrganizerType" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">Organizer Name </label>
                                <div class="col-lg-8">
                                   <input id="pOrganizerName" class="form-control" />
                                </div>
                            </div>
                            --%>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>


    <div class="modal inmodal" id="confirmModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content animated bounceInDown">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <i class="fa fa-question-circle modal-icon"></i>
                    <h1 class="modal-title">Are you sure Do you want delete?</h1>

                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">Close</button>
                    <button class="btn btn-danger" id="btnDeleteConfirm" runat="server" type="button" onserverclick="Save_Click"><strong>Delete</strong></button>
                </div>
            </div>
        </div>
    </div>


    <input type="hidden" id="hdnId" runat="server" />
    <input type="hidden" id="hdnMode" runat="server" />
    <input type="hidden" id="hdnTitle" runat="server" />
    <input type="hidden" id="hdnType" runat="server" />
    <input type="hidden" id="hdnContent" runat="server" />
    <input type="hidden" id="hdnStartTime" runat="server" />
    <input type="hidden" id="hdnEndTime" runat="server" />
    <input type="hidden" id="hdnOrganizerType" runat="server" />
    <input type="hidden" id="hdnOrganizerName" runat="server" />
    <input type="hidden" id="hdnStartDate" runat="server" />
    <input type="hidden" id="hdnEndDate" runat="server" />

    <input type="hidden" id="hdnDate" runat="server" />
      <script src="../Resource/js/plugins/fullcalendar/moment.min.js"></script>
    <script src="../Resource/js/plugins/fullcalendar/fullcalendar.min.js"></script>
    <script type="text/javascript">
        var RoleId = '';
        var EventsData = {};
        $(document).ready(function () {
            RoleId = '<%=Convert.ToString(Session["RoleId"]) %>';

            $('#spnStart').click(function (e) {
                var calendarBehavior = $find("Calendar2");
                calendarBehavior.hide();
                //$("#Calendar2_popupDiv").hide();                
            });
            $('#spnEnd').click(function (e) {
                var calendarBehavior = $find("Calendar1");
                    calendarBehavior.hide();      
                //$("#Calendar1_popupDiv").hide();
            });

            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green'
            });
            function BindEvents(type, value) {
                var Mode = 'Events';
                var GetDataMode = type;
                var Id = value;
                $.ajax({
                    type: "POST",
                    contentType: "application/json",
                    data: "{}",
                    url: "../Handlers/Announcement.ashx?Mode=" + Mode + "&GetDataMode=" + GetDataMode + "&Id=" + Id + "",
                    dataType: "json",
                    success: function (data) {
                        EventsData = data;
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {

                    }
                });
            }


            /* initialize the external events
             -----------------------------------------------------------------*/


            $('#external-events div.external-event').each(function () {
                var eventObject = {
                    title: $.trim($(this).text()),

                };
                // store data so the calendar knows to render an event upon drop
                //$(this).data('event', {
                //    title: $.trim($(this).text()), // use the element's text as the event title
                //    stick: true // maintain when user navigates (see docs on the renderEvent method)
                //});
                $(this).data('eventObject', eventObject);
                // make the event draggable using jQuery UI
                $(this).draggable({
                    zIndex: 1111999,
                    revert: true,      // will cause the event to go back to its
                    revertDuration: 0  //  original position after the drag
                });

            });


            /* initialize the calendar
             -----------------------------------------------------------------*/
            var date = new Date();
            var d = date.getDate();
            var m = date.getMonth();
            var y = date.getFullYear();

            $('#calendar').fullCalendar({

                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay'
                },
                selectable: true,
                selectHelper: true,
                editable: true,
                droppable: true, // this allows things to be dropped onto the calendar

                drop: function () {
                    // is the "remove after drop" checkbox checked?
                    if ($('#drop-remove').is(':checked')) {
                        // if so, remove the element from the "Draggable Events" list
                        $(this).remove();
                    }
                },
                select: function (start, end) {
                    ClearText();
                    // start contains the date you have selected
                    // end contains the end date. 
                    // Caution: the end date is exclusive (new since v2).
                    if (RoleId == 1) {
                        var now = moment().utc().format('L');
                        if (now >= moment(start).utc().format('L')) {
                            AppDisplayMessage('Start date should be future dates', 2);
                            return;
                        }
                        var allDay = !start.hasTime() && !end.hasTime();
                        $('#<%=txtStartDate.ClientID %>').val(moment(start).format("DD/MM/YYYY"));
                        $('#<%=txtEndDate.ClientID %>').val(moment(end).subtract(1, "days").format("DD/MM/YYYY"));
                        $('#<%=hdnStartDate.ClientID %>').val(moment(start).format("DD/MM/YYYY"));
                        $('#<%=hdnEndDate.ClientID %>').val(moment(end).subtract(1, "days").format("DD/MM/YYYY"));                        
                        $('#<%=btnClearData.ClientID %>').show();
                        $('#<%=btnDelete.ClientID %>').hide();
                        $('#modal-form').modal('show');
                    }
                },
                eventClick: function (calEvent, jsEvent, view, eventid) {
                    var eventid = calEvent.id;
                    var start = calEvent.start;
                    var end = calEvent.end;
                    var fullname = calEvent.fullname;

                    jQuery.ajax({
                        url: '../Handlers/Announcement.ashx?Mode=Events&GetDataMode=SELECTID&Id=' + eventid + '',
                        type: 'POST',
                        dataType: 'json',
                        data: {},
                        success: function (doc) {
                            if (doc != []) {
                                LoadEventsToControl(doc, eventid);
                                if (RoleId == 1) {
                                    $('#<%=btnClearData.ClientID %>').hide();
                                    $('#<%=btnDelete.ClientID %>').show();
                                    $('#modal-form').modal('show');
                                } else {
                                    $('#divNonAdminUser').modal('show');
                                }
                            }
                        }
                    });


                },
                events: function (start, end, timezone, callback) {
                    jQuery.ajax({
                        url: '../Handlers/Announcement.ashx?Mode=Events&GetDataMode=BINDVIEW&Id=0',
                        type: 'POST',
                        dataType: 'json',
                        data: {
                            start: start.format(),
                            end: end.format()
                        },
                        success: function (doc) {
                            var Obj = doc;
                            var events = [];
                            if (Obj != []) {
                                $.map(Obj, function (r, index) {
                                    events.push({
                                        id: r.Id,
                                        title: r.Title,
                                        start: r.StartDate,
                                        end: r.EndDate
                                    });
                                });
                            }
                            callback(events);
                        }
                    });
                }
            });


        });


        function Validate() {
            if ($("#<%=txtTitle.ClientID %>").val() == '' || $("#<%=txtType.ClientID %>").val() == '' || $("#<%=txtContent.ClientID %>").val() == '' || $("#<%=ddlStartTime.ClientID %>").val() == '0' || $("#<%=ddlEndTime.ClientID %>").val() == '0' || $("#<%=ddlOrganizer.ClientID %>").val() == '0' || $("#<%=txtOrganizer.ClientID %>").val() == '') {
                AppDisplayMessage('Please fill the mandatory fields', 2);
                return false;
            } else if (moment($('#<%=txtStartDate.ClientID %>').val()).format("DD/MM/YYYY") > moment($('#<%=txtEndDate.ClientID %>').val()).format("DD/MM/YYYY")) {
                AppDisplayMessage('Start date should be less than End date', 2);
                return false;
            }
            else if ($('#<%=txtStartDate.ClientID %>').val() == $('#<%=txtEndDate.ClientID %>').val()) {
                if ($("#<%=ddlStartTime.ClientID %>").val() >= $("#<%=ddlEndTime.ClientID %>").val()) {
                    AppDisplayMessage('Start time must be less than End time', 2);
                    return false;
                }
                else {
                    AssignValueToHiddenField();
                    return true;
                }
            } else {
                AssignValueToHiddenField();
                return true;
            }
    }
    function AssignValueToHiddenField() {
        $('#<%=hdnTitle.ClientID %>').val($("#<%=txtTitle.ClientID %>").val());
        $('#<%=hdnType.ClientID %>').val($("#<%=txtType.ClientID %>").val());
        $('#<%=hdnContent.ClientID %>').val($("#<%=txtContent.ClientID %>").val());
        $('#<%=hdnStartTime.ClientID %>').val($("#<%=ddlStartTime.ClientID %>").val());
        $('#<%=hdnEndTime.ClientID %>').val($("#<%=ddlEndTime.ClientID %>").val());
        $('#<%=hdnOrganizerType.ClientID %>').val($("#<%=ddlOrganizer.ClientID %>").val());
        $('#<%=hdnOrganizerName.ClientID %>').val($("#<%=txtOrganizer.ClientID %>").val());
    }
    function LoadEventsToControl(Data, Id) {
        if (RoleId == 1) {
            $("#<%=txtTitle.ClientID %>").val(Data[0].Title);
            $("#<%=txtType.ClientID %>").val(Data[0].EventType);
            $("#<%=txtContent.ClientID %>").val(Data[0].Content);
            $("#<%=ddlStartTime.ClientID %>").val(Data[0].StartTime);
            $("#<%=ddlEndTime.ClientID %>").val(Data[0].EndTime);
            $("#<%=ddlOrganizer.ClientID %>").val(Data[0].OrganizerType);
            $("#<%=txtOrganizer.ClientID %>").val(Data[0].Organizer);
            AssignValueToHiddenField();
            $('#<%=hdnMode.ClientID %>').val('Update');
            $('#<%=hdnId.ClientID %>').val(Id);
            $('#<%=txtStartDate.ClientID %>').val(moment(Data[0].StartDate).format("DD/MM/YYYY"));
            $('#<%=txtEndDate.ClientID %>').val(moment(Data[0].EndDate).format("DD/MM/YYYY"));
            $('#<%=hdnStartDate.ClientID %>').val(moment(Data[0].StartDate).format("DD/MM/YYYY"));
            $('#<%=hdnEndDate.ClientID %>').val(moment(Data[0].EndDate).format("DD/MM/YYYY"));
        } else {
            $("#pTitle").text(Data[0].Title);
            $("#pEventType").text(Data[0].EventType);
            $("#pContent").text(Data[0].Content);
            $("#pStartDateTime").text(moment(Data[0].StartDate).format("DD/MM/YYYY") + " " + Data[0].StartTime);
            $("#pEndDateTime").text(moment(Data[0].EndDate).format("DD/MM/YYYY") + " " + Data[0].EndTime);
            if (Data[0].OrganizerType == 1) {
                $("#pOrganizerType").text('Internal');
            } else {
                $("#pOrganizerType").text('External');
            }
            $("#pOrganizerName").text(Data[0].Organizer);
        }
    }
    function ConfirmDelete() {
        $('#<%=hdnMode.ClientID %>').val('Delete');
            $('#confirmModal').modal('show');
        }
        function ClearText() {

            $("#<%=txtTitle.ClientID %>").val('');
            $('#<%=hdnTitle.ClientID %>').val('');
            $("#<%=txtType.ClientID %>").val('');
            $('#<%=hdnType.ClientID %>').val('');
            $("#<%=txtContent.ClientID %>").val('');
            $('#<%=hdnContent.ClientID %>').val('');
            $("#<%=ddlStartTime.ClientID %>").val(0);
            $('#<%=hdnStartTime.ClientID %>').val(0);
            $("#<%=ddlEndTime.ClientID %>").val(0);
            $('#<%=hdnEndTime.ClientID %>').val(0);
            $("#<%=ddlOrganizer.ClientID %>").val(0);
            $('#<%=hdnOrganizerType.ClientID %>').val('');
            $("#<%=txtOrganizer.ClientID %>").val('');
            $('#<%=hdnOrganizerName.ClientID %>').val('');
            $('#<%=hdnMode.ClientID %>').val('');
            $('#<%=hdnId.ClientID %>').val('');
            $('#<%=hdnStartDate.ClientID %>').val('');
            $('#<%=hdnEndDate.ClientID %>').val('');
            $('#<%=txtStartDate.ClientID %>').val('');
            $('#<%=txtEndDate.ClientID %>').val('');

        }
        var tag=0;
        function dateselect(ev) {
            var calendarBehavior1 = $find("Calendar1");
            var date = calendarBehavior1._selectedDate.format("dd/MM/yyyy");
            var hiddencontrol = $get('<%=hdnDate.ClientID %>');
            if (hiddencontrol.value.indexOf(date) == -1)
                hiddencontrol.value += date + ";";
            tag1 = 1;
        }
        function dateselect(ev) {

            var calendarBehavior1 = $find("Calendar2");
            var date = calendarBehavior1._selectedDate.format("dd/MM/yyyy");
            var hiddencontrol = $get('<%=hdnDate.ClientID %>');
            if (hiddencontrol.value.indexOf(date) == -1)
                hiddencontrol.value += date + ";";
            tag1 = 1;
        }
        function calendarhidden1(obj) {
            $("#<%=hdnStartDate.ClientID %>").val($("#<%=txtStartDate.ClientID %>").val());
            var calendarBehavior = $find("Calendar1");
            if (tag1 == 1)
                calendarBehavior.show();          
        }
        function calendarhidden2(obj) {
            $("#<%=hdnEndDate.ClientID %>").val($("#<%=txtEndDate.ClientID %>").val());
            var calendarBehavior = $find("Calendar2");
            if (tag1 == 1)
                calendarBehavior.show();
        }


    </script>
</asp:Content>
