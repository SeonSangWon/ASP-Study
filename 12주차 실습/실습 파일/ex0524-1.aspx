<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    void BindUserID()
    {
        SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS_ASP; Initial Catalog=MyDB;" +
            "Integrated Security=true");
        string sql = "Select * From member";
        SqlCommand cmd = new SqlCommand(sql, con);
        SqlCommand cmd2 = new SqlCommand(sql, con);

        con.Open();
        SqlDataReader rd = cmd.ExecuteReader();

        DropDownList1.DataSource = rd;
        DropDownList1.DataValueField = "UserID";
        DropDownList1.DataTextField = "UserID";
        DropDownList1.DataBind();


        rd.Close();
        con.Close();
    }

    void SetInfo()
    {
        SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS_ASP; Initial Catalog=MyDB;" +
                 "Integrated Security=true");
        string sql = "Select * From member Where UserID=@UserID";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@UserID",DropDownList1.SelectedValue);

        con.Open();
        SqlDataReader rd = cmd.ExecuteReader();
        if(rd.Read())
        {
            TextBox5.Text = rd["Name"].ToString();
            TextBox6.Text = rd["UserID"].ToString();
            TextBox7.Text = rd["Password"].ToString();
            TextBox8.Text = rd["Phone"].ToString();
        }
        rd.Close();
        con.Close();
    }

    void BindDeleteUserID()
    {
        SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS_ASP; Initial Catalog=MyDB;" +
            "Integrated Security=true");
        string sql = "Select * From member";
        SqlCommand cmd = new SqlCommand(sql, con);
        SqlCommand cmd2 = new SqlCommand(sql, con);

        con.Open();
        SqlDataReader rd = cmd.ExecuteReader();

        DropDownList2.DataSource = rd;
        DropDownList2.DataValueField = "UserID";
        DropDownList2.DataTextField = "UserID";
        DropDownList2.DataBind();

        rd.Close();
        con.Close();
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        SetInfo();
    }

    //회원가입
    protected void Button1_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
    }

    //회원수정
    protected void Button2_Click(object sender, EventArgs e)
    {
        BindUserID();
        SetInfo();
        MultiView1.ActiveViewIndex = 1;
    }

    //회원삭제
    protected void Button3_Click(object sender, EventArgs e)
    {
        BindDeleteUserID();
        MultiView1.ActiveViewIndex = 2;
    }

    //회원목록
    protected void Button4_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 3;
        SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS_ASP; Initial Catalog=MyDB;" +
                 "Integrated Security=true");

        string sql = "Select * From member";
        SqlCommand cmd = new SqlCommand(sql, con);

        con.Open();
        SqlDataReader rd = cmd.ExecuteReader();

        while(rd.Read())
        {
            TableRow row = new TableRow();
            for(int i=0; i<1; i++)
            {
                TableCell cell1 = new TableCell();
                TableCell cell2 = new TableCell();
                TableCell cell3 = new TableCell();
                TableCell cell4 = new TableCell();
                cell1.Controls.Add(new LiteralControl(rd["UserID"].ToString()));
                cell2.Controls.Add(new LiteralControl(rd["Password"].ToString()));
                cell3.Controls.Add(new LiteralControl(rd["Name"].ToString()));
                cell4.Controls.Add(new LiteralControl(rd["Phone"].ToString()));
                row.Controls.Add(cell1);
                row.Controls.Add(cell2);
                row.Controls.Add(cell3);
                row.Controls.Add(cell4);
            }
            Table3.Rows.Add(row);
        }

    }

    //회원가입버튼 클릭
    protected void Button5_Click(object sender, EventArgs e)
    {
        //회원가입
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
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        TextBox4.Text = "";
    }

    //회원가입취소 버튼 클릭
    protected void Button6_Click(object sender, EventArgs e)
    {
        //취소
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        TextBox4.Text = "";
        Label1.Text = "작업을 취소했습니다. 다시 입력하세요.";
    }

    //회원수정 버튼 클릭
    protected void Button7_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS_ASP; Initial Catalog=MyDB;" +
                 "Integrated Security=true");

        string sql = "UPDATE member Set Name=@Name, Password=@Password, Phone=@Phone Where UserID=@UserID";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@Name", TextBox5.Text);
        cmd.Parameters.AddWithValue("@Password", TextBox7.Text);
        cmd.Parameters.AddWithValue("@Phone", TextBox8.Text);
        cmd.Parameters.AddWithValue("@UserID", DropDownList1.SelectedValue);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        Label3.Text = DropDownList1.SelectedValue + "님의 정보가 수정되었습니다.";
    }

    //회원탈퇴 버튼 클릭
    protected void Button8_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS_ASP; Initial Catalog=MyDB;" +
                 "Integrated Security=true");

        string sql = "Delete From member Where UserID=@UserID";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@UserID",DropDownList2.SelectedValue);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        Label5.Text = DropDownList2.SelectedValue + "님의 정보가 삭제되었습니다.";
        BindDeleteUserID();
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
            <br />
            <asp:Button ID="Button1" runat="server" Text="회원가입" BackColor="#CCFFFF" Height="40" Width="100" OnClick="Button1_Click" />&nbsp;
            <asp:Button ID="Button2" runat="server" Text="회원수정" BackColor="#CCFFFF" Height="40" Width="100" OnClick="Button2_Click" />&nbsp;
            <asp:Button ID="Button3" runat="server" Text="회원탈퇴" BackColor="#CCFFFF" Height="40" Width="100" OnClick="Button3_Click" />&nbsp;
            <asp:Button ID="Button4" runat="server" Text="회원목록" BackColor="#CCFFFF" Height="40" Width="100" OnClick="Button4_Click" />
            <br />
            <!-- 멀티뷰-->
            <!-- -1: 아무것도 안나옴 -->
            <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="-1">
                <!-- 회원가입 -->
                <asp:View ID="View1" runat="server" >
                    <asp:Table ID="Table1" runat="server">
                        <asp:TableRow>
                            <asp:TableCell>
                                이 름
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                아이디
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                암 호
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                연락처
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Button ID="Button5" runat="server" Text="회원가입" OnClick="Button5_Click" />&nbsp;
                                <asp:Button ID="Button6" runat="server" Text="취소" OnClick="Button6_Click" />
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </asp:View>
                <!-- 회원수정 -->
                <asp:View ID="View2" runat="server">
                    <asp:Label ID="Label2" runat="server" Text="아이디 선택 : "></asp:Label>
                    <asp:DropDownList ID="DropDownList1" runat="server" 
                        OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
                    </asp:DropDownList>
                    <asp:Table ID="Table2" runat="server">
                        <asp:TableRow>
                            <asp:TableCell>
                                이 름
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                아이디
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox ID="TextBox6" runat="server" Enabled="False"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                암 호
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                연락처
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Button ID="Button7" runat="server" Text="정보수정" OnClick="Button7_Click" />
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                    <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                </asp:View>
                <!-- 회원탈퇴 -->
                <asp:View ID="View3" runat="server">
                    <asp:Label ID="Label4" runat="server" Text="아이디 선택 : "></asp:Label>
                    <asp:DropDownList ID="DropDownList2" runat="server"></asp:DropDownList>
                    <asp:Button ID="Button8" runat="server" Text="회원탈퇴" OnClick="Button8_Click" />
                    <br />
                    <asp:Label ID="Label5" runat="server" Text=""></asp:Label>
                </asp:View>
                <!-- 회원목록 -->
                <asp:View ID="View4" runat="server">
                    <br />
                    <asp:Table ID="Table3" runat="server" BorderWidth="1" CellPadding="5" CellSpacing="0" GridLines="Both" 
                        BorderColor="Blue">
                        <asp:TableRow>
                            <asp:TableCell>아이디</asp:TableCell>
                            <asp:TableCell>비밀번호</asp:TableCell>
                            <asp:TableCell>이름</asp:TableCell>
                            <asp:TableCell>연락처</asp:TableCell>
                        </asp:TableRow>

                    </asp:Table>
                </asp:View>
            </asp:MultiView>
        </div>
    </form>
</body>
</html>
