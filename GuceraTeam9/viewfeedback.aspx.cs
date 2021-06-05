using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GuceraTeam9
{
    public partial class viewfeedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write(Session["user"]);
        }

        protected void view_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Gucera10"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(@connStr);

            int insid = Int16.Parse(instructorID.Text);
            int cid = Int16.Parse(courseID.Text);

            SqlCommand feedback = new SqlCommand("ViewFeedbacksAddedByStudentsOnMyCourse", conn);
            feedback.CommandType = CommandType.StoredProcedure;

            feedback.Parameters.Add(new SqlParameter("instrId", insid));
            feedback.Parameters.Add(new SqlParameter("cid", cid));


            conn.Open();
            //SqlDataReader rdr = feedback.ExecuteReader(CommandBehavior.CloseConnection);
            //while (rdr.Read())
            //{
            // Int32 number0 = rdr.GetInt32(rdr.GetOrdinal("number"));
            //Label num = new Label();
            //string toString = number0.ToString();
            //num.Text = toString;
            //form1.Controls.Add(num);

            //String comment0 = rdr.GetString(rdr.GetOrdinal("comment"));
            //Label com = new Label();
            //com.Text = comment0 ;
            //form1.Controls.Add(com);

            //Int32 numberoflikes0 = rdr.GetInt32(rdr.GetOrdinal("numberOfLikes"));
            //Label numlikes = new Label();
            //numlikes.Text = numberoflikes0.ToString();
            //form1.Controls.Add(numlikes);
            //}
            SqlDataAdapter sda = new SqlDataAdapter(feedback);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            StringBuilder sb = new StringBuilder();
            sb.Append("<center>");
            sb.Append("<table border=1>");
            sb.Append("<tr>");
            foreach (DataColumn dc in dt.Columns)
            {
                sb.Append("<th>");
                sb.Append(dc.ColumnName.ToUpper());
                sb.Append("</th>");
            }
            sb.Append("</tr>");

            foreach (DataRow dr in dt.Rows)
            {
                sb.Append("<tr>");
                foreach (DataColumn dc in dt.Columns)
                {
                    sb.Append("<th>");
                    sb.Append(dr[dc.ColumnName].ToString());
                    sb.Append("</th>");
                }
                sb.Append("</tr>");


            }
            sb.Append("</table>");
            sb.Append("</center>");


            if (sb.Length != 103)
            {
                Panel1.Controls.Add(new Label { Text = sb.ToString() });

            }

            else
            {
                Response.Write("no feedback");
            }

            //Response.Write(sb.Length);

            conn.Close();

        }
    }
}