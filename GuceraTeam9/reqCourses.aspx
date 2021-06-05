<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reqCourses.aspx.cs" Inherits="GuceraTeam9.reqCourses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 532px">
            Accept requested courses:-<br />
            <br />
            Admin ID:<asp:TextBox ID="adID" runat="server"></asp:TextBox>
            <br />
            <br />
            Course ID:<asp:TextBox ID="cID" runat="server"></asp:TextBox>
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="accButton" runat="server" OnClick="onAccept" Text="Accept Course" />
        </div>
    </form>
</body>
</html>
