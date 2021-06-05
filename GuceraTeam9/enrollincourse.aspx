
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="enrollincourse.aspx.cs" Inherits="GuceraTeam9.enrollincourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            direction: ltr;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <br />
        Enter Course ID to Enroll
        <asp:TextBox ID="cidenroll" runat="server" Width="42px"></asp:TextBox>
        <br />
        Enter your Sutdent ID
        <asp:TextBox ID="sidenroll" runat="server" Width="38px"></asp:TextBox>
        <br />
        Enter your Instructor&#39;s ID
        <asp:TextBox ID="instrid" runat="server" Width="38px"></asp:TextBox>
&nbsp;<p>
        <asp:Button ID="enroll" runat="server" OnClick="enroll_Click" Text="Enroll in a course" />
        </p>
        <p>
            <asp:Button ID="backtocourses" runat="server" Text="Back to Courses" OnClick="backtocourses_Click" />
        </p>
        <p>
            <asp:Button ID="backtostudent" runat="server" Text="Back to student" OnClick="backtostudent_Click" />
        </p>
    </form>
</body>
</html>
