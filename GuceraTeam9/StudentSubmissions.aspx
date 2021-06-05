<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StudentSubmissions.aspx.cs" Inherits="GuceraTeam9.StudentSubmissions" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="students Submissions"></asp:Label>
            <br />
            <br />
            instructorID&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="instructorID" runat="server"></asp:TextBox>
            <br />
            courseID&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="courseID" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="viewSubs" runat="server" Text="view" OnClick="viewSubs_Click" />
        </div>
            <div>
                <asp:Panel ID="Panel1" runat="server"></asp:Panel>

        </div>
    </form>
</body>
</html>
