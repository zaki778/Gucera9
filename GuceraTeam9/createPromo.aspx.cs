using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace GuceraTeam9
{
    public partial class createPromo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void onCreate(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Gucera10"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
            if (String.IsNullOrEmpty(code.Text)|| String.IsNullOrEmpty(IssueDate.Text) || String.IsNullOrEmpty(ExpiryDate.Text)|| String.IsNullOrEmpty(Discount.Text) || String.IsNullOrEmpty(AdminID.Text))
                System.Windows.Forms.MessageBox.Show("Please Fill All Fields");
           

            else
            {
                Int32 pcode = Int32.Parse(code.Text);
                string pidate = IssueDate.Text.ToString();
                string pedate = ExpiryDate.Text.ToString();
                int pdiscount = Int16.Parse(Discount.Text);
                int admID = Int16.Parse(AdminID.Text);
                SqlCommand createProc = new SqlCommand("AdminCreatePromocode", conn);
                createProc.CommandType = CommandType.StoredProcedure;
                createProc.Parameters.Add(new SqlParameter("@code", pcode));
                createProc.Parameters.Add(new SqlParameter("@isuueDate", pidate));
                createProc.Parameters.Add(new SqlParameter("@expiryDate", pedate));
                createProc.Parameters.Add(new SqlParameter("@discount", pdiscount));
                createProc.Parameters.Add(new SqlParameter("@adminId", admID));
                conn.Open();
                createProc.ExecuteNonQuery();
                conn.Close();
                MessageBox.Show("Successfully created");

            }


            
             

           
        }
    }
}