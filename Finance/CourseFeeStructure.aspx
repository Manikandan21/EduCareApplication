<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="CourseFeeStructure.aspx.cs" Inherits="ILogisticsApplication.Finance.CourseFeeStructure" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPanel" runat="server">
    <div class="wrapper wrapper-content fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Fee Structure Creation / Deletion / View &nbsp;&nbsp;&nbsp;&nbsp;<small> Manage fee structure for all the courses</small></h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div id="divActionArea" class="ibox-content">
                        <div class="row">
                            <div class="col-sm-3" id="divAction" style="margin-bottom: 5px">
                                <h4 style="text-align: center; color: #EC4758" id="headEditable1"></h4>
                                <div class="form-group col-sm-12">
                                    <label>Select Action *</label>
                                    <select class="form-control ddlAction" id="ddlAction" clientidmode="static" runat="server">
                                        <option value="0">--Select--</option>
                                        <option value="INSERT">CREATE A NEW FEE</option>
                                        <option value="VIEW">VIEW ALL FEE</option>
                                        <option value="DELETE">DELETE FEE</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row" id="divTermContentArea" style="display: none;">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Select the term *</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div class="row">
                            <div class="col-sm-12">
                                <input type="checkbox" id="TermHeaderCheckBox" />
                                <label>All Term</label>
                            </div>
                        </div>
                        <hr />
                        <div id="DivAddTerms" class="row">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row" id="divCategoryContentArea" style="display: none;">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Select the category of fee.</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div class="row">
                            <div class="col-sm-3" id="divCategory" style="margin-bottom: 5px">
                                <h4 style="text-align: center; color: #EC4758" id="headEditable2"></h4>
                                <div class="form-group col-sm-12">
                                    <label>Select Category *</label>
                                    <select class="form-control ddlCategory" id="ddlCategory" clientidmode="static" runat="server">
                                        <option value="0">--Select--</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row" id="divCourseContentArea" style="display: none;">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Select the course *</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div class="row">
                            <div class="col-sm-12">
                                <input type="checkbox" id="CourseHeaderCheckBox" />
                                <label>All Course</label>
                            </div>
                        </div>
                        <hr />
                        <div id="DivAddCourse" class="row">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row" id="divFeeAmtSubmitContentArea" style="display: none;">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Enter the fee description & Amount</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div class="row">
                            <div class="col-sm-6" id="divFeeCreateSubmit" style="margin-bottom: 5px">
                                <h4 style="text-align: center; color: #EC4758" id="headEditable5"></h4>
                                <div class="form-group col-sm-12">
                                    <label>Fee Desc. *</label>
                                    <asp:TextBox ID="txtFeeDescription" runat="server" CssClass="form-control" placeholder="Type fee description"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-sm-3" id="divFeeAmt" style="margin-bottom: 5px">
                                <h4 style="text-align: center; color: #EC4758" id="headEditable6"></h4>
                                <div class="form-group col-sm-12">
                                    <label>Fee Amount *</label>
                                    <asp:TextBox ID="txtFeeAmt" TextMode="Number" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <h4 style="text-align: center; color: #EC4758" id="headEditable7"></h4>
                                <div class="form-group col-sm-12 divlabelbtn">
                                    <div style="height: 29px"></div>
                                    <input type="button" id="btnCreate" value="Create Fee" onclick="return false;" class="btn btn-primary m-t-n-xs col-sm-8 btnCreate" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row" id="divFeeSearchSubmitContentArea" style="display: none;">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <%--<div class="ibox-title">
                        <h5>Generate the fee structure</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>--%>
                    <%--<div class="ibox-content">--%>
                    <div class="row">
                        <div class="col-sm-6">
                        </div>
                        <div class="col-sm-3">
                        </div>
                        <div class="col-sm-3">
                            <h4 style="text-align: center; color: #EC4758" id="headEditable4"></h4>
                            <div class="form-group col-sm-12 divlabelbtn">
                                <div style="height: 29px"></div>
                                <input type="button" id="btnSearch" value="Search Fee" onclick="return false;" class="btn btn-primary m-t-n-xs col-sm-8 btnSearch" />
                            </div>
                        </div>
                    </div>
                    <%--</div>--%>
                </div>
            </div>
        </div>
        <div class="row" id="divGridViewData" style="display: none;">
            <div class="col-sm-12">
                <div class="row">
                    <div class="col-sm-5">
                    </div>
                    <div class="col-sm-2">
                        <input type="button" id="btnGoBack" value="Go Back" onclick="return false;" class="btn btn-primary m-t-n-xs col-sm-8 btnGoBack" />
                    </div>
                    <div class="col-sm-5">
                    </div>
                </div>
            </div>
             <div class="col-sm-12" style="margin-top:5px"></div>
            <div class="col-sm-12">
                <div class="ibox">
                    <div class="">
                        <table style="text-align: center; width: 100%;" id="ViewdataTable"  class="table table-bordered">
                            <thead id="thead">
                                <tr>
                                    <th style="text-align: center;">#</th>
                                    <th style="text-align: center;">Course</th>
                                    <th style="text-align: center;">Term</th>
                                    <th style="text-align: center;">Category</th>
                                    <th style="text-align: center;">Fee Description</th>
                                    <th style="text-align: center;">Fee Amount</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-sm-12">
                <div class="row">
                    <div class="col-sm-5">
                    </div>
                    <div class="col-sm-2">
                        <input type="button" id="btnGoBack1" value="Go Back" onclick="return false;" class="btn btn-primary m-t-n-xs col-sm-8 btnGoBack" />
                    </div>
                    <div class="col-sm-5">
                    </div>
                </div>
            </div>
        </div>
        <div class="row" id="divGridDeleteData" style="display: none;">
            <div class="col-sm-12">
                <div class="row">
                    <div class="col-sm-4">
                    </div>
                    <div class="col-sm-2">
                        <input type="button" id="btnDelteGoBack" value="Go Back" onclick="return false;" class="btn btn-primary m-t-n-xs col-sm-8 btnGoBack" />
                    </div>
                    <div class="col-sm-2">
                        <input type="button" id="btnDelete" value="Delete" onclick="return false;" class="btn btn-danger m-t-n-xs col-sm-8 btnDelete" />
                    </div>
                    <div class="col-sm-4">
                    </div>
                </div>
            </div>
             <div class="col-sm-12" style="margin-top:5px"></div>
            <div class="col-sm-12">
                <div class="ibox">
                    <div class="">
                        <table style="text-align: center; width: 100%;" id="DeletedataTable"  class="table table-bordered">
                            <thead id="thead">
                                <tr>
                                    <th style="text-align: center;">#</th>
                                    <th style="text-align: center;"><input type="checkbox" class="i-checks" id="DeleteAllCheckbox" /></th>
                                    <th style="text-align: center;">Course</th>
                                    <th style="text-align: center;">Term</th>
                                    <th style="text-align: center;">Category</th>
                                    <th style="text-align: center;">Fee Description</th>
                                    <th style="text-align: center;">Fee Amount</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-sm-12">
                <div class="row">
                    <div class="col-sm-4">
                    </div>
                    <div class="col-sm-2">
                        <input type="button" id="btnDeleteGoBack1" value="Go Back" onclick="return false;" class="btn btn-primary m-t-n-xs col-sm-8 btnGoBack" />
                    </div>
                    <div class="col-sm-2">
                        <input type="button" id="btnDelete1" value="Delete" onclick="return false;" class="btn btn-danger m-t-n-xs col-sm-8 btnDelete" />
                    </div>
                    <div class="col-sm-4">
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
                    <h1 class="modal-title">Are you sure want to delete the fee?</h1>

                </div> 
                <%--<div id="divStudentList" style="padding-top: 10px">
                    <ul id="ulStudentLst">
                    </ul>
                </div>--%>
                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">Close</button>
                    <button class="btn btn-danger" id="btnDeleteConfirm" onclick="DeleteFee()" type="button"><strong>Confirm</strong></button>
                    <%-- onserverclick="Save_Click"--%>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        window.TermArrayData = new Array();
        window.CourseArrayData = new Array();

        $(document).ready(function () {
            BindDropDown_finance("TERM", "DIV", "#DivAddTerms", "#divTermContentArea", "");
            BindDropDown_finance("CATEGORY", "DROPDOWN", "#ddlCategory", "#divCategoryContentArea", "");
            BindDropDown_finance("COURSE", "DIV", "#DivAddCourse", "#divCourseContentArea", "");

            //Load data table.
            $('#ViewdataTable').DataTable({

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

            $('#DeletedataTable').DataTable({

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

        });
        $('.ddlAction').change(function () {
            var Action = $(this).find("option:selected").val();
            $("#divTermContentArea").attr("style", "display:block");
            $("#divCategoryContentArea").attr("style", "display:block");
            $("#divCourseContentArea").attr("style", "display:block");
            $("#divGridViewData").attr("style", "display:none");
            $("#divGridDeleteData").attr("style", "display:none");

            clearControls();

            if (Action == "INSERT") {
                $("#divFeeAmtSubmitContentArea").attr("style", "display:block");
                $("#divFeeSearchSubmitContentArea").attr("style", "display:none");
            }
            else if (Action == "0") {
                $("#divFeeAmtSubmitContentArea").attr("style", "display:none");
                $("#divFeeSearchSubmitContentArea").attr("style", "display:none");
            }
            else {
                //$("#divTermContentArea").attr("style", "display:none");
                //$("#divCategoryContentArea").attr("style", "display:none");
                //$("#divCourseContentArea").attr("style", "display:none");
                $("#divFeeAmtSubmitContentArea").attr("style", "display:none");
                $("#divFeeSearchSubmitContentArea").attr("style", "display:block");
            }
        });
        $("#TermHeaderCheckBox").click(function () {
            if ($(this).is(':checked')) {
                $("#DivAddTerms").find('input[type=checkbox]').prop('checked', true);
            }
            else {
                $("#DivAddTerms").find('input[type=checkbox]').prop('checked', false);
            }

        });
        $("#CourseHeaderCheckBox").click(function () {
            if ($(this).is(':checked')) {
                $("#DivAddCourse").find('input[type=checkbox]').prop('checked', true);
            }
            else {
                $("#DivAddCourse").find('input[type=checkbox]').prop('checked', false);
            }
        });
        $("#btnCreate").click(function () {
            TermArrayData = [];
            CourseArrayData = [];
            var Action = $("#ddlAction").find("option:selected").val();
            if (Action == undefined || Action == null || Action == "0") {
                AppDisplayMessage("Please select the action.", 2);
                $("#ddlAction").focus();
                return false;
            }
            $.each($("#DivAddTerms").find('input[type=checkbox]:checked'), function () {
                TermArrayData.push($(this)[0].name);
            });
            if (TermArrayData.length == 0) {
                AppDisplayMessage("Please select one or more term.", 2);
                return false;
            }
            var Category = $("#ddlCategory").find("option:selected").text();
            if (Category == undefined || Category == null || Category == "--Select--") {
                AppDisplayMessage("Please select the category.", 2);
                $("#ddlCategory").focus();
                return false;
            }
            $.each($("#DivAddCourse").find('input[type=checkbox]:checked'), function () {
                CourseArrayData.push($(this).val());
            });
            if (CourseArrayData.length == 0) {
                AppDisplayMessage("Please select one or more course.", 2);
                return false;
            }
            var FeeDesc = $("#<%= txtFeeDescription.ClientID %>").val();
            if (FeeDesc == undefined || FeeDesc == null || FeeDesc == "") {
                AppDisplayMessage("Please enter the fee description.", 2);
                $("#<%= txtFeeDescription.ClientID %>").focus();
                return false;
            }
            var FeeAmt = $("#<%= txtFeeAmt.ClientID %>").val();
            if (FeeAmt == undefined || FeeAmt == null || FeeAmt == "") {
                AppDisplayMessage("Please enter the fee amount.", 2);
                $("#<%= txtFeeAmt.ClientID %>").focus();
                return false;
            }
            GetAndSaveData(Action, TermArrayData, Category, CourseArrayData, FeeDesc, FeeAmt, "");
            if (Action == "INSERT") {
                clearControls();
            }
        });
        function clearControls() {
            TermArrayData = [];
            CourseArrayData = [];
            $("#TermHeaderCheckBox").prop('checked', false);
            $("#DivAddTerms").find('input[type=checkbox]').prop('checked', false);
            $("#CourseHeaderCheckBox").prop('checked', false);
            $("#DivAddCourse").find('input[type=checkbox]').prop('checked', false);
            $("#<%= txtFeeDescription.ClientID %>").val("");
            $("#<%= txtFeeAmt.ClientID %>").val("");
            $("#ddlCategory").val("0");
        }
        $("#btnSearch").click(function () {
            TermArrayData = [];
            CourseArrayData = [];
            var Action = $("#ddlAction").find("option:selected").val();
            $.each($("#DivAddTerms").find('input[type=checkbox]:checked'), function () {
                TermArrayData.push($(this)[0].name);
            });
            var Category = $("#ddlCategory").find("option:selected").text();
            if (Category == '--Select--') {
                Category = "";
            }
            $.each($("#DivAddCourse").find('input[type=checkbox]:checked'), function () {
                CourseArrayData.push($(this).val());
            });
            GetAndSaveData(Action, TermArrayData, Category, CourseArrayData, "", "", "");
            if (Action != "INSERT") {
                 $("#divTermContentArea").attr("style", "display:none");
                 $("#divCategoryContentArea").attr("style", "display:none");
                $("#divCourseContentArea").attr("style", "display:none");
                $("#divFeeSearchSubmitContentArea").attr("style", "display:none");
                if (Action != "DELETE") {
                    $("#divGridViewData").attr("style", "display:block");
                    $("#divGridDeleteData").attr("style", "display:none");
                }
                else {
                     $("#divGridViewData").attr("style", "display:none");
                     $("#divGridDeleteData").attr("style", "display:block");
                }
                
            }
        });
        $(".btnGoBack").click(function () {
                $("#divTermContentArea").attr("style", "display:block");
                $("#divCategoryContentArea").attr("style", "display:block");
                $("#divCourseContentArea").attr("style", "display:block");
                $("#divFeeSearchSubmitContentArea").attr("style", "display:block");
                $("#divGridViewData").attr("style", "display:none");
                $("#divGridDeleteData").attr("style", "display:none");
        });
        $('#DeleteAllCheckbox').click(function () {
            if ($(this).is(':checked')) {
               $("#divGridDeleteData").find('table td').find('input[type=checkbox]').prop('checked', true);
            }
            else {
              $("#divGridDeleteData").find('table td').find('input[type=checkbox]').prop('checked', false);
            }
        })
        function DeleteFee() {
            var Category = $("#ddlCategory").find("option:selected").text();
            if (Category == "--Select--") {
                Category = "";
            }
            var DeleteFeeIdArray = new Array();
             $.each($("#divGridDeleteData").find('table td').find('input[type=checkbox]:checked'), function () {
                DeleteFeeIdArray.push($(this)[0].id);
            });
            if (DeleteFeeIdArray.length == 0) {
                 AppDisplayMessage("Please select any fee to delete.", 2);
                return false;
            }
              GetAndSaveData("DELETE", TermArrayData, Category, CourseArrayData, "", "", DeleteFeeIdArray);
        }
        $(".btnDelete").click(function () {
            var isFeeSelected = $("#divGridDeleteData").find('table td').find('input[type=checkbox]:checked');
            if (isFeeSelected.length > 0) {
                $(this).attr("data-toggle", "modal");
                $(this).attr("data-placement", "top");
                $(this).attr("data-target", "#myModal");
            }
            else {
                AppDisplayMessage("Please select any fee to delete.", 2);
                return false;
            }
            
        });
    </script>
</asp:Content>
