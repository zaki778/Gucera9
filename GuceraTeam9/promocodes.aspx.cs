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
    public partial class promocodes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void viewPromos_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Gucera10"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int sid = Int16.Parse(TextBox1.Text);

            SqlCommand viewPromocodesproc = new SqlCommand("viewPromocode", conn);
            viewPromocodesproc.Parameters.Add(new SqlParameter("@sid", sid));



            conn.Open();


            SqlDataReader rdr = viewPromocodesproc.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                String availablepromo = rdr.GetString(rdr.GetOrdinal(""));
                Label promo = new Label();
                promo.Equals(availablepromo + "<br>");
                form1.Controls.Add(promo);
            }

            viewPromocodesproc.ExecuteNonQuery();


            conn.Close();
        }

        protected void backtostudent_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("student.aspx");
            
        }
    }
}