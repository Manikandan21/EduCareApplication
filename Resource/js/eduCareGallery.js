function GetInfo(AlbumId,ImageId, Mode) {
    $.ajax({
        type: "POST",
        url: "../Handlers/ImageHandler.ashx?Mode=AlbumInfo&Type=" + Mode + "&AlbumId=" + AlbumId + "&ImageId=" + ImageId + "",
        contentType: "application/json; charset=utf-8",
        processdata: true,
        async: false,
        data: "{}",
        dataType: "json",
        success: function (data) {
            if (data != []) {
                if (Mode == 'GetAlbumName') {
                    if (data[0].Description < 10) {
                        data[0].Description = '0' + data[0].Description;
                    }
                    $("#titleAlbum").text(data[0].Name + ' ( ' + data[0].Description + ' )');
                } else {
                    $("#pName").text(data[0].Name);
                    if (ImageId == 0) {
                        $("#pDescription").text(data[0].Description);
                    }
                    $("#pCreatedBy").text(data[0].CreatedBy);
                    $("#pCreatedOn").text(data[0].CreatedOn);
                }
            }
        },error: function (result) {
            AppDisplayMessage(result, 2);
    }
    });
}
function OnDeleteImage(Type,AlbumId,ImageId) {
    $.ajax({
        type: "POST",
        url: "../Handlers/ImageHandler.ashx?Mode=AlbumDelete&Type=" + Type + "&AlbumId=" + AlbumId + "&ImageId=" + ImageId + "",
        contentType: "text/plain",
        processdata: true,
        async: false,
        success: function (data) {

            if (data == 'Success') {
                if (Type == 'Album') {
                    AppDisplayMessage('Album deleted successfully', 1);
                } else {
                    AppDisplayMessage('Image deleted successfully', 1);
                }
                setTimeout("location.reload(true);", 2000);
            } else {
                AppDisplayMessage('Error occurred, Please try again later', 2);
            }            
        }, error: function (result) {
            AppDisplayMessage(result, 2);
        }
    });
}
function OnDownloadImage(ImageId) {
    $.ajax({
        type: "GET",
        url: "../Handlers/DownloadImage.ashx?Mode=Download&ImageId=" + ImageId + "",
        contentType: 'image/jpg',
        data:{},
        async: false,
        success: function (data) {
            window.location = "../Handlers/DownloadImage.ashx?Mode=Download&ImageId=" + ImageId + "";
        }, error: function (result) {
            AppDisplayMessage(result, 2);
        }
    });
}

