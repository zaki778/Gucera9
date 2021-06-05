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
    public partial class Instructor : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write(Session["user"]);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("addCourse.aspx");
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("defAss.aspx");
            
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("StudentSubmissions.aspx");
            
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("GradeStudent.aspx");
            
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("viewfeedback.aspx");
            
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("certificate.aspx");
            
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("addNumber.aspx");
        }
    }
}