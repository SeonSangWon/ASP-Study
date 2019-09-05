<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ex0503.aspx.cs" Inherits="ex00.ex0503" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Table ID="Table1" runat="server" BorderWidth="1" CellPadding="5" CellSpacing="0" GridLines="Both" 
                BorderColor="Blue">

            </asp:Table>
            <br />
            <p>행의 수 : &nbsp;&nbsp;&nbsp; 셀의 수 :</p>
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem Value="1">1행</asp:ListItem>
                <asp:ListItem Value="2">2행</asp:ListItem>
                <asp:ListItem Value="3">3행</asp:ListItem>
                <asp:ListItem Value="4">4행</asp:ListItem>
            </asp:DropDownList> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownList2" runat="server">
                <asp:ListItem Value="1">1셀</asp:ListItem>
                <asp:ListItem Value="2">2셀</asp:ListItem>
                <asp:ListItem Value="3">3셀</asp:ListItem>
                <asp:ListItem Value="4">4셀</asp:ListItem>
            </asp:DropDownList><br /><br />
            <asp:Button ID="Button1" runat="server" Text="테이블 생성" OnClick="Button1_Click" Height="25" Width="100" BackColor="#9999FF" />
            <hr />
            <asp:Table ID="Table2" runat="server" BorderWidth="1">
                <asp:TableRow>
                    <asp:TableCell Width="100" HorizontalAlign="Center">이름</asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox1" runat="server" Text="" Columns="30" BackColor="#A7EEFF"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Center">아이디</asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox2" runat="server" Text="" Columns="30" BackColor="#BECDFF"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Center">비밀번호</asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox3" runat="server" Text="" TextMode="Password" Columns="30"
                            BackColor="#FFF064"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Center">전화번호</asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox4" runat="server" Text="" Columns="30" BackColor="#FFCAD5"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Center">메모</asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox5" runat="server" Text="" Rows="3" TextMode="MultiLine" Columns="31"
                            BackColor="#7FFFD4"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableFooterRow>
                    <asp:TableCell ColumnSpan="2" HorizontalAlign="Center">
                        <asp:Button ID="Button2" runat="server" Text="회원가입" OnClick="Button2_Click" BorderStyle="Double" 
                            BackColor="#CCFFCC" BorderColor="Black" Height="25" Width="100" />
                    </asp:TableCell>
                </asp:TableFooterRow>
            </asp:Table>
        </div>
    </form>
</body>
</html>
