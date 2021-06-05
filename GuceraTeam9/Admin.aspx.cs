using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GuceraTeam9
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void allcourses_Click(object sender, EventArgs e)
        {
            Response.Redirect("allCourses.aspx");
        }

        protected void pendcourse_Click(object sender, EventArgs e)
        {
            Response.Redirect("pendCourse.aspx");

        }

        protected void accCourse_Click(object sender, EventArgs e)
        {
            Response.Redirect("reqCourses.aspx");

        }

        protected void createPromo_Click(object sender, EventArgs e)
        {
            Response.Redirect("createPromo.aspx");

        }

        protected void issuePromo_Click(object sender, EventArgs e)
        {
            Response.Redirect("issuePromo.aspx");

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("addNumber.aspx");
        }
    }
}