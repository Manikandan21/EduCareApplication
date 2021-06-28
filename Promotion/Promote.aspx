<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Promote.aspx.cs" Inherits="ILogisticsApplication.Promotion.Promote" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPanel" runat="server">
    <div class="wrapper wrapper-content fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Students Promotion <small>Manage students promotion configuration</small> <b style="color: red;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PLEASE DO THE CONFIGURATION VERY CAREFULLY</b></h5>
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
                            <div class="col-sm-2" id="divlabel" style="margin-bottom: 5px">
                                <h4 style="text-align: center; color: #EC4758" id="headlabel1"></h4>
                                <div class="form-group col-sm-12">
                                    <div style="height: 29px"></div>
                                    <input type="button" id="btnAdd" value="Add" onclick="return false;" class="btn btn-primary m-t-n-xs col-sm-8 btnAdd" />
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
                                                    <th style="text-align: center;">#</th>
                                                    <th style="text-align: center;">Current Course</th>
                                                    <th style="text-align: center;">Current Section</th>
                                                    <th style="text-align: center;">Promote Course</th>
                                                    <th style="text-align: center;">Promote Section</th>
                                                    <%--<th style="text-align: center;"> Edit Action</th>--%>
                                                    <th style="text-align: center;">Delete Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>

                        </div>
                         <div class="row" id="DivPromoteArea" style="display:none;" >
                             <div class="col-sm-5"></div>
                             <div class="col-sm-3" id="divpromoteSubmit" style="margin-bottom: 5px">
                                <h4 style="text-align: center; color: #EC4758" id="headlabel2"></h4>
                                <div class="form-group col-sm-12">
                                    <div style="height: 29px"></div>
                                    <input type="button" id="btnPromote" value="Promote"  class="btn btn-danger m-t-n-xs col-sm-8 btnPromote" />
                                </div>
                            </div>
                             <div class="col-sm-4"></div>
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
                    <button class="btn btn-danger" id="btnDelete" onclick="OnConfirmDelete();" type="button"><strong>Delete</strong></button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal inmodal" id="myPromoteModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content animated bounceInDown">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <i class="fa fa-question-circle modal-icon"></i>
                    <h1 class="modal-title">Are you sure proceed to promote?</h1>

                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">Close</button>
                    <button class="btn btn-primary" id="btnProceedPromote" onclick="Promote();" type="button"><strong>Yes! Proceed</strong></button>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" id="hdnId" runat="server" />
    <input type="hidden" id="hdnDeleteIndex" runat="server" />
    <script type="text/javascript">
        var MappedDataJson = [];
        $(document).ready(function () {
            //this dropdowns loading if promote functionality avaliable for the year. so it is replaced to loadData function.
            //BindDropdown('GetCourse', null, 0, '#ddlCourseCurrent');
            //BindDropdown('GetCourse', null, 0, '#ddlCoursePromote');
            //$('#ddlCoursePromote').append('<option value="-1">Alumni</option>');

            //var tabledata = $('#dataTable').DataTable();
            LoadData('select', '', '', '', '', '');

            $(".btnPromote").on("click", function () {
                $("#myPromoteModal").modal('show');
            });

            $(".btnAdd").on("click", function () {
                var CurrentCourse = $("#ddlCourseCurrent").find("option:selected").text();
                var CurrentSection = $("#ddlSectionCurrent").find("option:selected").text();
                var PromoteCourse = $("#ddlCoursePromote").find("option:selected").text();
                var PromoteSection = $("#ddlSectionPromote").find("option:selected").text();
                if (CurrentCourse == undefined || CurrentCourse == null || CurrentCourse == "--Select--") {
                    AppDisplayMessage("Please select current course. Also please fill all the mandatory fields.", 2);
                    return false;
                }
                if (CurrentSection == undefined || CurrentSection == null || CurrentSection == "--Select--") {
                    AppDisplayMessage("Please select current section. Also please fill all the mandatory fields.", 2);
                    return false;
                }
                if (PromoteCourse == undefined || PromoteCourse == null || PromoteCourse == "--Select--") {
                    AppDisplayMessage("Please select promote course. Also please fill all the mandatory fields.", 2);
                    return false;
                }
                if (PromoteSection == undefined || PromoteSection == null || PromoteSection == "--Select--") {
                    AppDisplayMessage("Please select promote section. Also please fill all the mandatory fields.", 2);
                    return false;
                }
                if (CurrentCourse != undefined && CurrentCourse != null && CurrentCourse != "--Select--" && PromoteCourse != undefined && PromoteCourse != null && PromoteCourse != "--Select--") {
                    if (CurrentCourse == PromoteCourse) {
                        AppDisplayMessage("Current course and promote course cannot be same.", 2);
                        return false;
                    }
                }
                //var rData = [CurrentCourse, CurrentSection, PromoteCourse, PromoteSection,
                //    '<a href="#" class="delete"><i class="fa fa-trash"></i></a>'
                //];
                cur = {};
                var insert = true;
                cur["CurrentCourse"] = CurrentCourse.trim();
                cur["CurrentSection"] = CurrentSection.trim();
                cur["PromoteCourse"] = PromoteCourse.trim();
                cur["PromoteSection"] = PromoteSection.trim();
                if (MappedDataJson.length != undefined && MappedDataJson.length != null && MappedDataJson.length > 0) {
                    $.each(MappedDataJson, function (index, element) {
                        if (element != undefined && element != null) {
                            var iElemntCurrCourse = element.CurrentCourse;
                            var iElemntCurrSection = element.CurrentSection;

                            //if (iElemntCurrCourse == CurrentCourse.trim() && iElemntCurrSection == CurrentSection.trim()) {
                            //    AppDisplayMessage("Already added this data. Please check it.", 2);
                            //    insert = false;
                            //    return false;
                            //}
                        }

                    });
                }
                if (insert) {
                    // tabledata.row.add(rData).draw(false);
                    LoadData('add', CurrentCourse.trim(), CurrentSection.trim(), PromoteCourse.trim(), PromoteSection.trim(), '');
                    //MappedDataJson.push(cur);
                    ClearControls();
                }
            });

            //$('#dataTable').on("click", ".delete", function () {
            //    var prgrmDataTable = $('#dataTable').DataTable();
            //    var tableRow = prgrmDataTable.row($(this).parents('tr'));
            //    delete MappedDataJson[tableRow[0][0]];
            //    prgrmDataTable.row(tableRow).remove().draw();
            //});
        });

        function Promote() {
            LoadData('submit', '', '', '', '', '');
            $("#myPromoteModal").modal('hide');
        }
        function LoadData(mode, currentCourse, currentSection, promoteCourse, promoteSection, Id) {
            var formEnable = true;
            var JsonData = [];
            var Request = new XMLHttpRequest();
            var url = '../Handlers/Promote.ashx?Mode=' + mode + '&CurrentCourse=' + currentCourse + '&CurrentSection=' + currentSection + '&PromoteCourse=' + promoteCourse + '&PromoteSection=' + promoteSection + '&Id=' + Id;
            Request.open("POST", url, false);
            Request.send();
            var Data = Request.responseText;

            if (Data != undefined) {
                Data = jQuery.parseJSON(Data);
                var msg = "";
                var msgCode;
                $.each(Data, function (index, PARAM) {

                    if (index != 0) {
                        JsonData.push([
                            index, PARAM.CurrentCourse, PARAM.CurrentSection, PARAM.PromoteCourse, PARAM.PromoteSection,
                            //"<a onclick='OnEdit(" + PARAM.Id + ")' ><i class='fa fa-edit scrollToTop'></i></a>",
                            "<a onclick='OnDelete(" + PARAM.Id + ")' data-target=#myModal data-toggle=modal><i class='fa fa-trash'></i></a>",
                        ]);
                    }
                    else if (index == 0) {
                        if (PARAM.Id == "0") {
                            if (PARAM.ReturnResult == 0) {
                                msg = "Data not saved. Please contact administrator.";
                                msgCode = 2;
                            }
                            if (PARAM.ReturnResult == 1) {
                                msg = "Data saved successfully.";
                                msgCode = 1;
                            }
                            if (PARAM.ReturnResult == 2) {
                                formEnable = false;
                                msg = "Already promotion done for the year.";
                                msgCode = 2;
                            }
                            if (PARAM.ReturnResult == 3) {
                                msg = "There is no matching configuration records for all the course(s) and section(s). Please check it.";
                                msgCode = 2;
                            }
                            if (PARAM.ReturnResult == 4) {
                                formEnable = false;
                                msg = "Promoted successfully.";
                                msgCode = 1;
                            }
                            if (PARAM.ReturnResult == 5) {
                                msg = "Already exist this configuration. Please check it.";
                                msgCode = 2;
                            }
                            if (PARAM.ReturnResult == 6) {
                                formEnable = false;
                                msg = "Promote can be done after generate the new academic year. Please contact administartor.";
                                msgCode = 2;
                            }

                        }
                    }

                });
                if (formEnable) {
                    //Dropdowns are loading here.
                    BindDropdown('GetCourse', null, 0, '#ddlCourseCurrent');
                    BindDropdown('GetCourse', null, 0, '#ddlCoursePromote');
                    $('#ddlCoursePromote').append('<option value="-1">Alumni</option>');

                    //To show promote button.
                    $("#DivPromoteArea").css("display", "block");

                    $('#dataTable').dataTable().fnDestroy();
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
                else {
                    $("#DivPromoteArea").css("display", "none")
                    $("#ddlCourseCurrent").empty().append('<option value="0">--Select--</option>')
                    $("#ddlCoursePromote").empty().append('<option value="0">--Select--</option>')
                    $("#ddlSectionCurrent").empty().append('<option value="0">--Select--</option>')
                    $("#ddlSectionPromote").empty().append('<option value="0">--Select--</option>')
                }

                if (msg != undefined && msg != null && msg != "")
                    AppDisplayMessage(msg, msgCode);
            }
        }
        function OnDelete(Id) {
            $('#<%=hdnId.ClientID %>').val(Id);
            var prgrmDataTable = $('#dataTable').DataTable();
            var tableRow = prgrmDataTable.row($(this).parents('tr'));
            $('#<%=hdnDeleteIndex.ClientID %>').val(tableRow[0][0]);
        }
        function OnConfirmDelete() {
            try {
                var deleteIndx = $('#<%=hdnDeleteIndex.ClientID %>').val();
                delete MappedDataJson[deleteIndx];
            }
            catch (e) {
                console.log('error occured.');
            }
            var id = $('#<%=hdnId.ClientID %>').val();
            LoadData('delete', '', '', '', '', id);
            $('#myModal').modal('hide');
        }
        function ClearControls() {
            $("#ddlCourseCurrent").val("0");
            $("#ddlSectionCurrent").val("0");
            $("#ddlCoursePromote").val("0");
            $("#ddlSectionPromote").val("0");
        }
        $(".ddlCourseCurrent").change(function () {
            Course = $(this).find("option:selected").text();
            BindDropdown('GetSection', Course, 0, '#ddlSectionCurrent');
            $(".ddlSectionCurrent").focus();
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

    </script>
</asp:Content>
