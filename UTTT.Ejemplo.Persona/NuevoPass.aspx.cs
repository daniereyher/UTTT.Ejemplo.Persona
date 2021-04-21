﻿using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using UTTT.Ejemplo.Linq.Data.Entity;
using UTTT.Ejemplo.Persona.Control;
using UTTT.Ejemplo.Persona.Control.Ctrl;
using UTTT.Ejemplo.Persona.Model;
namespace UTTT.Ejemplo.Persona
{
    public partial class NuevoPass : System.Web.UI.Page
    {

        private SessionManager session = new SessionManager();
        private int idPersona = 0;
        private UTTT.Ejemplo.Linq.Data.Entity.Usuario baseEntity;
        private DataContext dcGlobal = new DcGeneralDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

            string valor = Convert.ToString(Request.QueryString["token"]);
            var token = valor;

            if (token == null)
            {
                //this.Response.Redirect("~/Login.aspx");
            }
            else
            {
                idPersona = 1;
            }
            try
            {
                var por = token.ToString();
                this.Response.Buffer = true;
                this.baseEntity = dcGlobal.GetTable<Linq.Data.Entity.Usuario>().First(c => c.token == por.ToString());
                if (!this.IsPostBack)
                {
                    if (this.session.Parametros["baseEntity"] == null)
                    {
                        this.session.Parametros.Add("baseEntity", this.baseEntity);
                    }
                    if (this.idPersona == 0)
                    {
                        //TextBoxCalendario.Text = DateTime.Today.ToString().Split()[0];
                    }
                    else
                    {
                        this.txtUsuario.Text = this.baseEntity.strUsuario;
                    }
                }

            }
            catch (Exception _e)
            {
                this.showMessage("Ha ocurrido un problema al cargar la página" + _e.Message);
                this.showMessageException(_e.Message);
            }

        }

        bdPersonEntities db = new bdPersonEntities();
        protected void btnAceptar_Click(object sender, EventArgs e)
        {

            try
            {
                if (txtPasswordN.Text == txtPasswordConfirm.Text && txtPasswordN.Text == txtPasswordConfirm.Text)
                {

                    string valor = Convert.ToString(Request.QueryString["token"]);
                    var por = valor;
                    this.baseEntity = dcGlobal.GetTable<Linq.Data.Entity.Usuario>().First(c => c.token == por.ToString());
                    DataContext dcGuardar = new DcGeneralDataContext();
                    UTTT.Ejemplo.Linq.Data.Entity.Usuario usuario = new Linq.Data.Entity.Usuario();
                    if (dcGlobal != null)
                    {
                        usuario = dcGuardar.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Usuario>().First(c => c.token == por.ToString());
                        var contra = (txtPasswordN.Text);
                       
                        usuario.strPassword = this.txtPasswordN.Text.Trim();
                        dcGuardar.SubmitChanges();
                        FormsAuthentication.SignOut();
                        Session.Abandon();
                        this.Response.Redirect("~/Login.aspx");
                    }
                }
                else
                {
                    //this.alerta.Text = "los campos contraseñas deben ser iguales";
                }
            }
            catch (Exception ex)
            {
                this.lblError.Text = ex.Message;
            }
        }
    }
}