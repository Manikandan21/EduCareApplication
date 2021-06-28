<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExcelUpload.aspx.cs" Inherits="ExcelSample.ExcelUpload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
                    
        <asp:FileUpLoad id="FileUpLoad" runat="server"  />  
<asp:RegularExpressionValidator   
id="FileUpLoadValidator" runat="server"   
ErrorMessage="only upload xlsx files only "   
ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))(.csv|.xml|.xlsx)$"   
ControlToValidate="FileUpLoad">  
</asp:RegularExpressionValidator> 
              <asp:button runat="server" Text="Excel Upload" onclick="UploadButton"></asp:button>
              <asp:Label id="Status" runat="server"></asp:Label> 
            <asp:button runat="server" Text="ExcelTemplate" onclick="DownloadButton" Visible="true" ID="btnDownloadButton"></asp:button>
            <asp:button runat="server" Text="ErrorList"  Visible="false" ID="btnErrorButton"></asp:button>

            </div>

    </form>
</body>
</html>
