<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GradeStudent.aspx.cs" Inherits="GuceraTeam9.GradeStudent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form2" runat="server">
        <div>
            Grade Student<br />
            <br />
            instructorId&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="instructorId" runat="server"></asp:TextBox>
            <br />
            studentId&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="studentId" runat="server"></asp:TextBox>
            <br />
            courseId&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="courseId" runat="server"></asp:TextBox>
            <br />
            assignmentNumber&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="assignmentNumber" runat="server"></asp:TextBox>
            <br />
            type&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="type" runat="server"></asp:TextBox>
            <br />
            grade&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="grade" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="submitButton" runat="server" Text="submit" OnClick="submitButton_Click" />
        </div>
    </form>
    
        <div>
        </div>
    
</body>
</html>
