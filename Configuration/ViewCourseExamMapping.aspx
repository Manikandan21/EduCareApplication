<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ViewCourseExamMapping.aspx.cs" Inherits="ILogisticsApplication.Configuration.ViewCourseExamMapping" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPanel" runat="server">
    <div class="wrapper wrapper-content fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Courses & Exam mapping <small>Manage course / exam details</small></h5>
                        
                        <div class="btn btn-sm btn-primary m-t-n-xs col-sm-2 pull-right">
                            <a class="collapse-link" style="font-family: open sans,Helvetica Neue,Helvetica,Arial,sans-serif;font-size: 13px;" href="CourseExamMapping.aspx?MenuID=79">                                
                               <i class="fa fa-edit" style="color:white;"> Create Mapping</i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <asp:Panel ID="pnlAction" runat="server">
                            <div class="row">
                                <div class="col-sm-12" id="divEditable" style="margin-bottom: 5px">
                                    <h4 style="text-align: center; color: #EC4758" id="headEditable"></h4>
                                    <div class="form-group col-sm-3">
                                        <label>Course <span class="text-danger">*</span></label>
                                        <select class="form-control ddlCourse" id="ddlCourse" clientidmode="static" runat="server">
                                            <option value="0">--Select--</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-sm-3">
                                        <label>Section <span class="text-danger">*</span></label>
                                        <select class="form-control ddlSection" id="ddlSection" clientidmode="static" runat="server">
                                            <option value="0">--Select--</option>
                                        </select>
                                    </div>

                                    <div class="form-group  col-sm-3" runat="server" id="divAction">
                                        <div style="height: 29px"></div>
                                        <button class="btn btn-sm btn-primary m-t-n-xs col-sm-8" id="btnSubmit" runat="server" type="button" onclick="BindData()"><strong>Get Data</strong></button>
                                    </div>
                                    <div class="form-group  col-sm-3" id="divAddExam" style="display: none">
                                        <div style="height: 29px"></div>
                                        <strong><a data-target='#AddNew' class="btn btn-sm btn-primary m-t-n-xs col-sm-8" data-toggle='modal'>Add new Exam</a></strong>
                                       
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>

                        <div class="row">
                            <div class="col-sm-12">
                                <div class="ibox">

                                    <div class="">

                                        <table style="text-align: center; width: 100%" id="dataTable" class="table table-bordered">
                                            <thead>
                                                <tr>
                                                    <th style="text-align: center;">#</th>
                                                    <th style="text-align: center;">Course</th>
                                                    <th style="text-align: center;">Section</th>
                                                    <th style="text-align: center;">Exam</th>
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
                    <button class="btn btn-danger" id="btnDelete" onclick="DeleteConfirm()" runat="server" type="button"><strong>Delete</strong></button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal inmodal" id="AddNew" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content animated bounceInDown">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>

                    <h4 class="modal-title">Add new Exam</h4>
                </div>
                <%-- <div class="row">
                  
                </div>--%>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-sm-12" id="div2" style="margin-bottom: 5px">
                            <h4 style="text-align: center; color: #EC4758" id="h2"></h4>
                            <div class="form-group  col-sm-2"></div>
                            <div class="form-group  col-sm-6">

                                <select class="form-control ddlExam" id="ddlExam" runat="server">
                                    <option value="0">-- Select Exam --</option>
                                </select>
                            </div>
                            <div class="form-group  col-sm-4">
                                <button class="btn btn-xl btn-primary col-sm-12" id="btnAddNew" runat="server" type="button" onclick="OnAddNew()">Save</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" id="hdnId" runat="server" />
    <input type="hidden" id="hdnCourse" />
    <input type="hidden" id="hdnSection" />
    <input type="hidden" id="hdnExam" />
    <input type="hidden" id="hdnMode" runat="server" />
    <script type="text/javascript">
        $(document).ready(function () {
            BindDropdown('GetCourse', null, 0, '#ddlCourse');
            $('#dataTable').DataTable({

                "bSearchable": false,
                "bSortable": false,
                "bFilter": true,
                "bInfo": true,
                "bLengthChange": false,
                "bVisible": false,
                "oLanguage": {
                    "sEmptyTable": "No records found"
                },
            });
        });
        $(".ddlCourse").change(function () {
            $("#hdnCourse").val('');
            var courseIndex = $(".ddlCourse").prop('selectedIndex');
            if (courseIndex == 0) {
                $("#divAddExam").hide();
            } else {
                Course = $(this).find("option:selected").text();
                BindDropdown('GetSection', Course, 0, '#ddlSection');
                $("#hdnCourse").val(Course);
                $(".ddlSection").focus();
            }
        });
        $(".ddlSection").change(function () {
            $("#hdnSection").val('');
            var sectionIndex = $(".ddlSection").prop('selectedIndex');
            if (sectionIndex == 0) {
                $("#divAddExam").hide();
            } else {
                $("#hdnSection").val($(this).find("option:selected").text());
            }
        });
        $(".ddlExam").change(function () {
            $("#hdnExam").val($(this).find("option:selected").val());
        });
        function AddNewExam() {
            var JsonData = [];
            var Mode = 'ExceptCourseExam';
            var Course = $("#hdnCourse").val();
            var Section = $("#hdnSection").val();
            //Get Json Data from Server

            var Request = new XMLHttpRequest();
            var url = '../Handlers/CourseMapping.ashx?Mode=' + Mode + '&Course=' + Course + '&Section=' + Section + '&Id=0';
            Request.open("GET", url, false);
            Request.send();
            var Data = Request.responseText;

            if (Data != undefined) {
                Data = jQuery.parseJSON(Data);

                $("#<%=ddlExam.ClientID %>").empty();;
                $("#<%=ddlExam.ClientID %>").append('<option value=0>--Select Exam--</option>');
                $.each(Data, function (index, PARAM) {
                    $("#<%=ddlExam.ClientID %>").append('<option value="' + PARAM.Id + '">' + PARAM.Exam + '</option>');
                });

                }

            }
            function BindData() {
                try {
                    var courseIndex = $(".ddlCourse").prop('selectedIndex');
                    var sectionIndex = $(".ddlSection").prop('selectedIndex');
                    if (sectionIndex == 0 && courseIndex == 0) {
                        AppDisplayMessage('Please select the course and section', 2);
                        return false;
                    }
                    else {
                        $('#dataTable').dataTable().fnDestroy();
                        var JsonData = [];
                        var Mode = 'GetByCourseExam';
                        var Id = 0;
                        var Course = $("#hdnCourse").val();
                        var Section = $("#hdnSection").val();
                        //Get Json Data from Server

                        var Request = new XMLHttpRequest();
                        var url = '../Handlers/CourseMapping.ashx?Mode=' + Mode + '&Course=' + Course + '&Section=' + Section + '&Id=0';
                        Request.open("GET", url, false);
                        Request.send();
                        var Data = Request.responseText;

                        if (Data != []) {
                            Data = jQuery.parseJSON(Data);
                            $.each(Data, function (index, PARAM) {
                                JsonData.push([
                                   index + 1, PARAM.Course, PARAM.Section, PARAM.Exam,
                                   "<a onclick='OnDelete(" + PARAM.Id + ")' data-target=#myModal data-toggle=modal><i class='fa fa-trash'></i></a>",
                                ]);
                            })


                            $('#dataTable').dataTable({
                                "bRetrieve": true,
                                "bDestroy": true,
                                "bSearchable": true,
                                "bSortable": false,
                                "bFilter": true,
                                "bInfo": true,
                                "bLengthChange": false,
                                "bVisible": false,
                                "bProcessing": true,
                                "bPaginate": false,
                                "iDisplayLength": 100,
                                "oLanguage": {
                                    "sEmptyTable": "No records found"
                                },
                                "aaData": JsonData,

                            });

                            $("#divAddExam").show();
                            AddNewExam();
                        }
                        else {

                        }
                    }
                }
                catch (e) {
                    alert(e.message);
                }
                //  clearData();
            }

            function clearData() {
                $("#<%=hdnId.ClientID %>").val('');
                $("#hdnSection").val('');
                $("#hdnExam").val('');
            }
            function OnAddNew() {
                var examIndex = $(".ddlExam").prop('selectedIndex');

                if (examIndex == 0) {
                    AppDisplayMessage('Please select the exam', 2);
                    return false;
                } else {
                    var Id = $("#hdnExam").val();
                    CallAction(Id, "AddNewExam");
                }
            }

            function OnDelete(Id) {
                $("#<%=hdnId.ClientID %>").val(Id);
            }
            function DeleteConfirm() {

                CallAction($("#<%=hdnId.ClientID %>").val(), "DeleteExam");
            }
            function CallAction(Id, type) {
                var JsonData = [];
                var Mode = type;
                var Course = $("#hdnCourse").val();
                var Section = $("#hdnSection").val();
                //Get Json Data from Server

                var Request = new XMLHttpRequest();
                var url = '../Handlers/CourseMapping.ashx?Mode=' + Mode + '&Course=' + Course + '&Section=' + Section + '&Id=' + Id;
                Request.open("GET", url, false);
                Request.send();
                var Data = Request.responseText;

                if (Data != undefined) {
                    if (Data == 'Success') {
                        if (type == 'AddNewExam') {
                            AppDisplayMessage("Course and Exam saved successfully", 1);
                        } else {
                            AppDisplayMessage("Mapping deleted successfully", 1);
                        }
                        BindData();                        
                        $('#myModal').modal('hide');
                        $('#AddNew').modal('hide');
                    } else {
                        if (type == 'AddNewExam') {
                            AppDisplayMessage("Course and Exam not saved successfully", 2);
                        } else {
                            if (Data == 'Mapped') {
                                AppDisplayMessage("Mapped with another entity, you can not delete the record", 2);
                            } else {
                                AppDisplayMessage("Mapping not deleted successfully", 2);
                            }
                        }
                    }
                }
            }


    </script>
</asp:Content>
