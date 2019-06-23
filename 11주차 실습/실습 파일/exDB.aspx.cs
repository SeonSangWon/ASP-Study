using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ex00
{
    public partial class exDB : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Data Source=.서버명(MsSQL); Initial Catalog=데이터베이스명; Integrated Security=true(Windows인증)
            //false(Sql Server인증); uid=사용자계정 pwd=비밀번호
            //명명인스턴스로 생성하지 않았을 경우 : MsSQL Server 관리자 > 서비스 > 실행 중인 서버가 이름이다.
            SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS_ASP; Initial Catalog=MyDB;" +
                "Integrated Security=true");
            Label1.Text = "<font color='red'>";
            Label1.Text += "<br />서버 접속 시간 : ---" +
                DateTime.Now.ToString() + "---<br />";

            try
            {
                con.Open(); //데이터베이스 연결
                Label1.Text += "서버 버전 : " + con.ServerVersion;    //해당 서버의 버전을 확인
            }catch (Exception er) {
                Label1.Text += "데이터베이스 읽기 오류입니다. <br />";
                Label1.Text += er.Message;  //해당 에러에 대한 메시지

            }
            finally
            {
                con.Close();    //연결 끊기
                Label1.Text += "<br />마지막 상태 : " + con.State.ToString(); //현재 상태를 문자열로 변환하여 출력
                Label1.Text += "</font>";
            }
        }
    }
}