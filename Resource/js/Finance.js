
function BindDropDown_finance(Type, ctrlType, ElementId ,PropertyChangeElement , Value ) {
    try {     
        var JsonData = [];
        //Get Json Data from Server
        var Request = new XMLHttpRequest();
        var url = '../Handlers/FinanceDropDownLoader.ashx?Type=' + Type + '&Value=' + Value;
        Request.open("POST", url, false);
        Request.send();
        var Data = Request.responseText;

        if (ctrlType == "DROPDOWN") {
            if (Data != undefined) {
                ListData = jQuery.parseJSON(Data);
                $(ElementId).children().remove();
                $(ElementId).append('<option value=0>--Select--</option>');
                $.each(ListData, function (index, PARAM) {
                    $(ElementId).append('<option value="' + PARAM.Id + '">' + PARAM.Name + '</option>');
                });
            }
        }        
        if (ctrlType === "DIV") {
            if (Data != undefined) {
                ListData = jQuery.parseJSON(Data);
                $(ElementId).empty();
               //$(PropertyChangeElement).attr("style", "display:block");
                var checkBoxes = '';
                if (Type == "TERM") {
                    $.each(ListData, function (index, PARAM) {
                        checkBoxes = checkBoxes + ' <div  class="col-sm-3"> <input type="checkbox" class=i-checks-' + Type + ' name="' + PARAM.Name + '" value="' + PARAM.Id + '" onclick="TermChildCgheckBoxClick(this)" /> <label for="' + PARAM.Id + '">' + PARAM.Name + '</label> </div> ';
                    });
                }
                else if (Type == "COURSE") {
                    $.each(ListData, function (index, PARAM) {
                        checkBoxes = checkBoxes + ' <div  class="col-sm-3"> <input type="checkbox" class=i-checks-' + Type + ' name="' + PARAM.Name + '" value="' + PARAM.Id + '" onclick="CourseChildCgheckBoxClick(this)" /> <label for="' + PARAM.Id + '">' + PARAM.Name + '</label> </div> ';
                    });
                }
                else {
                    $.each(ListData, function (index, PARAM) {
                        checkBoxes = checkBoxes + ' <div  class="col-sm-3"> <input type="checkbox" class=i-checks-' + Type + ' name="' + PARAM.Name + '" value="' + PARAM.Id + '" /> <label for="' + PARAM.Id + '">' + PARAM.Name + '</label> </div> ';
                    });
                }
                
                var FinalHtml = $('' +  checkBoxes + ' </div> ');
                FinalHtml.appendTo(ElementId);
            }
        } 
        //if (Type === "COURSE") {
        //    if (Data != undefined) {
        //        ListData = jQuery.parseJSON(Data);
        //        $(ElementId).empty();
        //        var HeadRow = ' <div class="wrapper wrapper-content fadeInRight"> <div class="row"> ';
        //        var checkBoxes = '';
        //        $.each(ListData, function (index, PARAM) {
        //            checkBoxes = checkBoxes + ' <div  class="col-sm-3"> <input type="checkbox" class=i-checks name="' + PARAM.Id + '" value="' + PARAM.Id + '" onclick="AddCourseArray(this)"/> <label for="' + PARAM.Id + '">' + PARAM.Name +'</label> </div> ';
        //        });
        //        var FinalHtml = $('' + HeadRow + checkBoxes + ' </div> </div> ');
        //        FinalHtml.appendTo(ElementId);
        //    }
        //}        
    }
    catch (e) {
        alert(e.message);
    }
}

function TermChildCgheckBoxClick(ctrl) {
    var overAllCtrl = $("#DivAddTerms").find('input[type=checkbox]');
    var overAllCheckedCtrl = $("#DivAddTerms").find('input[type=checkbox]:checked');
    if (overAllCtrl.length > overAllCheckedCtrl.length) {
        $("#TermHeaderCheckBox").prop("checked", false);
    }
    else { $("#TermHeaderCheckBox").prop("checked", true);}
}

