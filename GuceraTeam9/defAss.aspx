<%@ Page Language="C#" AutoEventWireup="true" CodeFile="defAss.aspx.cs" Inherits="GuceraTeam9.defAss" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Define Assignment"></asp:Label>
&nbsp;&nbsp;&nbsp;
            <br />
            <br />
            Instructor_Id&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Instructor_Id" runat="server"></asp:TextBox>
            <br />
            Course_Id&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Course_Id" runat="server"></asp:TextBox>
            <br />
            Number&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Number" runat="server"></asp:TextBox>
            <br />
            type&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="type" runat="server"></asp:TextBox>
            <br />
            fullgrade&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="fullgrade" runat="server"></asp:TextBox>
            <br />
            weight&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="weight" runat="server"></asp:TextBox>
            <br />
            deadline&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="deadline" runat="server"></asp:TextBox>
            <br />
            content&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="content" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Done" />
        </div>
    </form>
</body>
</html>
