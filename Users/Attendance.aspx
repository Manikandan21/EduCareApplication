<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Attendance.aspx.cs" Inherits="ILogisticsApplication.Users.Attendance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Resource/css/AjaxCalender.css" rel="stylesheet" />
    <link href="../Resource/css/plugins/fullcalendar/fullcalendar.css" rel="stylesheet" />
    <link href="../Resource/css/plugins/fullcalendar/fullcalendar.print.css" rel="stylesheet" media="print" />
    <style>
        .fc-event, .fc-agenda .fc-event-time, .fc-event a {
            background-color: #fff !important;
            border-color: #fff !important;
            height: 70px;
            padding: 4px 6px;
        }

        .AbsentView {
            background: url("../Resource/img/attendance/User/Absent.png") no-repeat center;
        }

        .PresentView {
            background: url("../Resource/img/attendance/User/Present.png") no-repeat center;
        }

        .WeekEndView {
            background: url("../Resource/img/attendance/User/WeekEnd.png") no-repeat center;
        }

        .HolidayView {
            background: url("../Resource/img/attendance/User/Holiday.png") no-repeat center;
        }

        .UnmarkedView {
            background: url("../Resource/img/attendance/User/unmarked.png") no-repeat center;
        }

        .Absent {
            background: url("../../Img/images/icon/Absent.png") no-repeat center;
            width: 25px;
            height: 25px;
        }

        .Present {
            background: url("../../Img/images/icon/Present.png") no-repeat center;
            width: 25px;
            height: 25px;
        }

        .WeekEnd {
            background: url("../../Img/images/icon/WeekEnd.png") no-repeat center;
            width: 25px;
            height: 25px;
        }

        .Holiday {
            background: url("../../Img/images/icon/Holiday.png") no-repeat center;
            width: 25px;
            height: 25px;
        }

        .Unmarked {
            background: url("../../Img/images/icon/unmarked.png") no-repeat center;
            width: 25px;
            height: 25px;
        }

        .testing {
            text-align: right;
            float: left;
            font-family: Helvetica,Arial,sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 0;
            width: 100px;
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
                                <h5 id="hTag">Exam Schedule <small>view Exam scheduling details</small></h5>

                            </div>
                            <div class="ibox-content">

                                <asp:Panel ID="pnlAction" runat="server">
                                    <div class="row">
                                        <div class="col-sm-12" id="divEditable" style="margin-bottom: 5px">
                                            <h4 style="text-align: center; color: #EC4758" id="headEditable"></h4>
                                            <div class="form-group col-sm-3"></div>

                                            <div class="form-group col-sm-3">
                                                <label>Select Month <span class="text-danger">*</span></label>
                                                <asp:DropDownList ID="ddlMonth" runat="server" CssClass="form-control ddlExam">
                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                    <asp:ListItem Value="6">June</asp:ListItem>
                                                    <asp:ListItem Value="7">July</asp:ListItem>
                                                    <asp:ListItem Value="8">August</asp:ListItem>
                                                    <asp:ListItem Value="9">September</asp:ListItem>
                                                    <asp:ListItem Value="10">October</asp:ListItem>
                                                    <asp:ListItem Value="11">November</asp:ListItem>
                                                    <asp:ListItem Value="12">December</asp:ListItem>
                                                    <asp:ListItem Value="1">January</asp:ListItem>
                                                    <asp:ListItem Value="2">February</asp:ListItem>
                                                    <asp:ListItem Value="3">March</asp:ListItem>
                                                    <asp:ListItem Value="4">April</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div id="Div1" class="form-group  col-sm-3" runat="server">
                                                <div style="height: 29px"></div>

                                                <asp:Button ID="btnGet" runat="server" Text="Get Attendance" OnClientClick="if (!Validate()) {return false;}" CssClass="btn btn-primary m-t-n-xs col-sm-8 btnGetData" />

                                            </div>
                                            <div class="form-group col-sm-3"></div>
                                        </div>

                                    </div>
                                </asp:Panel>

                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="ibox">

                                            <div class="ibox-content">
                                                <div id="calendar"></div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <asp:HiddenField ID="hdnAcademicYr" runat="server" />
            <asp:HiddenField ID="hdnMonth" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <script src="../Resource/js/eduCareCommon.js"></script>
    <script src="../Resource/js/plugins/fullcalendar/moment.min.js"></script>
    <script src="../Resource/js/plugins/fullcalendar/fullcalendar.min.js"></script>
    <script type="text/javascript">
        $(function () {
            BindAcademicYr();
        });
        var BindAcademicYr = function () {
            var url = '../Handlers/ApplicationConfig.ashx?Mode=AcademicYr';
            var result = JSON.parse(GetJsonResult(url));

            $('#<%=hdnAcademicYr.ClientID %>').val(result[0].Name);
        }
        function Validate() {
            var Month = $('#<%=ddlMonth.ClientID %>').val();

            if (Number(Month) == 0) {
                AppDisplayMessage('Please fill the mandatory fields', 2);
                return false;
            }
            else {
                initializeCalendar();
            }
        }
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

        var initializeCalendar = function () {
            $('#calendar').fullCalendar('destroy');
            var AcademicYr = $('#<%=hdnAcademicYr.ClientID %>').val();
            var Month = $('#<%=ddlMonth.ClientID %>').val();
            var result = AcademicYr.split("-");
            var year = "";
            if (Month > 5) {
                year = result[0];
            } else {
                year = result[1];
            }
            $('#calendar').fullCalendar({
                defaultDate: new Date(year, Month - 1, 1),
                header: {
                    left: '',
                    center: 'title',
                    right:''
                },
                selectable: false,
                selectHelper: false,
                editable: false,
                droppable: false, // this allows things to be dropped onto the calendar
                displayEventTime: false,
                drop: function () {
                    // is the "remove after drop" checkbox checked?
                    if ($('#drop-remove').is(':checked')) {
                        // if so, remove the element from the "Draggable Events" list
                        $(this).remove();
                    }
                },
                select: function (start, end) {

                },
                eventClick: function (calEvent, jsEvent, view, eventid) {

                },
                viewRender: function (view, element) {

                }, eventRender: function (event, element, view) {
                    
                    
                    element.find('.fc-time').hide();
                    element.find('.fc-title').hide();
                    element.find('.fc-content').hide();
                    if (event.id == 1) {
                        element.addClass("PresentView");
                    }else if (event.id == 2) {
                        element.addClass("AbsentView");
                    }else if (event.id == 3) {
                        element.addClass("WeekEndView");
                    } else if (event.id == 4) {
                        element.addClass("HolidayView");
                    } else {
                        element.addClass("UnmarkedView");
                    }
                },
                events: function (start, end, timezone, callback) {

                    jQuery.ajax({
                        url: '../Handlers/UserAttendance.ashx?Mode=GetData&MonthID=' + Month,
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
                                        id: r.Key,
                                        title: r.Title,
                                        start: r.Date,
                                        end: r.Date
                                    });
                                });
                            }
                            callback(events);
                        }
                    });
                }
            });

        }

    </script>
</asp:Content>