function CourseChildCgheckBoxClick(ctrl) {
    var overAllCtrl = $("#DivAddCourse").find('input[type=checkbox]');
    var overAllCheckedCtrl = $("#DivAddCourse").find('input[type=checkbox]:checked');
    if (overAllCtrl.length > overAllCheckedCtrl.length) {
        $("#CourseHeaderCheckBox").prop("checked", false);
    }
    else { $("#CourseHeaderCheckBox").prop("checked", true); }
}

function GetAndSaveData(Action, TermArrayData, Category, CourseArrayData, FeeDesc, FeeAmt, DeleteFeeIdArray) {
    var JsonData = [];
    //Get Json Data from Server
    var Request = new XMLHttpRequest();
    var url = '../Handlers/FinanceFeeManagement.ashx?Mode=' + Action + '&TermData=' + TermArrayData + '&Category=' + Category + '&CourseData=' + CourseArrayData + '&FeeDesc=' + FeeDesc + '&FeeAmt=' + FeeAmt + '&DeleteFeeId=' + DeleteFeeIdArray;
    Request.open("POST", url, false);
    Request.send();
    var Data = Request.responseText;
    if (Data != undefined) {
        if (Action == "INSERT") {
            if (Data == "1") {
                AppDisplayMessage("Fee created successfully.", 1);
            }
            else if (Data == "2") {
                AppDisplayMessage("Fee created successfully. Some term and course already has this fee.", 1); 
            }
        }
        if (Action != "INSERT") {
            Data = jQuery.parseJSON(Data); 
            if (Action != "DELETE") {
                $.each(Data, function (index, PARAM) {
                    JsonData.push([index + 1, PARAM.Course, PARAM.TermName, PARAM.CatName, PARAM.FeeDescription, PARAM.Amount]);
                });
                $('#ViewdataTable').dataTable().fnDestroy();
                $('#ViewdataTable').dataTable({
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
                $('#DeleteAllCheckbox').prop("checked", false);
                var isDeleteMsgShown = false;
                $.each(Data, function (index, PARAM) {
                    if (index == 0 && PARAM.Id == "1" && PARAM.Course == "Delete") {
                        AppDisplayMessage("Fee deleted successfully.", 1);                        
                        isDeleteMsgShown = true;
                    }
                    else {
                        if (isDeleteMsgShown == true) {
                            JsonData.push([index,
                                '<input type=checkbox class=i-checks id=' + PARAM.Id + ' onclick="ChildCheckboxForDelete(this)">',
                                PARAM.Course, PARAM.TermName, PARAM.CatName, PARAM.FeeDescription, PARAM.Amount]);
                        }
                        else {
                            JsonData.push([index+1,
                                '<input type=checkbox class=i-checks id=' + PARAM.Id + ' onclick="ChildCheckboxForDelete(this)">',
                                PARAM.Course, PARAM.TermName, PARAM.CatName, PARAM.FeeDescription, PARAM.Amount]);
                        }    
                    }
                });
                $('#myModal').modal('hide');
                $('#DeletedataTable').dataTable().fnDestroy();
                $('#DeletedataTable').dataTable({
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
                    "iDisplayLength": 10000,
                    "oLanguage": {
                        "sEmptyTable": "No records found"
                    },
                    "aaData": JsonData,

                });
            }            
        }
    }
}
function ChildCheckboxForDelete(ctrl) {
    var overAllCtrl = $("#divGridDeleteData").find('table td').find('input[type=checkbox]');
    var overAllCheckedCtrl = $("#divGridDeleteData").find('table td').find('input[type=checkbox]:checked');
    if (overAllCtrl.length > overAllCheckedCtrl.length) {
        $("#DeleteAllCheckbox").prop("checked", false);
    }
    else { $("#DeleteAllCheckbox").prop("checked", true); }
}

//Fee Collection Student list loading
function BindStudentData(Course, Section) {
    try {
        $('#dataTable').dataTable().fnDestroy();
        var JsonData = [];
        var Request = new XMLHttpRequest();
        var url = '../Handlers/FinanceGetStudent.ashx?Course=' + Course + '&Section=' + Section;
        Request.open("GET", url, false);
        Request.send();
        var Data = Request.responseText;
        if (Data != undefined) {
            Data = jQuery.parseJSON(Data);
            var StatusColr = "";
            $.each(Data, function (index, PARAM) {
                if (PARAM.PayStatus == "Pending") {
                    JsonData.push([
                        index + 1, PARAM.StudentName, PARAM.Course, PARAM.Section,
                        "<code>" + PARAM.PayStatus + "</code>",
                        "<button class='btn btn-sm btn-primary m-t-n-xs col-sm-12' id=id" + PARAM.studentId + " data-value='" + PARAM.StudentName +"' onclick='onMapFee(this,0,0," + PARAM.studentId + ")' type=button >Assign Fee</button>",
                        "<button class='btn btn-sm btn-primary m-t-n-xs col-sm-12' id=id" + PARAM.studentId + " data-value='" + PARAM.StudentName +"' onclick='onCollectFee(this," + PARAM.studentId + ")' type=button >Collect Fee</button>",
                        "<button class='btn btn-sm btn-primary m-t-n-xs col-sm-12' id=id" + PARAM.studentId + " data-value='" + PARAM.StudentName +"' onclick='onPaymentHistory(this,0,0,"+ PARAM.studentId + ")' type=button >Payment History</button>",
                    ]);
                }
                else {
                    JsonData.push([
                        index + 1, PARAM.StudentName, PARAM.Course, PARAM.Section,
                        '<code style="color:green !important">' + PARAM.PayStatus + '</code>',
                        "<button class='btn btn-sm btn-primary m-t-n-xs col-sm-12' id=id" + PARAM.studentId + " data-value='" + PARAM.StudentName +"' onclick='onMapFee(this,0,0," + PARAM.studentId + ")' type=button >Map Fee</button>",
                        "<button class='btn btn-sm btn-primary m-t-n-xs col-sm-12' id=id" + PARAM.studentId + " data-value='" + PARAM.StudentName + "' onclick='onCollectFee(this," + PARAM.studentId + ")' type=button >Collect Fee</button>",
                        //"Paid Fully",
                        "<button class='btn btn-sm btn-primary m-t-n-xs col-sm-12' id=id" + PARAM.studentId + " data-value='" + PARAM.StudentName +"' onclick='onPaymentHistory(this,0,0," + PARAM.studentId + ")' type=button >Payment History</button>",
                    ]);
                }
            });

            $('#dataTable').dataTable({
                "bRetrieve": true,
                "bDestroy": true,
                "bSearchable": true,
                "bSortable": false,
                "bFilter": true,
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
        }
    }
    catch (e) {
        alert(e.message);
    }
}

//Payment History

function onPaymentHistory(ctrl,RoleId,UserText,studentId) {
    try {
        var UserName = "";
        if (UserText == 0) { //Accessing by school staff , if userid  = 0
            UserName = "";
        }
        else {
            UserName = UserText;
        }
            $('#PayHistorydataTable').dataTable().fnDestroy();
            var JsonData = [];
            var Request = new XMLHttpRequest();
            var url = '../Handlers/FinancePaymentHistory.ashx?Mode=GET&UserName=' + UserName + '&RoleId=' + RoleId + '&StudentId=' + studentId ;
            Request.open("GET", url, false);
            Request.send();
            var Data = Request.responseText;
            if (Data != undefined) {
                Data = jQuery.parseJSON(Data);
                $.each(Data, function (index, PARAM) {
                    JsonData.push([
                        index + 1, PARAM.PayMode, PARAM.PaymentAmt, PARAM.ChqDDNumber, PARAM.ChqDate, PARAM.ChellanNo, PARAM.TxnNumber, PARAM.TxnDate, PARAM.PaidOn, PARAM.EntryDate                 
                    ]);
                });
                //if (UserText == 0) {
                    $('#PayHistorydataTable').dataTable({
                        "bRetrieve": true,
                        "bDestroy": true,
                        "bSearchable": true,
                        "bSortable": false,
                        "bFilter": true,
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
                //}
        }
        if (UserText == 0) { //Accessing by school staff , if userid  = 0
            var stdCourse = $('.ddlCourse').find("option:selected").text();
            var stdSection = $('.ddlSection').find("option:selected").text();
            $(".StudentName").text("" + $(ctrl).data('value') + ' (' + stdCourse + ' - ' + stdSection + ')');
            $("#SearchCriteria").attr("style", "display:none");
            $("#PaymentHistoryDetails").attr("style", "display:block"); 
            $("#StudentListData").attr("style", "display:none");
            $("#PaymentCollectionDetails").attr("style", "display:none");
        }
    }
    catch (e) {
        alert(e.message);
    }
}

//Mapping the fee to student,
function onMapFee(ctrl, RoleId, UserText, studentId) {
    try {
        var UserName = "";
        var courseName = "";
        var SectionName = "";
        if (UserText == 0) { //Accessing by school staff , if userid  = 0
            $("#hdnStudentId").val(studentId);
            UserName = "";
            courseName = $("#ddlCourse").find("option:selected").text();
            SectionName = $("#ddlSection").find("option:selected").text();
            $("#ContentPanel_txtTotMappedFeeAmt").val(0);
            $(".SaveDiv").attr("style", "display:none");
        }
        else {
            UserName = UserText;
        }
        var JsonData = [];
        var isNoRecords = false;
        var Request = new XMLHttpRequest();
        var url = '../Handlers/FinanceFeeMappingStudent.ashx?Mode=GET&UserName=' + UserName + '&RoleId=' + RoleId + '&StudentId=' + studentId + '&Course=' + courseName + '&Section=' + SectionName;
        Request.open("GET", url, false);
        Request.send();
        var Data = Request.responseText;
        $("#divFeeMappingDeatils").empty();
        
        var TablHtml = '<table style="text-align: center;" id="MappedFeedataTable" class="table table-bordered"> ';
        TablHtml += ' <thead id="thead">';
        TablHtml += ' <tr> ';
        TablHtml += ' <th style="text-align: center;"># </th> ';
        TablHtml += ' <th style="text-align: center;">Fee Description</th> ';
        TablHtml += ' <th style="text-align: center;">Amount</th> ';
        if (UserText != 0) {
            TablHtml += ' <th style="text-align: center;">Choosed Fee</th> ';
        }
        else {
            TablHtml += ' <th style="text-align: center;"><input type="checkbox" class="i-checks" id="AllFeeCheckbox" onclick="SelectAllFeeCheckbox(this)" /></th> ';           
        }
        TablHtml += ' </tr> ';
        TablHtml += ' </thead> ';
        TablHtml += ' <tbody> ';

        if (Data != undefined) {
            Data = jQuery.parseJSON(Data);
            if (Data.length > 0) {
                var termName = "";
                var CategoryName = "";
                var FeeMapped;
                var AllFeeMapped = true;
                $.each(Data, function (index, PARAM) {
                    if (PARAM.IsMapped == 0)
                        FeeMapped = false;
                    else
                        FeeMapped = true;

                    if (PARAM.TermName != termName) {
                        termName = PARAM.TermName;
                        TablHtml += ' <tr> ';
                        TablHtml += ' <td colspan="4" style="text-align: center;"><b>' + PARAM.TermName + '</b></td>';
                        TablHtml += ' </tr> ';

                        CategoryName = PARAM.CategoryName;
                        TablHtml += ' <tr> ';
                        TablHtml += ' <td colspan="4" style="text-align: left;"><b>' + PARAM.CategoryName + '</b></td>';
                        TablHtml += ' </tr> ';
                    }
                    if (PARAM.TermName == termName && PARAM.CategoryName != CategoryName) {
                        CategoryName = PARAM.CategoryName;
                        TablHtml += ' <tr> ';
                        TablHtml += ' <td colspan="4" style="text-align: left;"><b>' + PARAM.CategoryName + '</b></td>';
                        TablHtml += ' </tr> ';
                    }
                    TablHtml += ' <tr> ';
                    TablHtml += ' <td>' + (index + 1) + '</td>';
                    TablHtml += ' <td>' + PARAM.Description + '</td>';
                    TablHtml += ' <td><input type=textbox disabled id='+PARAM.Id+' value=' + PARAM.Amount + '></td>';
                    if (UserText != 0) {
                        if (FeeMapped)
                            TablHtml += ' <td><input type=checkbox disabled = "disabled" checked  class=i-checks id=' + PARAM.Id + '></td>';
                        else
                            TablHtml += ' <td><input type=checkbox disabled = "disabled"  class=i-checks id=' + PARAM.Id + '></td>';
                    }
                    else {
                        if (FeeMapped) {
                            TablHtml += ' <td><input type=checkbox class=i-checks checked  id=' + PARAM.Id + ' onclick="ChildCheckboxForFeeMap(this,' + PARAM.Amount +')"></td>';
                            $(".SaveDiv").attr("style", "display:block");
                            var Totalamt = parseFloat($("#ContentPanel_txtTotMappedFeeAmt").val());
                            Totalamt = Totalamt + parseFloat(PARAM.Amount);
                            $("#ContentPanel_txtTotMappedFeeAmt").val(Totalamt);
                        }
                        else {
                            AllFeeMapped = false;
                            TablHtml += ' <td><input type=checkbox class=i-checks  id=' + PARAM.Id + ' onclick="ChildCheckboxForFeeMap(this,' + PARAM.Amount +')"></td>';
                        }
                    }
                    
                    TablHtml += ' </tr> ';
                });
            }
            else {
                isNoRecords = true;
                TablHtml += ' <tr> ';
                TablHtml += ' <td colspan="4"> No Records Found. </td>';
                TablHtml += ' </tr> ';
            }
        }
        TablHtml += ' </tbody> ';
        TablHtml += ' </table> ';

        var FinalHtml = $(TablHtml);
        FinalHtml.appendTo("#divFeeMappingDeatils");

        if (UserText == 0) { //Accessing by school staff , if userid  = 0
            var stdCourse = $('#ddlCourse').find("option:selected").text();
            var stdSection = $('#ddlSection').find("option:selected").text();
            $(".StudentName").text("" + $(ctrl).data('value') + ' (' + stdCourse + ' - ' + stdSection + ')');
            $("#SearchCriteria").attr("style", "display:none");
            $("#PaymentHistoryDetails").attr("style", "display:none");
            $("#StudentListData").attr("style", "display:none");
            $("#PaymentCollectionDetails").attr("style", "display:none");
            $("#FeeMappingDetails").attr("style", "display:block");

            if (AllFeeMapped) {
                $("#divFeeMappingDeatils").find('table th').find('input[type=checkbox]').prop('checked', true); 
            }
            if (isNoRecords)
                $("#divFeeMappingDeatils").find('table th').find('input[type=checkbox]').prop('disabled', true);
        }
    }
    catch (e) {
        alert(e.message);
    }
}

function  SelectAllFeeCheckbox(ctrl) {
    if ($(ctrl).is(':checked')) {
        $("#divFeeMappingDeatils").find('table td').find('input[type=checkbox]').prop('checked', true);
        $(".SaveDiv").attr("style", "display:block");
        var TotalAmount = 0;
        $.each($("#divFeeMappingDeatils").find('table td').find('input[type=textbox]'), function () {
            TotalAmount = TotalAmount + parseFloat($(this).val());
            $("#ContentPanel_txtTotMappedFeeAmt").val(TotalAmount);
        });
    }
    else {
        $("#divFeeMappingDeatils").find('table td').find('input[type=checkbox]').prop('checked', false);
        $(".SaveDiv").attr("style", "display:none");
        $("#ContentPanel_txtTotMappedFeeAmt").val(0);
    }
}

function ChildCheckboxForFeeMap(ctrl,Amount) {
    var overAllCtrl = $("#divFeeMappingDeatils").find('table td').find('input[type=checkbox]');
    var overAllCheckedCtrl = $("#divFeeMappingDeatils").find('table td').find('input[type=checkbox]:checked');
    if (overAllCheckedCtrl.length > 0) {
        $(".SaveDiv").attr("style", "display:block");
    } else {
        $(".SaveDiv").attr("style", "display:none");
    }
    if (overAllCtrl.length > overAllCheckedCtrl.length) {
        $("#divFeeMappingDeatils").find('table th').find('input[type=checkbox]').prop('checked', false);
    }
    else { $("#divFeeMappingDeatils").find('table th').find('input[type=checkbox]').prop('checked', true); }

    //Amount deduct/adding when child checkbox click.
    var Totalamt = parseFloat($("#ContentPanel_txtTotMappedFeeAmt").val());
    if ($(ctrl).is(':checked')) {
        Totalamt = Totalamt + parseFloat(Amount);
    } else {
        Totalamt = Totalamt - parseFloat(Amount);
    }
    $("#ContentPanel_txtTotMappedFeeAmt").val(Totalamt);
}

function onCollectFee(ctrl,studentId) {
    try {
        if (studentId > 0) {
            $("#hdnStudentId").val(studentId);
            var stdCourse = $('#ddlCourse').find("option:selected").text();
            var stdSection = $('#ddlSection').find("option:selected").text();
            $(".StudentName").text("" + $(ctrl).data('value') + ' (' + stdCourse + ' - ' + stdSection + ')');
            ClearControlsAfterPayment();
            $('#CollectedPaymentTable').dataTable().fnDestroy();
            $("#btnPrintPaymentCollect").attr("style", "display:none");
            var JsonData = [];
            var payMode = ""; 
            var InputAmt = 0;
            var ChqDDTxnChllnNumber = "";
            var PaymentDate = "";
            var UserId = 0;

            var Request = new XMLHttpRequest();
            var url = '../Handlers/FinancePaymentCollection.ashx?Mode=GET&PayMode=' + payMode + '&InputAmt=' + InputAmt + '&ChqDDTxnChllnNumber=' + ChqDDTxnChllnNumber + '&PaymentDate=' + PaymentDate + '&UserId=' + UserId + '&StudentID=' + studentId;
            Request.open("GET", url, false);
            Request.send();
            var Data = Request.responseText;
            if (Data != undefined) {
                Data = jQuery.parseJSON(Data);
                if (Data.length > 0) {
                    $("#SearchCriteria").attr("style", "display:none");
                    $("#PaymentHistoryDetails").attr("style", "display:none");
                    $("#StudentListData").attr("style", "display:none");
                    $("#PaymentCollectionDetails").attr("style", "display:block");
                    $("#FeeMappingDetails").attr("style", "display:none");
                    AssignValuetoCaontrol(Data);
                  }
                else {
                    AppDisplayMessage("Fee not yet assinged for this student, Please assign the fee first.!", 2);
                }
            }
        }
    }
    catch (e) {
        alert(e.message);
    }    
}

function savePaymentDetails(payMode, InputAmt, PaymentDate, ChqDDTxnChllnNumber, studentId, UserId) {
    var Request = new XMLHttpRequest();
    if (payMode !="REFUND")
        var url = '../Handlers/FinancePaymentCollection.ashx?Mode=PAY&PayMode=' + payMode + '&InputAmt=' + InputAmt + '&ChqDDTxnChllnNumber=' + ChqDDTxnChllnNumber + '&PaymentDate=' + PaymentDate + '&UserId=' + UserId + '&StudentID=' + studentId;
    else
        var url = '../Handlers/FinancePaymentCollection.ashx?Mode=REFUND&PayMode=' + payMode + '&InputAmt=' + InputAmt + '&ChqDDTxnChllnNumber=' + ChqDDTxnChllnNumber + '&PaymentDate=' + PaymentDate + '&UserId=' + UserId + '&StudentID=' + studentId;

    Request.open("GET", url, false);
    Request.send();
    var Data = Request.responseText;
    if (Data != undefined) {
        Data = jQuery.parseJSON(Data);
        if (Data.length > 0) {
            AssignValuetoCaontrol(Data);
            ClearControlsAfterPayment();
            AppDisplayMessage("Payment successfully processed.", 1);
            var JsonData = [];
            var CurrentDate = new Date();
            var EntryDate = CurrentDate.getDate() + "/" + (CurrentDate.getMonth() + 1) + "/" + CurrentDate.getFullYear() + " " + CurrentDate.getHours() + ":" + CurrentDate.getMinutes() + ":" + CurrentDate.getSeconds();
            JsonData.push([
                1, payMode, InputAmt, ChqDDTxnChllnNumber, PaymentDate, EntryDate
            ]);
            $('#CollectedPaymentTable').dataTable().fnDestroy();
            $('#CollectedPaymentTable').dataTable({
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

            $("#btnPrintPaymentCollect").attr("style", "display:block");
        }
        else {
            AppDisplayMessage("Payment process failed, Please contact administrator.", 2);
            return false;
        }
    }
}
function PrintPayment(PrintDivControl) {
    //var height = window.screen.availHeight;
    //var width = window.screen.availWidth;
    //var prtContent = document.getElementById(PrintDivControl);
    //var WinPrint = window.open('', '', 'left=0,top=0,width=' + width + ',height=' + height +',toolbar=0,scrollbars=0,status=0,dir=ltr');
    //WinPrint.document.write(prtContent.innerHTML);
    //WinPrint.document.close();
    //WinPrint.focus();
    //WinPrint.print();
    //WinPrint.close();
    //prtcontent.innerhtml = document.body.innerhtml;
    //var headerstr = "<html><head><title></title></head><body>";
    //var footerstr = "</body></html>";
    //var newstr = document.all.item(PrintDivControl).innerHTML;
    //var oldstr = document.body.innerHTML;
    //document.body.innerhtml = headerstr + newstr + footerstr;
    //w = window.open("", "_blank", "k");
    //w.document.write(headerstr + newstr + footerstr);
    //w.print();
    //document.body.innerHTML = oldstr;
    //return false;
   // window.print();
   //// 
    // return false;
    //window.frames["print_frame"].document.body.innerHTML = document.getElementById(PrintDivControl).innerHTML;
    //window.frames["print_frame"].window.focus();
    //window.frames["print_frame"].window.print();

    //var prtContent = document.getElementById(PrintDivControl);
    //var newWin = window.open('', 'Print-Window');
    //newWin.document.open();
    //newWin.document.write('<html><body onload="window.print()">' + prtContent.innerHTML + '</body></html>');
    //newWin.document.close();
    //setTimeout(function () { newWin.close(); }, 10);

    //var htmlToPrint = '' + '<style type="text/css"' +
    //    'table th, table td {' +
    //    'boder:1px solid #000;' +
    //    'padding:0.5em;' +
    //    '}' +
    //    '</style>';

    //htmlToPrint += prtContent.outerHTML;
    //newWin = window.open("");
    //newWin.document.write("");
    //newWin.document.write(htmlToPrint);
    //newWin.print();
    //newWin.close();
}