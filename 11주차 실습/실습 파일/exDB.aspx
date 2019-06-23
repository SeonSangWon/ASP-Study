<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="exDB.aspx.cs" Inherits="ex00.exDB" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>DB연결</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>데이터베이스 연결 실습<br /><br />
            <asp:Button ID="Button1" runat="server" Text="DB연결" OnClick="Button1_Click"/>
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>
