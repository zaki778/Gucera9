<%@ Page Language="C#" AutoEventWireup="true" CodeFile="courses.aspx.cs" Inherits="GuceraTeam9.courses" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        Enter Course ID to view its info
        <asp:TextBox ID="cidview" runat="server" Width="93px"></asp:TextBox>
        <asp:Button ID="viewCourseInfo" runat="server" Text="view" OnClick="viewCourseInfo_Click" />
        <br />
        <br />
        <p>
        <asp:Button ID="enroll" runat="server" OnClick="enroll_Click" Text="Enroll in a course" />
        </p>
        <p>
            <asp:Button ID="backToStudent" runat="server" Text="Go Back to Student" OnClick="backToStudent_Click" />
        </p>
    </form>
</body>
</html>
