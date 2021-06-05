<%@ Page Language="C#" AutoEventWireup="true" CodeFile="promocodes.aspx.cs" Inherits="GuceraTeam9.promocodes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="backtostudent" runat="server" Text="back to student profile" OnClick="backtostudent_Click" />
            <br />
            <br />
            Enter your Student ID to view the available promocodes<br />
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <asp:Button ID="viewPromos" runat="server" Text="view" OnClick="viewPromos_Click" />
        </div>
    </form>
</body>
</html>
