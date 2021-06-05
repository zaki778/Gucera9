<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="issuePromo.aspx.cs" Inherits="GuceraTeam9.issuePromo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            height: 351px;
        }
    </style>
</head>
<body style="height: 332px">
    <form id="form1" runat="server">
        <div>
        </div>
        Issue Promocode to Student:<br />
        <br />
        Student ID:&nbsp;&nbsp;
        <asp:TextBox ID="stID" runat="server"></asp:TextBox>
        <br />
        <br />
        Promocode:&nbsp; <asp:TextBox ID="poID" runat="server"></asp:TextBox>
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="issueButton" runat="server" OnClick="onIssue" Text="Issue" />
    </form>
</body>
</html>
