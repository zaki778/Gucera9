using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace GuceraTeam9
{
    public partial class profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void viewProfile_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GUCera10"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int id = Int16.Parse(TextBox1.Text);


            SqlCommand viewProfileProc = new SqlCommand("viewMyProfile", conn);
            viewProfileProc.Parameters.Add(new SqlParameter("@id", sid));

            // o/p is in a table a label w automatically fill it with the data

            conn.Open();
            SqlDataReader rdr = viewProfileProc.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                String studentProfile = rdr.GetString(rdr.GetOrdinal(""));
                Label profile = new Label();
                profile.Equals(studentProfile + "<br>");
                form1.Controls.Add(profile);
            }

            viewProfileProc.ExecuteNonQuery();

            conn.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("student.aspx");
            
        }
    }
}