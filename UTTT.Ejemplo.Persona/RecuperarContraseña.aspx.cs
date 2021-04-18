using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UTTT.Ejemplo.Persona.Control.Ctrl;

namespace UTTT.Ejemplo.Persona
{
    public partial class RecuperarContraseña : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRecPass_Click(object sender, EventArgs e)
        {
            string mainconn = ConfigurationManager.ConnectionStrings["bdPersonConnectionString"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(mainconn);
            string sqlquery = "select a.strUsuario, a.strPassword, b.strCorreoElectronico from Usuario a, Persona b where b.strCorreoElectronico=@strCorreoElectronico";
            SqlCommand sqlcomm = new SqlCommand(sqlquery, sqlconn);
            sqlcomm.Parameters.AddWithValue("@strCorreoElectronico", txtCorreo.Text);
            sqlconn.Open();
            SqlDataReader sdr = sqlcomm.ExecuteReader();
            if (sdr.Read())
            {
                string username = sdr["strUsuario"].ToString();
                string password = sdr["strPassword"].ToString();

                MailMessage msg = new MailMessage("dayra.daniela.reyes.hernandez@gmail.com", txtCorreo.Text);
                msg.Subject = "Recuperar password";
                msg.Body = string.Format("Hola! Agradecemos el uso de nuestro sistema: <h1>{0} </h1> <br/> El password es : <h1>{1} </h1> ", username, password);
                msg.BodyEncoding = System.Text.Encoding.UTF8;
                msg.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.EnableSsl = true;
                NetworkCredential from = new NetworkCredential();
                from.UserName = "dayra.daniela.reyes.hernandez@gmail.com";
                from.Password = "ddrh241000";
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = from;
                smtp.Port = 587;
                smtp.Send(msg);
                lblError.Text = " Su password se ha enviado al correo " + txtCorreo.Text;
                lblError.ForeColor = Color.Blue;

                //if (lblError.ForeColor == Color.Blue)
                //{
                //    this.Response.Redirect("~/Login.aspx", false);
                //}
                

                
            }
            else
            {
                lblError.Text = txtCorreo.Text + " - El correo no fue encontrado en la base de datos ";
                lblError.ForeColor = Color.Red;
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                this.Response.Redirect("~/Login.aspx", false);
            }
            catch (Exception _e)
            {
                this.showMessage("Ha ocurrido un error inesperado");
            }
        }
    }
}