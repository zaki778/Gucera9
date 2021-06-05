<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Instructor.aspx.cs" Inherits="GuceraTeam9.Instructor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <span class="auto-style1"><strong>Instructor&#39;s Page</strong></span><br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="AddCourse" OnClick="Button1_Click" />
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" Text="DefineAssignment" OnClick="Button2_Click" />
            <br />
            <br />
            <asp:Button ID="Button3" runat="server" Text="ViewAssignment" OnClick="Button3_Click" />
            <br />
            <br />
            <asp:Button ID="Button4" runat="server" Text="GradeAssignment" OnClick="Button4_Click" />
            <br />
            <br />
            <asp:Button ID="Button5" runat="server" Text="ViewFeedback" OnClick="Button5_Click" />
            <br />
            <br />
            <asp:Button ID="Button6" runat="server" Text="IssueCertificate" OnClick="Button6_Click" />
            <br />
            <br />
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Add Mobile</asp:LinkButton>
            <br />
            <br />
        </div>
    </form>
</body>
</html>
