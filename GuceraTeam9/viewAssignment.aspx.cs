using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Windows.Forms;

namespace GuceraTeam9
{
    public partial class viewAssignment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int courseID;
            courseID = Int16.Parse(Request.QueryString["cid"]);

            string connectionString = WebConfigurationManager.ConnectionStrings["Gucera10"].ToString();
            SqlConnection conn = new SqlConnection(connectionString);

            SqlCommand viewAssignProc = new SqlCommand("viewAssign", conn);
            viewAssignProc.CommandType= CommandType.StoredProcedure;

            viewAssignProc.Parameters.Add(new SqlParameter("@courseId", courseID));
            viewAssignProc.Parameters.Add(new SqlParameter("@Sid", Session["user"]));


            
            conn.Open();
            SqlDataAdapter sda = new SqlDataAdapter(viewAssignProc);
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


            if (sb.Length != 156)
            {
                Panel1.Controls.Add(new System.Web.UI.WebControls.Label { Text = sb.ToString() });
                
            }
                
            else
            {
                MessageBox.Show("student not enrolled in course or did not finish any course's Assignment ");
            }
                


            viewAssignProc.ExecuteNonQuery();
            conn.Close();

        }
    }
}