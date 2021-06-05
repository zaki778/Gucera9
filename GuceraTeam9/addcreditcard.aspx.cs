using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GuceraTeam9
{
    public partial class addcreditcard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void addCard_Click(object sender, EventArgs e)
        {
            // @sid int, @number varchar(15), @cardHolderName varchar(16), @expiryDate datetime, @cvv varchar(3)

            string connStr = WebConfigurationManager.ConnectionStrings["Gucera10"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int sid = Int16.Parse(sid1.Text);
            int number = Int32.Parse(cardNumber.Text);
            string name = cardHolderName.Text;
            DateTime expiry = DateTime.Parse(expirydate.Text);
            int cvvnumber = Int16.Parse(cvv.Text);


            SqlCommand addcard = new SqlCommand("addCreditCard", conn);

            addcard.Parameters.Add(new SqlParameter("@sid", sid));
            addcard.Parameters.Add(new SqlParameter("@number", number));
            addcard.Parameters.Add(new SqlParameter("@cardHolderName", name));
            addcard.Parameters.Add(new SqlParameter("@expiryDate", expiry));
            addcard.Parameters.Add(new SqlParameter("@cvv", cvvnumber));

            // how to confirm it was added?
            Response.Write("Credit card added");

            conn.Open();
            addcard.ExecuteNonQuery();
            conn.Close();

        }

        protected void backtostudent_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("student.aspx");
            
        }
    }
}