<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gradeOfAssignment.aspx.cs" Inherits="GuceraTeam9.gradeOfAssignment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Enter Assignment Number"></asp:Label>
            <br />
            <asp:TextBox ID="assignNumber" runat="server"></asp:TextBox>
            <br />
            <br />
            
            
            <asp:Label ID="Label2" runat="server" Text="Enter Assignment Type"></asp:Label>
            <br />
            <asp:TextBox ID="assignType" runat="server"></asp:TextBox>
            <br />
            <br />

            <asp:Label ID="Label3" runat="server" Text="Enter Course ID"></asp:Label>
            <br />
            <asp:TextBox ID="courseID" runat="server"></asp:TextBox>

            <br />
            <br />
            <asp:Button ID="viewGrades" runat="server" Height="27px" Text="View" Width="145px" OnClick="viewGrades_Click" />

        </div>
    </form>
</body>
</html>
