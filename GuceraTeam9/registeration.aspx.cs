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
    public partial class registeration : System.Web.UI.Page
    {
        

        

        protected void studentRegister_Click(object sender, EventArgs e)
        {

            string connectionString = WebConfigurationManager.ConnectionStrings["GUCera10"].ToString();

            SqlConnection conn = new SqlConnection(connectionString);




            string FirstName = firstName.Text;
            string LastName = lastName.Text;
            string password = Password.Text;
            string email = Email.Text;
            string address = Address.Text;
            int gender =Int16.Parse(Gender.Text);



            SqlCommand studentRegisterProc = new SqlCommand("studentRegister", conn);
            studentRegisterProc.CommandType = CommandType.StoredProcedure;

            studentRegisterProc.Parameters.Add(new SqlParameter("@first_name", FirstName));
            studentRegisterProc.Parameters.Add(new SqlParameter("@last_name", LastName));
            studentRegisterProc.Parameters.Add(new SqlParameter("@password", password));
            studentRegisterProc.Parameters.Add(new SqlParameter("@email", email));
            studentRegisterProc.Parameters.Add(new SqlParameter("@gender", gender));
            studentRegisterProc.Parameters.Add(new SqlParameter("@address", address));

            



           conn.Open();
          studentRegisterProc.ExecuteNonQuery();
           conn.Close();

            //  string Gender = 
            



        }

        protected void instructorRegister_Click(object sender, EventArgs e)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings ["Gucera10"].ToString();

            SqlConnection conn = new SqlConnection(connectionString);




            string FirstName = firstName.Text;
            string LastName = lastName.Text;
            string password = Password.Text;
            string email = Email.Text;
            string address = Address.Text;
            int gender = Int16.Parse(Gender.Text);



            SqlCommand instructorRegister = new SqlCommand("InstructorRegister", conn);
            instructorRegister.CommandType = CommandType.StoredProcedure;

            instructorRegister.Parameters.Add(new SqlParameter("@first_name", FirstName));
            instructorRegister.Parameters.Add(new SqlParameter("@last_name", LastName));
            instructorRegister.Parameters.Add(new SqlParameter("@password", password));
            instructorRegister.Parameters.Add(new SqlParameter("@email", email));
            instructorRegister.Parameters.Add(new SqlParameter("@gender", gender));
            instructorRegister.Parameters.Add(new SqlParameter("@address", address));
            


            conn.Open();
            instructorRegister.ExecuteNonQuery();
            conn.Close();

        }
    }
}