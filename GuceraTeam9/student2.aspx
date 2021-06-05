<%@ Page Language="C#" AutoEventWireup="true" CodeFile="student2.aspx.cs" Inherits="GuceraTeam9.student2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            height: 337px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label3" runat="server" Text="View any Assignment Content"></asp:Label>
            <br />
            <asp:Label ID="Label1" runat="server" Text="Enter Course ID"></asp:Label>
            <br />
        </div>
        <asp:TextBox ID="TextBox1" runat="server" Height="20px" Width="77px"></asp:TextBox>
        <br />
        <asp:Button ID="viewAssignment" runat="server" Height="30px" Text="View Assginment" Width="136px" OnClick="viewAssignment_Click" />
        <br />
        <hr />
        <br />
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Click here to submit Assignments</asp:LinkButton>
        <br />
        <hr />
        <br />
        <div style="height: 311px">
            <asp:Label ID="Label2" runat="server" Text="For Assignment Grades"></asp:Label>
            <br />
            <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">Click here</asp:LinkButton>
            <br />
            <hr />
            <br />
            <asp:Label ID="Label4" runat="server" Text="For Feedbacks"></asp:Label>
            <br />
            <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">click here</asp:LinkButton>
            <br />
            <hr />
            <asp:Label ID="Label5" runat="server" Text="Enter Course ID to view certificates"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="viewCert" runat="server" Text="view" OnClick="viewCert_Click" />
            <br />
            <hr />
            <br />
            <asp:Button ID="Button1" runat="server" Text="View Profile" OnClick="Button1_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" Text="View Available Courses" OnClick="Button2_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button3" runat="server" Text="View Promocodes" OnClick="Button3_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button4" runat="server" Text="Add a new Credit Card" OnClick="Button4_Click" />
            <br />
            <hr />
            <br />

            


            
           
        </div>
        <div>
            <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click">Add Mobile</asp:LinkButton>
        </div>
    </form>
</body>
</html>
