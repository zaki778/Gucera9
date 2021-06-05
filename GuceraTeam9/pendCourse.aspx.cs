using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GuceraTeam9
{
    public partial class pendCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            {
                string connStr = ConfigurationManager.ConnectionStrings["Gucera10"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand pendProc = new SqlCommand("AdminViewNonAcceptedCourses", conn);
                pendProc.CommandType = CommandType.StoredProcedure;

                conn.Open();
                
                //IF the output is a table, then we can read the records one at a time
                SqlDataReader rdr = pendProc.ExecuteReader(CommandBehavior.CloseConnection);
                while (rdr.Read())
                {
                    //Get the value of the attribute name in the courses table
                    string courseName = rdr.GetString(rdr.GetOrdinal("name"));
                    //Create a new label and add it to the HTML form
                    Label lbl_courseName = new Label();
                    lbl_courseName.Text = "Course Name: " + courseName + "  <br /> <br />";
                    form1.Controls.Add(lbl_courseName);

                    Int32 coursecH = rdr.GetInt32(rdr.GetOrdinal("creditHours"));
                    Label lbl_coursecH = new Label();
                    lbl_coursecH.Text = "Credit Hours: " + coursecH + "  <br /> <br />";
                    form1.Controls.Add(lbl_coursecH);

                    decimal coursePrice = rdr.GetDecimal(rdr.GetOrdinal("Price"));
                    Label lbl_coursePrice = new Label();
                    lbl_coursePrice.Text = "Price: " + coursePrice + "  <br /> <br />";
                    form1.Controls.Add(lbl_coursePrice);

                    try
                    {
                        string courseCntnt = rdr.GetString(rdr.GetOrdinal("content"));
                        Label lbl_courseCntnt = new Label();
                        lbl_courseCntnt.Text = "Content: " + courseCntnt + "  <br /> <br />";
                        form1.Controls.Add(lbl_courseCntnt);
                    }
                    catch (Exception)
                    {
                        string courseCntnt = "null";
                        Label lbl_courseCntnt = new Label();
                        lbl_courseCntnt.Text = "Content: " + courseCntnt + "  <br /> <br />" + " ------------------------------------------------------------  " + "  <br /> <br />";
                        form1.Controls.Add(lbl_courseCntnt);
                    }



                }
            }

        }
    }
}