<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addcreditcard.aspx.cs" Inherits="GuceraTeam9.addcreditcard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Student ID
            <asp:TextBox ID="sid1" runat="server"></asp:TextBox>
            <br />
            card number
            <asp:TextBox ID="cardNumber" runat="server"></asp:TextBox>
            <br />
            card holder name
            <asp:TextBox ID="cardHolderName" runat="server" OnTextChanged="TextBox3_TextChanged"></asp:TextBox>
            <br />
            expiry date
            <asp:TextBox ID="expirydate" runat="server"></asp:TextBox>
            <br />
            cvv
            <asp:TextBox ID="cvv" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="addCard" runat="server" Text="Add Card" OnClick="addCard_Click" />
            <br />
            <br />
            <asp:Button ID="backtostudent" runat="server" Text="Go back to student" OnClick="backtostudent_Click" />
        </div>
    </form>
</body>
</html>
