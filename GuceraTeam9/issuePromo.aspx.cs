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
    public partial class issuePromo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void onIssue(object sender, EventArgs e)
        {

            string connStr = WebConfigurationManager.ConnectionStrings["Gucera10"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
            if (String.IsNullOrEmpty(stID.Text) || String.IsNullOrEmpty(poID.Text))
                System.Windows.Forms.MessageBox.Show("Please Fill All Fields");

            else
            {
                Int16 sid = Int16.Parse(stID.Text);
                Int32 pid = Int32.Parse(poID.Text);

                SqlCommand issueProc = new SqlCommand("AdminIssuePromocodeToStudent", conn);
                issueProc.CommandType = CommandType.StoredProcedure;

                issueProc.Parameters.Add(new SqlParameter("@sid", sid));
                issueProc.Parameters.Add(new SqlParameter("@pid", pid));

                conn.Open();
                issueProc.ExecuteNonQuery();
                conn.Close();
                MessageBox.Show("Successfully issued");
            }
        }
    }
}