<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="createPromo.aspx.cs" Inherits="GuceraTeam9.createPromo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            height: 356px;
        }
    </style>
</head>
<body style="height: 313px">
    <form id="form1" runat="server">
        <div>
        </div>
        Create Promocode:<br />
        <br />
        Code<br />
        <asp:TextBox ID="code" runat="server" ></asp:TextBox>
        <br />
        Issue Date (Insert in YYYYMMDD format. ex: 20210417)<br />
        <asp:TextBox ID="IssueDate" runat="server" ></asp:TextBox>
        <br />
        Expiry Date (Insert in YYYYMMDD format. ex: 20210417)<br />
        <asp:TextBox ID="ExpiryDate" runat="server" ></asp:TextBox>
        <br />
        Discount<br />
        <asp:TextBox ID="Discount" runat="server" ></asp:TextBox>
        <br />
        Admin ID<br />
        <asp:TextBox ID="AdminID" runat="server" ></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Create" OnClick="onCreate" />
    </form>
</body>
</html>
