<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="HolidayMaster.aspx.cs" Inherits="ILogisticsApplication.Configuration.HolidayMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPanel" runat="server">
    <div class="wrapper wrapper-content fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>View Holidays & Week End</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div class="row" style="height: auto">
                            <div class="col-sm-12" id="divEditable" style="margin-bottom: 5px">
                                <h4 style="text-align: center; color: #EC4758" id="headEditable"></h4>
                                <div class="form-group col-sm-3">
                                    <label>Select Academic <span class="text-danger">*</span></label>
                                    <asp:DropDownList ID="ddlType" runat="server" CssClass="form-control ddlAcademic">
                                    </asp:DropDownList>

                                </div>
                                <div class="form-group  col-sm-3" runat="server" id="divAction">
                                    <div style="height: 29px"></div>
                                    <asp:Button ID="btnMarkHolidays" runat="server" Text="Submit" CssClass="btn btn-primary m-t-n-xs col-sm-8 btnGenerate" />
                                </div>
                                <%--OnClick="btnMarkHolidays_Click" OnClientClick="if (!Validate()) {return false;}" --%>
                            </div>
                        </div>
                        <div class="row" style="height: auto">
                            <div class="col-sm-12">
                                <div class="ibox">
                                    <div class="">
                                        <table style="text-align: center; width: 100%" id="dataTable" class="table table-bordered">
                                            <thead id="thead">
                                                <tr>
                                                    <th style="text-align: center;">Holiday Type</th>
                                                    <th style="text-align: center;">Academic Year</th>
                                                    <th style="text-align: center;">Holiday</th>
                                                    <th style="text-align: center;">Description</th>
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

    <!--Datatable-->
    <script src="../Resource/js/plugins/dataTables/datatables.min.js"></script>
    <script type="text/javascript">
        $("#tHead").removeClass('sorting_asc');
        window.ArrayData = new Array();

        $(document).ready(function () {
            //$('#dataTable').DataTable({

            //    "bSearchable": false,
            //    "bSortable": false,
            //    "bFilter": false,
            //    "bInfo": true,
            //    "bPaginate": false,
            //    "bLengthChange": false,
            //    "bVisible": false,
            //    "oLanguage": {
            //        "sEmptyTable": "No records found"
            //    },
            //});

            $(".btnGenerate").click(function () {
                var AcademicYr = $("#<%= ddlType.ClientID %>" + " option:selected").html();
                BindStudentData(AcademicYr);
                return false;
            });

            function BindStudentData(AcademicYr) {
                try {
                    ArrayData = [];
                    var Id = 0;
                    $('#dataTable').dataTable().fnDestroy();
                    var JsonData = [];


                    //Get Json Data from Server

                    var Request = new XMLHttpRequest();
                    var url = '../Handlers/HolidayList.ashx?AcademicYr=' + AcademicYr;
                    Request.open("GET", url, false);
                    Request.send();
                    var Data = Request.responseText;

                    if (Data != undefined) {
                        $("#divAction").show();
                        Data = jQuery.parseJSON(Data);
                        $.each(Data, function (index, PARAM) {
                            JsonData.push([
                                PARAM.HolidayType,
                                PARAM.AcademicYear,
                                PARAM.Holiday, PARAM.Description,
                            ]);
                        });
                        $('#dataTable').dataTable({
                            "bRetrieve": true,
                            "bDestroy": true,
                            "bSearchable": true,
                            "bSortable": true,
                            "bFilter": true,
                            "bInfo": true,
                            "bLengthChange": false,
                            "bVisible": false,
                            "sPaginationType": "full_numbers",
                            "sPaging": "pagination",
                            "bProcessing": true,
                            "bPaginate": true,
                            "iDisplayLength": 100,
                            "oLanguage": {
                                "sEmptyTable": "No records found"
                            },
                            "aaData": JsonData,

                        });
                    }
                }
                catch (e) {
                    alert(e.message);
                }
            }
        });
    </script>
</asp:Content>

