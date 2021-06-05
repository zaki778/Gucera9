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
    public partial class student2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void viewAssignment_Click(object sender, EventArgs e)
        {
            string url;
            url = "viewAssignment.aspx?cid=" + TextBox1.Text;
            Response.Redirect(url);
        }

        
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("submitAssignment.aspx");
        }

        

       

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("gradeOfAssignment.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("addFeedback.aspx");
        }

        protected void viewCert_Click(object sender, EventArgs e)
        {
            string url;
            url = "viewCertificate.aspx?cid=" + TextBox2.Text;
            Response.Redirect(url);
        }

        // string url;
        //url = "viewCertificate.aspx?cid=" + TextBox2.Text;
        //  Response.Redirect(url);

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("profile.aspx");
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("courses.aspx");
            
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("promocodes.aspx");
        }


        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("addcreditcard.aspx");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("addNumber.aspx");
        }
    }
}