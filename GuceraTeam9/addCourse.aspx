<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addCourse.aspx.cs" Inherits="GuceraTeam9.addCourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        Course Details :<br />
        <br />
        creditHours&nbsp;&nbsp;&nbsp; <asp:TextBox ID="credithours" runat="server"></asp:TextBox>
        <br />
        name&nbsp;&nbsp;&nbsp; <asp:TextBox ID="name" runat="server"></asp:TextBox>
        <br />
        price&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="price" runat="server"></asp:TextBox>
        <br />
        instructorId&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="instructorId" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Done" OnClick="Button1_Click" />
    </form>
</body>
</html>
