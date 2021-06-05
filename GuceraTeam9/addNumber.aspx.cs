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
    public partial class addNumber : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Gucera10"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(@connStr);

            string id = iD.Text;
            string teleNumber = telephoneNumber.Text;

            SqlCommand addNumber = new SqlCommand("addMobile", conn);
            addNumber.CommandType = CommandType.StoredProcedure;

            addNumber.Parameters.Add(new SqlParameter("@id", id));
            addNumber.Parameters.Add(new SqlParameter("@mobile_number", teleNumber));

            Response.Write("Your ID is ");
            Response.Write(Session["user"]);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Gucera10"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(@connStr);

            string id = iD.Text;
            string teleNumber = telephoneNumber.Text;

            SqlCommand addNumber = new SqlCommand("addMobile", conn);
            addNumber.CommandType = CommandType.StoredProcedure;

            addNumber.Parameters.Add(new SqlParameter("@id", id));
            addNumber.Parameters.Add(new SqlParameter("@mobile_number", teleNumber));

            conn.Open();
           int a= addNumber.ExecuteNonQuery();
            conn.Close();
            if (a > 0)
            {
                Response.Write("Number added");
            }
            else
            {
                Response.Write("Not Added");
            }
        }

    }
}