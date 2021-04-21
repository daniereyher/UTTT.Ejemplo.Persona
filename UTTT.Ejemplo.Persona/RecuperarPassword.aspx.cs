using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Linq;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UTTT.Ejemplo.Linq.Data.Entity;
using UTTT.Ejemplo.Persona.Control.Ctrl;
using UTTT.Ejemplo.Persona.Model;

namespace UTTT.Ejemplo.Persona
{
    public partial class RecuperarContraseña : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        bdPersonEntities db = new bdPersonEntities();
        DataContext dcGuardar = new DcGeneralDataContext();
        UTTT.Ejemplo.Linq.Data.Entity.Usuario usuario = new Linq.Data.Entity.Usuario();
        private UTTT.Ejemplo.Linq.Data.Entity.Usuario baseEntity;
        private DataContext dcGlobal = new DcGeneralDataContext();


        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            try
            {
                var user = db.Persona.FirstOrDefault(p => p.strCorreoElectronico == txtCorreo.Text);
                if (user != null)
                {
                    var user2 = db.Usuario.FirstOrDefault(p => p.idPersona == user.id);
                    string correo = user.strCorreoElectronico.ToString();
                    MD5("123456");
                    string tak = Token();
                    Error(tak, correo);
                    this.baseEntity = dcGlobal.GetTable<Linq.Data.Entity.Usuario>().First(c => c.id == user2.id);
                    DataContext dcGuardar = new DcGeneralDataContext();
                    UTTT.Ejemplo.Linq.Data.Entity.Usuario usuario = new Linq.Data.Entity.Usuario();
                    if (dcGlobal != null)
                    {
                        usuario = dcGuardar.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Usuario>().First(c => c.id == user2.id);
                        var por = tak;
                        Session["abc"] = por.ToString().Trim();
                        usuario.token = por.ToString().Trim();
                        var net = Session["abc"].ToString();
                        dcGuardar.SubmitChanges();
                        lblError.Text = "Se ha enviado un link para reestablecer su password al correo " + txtCorreo.Text;
                        lblError.ForeColor = Color.Blue;
                    }
                }
                else
                {
                    lblError.Text = txtCorreo.Text + " - El correo no fue encontrado en la base de datos ";
                    lblError.ForeColor = Color.Red;
                }
            }
            catch (Exception ex)
            {
                this.lblError.Text = ex.Message;
            }
        }

        public static string MD5(string word)
        {
            MD5 md5 = MD5CryptoServiceProvider.Create();
            ASCIIEncoding encoding = new ASCIIEncoding();
            byte[] stream = null;
            StringBuilder sb = new StringBuilder();
            stream = md5.ComputeHash(encoding.GetBytes(word));
            for (int i = 0; i < stream.Length; i++) sb.AppendFormat("{0:x2}", stream[i]);
            return sb.ToString();
        }


        public static string Token()
        {
            long i = 1;
            foreach (byte b in Guid.NewGuid().ToByteArray()) i *= ((int)b + 1);
            return MD5(string.Format("{0:x}", i - DateTime.Now.Ticks));
        }
        public new void Error(string error, string correo)
        {
            string EmailOrigen = "serviciobdperson@gmail.com";
            string EmailDestino = correo;
            string contra = "bdperson12345";

            MailMessage oMailMessage = new MailMessage(EmailOrigen, EmailDestino, "Este es el enlace para cambiar su password", "http://utttdanielaperson.somee.com/PSR/NuevoPass.aspx" + "?token=" + error);

            oMailMessage.IsBodyHtml = true;
            SmtpClient oSmtpClient = new SmtpClient("smtp.gmail.com");
            oSmtpClient.EnableSsl = true;
            oSmtpClient.UseDefaultCredentials = false;
            oSmtpClient.Port = 587;
            oSmtpClient.Credentials = new System.Net.NetworkCredential(EmailOrigen, contra);

            oSmtpClient.Send(oMailMessage);

            oMailMessage.Dispose();
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
        //    bdPersonEntities db = new bdPersonEntities();
        //    DataContext dcGuardar = new DcGeneralDataContext();
        //    UTTT.Ejemplo.Linq.Data.Entity.Usuario usuario = new Linq.Data.Entity.Usuario();
        //    private UTTT.Ejemplo.Linq.Data.Entity.Usuario baseEntity;
        //    private DataContext dcGlobal = new DcGeneralDataContext();


        //    protected void btnEnviar_Click(object sender, EventArgs e)
        //    {
        //        try
        //        {
        //            var user = db.Persona.FirstOrDefault(p => p.strCorreoElectronico == txtCorreo.Text);
        //            if (user != null)
        //            {
        //                var user2 = db.Usuario.FirstOrDefault(p => p.idPersona == user.id);
        //                string correo = user.strCorreoElectronico.ToString();
        //                MD5("123456");
        //                string tak = Token();
        //                Error(tak, correo);
        //                this.baseEntity = dcGlobal.GetTable<Linq.Data.Entity.Usuario>().First(c => c.id == user2.id);
        //                DataContext dcGuardar = new DcGeneralDataContext();
        //                UTTT.Ejemplo.Linq.Data.Entity.Usuario usuario = new Linq.Data.Entity.Usuario();

        //                if (dcGlobal != null)
        //                {
        //                    usuario = dcGuardar.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Usuario>().First(c => c.id == user2.id);
        //                    var por = tak;
        //                    Session["abc"] = por.ToString().Trim();
        //                    usuario.token = por.ToString().Trim();
        //                    var net = Session["abc"].ToString();
        //                    dcGuardar.SubmitChanges();
        //                    lblError.Text = "Se ha enviado un link para reestablecer su password al correo " + txtCorreo.Text;
        //                    lblError.ForeColor = Color.Blue;
        //                }
        //            }
        //            else
        //            {
        //                lblError.Text = txtCorreo.Text + " - El correo no fue encontrado en la base de datos ";
        //                lblError.ForeColor = Color.Red;
        //            }
        //        }
        //        catch (Exception ex)
        //        {
        //            this.lblError.Text = ex.Message;
        //        }
        //    }

        //    public static string MD5(string word)
        //    {
        //        MD5 md5 = MD5CryptoServiceProvider.Create();
        //        ASCIIEncoding encoding = new ASCIIEncoding();
        //        byte[] stream = null;
        //        StringBuilder sb = new StringBuilder();
        //        stream = md5.ComputeHash(encoding.GetBytes(word));
        //        for (int i = 0; i < stream.Length; i++) sb.AppendFormat("{0:x2}", stream[i]);
        //        return sb.ToString();
        //    }


        //    public static string Token()
        //    {
        //        long i = 1;
        //        foreach (byte b in Guid.NewGuid().ToByteArray()) i *= ((int)b + 1);
        //        return MD5(string.Format("{0:x}", i - DateTime.Now.Ticks));
        //    }


        //    public new void Error(string error, string correo)
        //    {
        //        string EmailOrigen = "serviciobdperson@gmail.com";
        //        string EmailDestino = correo;
        //        string pass = "bdperson12345";

        //        MailMessage msg = new MailMessage(EmailOrigen, EmailDestino);
        //        msg.Subject = "Reestablecer password";
        //        msg.Body = string.Format("Hola! Agradecemos el uso de nuestro sistema: <h1>{0} </h1> <br/> De click en el siguiente enlace para reestablecer su password : <h1>{1} </h1> ", "Reestablecer password", "http://utttdanielaperson.somee.com/PSR/NuevoPass.aspx" + "?token=" + error);
        //        msg.BodyEncoding = System.Text.Encoding.UTF8;
        //        msg.IsBodyHtml = true;
        //        msg.IsBodyHtml = true;
        //        SmtpClient oSmtpClient = new SmtpClient("smtp.gmail.com");
        //        oSmtpClient.EnableSsl = true;
        //        oSmtpClient.UseDefaultCredentials = false;
        //        oSmtpClient.Port = 587;
        //        oSmtpClient.Credentials = new System.Net.NetworkCredential(EmailOrigen, pass);

        //        oSmtpClient.Send(msg);

        //        msg.Dispose();
        //    }


        //    protected void btnLogin_Click(object sender, EventArgs e)
        //    {
        //        try
        //        {
        //            this.Response.Redirect("~/Login.aspx", false);
        //        }
        //        catch (Exception _e)
        //        {
        //            this.showMessage("Ha ocurrido un error inesperado");
        //        }
        //    }
        //}
    


