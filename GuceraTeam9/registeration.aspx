<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registeration.aspx.cs" Inherits="GuceraTeam9.registeration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            direction: ltr;
            height: 816px;
        }
    </style>
</head>
<body style="height: 793px">
    <form id="form1" runat="server">
        First Name<br />
        <asp:TextBox ID="firstName" runat="server" Height="18px" Width="186px"></asp:TextBox>
        <br />
        <br />
        Last Name<br />
        
        <asp:TextBox ID="lastName" runat="server"></asp:TextBox>
        
        <br />
        <br />
        Password<br />
        <asp:TextBox ID="Password" runat="server" Width="188px"></asp:TextBox>
        <br />
        <br />
        Email<br />
        <asp:TextBox ID="Email" runat="server" Width="191px"></asp:TextBox>
        <br />
        <br />
        Address<br />
        <asp:TextBox ID="Address" runat="server" Width="186px"></asp:TextBox>
        <br />
        <br />Gender<br />
        <asp:TextBox ID="Gender" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="studentRegister" runat="server" Text="studentRegister" OnClick="studentRegister_Click" />
        <br />
        <br />
        <asp:Button ID="instructorRegister" runat="server" Text="instructorRegister" OnClick="instructorRegister_Click" />
    </form>
</body>
</html>
