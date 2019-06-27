<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ex0503-1.aspx.cs" Inherits="ex00.ex0503_1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            ID : <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <!-- ControlToValidate : 검사할 컨트롤의 ID -->
            <!-- ErrorMessage : 유효하지않을 경우 나오는 메시지 -->
            <!-- SetFocusOnError : 에러 발생 시, 커서가 해당 컨트롤에 있도록 설정 -->
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please input ID"
                ControlToValidate="TextBox1" SetFocusOnError="true">
            </asp:RequiredFieldValidator>
            <br />
            PW : <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox><br />
            <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
            <br />
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                ControlToValidate="TextBox3" ValidationExpression="\d{3}-\d{4}-\d{4}"
                ErrorMessage="전화번호를 제대로 입력해주세요.">

            </asp:RegularExpressionValidator>

        </div>
    </form>
</body>
</html>
