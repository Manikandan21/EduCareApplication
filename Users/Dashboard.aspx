<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs"  MasterPageFile="~/MasterPage/AdminMaster.Master" Inherits="ILogisticsApplication.Users.Dashboard" %>

<asp:Content ID="Content" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Panel" ContentPlaceHolderID="ContentPanel" runat="server">

    <div class="wrapper wrapper-content">
        <div class="row">
            <div class="col-lg-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <span class="label label-success pull-right">Active</span>
                        <h5>Attendance</h5>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins lblAttendanceStatus"></h1>
                        <div class="stat-percent font-bold text-success"></div>
                        <small>Today</small>
                    </div>
                </div>
            </div>
           
            <div class="col-lg-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <span class="label label-primary pull-right"></span>
                        <h5>Attendance Percentage</h5>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins lblAttendancePercentage"></h1>
                        <div class="stat-percent font-bold text-navy"></div>
                        <small>Overall Percentage</small>
                    </div>
                </div>
            </div>
             <div class="col-lg-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <span class="label label-info pull-right">Total</span>
                        <h5>Mail count</h5>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins lblMailCount"></h1>
                        <div class="stat-percent font-bold text-info"></div>
                         <small>Unread count</small>
                    </div>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <span class="label label-danger pull-right">Overall</span>
                        <h5>Login Count</h5>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins lblLogCount"></h1>
                        <div class="stat-percent font-bold text-danger"></div>
                        <small>times</small>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <div>
                            <%-- <span class="pull-right text-right">
                                        <small>Average value of sales in the past month in: <strong>United states</strong></small>
                                            <br/>
                                            All sales: 162,862
                                        </span>--%>
                            <h1 class="m-b-xs">Attendance Margin</h1>
                            <h3 class="font-bold no-margins" style="margin-bottom: 5px">Last 6 months attendance margin
                            </h3>
                            <%--  <small>Attendance Review.</small>--%>
                        </div>

                        <div>
                            <canvas id="lineChart" height="70"></canvas>
                        </div>

                        <div class="m-t-md">
                            <small class="pull-right">
                                <i class="fa fa-clock-o"></i>
                                Update on 18.03.2016
                            </small>
                            <small>
                                <%--<strong>Analysis of sales:</strong> The value has been changed over time, and last month reached a level over $50,000.--%>
                            </small>
                        </div>

                    </div>
                </div>
            </div>
        </div>    


        <div class="row divMessagePanel">
            <div class="col-lg-4">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Messages</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content ibox-heading">
                        <h3><i class="fa fa-envelope-o"></i>New messages</h3>
                        <small><i class="fa fa-tim"></i>You have  <b class="lblUnreadCount">0</b> new messages..</small>
                    </div>
                    <div class="ibox-content">
                        <div class="feed-activity-list divMailInbox">  
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-4">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Notice board & Events</h5>
                       
                    </div>
                    <div class="ibox-content no-padding">
                        <ul class="list-group ulAnnouncement">
                           
                        </ul>
                    </div>
                    
                </div> </div>
            <div class="col-lg-4">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Recent Activities</h5>
                      
                        <div class="ibox-content no-padding">
                        <ul class="list-group ulRecentActivity">
                         
                        </ul>
                    </div>
                    </div>
                    
                </div>
           </div>
        </div>
    </div>


       
     <!-- Main -->
     <script src="../Resource/js/plugins/easypiechart/jquery.easypiechart.js" type="text/javascript"></script>
    <!-- EayPIE -->

     <!-- Jvectormap -->
  <%--  <script src="../Resource/js/plugins/jvectormap/jquery-jvectormap-2.0.2.min.js"></script>
    <script src="../Resource/js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>--%>

    <script>
        $(document).ready(function () {
            BindLineChart();
            BindDashboardInfo();
        });
        function BindDashboardInfo() {
            var url = '../Handlers/Dashboard.ashx?Mode=GET';
            var result = JSON.parse(GetJsonResult(url));
            console.log(result);
            BindInformationByPanel(result);
        }
        function BindInformationByPanel(DashboardInfo) {
            var Role = '<%=Convert.ToString(Session["RoleId"]) %>';
               if (Role == "6" || Role == "7") {
                   if (DashboardInfo) {
                       if (DashboardInfo.Table.length > 0) {
                           var Enrollment = DashboardInfo.Table[0];
                           $('.lblAttendanceStatus').text(Enrollment.Present);
                           $('.lblAttendancePercentage').text('***');
                           $('.lblMailCount').text(Enrollment.MsgCount);
                           $('.lblLogCount').text(Enrollment.LOGCOUNT);
                       }                     
                       if (DashboardInfo.Table1.length > 0) {
                           var MailInfo = DashboardInfo.Table1;//divMailInbox
                           var element = "";
                           if (MailInfo.length > 0) {
                               for (var i = 0; i < MailInfo.length; i++) {
                                   element = "";
                                   element += "<div class=feed-element>";
                                   element += "<div><small class=pull-right text-navy>" + MailInfo[i].Date + "</small>"
                                   element += "<strong> " + MailInfo[i].SenderName + "</strong> ";
                                   element += "<div>" + MailInfo[i].Subject + "</div><small class=text-muted>" + MailInfo[i].CreatedOn + "</small > </div></div> ";
                                   console.log(element)
                                   $('.divMailInbox').append(element);
                               }
                           }
                       }
                       if (DashboardInfo.Table2.length > 0) {
                           var Announcement = DashboardInfo.Table2;
                           var element = "";
                           if (Announcement.length > 0) {
                               for (var i = 0; i < Announcement.length; i++) {
                                   element = "";
                                   if (Announcement[i].TYPE == 1) {
                                       element += "<li class=list-group-item><p><b>Noticeboard: </b>" + Announcement[i].Title + "</p><small class=block text-muted><i class=fa fa-clock-o></i>" + Announcement[i].Date + "</small></li>";
                                   } else {
                                       element += "<li class=list-group-item><p><b>Events: </b>" + Announcement[i].Title + "</p><small class=block text-muted><i class=fa fa-clock-o></i>" + Announcement[i].Date + "</small></li>";
                                   }
                                   $('.ulAnnouncement').append(element);
                               }
                           }
                       } else {
                           var element = "<li class=list-group-item><p><b>No Record found: </b></p><small class=block text-muted><i class=fa fa-clock-o></i></small></li>";
                           $('.ulAnnouncement').append(element);
                       }
                       if (DashboardInfo.Table3 != undefined) {
                           if (DashboardInfo.Table3.length > 0) {
                               var Activity = DashboardInfo.Table3;
                               var element = "";
                               if (Activity.length > 0) {
                                   for (var i = 0; i < Activity.length; i++) {
                                       element = "";
                                       element += "<li class=list-group-item><p><a class=text-info href=#>" + Activity[i].By + "</a>" + Activity[i].Activity + "</p><small class=block text-muted><i class=fa fa-clock-o></i>" + Activity[i].Date + "</small></li>";
                                       $('.ulRecentActivity').append(element);
                                   }
                               }
                           } else {
                               var element = "<li class=list-group-item><p><b class=text-info>No Records found</b></small></li>";
                               $('.ulRecentActivity').append(element);
                           }
                       }

                   }
               }
               else {
                   $('.divEnrollmentPanel').hide();
                   $('.divAttendancePanel').hide();
                   if (DashboardInfo.Table.length > 0) {
                       var Read = DashboardInfo.Table[0];
                       $('.lblUnreadCount').text(Read.UNREADCOUNT);
                   }
                   if (DashboardInfo.Table1.length > 0) {
                       var MailInfo = DashboardInfo.Table1;//divMailInbox
                       var element = "";
                       if (MailInfo.length > 0) {
                           for (var i = 0; i < MailInfo.length; i++) {
                               element = "";
                               element += "<div class=feed-element>";
                               element += "<div><small class=pull-right text-navy>" + MailInfo[i].Date + "</small>"
                               element += "<strong> " + MailInfo[i].SenderName + "</strong> ";
                               element += "<div>" + MailInfo[i].Subject + "</div><small class=text-muted>" + MailInfo[i].CreatedOn + "</small > </div></div> ";
                               console.log(element)
                               $('.divMailInbox').append(element);
                           }
                       }
                   }
                   if (DashboardInfo.Table2.length > 0) {
                       var Announcement = DashboardInfo.Table2;//divMailInbox
                       var element = "";
                       if (Announcement.length > 0) {
                           for (var i = 0; i < Announcement.length; i++) {
                               element = "";
                               if (Announcement[i].TYPE == 1) {
                                   element += "<li class=list-group-item><p><b>Noticeboard: </b>" + Announcement[i].Title + "</p><small class=block text-muted><i class=fa fa-clock-o></i>" + Announcement[i].Date + "</small></li>";
                               } else {
                                   element += "<li class=list-group-item><p><b>Events: </b>" + Announcement[i].Title + "</p><small class=block text-muted><i class=fa fa-clock-o></i>" + Announcement[i].Date + "</small></li>";
                               }
                               $('.ulAnnouncement').append(element);
                           }
                       }
                   } else {
                       var element = "<li class=list-group-item><p><b>No Record found: </b></p><small class=block text-muted><i class=fa fa-clock-o></i></small></li>";
                       $('.ulAnnouncement').append(element);
                   }
                   if (DashboardInfo.Table3.length > 0) {
                       var Activity = DashboardInfo.Table3;//divMailInbox
                       var element = "";
                       if (Activity.length > 0) {
                           for (var i = 0; i < Activity.length; i++) {
                               element = "";
                               element += "<li class=list-group-item><p><a class=text-info href=#>" + Activity[i].By + "</a>" + Activity[i].Activity + "</p><small class=block text-muted><i class=fa fa-clock-o></i>" + Activity[i].Date + "</small></li>";
                               $('.ulRecentActivity').append(element);
                           }
                       } else {
                           var element = "<li class=list-group-item><p><b class=text-info>No Records found</b></small></li>";
                           $('.ulRecentActivity').append(element);
                       }
                   } else {
                       var element = "<li class=list-group-item><p><b class=text-info>No Records found</b></small></li>";
                       $('.ulRecentActivity').append(element);
                   }
               }


           }
           function returnPercentage(value, total) {
               return (value / total * 100).toFixed(2);
           }
        function BindLineChart() {
            var lineData = {
                labels: ["January", "February", "March", "April", "May", "June", "July"],
                datasets: [
                    {
                        label: "Example dataset",
                        fillColor: "rgba(220,220,220,0.5)",
                        strokeColor: "rgba(220,220,220,1)",
                        pointColor: "rgba(220,220,220,1)",
                        pointStrokeColor: "#fff",
                        pointHighlightFill: "#fff",
                        pointHighlightStroke: "rgba(220,220,220,1)",
                        data: [100, 100, 100, 100, 100, 100, 100]
                    },
                    {
                        label: "Example dataset",
                        fillColor: "rgba(26,179,148,0.5)",
                        strokeColor: "rgba(26,179,148,0.7)",
                        pointColor: "rgba(26,179,148,1)",
                        pointStrokeColor: "#fff",
                        pointHighlightFill: "#fff",
                        pointHighlightStroke: "rgba(26,179,148,1)",
                        data: [28, 48, 40, 19, 86, 27, 90]
                    }
                ]
            };

            var lineOptions = {
                scaleShowGridLines: true,
                scaleGridLineColor: "rgba(0,0,0,.05)",
                scaleGridLineWidth: 1,
                bezierCurve: true,
                bezierCurveTension: 0.4,
                pointDot: true,
                pointDotRadius: 4,
                pointDotStrokeWidth: 1,
                pointHitDetectionRadius: 20,
                datasetStroke: true,
                datasetStrokeWidth: 2,
                datasetFill: true,
                responsive: true,
            };


            var ctx = document.getElementById("lineChart").getContext("2d");
            var myNewChart = new Chart(ctx).Line(lineData, lineOptions);

        }
    </script>
</asp:Content>
