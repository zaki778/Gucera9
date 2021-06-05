<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addFeedback.aspx.cs" Inherits="GuceraTeam9.addFeedback" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Enter Your Comment"></asp:Label>
            <br />
            <asp:TextBox ID="comment" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Enter Course ID"></asp:Label>
            <br />
            <asp:TextBox ID="cid" runat="server"></asp:TextBox>
            <br />
            
        </div>
        <asp:Button ID="add" runat="server" Height="27px" Text="Add Feedback" Width="181px" OnClick="add_Click" />
    </form>
</body>
</html>
