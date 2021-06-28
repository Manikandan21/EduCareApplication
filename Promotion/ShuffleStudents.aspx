<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ShuffleStudents.aspx.cs" Inherits="ILogisticsApplication.Promotion.ShuffleStudents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPanel" runat="server">
    <div class="wrapper wrapper-content fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Shuffle Students <small>Shuffling students to different classes</small></h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div class="row">
                            <div class="col-sm-5" id="divCurrent" style="margin-bottom: 5px">
                                <h4 style="text-align: center; color: #EC4758" id="headEditable1"></h4>
                                <div class="form-group col-sm-6">
                                    <label>Current Course *</label>
                                    <select class="form-control ddlCourseCurrent" id="ddlCourseCurrent" clientidmode="static" runat="server">
                                        <option value="0">--Select--</option>
                                    </select>
                                </div>
                                <div class="form-group  col-sm-6">
                                    <label>Current Section *</label>
                                    <select class="form-control ddlSectionCurrent" id="ddlSectionCurrent" clientidmode="static" runat="server">
                                        <option value="0">--Select--</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-sm-5" id="divNextLevel" style="margin-bottom: 5px">
                                <h4 style="text-align: center; color: #EC4758" id="headEditable2"></h4>
                                <div class="form-group col-sm-6">
                                    <label>Promote Course *</label>
                                    <select class="form-control ddlCoursePromote" id="ddlCoursePromote" clientidmode="static" runat="server">
                                        <option value="0">--Select--</option>
                                    </select>
                                </div>
                                <div class="form-group  col-sm-6">
                                    <label>Promote Section *</label>
                                    <select class="form-control ddlSectionPromote" id="ddlSectionPromote" clientidmode="static" runat="server">
                                        <option value="0">--Select--</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-2" id="divlabelbtn" style="margin-bottom: 5px; display: none;">
                                <h4 style="text-align: center; color: #EC4758" id="headlabel1"></h4>
                                <div class="form-group col-sm-12">
                                    <div style="height: 29px"></div>
                                    <input type="button" id="btnPromote" value="Add" onclick="return false;" class="btn btn-primary m-t-n-xs col-sm-8 btnPromote" />
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-12">
                                <div class="ibox">

                                    <div class="">

                                        <table style="text-align: center; width: 100%" id="dataTable" class="table table-bordered">
                                            <thead id="thead">
                                                <tr>
                                                    <th style="text-align: center;">#
                                                      <%--  <input type="checkbox" id="hCheckbox" />--%>
                                                    </th>
                                                    <th style="text-align: center;">Student Name</th>
                                                    <th style="text-align: center;">Course</th>
                                                    <th style="text-align: center;">Section</th>

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
    <script type="text/javascript">
        var Course = '';
        var CurrCourse = '';
        window.ArrayData = new Array();
        $(document).ready(function () {
            BindDropdown('GetCourse', null, 0, '#ddlCourseCurrent');
            BindDropdown('GetCourse', null, 0, '#ddlCoursePromote');
            //$('#ddlCoursePromote').append('<option value="-1">Alumni</option>');

            $('#dataTable').DataTable({

                "bSearchable": false,
                "bSortable": false,
                "bFilter": false,
                "bInfo": true,
                "bPaginate": false,
                "bLengthChange": false,
                "bVisible": false,
                "oLanguage": {
                    "sEmptyTable": "No records found"
                },
            });

            $(".btnPromote").on("click", function () {
                var CurrentCourse = $("#ddlCourseCurrent").find("option:selected").text();
                var CurrentSection = $("#ddlSectionCurrent").find("option:selected").text();
                var PromoteCourse = $("#ddlCoursePromote").find("option:selected").text();
                var PromoteSection = $("#ddlSectionPromote").find("option:selected").text();
                //if (CurrentCourse == undefined || CurrentCourse == null || CurrentCourse == "--Select--") {
                //    AppDisplayMessage("Please select current course. Also please fill all the mandatory fields.", 2);
                //    return false;
                //}
                //if (CurrentSection == undefined || CurrentSection == null || CurrentSection == "--Select--") {
                //    AppDisplayMessage("Please select current section. Also please fill all the mandatory fields.", 2);
                //    return false;
                //}
                if (PromoteCourse == undefined || PromoteCourse == null || PromoteCourse == "--Select--") {
                    AppDisplayMessage("Please select promote course. Also please fill all the mandatory fields.", 2);
                    return false;
                }
                if (PromoteSection == undefined || PromoteSection == null || PromoteSection == "--Select--") {
                    AppDisplayMessage("Please select promote section. Also please fill all the mandatory fields.", 2);
                    return false;
                }
                if (CurrentCourse != undefined && CurrentCourse != null && CurrentCourse != "--Select--" && PromoteCourse != undefined && PromoteCourse != null && PromoteCourse != "--Select--") {
                    if (CurrentCourse == PromoteCourse && CurrentSection == PromoteSection) {
                        AppDisplayMessage("Current course & section and promote course & section cannot be same.", 2);
                        return false;
                    }
                }
                BindStudentData(CurrentCourse, CurrentSection, PromoteCourse, PromoteSection, 'SUBMIT', ArrayData);
            });
        });
        function ClearControls() {
            $("#ddlCourseCurrent").val("0");
            $("#ddlSectionCurrent").val("0");
            $("#ddlCoursePromote").val("0");
            $("#ddlSectionPromote").val("0");
        }
        $(".ddlCourseCurrent").change(function () {
            Course = $(this).find("option:selected").text();
            CurrCourse = Course;
            BindDropdown('GetSection', Course, 0, '#ddlSectionCurrent');
            if (Course == '--Select--') {
                $('#dataTable').dataTable().fnDestroy();
                var JsonData = [];
                $('#dataTable').DataTable({

                    "bSearchable": false,
                    "bSortable": false,
                    "bFilter": false,
                    "bInfo": true,
                    "bPaginate": false,
                    "bLengthChange": false,
                    "bVisible": false,
                    "oLanguage": {
                        "sEmptyTable": "No records found"
                    },
                    "aaData": JsonData,
                });

            }
            $(".ddlSectionCurrent").focus();
            $("#divlabelbtn").hide();
        });
        $(".ddlCoursePromote").change(function () {
            Course = $(this).find("option:selected").text();
            if (Course != undefined && Course != null && Course != "Alumni") {
                BindDropdown('GetSection', Course, 0, '#ddlSectionPromote');
                $(".ddlSectionPromote").focus();
            }
            else {
                $(".ddlSectionPromote option").each(function () {
                    $(this).remove();
                });
                $('#ddlSectionPromote').append('<option value="0">--Select--</option>');
                $('#ddlSectionPromote').append('<option value="1">Alumni</option>');
            }
        });

        $(".ddlSectionCurrent").change(function () {
            var Section = $(this).find("option:selected").text();
            BindStudentData(CurrCourse, Section, '', '', 'GETDATA', '');
            $("#divlabelbtn").hide();
        });

        function BindStudentData(curCourse, curSection, promCourse, promSection, Mode, Ids) {
            try {
                ArrayData = [];

                $('#dataTable').dataTable().fnDestroy();
                var JsonData = [];

                var Request = new XMLHttpRequest();
                var url = '../Handlers/Shuffle.ashx?Mode=' + Mode + '&Ids=' + Ids + '&CurrentCourse=' + curCourse + '&CurrentSection=' + curSection + '&PromoteCourse=' + promCourse + '&PromoteSection=' + promSection;
                Request.open("GET", url, false);
                Request.send();
                var Data = Request.responseText;

                if (Data != undefined) {
                    Data = jQuery.parseJSON(Data);
                    $.each(Data, function (index, PARAM) {
                        if (index == 0) {
                            if (Mode == 'SUBMIT') {
                                //CourseCode here used for status of hitting DB.
                                var returnResult = PARAM.CourseCode;
                                if (returnResult == '1') {
                                    AppDisplayMessage('Selected student(s) moved successfully.', 1);
                                }
                                else {
                                    AppDisplayMessage('Unable to process, Please contact administrator.',2);
                                }
                                //ClearControls();
                            }
                        }
                        else {
                            JsonData.push([
                                "<input type=checkbox class=i-checks id=" + PARAM.studentId + ">",
                                "<a id=name" + PARAM.studentId + ">" + PARAM.StudentName + "</a>",
                                PARAM.Course, PARAM.Section,
                            ]);
                        }

                    });

                    $('#dataTable').dataTable({
                        "bRetrieve": true,
                        "bDestroy": true,
                        "bSearchable": true,
                        "bSortable": false,
                        "bFilter": false,
                        "bInfo": true,
                        "bLengthChange": false,
                        "bVisible": false,
                        "sPaginationType": "full_numbers",
                        "sPaging": "pagination",
                        "bProcessing": true,
                        "bPaginate": false,
                        "iDisplayLength": 100,
                        "oLanguage": {
                            "sEmptyTable": "No records found"
                        },
                        "aaData": JsonData,

                    });
                    checkboxclick();
                }
                $("#divlabelbtn").hide();
            }
            catch (e) {
                alert(e.message);
                console.log(e);
            }
        }
        function checkboxclick() {
            $('.i-checks').click(function () {
                try {

                    if ($(this).is(':checked')) {
                        //alert(ArrayData);
                        ArrayData.push($(this).attr("id"));
                        //alert(ArrayData);
                    } else {

                        if (ArrayData.length > 0) {

                            for (var i = ArrayData.length - 1; i >= 0; i--) {
                                //alert('Array : ' + ArrayData[i]);
                                //alert('id : ' + $(this).attr("id"));
                                if ('' + ArrayData[i] + '' === '' + $(this).attr("id") + '') {
                                    //alert('eql');
                                    ArrayData.splice(i, 1);
                                }
                            }
                        }
                    }
                    //Show the shuffle button.
                    if (ArrayData.length > 0) {
                        $("#divlabelbtn").show();
                    }
                    else {
                        $("#divlabelbtn").hide();
                    }

                }
                catch (e) {
                    alert(e);
                }
            });
        }

    </script>
</asp:Content>
