function BindDropdown(Mode, Value, Id, ElementId) {
    try {
        if (Mode == 'DdlStudent') {
           
            $(ElementId).children().remove();
            $(ElementId).append('<option value=0>--Select--</option>');
            var JsonData = [];
            //Get Json Data from Server

            var Request = new XMLHttpRequest();
            var url = '../Handlers/managestudents.ashx?Mode=' + Mode + '&Course=' + Value + '&Section=' + Id + '&Id=0';
            Request.open("GET", url, false);
            Request.send();
            var Data = Request.responseText;

            if (Data != undefined) {
                Data = jQuery.parseJSON(Data);
                $.each(Data, function (index, PARAM) {
                    $(ElementId).append('<option value="' + PARAM.Id + '">' + PARAM.Name + '</option>');
                });
            }
        } else if (Mode == 'ServerElementGetSection') {
          
            $(ElementId).children().remove();
            $(ElementId).append('<option value=0>--Select--</option>');
            var JsonData = [];
            //Get Json Data from Server

            var Request = new XMLHttpRequest();
            var url = '../Handlers/Configuration.ashx?Mode=GetSection&GetDataMode=' + Value + '&Id=' + Id;
            Request.open("GET", url, false);
            Request.send();
            var Data = Request.responseText;

            if (Data != undefined) {
                Data = jQuery.parseJSON(Data);
                $.each(Data, function (index, PARAM) {
                    $(ElementId).append('<option value="' + PARAM.Id + '">' + PARAM.Name + '</option>');
                });
            }
        }

        else {
            $(ElementId).children().remove();
            $(ElementId).append('<option value=0>--Select--</option>');
            var JsonData = [];
            //Get Json Data from Server

            var Request = new XMLHttpRequest();
            var url = '../Handlers/Configuration.ashx?Mode=' + Mode + '&GetDataMode=' + Value + '&Id=' + Id;
            Request.open("GET", url, false);
            Request.send();
            var Data = Request.responseText;

            if (Data != undefined) {
                Data = jQuery.parseJSON(Data);
                $.each(Data, function (index, PARAM) {
                    $(ElementId).append('<option value="' + PARAM.Id + '">' + PARAM.Name + '</option>');
                });
            }
        }
    }
    catch (e) {        
        alert(e.message);
    }

}
function GetJsonResult(url) {
    var result = '';
    jQuery.ajaxSetup({ async: false });
    $.get(url, function (data) {
        result = data;
    });
    jQuery.ajaxSetup({ async: true });
    return result;
}