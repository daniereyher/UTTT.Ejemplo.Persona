using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UTTT.Ejemplo.Linq.Data.Entity;
using UTTT.Ejemplo.Persona.Control;
using UTTT.Ejemplo.Persona.Control.Ctrl;

namespace UTTT.Ejemplo.Persona
{
    public partial class UsuarioPrincipal : System.Web.UI.Page
    {
        private SessionManager session = new SessionManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["strUsuario"] == null)
            {
                Response.Redirect("Login.aspx");

            }
            try
            {

                Response.Buffer = true;
                DataContext dcTemp = new DcGeneralDataContext();
                if (!this.IsPostBack)
                {
                    List<CatUsuario> lista = dcTemp.GetTable<CatUsuario>().ToList();
                    CatUsuario catEstado = new CatUsuario();
                    catEstado.id = -1;
                    catEstado.strValor = "Todos";
                    lista.Insert(0, catEstado);
                    this.ddlEstado.DataTextField = "strValor";
                    this.ddlEstado.DataValueField = "id";
                    this.ddlEstado.DataSource = lista;
                    this.ddlEstado.DataBind();


                }
            }
            catch (Exception _e)
            {
                this.showMessage("Ha ocurrido un problema al cargar la página");
            }
        }

        protected void btnAgregarUsuario_Click(object sender, EventArgs e)
        {

            try
            {
                this.session.Pantalla = "~/UsuarioManager.aspx";
                Hashtable parametrosRagion = new Hashtable();
                parametrosRagion.Add("idUsuario", "0");
                this.session.Parametros = parametrosRagion;
                this.Session["SessionManager"] = this.session;
                this.Response.Redirect(this.session.Pantalla, false);
            }
            catch (Exception _e)
            {
                this.showMessage("Ha ocurrido un problema al agregar");
            }
        }

        protected void DataSourceUsuario_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            try
            {
                DataContext dcConsulta = new DcGeneralDataContext();
                bool nombreBool = false;

                bool estado = false;
                if (!this.txtNombre.Text.Equals(String.Empty))
                {
                    nombreBool = true;
                }

                if (this.ddlEstado.Text != "-1")
                {
                    estado = true;
                }

                Expression<Func<UTTT.Ejemplo.Linq.Data.Entity.Usuario, bool>>
                   predicate =
                   (c =>

                   ((estado) ? c.idCatUsuario== int.Parse(this.ddlEstado.Text) : true) &&
                   ((nombreBool) ? (((nombreBool) ? c.strUsuario.Contains(this.txtNombre.Text.Trim()) : false)) : true)
                   );

                

                predicate.Compile();

                List<UTTT.Ejemplo.Linq.Data.Entity.Usuario> listaPersona =
                    dcConsulta.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Usuario>().Where(predicate).ToList();
                e.Result = listaPersona;
            }
            catch (Exception _e)
            {
                throw _e;
            }
        }

        protected void dgvUsuarios_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void dgvUsuarios_RowCommand(object sender, GridViewCommandEventArgs e) 
        {
            try
            {
                int idUsuario = int.Parse(e.CommandArgument.ToString());
                switch (e.CommandName)
                {
                    case "Editar":
                        this.editar(idUsuario);
                        break;
                    case "Eliminar":
                        this.eliminar(idUsuario);
                        break;

                }
            }
            catch (Exception _e)
            {
                this.showMessage("Ha ocurrido un problema al seleccionar");
            }
        }
        private void editar(int _idUsuario)
        {
            try
            {
                Hashtable parametrosRagion = new Hashtable();
                parametrosRagion.Add("idUsuario", _idUsuario.ToString());
                this.session.Parametros = parametrosRagion;
                this.Session["SessionManager"] = this.session;
                this.session.Pantalla = String.Empty;
                this.session.Pantalla = "~/UsuarioManager.aspx";
                this.Response.Redirect(this.session.Pantalla, false);
                this.showMessage("El registro se edito corecctamente.");
            }
            catch (Exception _e)
            {
                throw _e;
            }
        }
        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }

        private void eliminar(int _idUsuario)
        {
            try
            {
                DataContext dcDelete = new DcGeneralDataContext();
                UTTT.Ejemplo.Linq.Data.Entity.Usuario usuario = dcDelete.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Usuario>().First(
                    c => c.id == _idUsuario);
                dcDelete.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Usuario>().DeleteOnSubmit(usuario);
                dcDelete.SubmitChanges();

                this.showMessage("El registro se elimino corecctamente.");
               
                this.Response.Redirect("~/UsuarioPrincipal.aspx", false);



            }
            catch (Exception _e)
            {
                throw _e;
            }
        }

        
        protected void txtNombre_TextChanged(object sender, EventArgs e)
        {

        }

    

        protected void btnBuscarUsuario_Click(object sender, EventArgs e)
        {
            try
            {
                this.DataSourcePersona.RaiseViewChanged();
            }
            catch (Exception _e)
            {
                this.showMessage("Ha ocurrido un problema al buscar");
            }
        }

        protected void btnInicio_Click(object sender, EventArgs e)
        {
            try
            {
                this.Response.Redirect("~/Inicio.aspx", false);
            }
            catch (Exception _e)
            {
                this.showMessage("Ha ocurrido un error inesperado");
            }
        }
    }

}