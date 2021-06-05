<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="submitAssignment.aspx.cs" Inherits="GuceraTeam9.submitAssignment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Assignment Type"></asp:Label>

            <br />
            <br />

            <asp:TextBox ID="assignType" runat="server"></asp:TextBox>

            <br />
            <br />

            <asp:Label ID="Label2" runat="server" Text="Assignment Number"></asp:Label>

            <br />
            <br />

            <asp:TextBox ID="assignNumber" runat="server"></asp:TextBox>
            
            
            <br />
            <br />
            
            
           <asp:Label ID="Label3" runat="server" Text="Course ID"></asp:Label>

            <br />
            <br />

            <asp:TextBox ID="cid" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
