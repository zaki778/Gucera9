<%@ Page Language="C#" AutoEventWireup="true" CodeFile="certificate.aspx.cs" Inherits="GuceraTeam9.certificate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            issue Certificate<br />
            <br />
            CourseID&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="CourseID" runat="server"></asp:TextBox>
            <br />
            StudentID&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="StudentID" runat="server"></asp:TextBox>
            <br />
            InstructorID&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="InstructorID" runat="server"></asp:TextBox>
            <br />
            IssueDate&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="IssueDate" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="submitCertificate" runat="server" Text="submit" OnClick="submitCertificate_Click" />
        </div>
    </form>
</body>
</html>
