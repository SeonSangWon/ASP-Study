﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ex00
{
    public partial class ex0503 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int rowCount = int.Parse(DropDownList1.SelectedItem.Value);
            int cellCount = int.Parse(DropDownList2.SelectedItem.Value);

            for(int i=0; i<rowCount; i++)
            {
                TableRow row = new TableRow();
                for(int k=0; k<cellCount; k++)
                {
                    TableCell cell = new TableCell();
                    cell.Controls.Add(new LiteralControl("(" + i.ToString() + "행 " + k.ToString() + "셀 )"));
                    row.Controls.Add(cell);
                }
                Table1.Rows.Add(row);
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }
    }
}