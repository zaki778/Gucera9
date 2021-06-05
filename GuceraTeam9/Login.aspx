     <%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="GuceraTeam9.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Please Sign in<br />
&nbsp;UserName:</div>
        <p>
            <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
        </p>
        <p>
            Password:</p>
        <asp:TextBox ID="Password" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="signIn" runat="server" Text="login" OnClick="login" />
        <br />
        <br />
        <hr />
        <br />
        <div>
        <asp:LinkButton ID="toRegister" runat="server" OnClick="toRegister_Click">I don't have an account</asp:LinkButton>
          </div>
    </form>
</body>
</html>
