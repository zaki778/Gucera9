<%@ Page Language="C#" AutoEventWireup="true" CodeFile="viewfeedback.aspx.cs" Inherits="GuceraTeam9.viewfeedback" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            view Feedback<br />
            <br />
            instructorID&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="instructorID" runat="server"></asp:TextBox>
            <br />
            courseID&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="courseID" runat="server"></asp:TextBox>
        </div>
        <asp:Button ID="view" runat="server" Text="view" OnClick="view_Click" />
    </form>
    <asp:Panel ID="Panel1" runat="server"></asp:Panel>
</body>
</html>
