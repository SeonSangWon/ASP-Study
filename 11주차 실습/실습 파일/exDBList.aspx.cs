﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ex00
{
    public partial class exDBList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS_ASP; Initial Catalog=MyDB;" +
                "Integrated Security=true");

            String sql = "Select UserID, Password, Name, Phone From member";

            //커맨드 객체 생성(명령문만 만듬)
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();

            //수행한 명령을 저장시킬 객체를 생성
            //ExecuteReader() : cmd 객체를 실행
            //연결기반 DB연동방식의 경우 SqlDataReader를 사용하며
            //비연결기반 DB연동방식의 경우 SqlDataAdapter를 사용한다.
            SqlDataReader rd = cmd.ExecuteReader();

            while(rd.Read())
            {
                //rd에서 읽어와 Label에 출력
                Label1.Text += String.Format("{0}, {1}, {2}, {3}<br />",
                    rd["UserID"], rd["Password"], rd["Name"], rd["Phone"]);
            }

            //종료
            rd.Close();
            con.Close();
        }
    }
}