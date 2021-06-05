using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GuceraTeam9
{
    public partial class addCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

            Response.Write(Session["user"]);

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Gucera10"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(@connStr);

            int credithours0 = Int16.Parse(credithours.Text);
            String name0 = name.Text;
            int price0 = Int16.Parse(price.Text);
            int instructorId0 = Int16.Parse(instructorId.Text);

            SqlCommand addCourse = new SqlCommand("InstAddCourse", conn);
            addCourse.CommandType = CommandType.StoredProcedure;

            addCourse.Parameters.Add(new SqlParameter("@credithours", credithours0));
            addCourse.Parameters.Add(new SqlParameter("@name", name0));
            addCourse.Parameters.Add(new SqlParameter("@price", price0));
            addCourse.Parameters.Add(new SqlParameter("@instructorId", instructorId0));

             conn.Open();
             int num = addCourse.ExecuteNonQuery();
             conn.Close();
            if (num > 0)
            {
                Response.Write("Course Added Successfully");
            }
            else
            {
                Response.Write("this instructor doesn't exist");
                
            }
        }
    }
}