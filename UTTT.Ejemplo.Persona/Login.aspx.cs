using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UTTT.Ejemplo.Linq.Data.Entity;

namespace UTTT.Ejemplo.Persona
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            lblError.Visible = false;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection("Data Source = bdPerson.mssql.somee.com; Initial Catalog = bdPerson; User ID = danirher; Password = dan12345"))

            {
                string query = "SELECT COUNT(1) FROM USUARIO WHERE strUsuario=@strUsuario AND strPassword=@strPassword";
                SqlCommand sqlcmd = new SqlCommand(query, sqlCon);

                sqlcmd.Parameters.AddWithValue("@strUsuario", txtUsuarioName.Text.Trim());

                sqlcmd.Parameters.AddWithValue("@strPassword", txtPassword.Text.Trim());


                sqlCon.Open();
                int count = Convert.ToInt32(sqlcmd.ExecuteScalar());
                if (count == 1)
                {
                    Session["strUsuario"] = txtUsuarioName.Text.Trim();
                    Response.Redirect("Inicio.aspx");

                }
                else 
                { lblError.Visible = true; }
            }


        }

    }
}