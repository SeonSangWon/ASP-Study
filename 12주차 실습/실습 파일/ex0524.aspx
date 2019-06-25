﻿<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>

<script runat="server">
    protected void Button1_Click(object sender, EventArgs e)
    {
        //확인 버튼 클릭
        //개체 생성 > 개체 열기 > SQL문 실행 > 개체 닫기

        //Integrated Security=true Window인증
        //Integrated Security=False SQPServer인증
        SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS_ASP; Initial Catalog=MyDB;" +
                 "Integrated Security=true");

        string sql = "INSERT INTO member Values(@UserID, @Password, @Name, @Phone)";

        //해당 SQL문을 con개체와 연동하여 실행한다.
        SqlCommand cmd = new SqlCommand(sql, con);

        //sql문의 @파라미터값 가져오기
        cmd.Parameters.AddWithValue("@Name", TextBox1.Text);
        cmd.Parameters.AddWithValue("@UserID", TextBox2.Text);
        cmd.Parameters.AddWithValue("@Password", TextBox3.Text);
        cmd.Parameters.AddWithValue("@Phone", TextBox4.Text);

        //SQLConnection개체 열기
        con.Open();

        //결과값이 없을경우 NonQuert()사용
        cmd.ExecuteNonQuery();

        //SQLConnection개체 닫기
        con.Close();

        //입력완료 확인작업
        Label1.Text = "<br>" + TextBox1.Text + "의 입력완료";
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        //취소 버튼 클릭
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        TextBox4.Text = "";
        Label1.Text = "작업을 취소했습니다. 다시 입력하세요.";
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr height="30">
                    <td align="center">이 름</td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr height="30">
                    <td align="center">아이디</td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr height="30">
                    <td align="center">암 호</td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr height="30">
                    <td align="center">연락처</td>
                    <td>
                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr height="30">
                    <td align="center" colspan="2">
                        <asp:Button ID="Button1" runat="server" Text="확인" OnClick="Button1_Click" />
                        &nbsp;&nbsp;
                        <asp:Button ID="Button2" runat="server" Text="취소" OnClick="Button2_Click" />
                    </td>
                </tr>
            </table>
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>
