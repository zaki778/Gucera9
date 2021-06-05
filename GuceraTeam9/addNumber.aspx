<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addNumber.aspx.cs" Inherits="GuceraTeam9.addNumber" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            ID&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="iD" runat="server"></asp:TextBox>
            <br />
            TelephoneNumber&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="telephoneNumber" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Add" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
