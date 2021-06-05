using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace GuceraTeam9
{
    public partial class Login : System.Web.UI.Page
    {
        
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void toRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("registeration.aspx");
        }
        protected void login(object sender, EventArgs e)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["Gucera10"].ToString(); 
            SqlConnection conn = new SqlConnection(connectionString);
            

          


                int id = Int16.Parse(UserName.Text);
                string pass = Password.Text;

                SqlCommand loginProc = new SqlCommand("userLogin", conn);
                loginProc.CommandType = CommandType.StoredProcedure;
                loginProc.Parameters.Add(new SqlParameter("@id", id));
                loginProc.Parameters.Add(new SqlParameter("@password", pass));

                SqlParameter success = loginProc.Parameters.Add("@success", SqlDbType.Int);
                SqlParameter type = loginProc.Parameters.Add("@type", SqlDbType.Int);

                success.Direction = ParameterDirection.Output;
                type.Direction = ParameterDirection.Output;

                conn.Open();
                loginProc.ExecuteNonQuery();
                conn.Close();

                if (success.Value.ToString() == "1")
                {
                    Session["user"] = id;
                    switch (type.Value.ToString())
                    {
                        case "2": Response.Redirect("student2.aspx"); break;
                        case "1": Response.Redirect("Admin.aspx"); break;
                        default: Response.Redirect("Instructor.aspx"); break;




                    }

                }
                else
                {
                    Response.Write("Login Failed, use valid username or password");
                }
            }

        }

        

     
        
    }
