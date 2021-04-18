using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UTTT.Ejemplo.Linq.Data.Entity;
using System.Linq.Expressions;
using System.Collections;
using UTTT.Ejemplo.Persona.Control.Ctrl;
using EASendMail;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;
using System.Web.Script.Serialization;
using UTTT.Ejemplo.Persona.Control;
using System.Text;
using System.Security.Cryptography;
using SimpleCrypto;


namespace UTTT.Ejemplo.Persona
{
    public partial class UsuarioManager : System.Web.UI.Page
    {

        private SessionManager session = new SessionManager();
        private int idUsuario = 0;
        private UTTT.Ejemplo.Linq.Data.Entity.Usuario baseEntity;

        private DataContext dcGlobal = new DcGeneralDataContext();
        private int tipoAccion = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["strUsuario"] == null)
            {
                Response.Redirect("Login.aspx");

            }
            try
            {

                this.Response.Buffer = true;
                this.session = (SessionManager)this.Session["SessionManager"];
                this.idUsuario = this.session.Parametros["idUsuario"] != null ?
                    int.Parse(this.session.Parametros["idUsuario"].ToString()) : 0;

                if (this.idUsuario== 0)
                {
                    this.baseEntity = new Linq.Data.Entity.Usuario();
                    this.tipoAccion = 1;
                }
                else
                {
                    this.baseEntity = dcGlobal.GetTable<Linq.Data.Entity.Usuario>().First(c => c.id == this.idUsuario);
                    this.tipoAccion = 2;
                }

                if (!this.IsPostBack)
                {
                    if (this.session.Parametros["baseEntity"] == null)
                    {
                        this.session.Parametros.Add("baseEntity", this.baseEntity);
                    }

                    List<CatUsuario> lista = dcGlobal.GetTable<CatUsuario>().ToList();
                    CatUsuario catEstado = new CatUsuario();
                    catEstado.id = -1;
                    catEstado.strValor = "Seleccionar";
                    lista.Insert(0, catEstado);
                    this.ddlEstado.DataTextField = "strValor";
                    this.ddlEstado.DataValueField = "id";
                    this.ddlEstado.DataSource = lista;
                    this.ddlEstado.DataBind();
                    execute();

                  


                    this.ddlEstado.SelectedIndexChanged += new EventHandler(ddlEstado_SelectedIndexChanged);
                    this.ddlEstado.AutoPostBack = false;
                   
                   




                    if (this.idUsuario == 0)
                    {



                        this.lblAccion.Text = "Agregar";
                        DateTime tiempo = new DateTime((DateTime.Now.Year), DateTime.Now.Month, DateTime.Now.Day);
                        this.txtFecha.Text = DateTime.Today.ToString("yyyy-MM-dd");
                        this.CalendarExtender.SelectedDate = tiempo;
                        this.CalendarExtender.EndDate = tiempo;
                        lblEstado.Visible = false;
                        ddlEstado.Visible = false;
                        rfvEstado.Visible = false;

                       


                    }
                    else
                    {
                        this.lblAccion.Text = "Editar";
                        ddlNombre.Enabled = false;

                        this.txtUsuario.Text = this.baseEntity.strUsuario;
                        this.txtPassword.Text = this.baseEntity.strPassword;
                        this.txtConfirmarPassword.Text = this.baseEntity.strPassword;
                        this.txtFecha.Text = this.baseEntity.strFecha;

                       
                        this.ddlNombre.DataBind();
                       
                        this.ddlEstado.DataSource = lista;
                        this.ddlEstado.DataBind();

                        //txtPassword.Text = Seguridad.DesEncriptar(txtPassword.Text);

                        this.setItem(ref this.ddlEstado, baseEntity.CatUsuario.strValor);

                        this.setItemEditar(ref this.ddlEstado, baseEntity.CatUsuario.strValor);
                        this.setItemEditar(ref this.ddlNombre, baseEntity.Persona.strNombre);
                    }
                }

            }
            catch (Exception _e)
            {
                this.showMessage("Ha ocurrido un problema al cargar la página");
                this.Response.Redirect("~/UsuarioPrincipal.aspx", false);
            }
        }


        public bool Invalid(int id)
        {
            using (SqlConnection conn = new SqlConnection("Data Source = bdPerson.mssql.somee.com; Initial Catalog = bdPerson; User ID = danirher; Password = dan12345"))
            {

                string query = "SELECT COUNT(*) FROM Usuario WHERE idPersona=@IdPersona";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@IdPersona", id);
                conn.Open();

                int count = Convert.ToInt32(cmd.ExecuteScalar());
                if (count == 0)
                    return false;
                else
                    return true;


            }
        }


        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {

                if (!Page.IsValid)
                {
                    return;
                }
                DataContext dcGuardar = new DcGeneralDataContext();
               
                UTTT.Ejemplo.Linq.Data.Entity.Usuario usuario = new Linq.Data.Entity.Usuario();
                if (this.idUsuario == 0)
                {
                    if (!Invalid(Convert.ToInt32(ddlNombre.Text)))
                    {
                        

                        usuario.idPersona = int.Parse(this.ddlNombre.Text.Trim());
                        this.lblMensajeDDL.Visible = false;
                        //txtPassword.Text = Seguridad.Encriptar(txtPassword.Text);
                        //txtPassword.Text = Seguridad.Encriptar(txtPassword.Text);
                    }
                    else
                    {

                        //this.showMessage("La persona seleccionada ya tiene un usuario");
                        this.lblMensajeDDL.Visible = true;
                        //this.lblMensajeDDL.Text = "La persona seleccionada ya tiene un usuario.*";
                        


                    }


         
                    //UTTT.Ejemplo.Persona.EncriptarPass obclsEncriptacion = new UTTT.Ejemplo.Persona.EncriptarPass();
                    //string stkey = ConfigurationManager.AppSettings["stkey"];
                    usuario.strPassword = this.txtPassword.Text.Trim();
                    usuario.idCatUsuario = 1;
                    usuario.strFecha = this.txtFecha.Text.Trim();
                    
                    var UsuarioExiste = dcGlobal.GetTable<Usuario>().Where(a => a.strUsuario == txtUsuario.Text).FirstOrDefault();
                    

                    if (UsuarioExiste != null)
                    {

                        //this.showMessage("El usuario ya existe");
                        this.lblMensajeUsuario.Visible = true;
                        //this.lblMensajeUsuario.Text = "El usuario ya existe.*";

                    }
                    else
                    {
                        this.lblMensajeUsuario.Visible = false;

                        usuario.strUsuario = this.txtUsuario.Text.Trim();
                        String mensaje = String.Empty;
                        if (!this.validacion(usuario, ref mensaje))

                        {
                            this.lblMensaje.Text = mensaje;
                            this.lblMensaje.Visible = true;
                            return;
                        }
                        if (!this.validaSql(ref mensaje))

                        {
                            this.lblMensaje.Text = mensaje;
                            this.lblMensaje.Visible = true;
                            return;
                        }
                        if (!this.validaHtml(ref mensaje))

                        {
                            this.lblMensaje.Text = mensaje;
                            this.lblMensaje.Visible = true;
                            return;
                        }
                       

                        dcGuardar.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Usuario>().InsertOnSubmit(usuario);

                        dcGuardar.SubmitChanges();
                        this.showMessage("El registro se agrego correctamente.");
                        this.Response.Redirect("~/UsuarioPrincipal.aspx", false);


                    }

                   

                }
                if (this.idUsuario > 0)
                {

                    usuario = dcGuardar.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Usuario>().First(c => c.id == idUsuario);

                    //usuario.strPassword = EncriptarPass.GetSHA256(txtPassword.Text.Trim());
                    //txtPassword.Text = Seguridad.Encriptar(txtPassword.Text);
                    usuario.strPassword = this.txtPassword.Text.Trim();
                    usuario.strFecha = this.txtFecha.Text.Trim();
                    usuario.strUsuario = this.txtUsuario.Text.Trim();
                    usuario.idCatUsuario = int.Parse(this.ddlEstado.Text);

                   // persona.idCatSexo = int.Parse(this.ddlSexo.Text);



                    usuario.strUsuario = this.txtUsuario.Text.Trim();
                    String mensaje = String.Empty;
                    if (!this.validacion(usuario, ref mensaje))

                    {
                        this.lblMensaje.Text = mensaje;
                        this.lblMensaje.Visible = true;
                        return;
                    }
                    if (!this.validaSql(ref mensaje))

                    {
                        this.lblMensaje.Text = mensaje;
                        this.lblMensaje.Visible = true;
                        return;
                    }
                    if (!this.validaHtml(ref mensaje))

                    {
                        this.lblMensaje.Text = mensaje;
                        this.lblMensaje.Visible = true;
                        return;
                    }


                    dcGuardar.SubmitChanges();
                    this.showMessage("El usuario se edito correctamente.");
                    this.Response.Redirect("~/UsuarioPrincipal.aspx", false);



                }


            }
            catch (Exception _e)
            {
                this.showMessageException(_e.Message);

                //// Happend
                //var mensaje = "Error message: " + _e.Message;
                //// Información sobre la excepción interna
                //if (_e.InnerException != null)
                //{
                //    mensaje = mensaje + " Inner exception: " + _e.InnerException.Message;
                //}
                //// Site
                //mensaje = mensaje + " Stack trace: " + _e.StackTrace;
                //this.Response.Redirect("~/ErrorPage.aspx", false);


                //this.sendCorreo("dayra.daniela.reyes.hernandez@gmail.com", "Exception", mensaje);
            }

        }


       
        private void EnviarCorreo(string v1, string v2, string mensaje)
        {
            throw new NotImplementedException();
        }


        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            try
            {
                this.Response.Redirect("~/UsuarioPrincipal.aspx", false);
            }
            catch (Exception _e)
            {
                this.showMessage("Ha ocurrido un error inesperado");
            }
        }


        private void execute()
        {
            SqlConnection con = new SqlConnection("Data Source = bdPerson.mssql.somee.com; Initial Catalog = bdPerson; User ID = danirher; Password = dan12345");
            SqlCommand cmd = new SqlCommand("select strNombre, id from Persona", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();


            sda.Fill(ds);



            ddlNombre.DataSource = ds;

            ddlNombre.DataTextField = "strNombre"; 
            ddlNombre.DataValueField = "id";
            ddlNombre.DataBind();
            ddlNombre.Items.Insert(0, new ListItem("Seleccionar", String.Empty));

           

        }



       
        public void setItemEditar(ref DropDownList _control, String _value)
        {
            foreach (ListItem item in _control.Items)
            {
                if (item.Value != _value)
                {
                    item.Enabled = false;

                    break;
                }
            }
            _control.Items.FindByText(_value).Selected = true;
        }

        public bool validacion(UTTT.Ejemplo.Linq.Data.Entity.Usuario _usuario, ref String _mensaje)
        {
            if (_usuario.idPersona != Convert.ToInt32(ddlNombre.Text))

            {
                _mensaje = "El usuario seleccionado ya tiene un usuario";
                return false;
            }

            //Usuario validaciones
            string Uss = _usuario.strUsuario.Trim();
            if (Uss.Length < 5)
            {
                _mensaje = "La cantidad mínima de caracteres para el campo usuario es de 5";
                return false;
            }

            if (_usuario.strUsuario.Equals(String.Empty))
            {
                _mensaje = "El campo usuario no puede estar vacío";
                return false;
            }

            if (_usuario.strUsuario.Length > 20)
            {
                _mensaje = "Número de caracteres invalido";
                return false;
            }


            //Password validaciones

            string Pass = _usuario.strPassword.Trim();
            if (Pass.Length < 5)
            {
                _mensaje = "La cantidad mínima de caracteres para el password es de 5";
                return false;
            }

            if (_usuario.strPassword.Equals(String.Empty))
            {
                _mensaje = "El campo password no puede estar vacío";
                return false;
            }
            if (_usuario.strPassword.Length > 20)
            {
                _mensaje = "Número de caracteres invalido";
                return false;
            }

            return true;
        }
        private bool validaSql(ref String _mensaje)
        {
            CtrlValidaInyeccion valida = new CtrlValidaInyeccion();
            string mensajeFuncion = string.Empty;


            if (valida.sqlInyectionValida(this.txtUsuario.Text.Trim(), ref mensajeFuncion, "Usuario", ref this.txtUsuario))
            {
                _mensaje = mensajeFuncion;
                return false;
            }
            if (valida.sqlInyectionValida(this.txtPassword.Text.Trim(), ref mensajeFuncion, "Password", ref this.txtPassword))
            {
                _mensaje = mensajeFuncion;
                return false;
            }
            if (valida.sqlInyectionValida(this.txtConfirmarPassword.Text.Trim(), ref mensajeFuncion, "Confirmar password", ref this.txtConfirmarPassword))
            {
                _mensaje = mensajeFuncion;
                return false;
            }
            if (valida.sqlInyectionValida(this.txtFecha.Text.Trim(), ref mensajeFuncion, "Fecha de registro", ref this.txtFecha))
            {
                _mensaje = mensajeFuncion;
                return false;
            }


            return true;
        }

        private bool validaHtml(ref String _mensaje)

        {
            CtrlValidaInyeccion valida = new CtrlValidaInyeccion();
            string mensajeFuncion = string.Empty;
            if (valida.htmlInyectionValida(this.txtUsuario.Text.Trim(), ref mensajeFuncion, "Usuario", ref this.txtUsuario))
            {
                _mensaje = mensajeFuncion;
                return false;
            }
            if (valida.htmlInyectionValida(this.txtPassword.Text.Trim(), ref mensajeFuncion, "Password", ref this.txtPassword))
            {
                _mensaje = mensajeFuncion;
                return false;
            }
            if (valida.htmlInyectionValida(this.txtConfirmarPassword.Text.Trim(), ref mensajeFuncion, "Confirmar password", ref this.txtConfirmarPassword))
            {
                _mensaje = mensajeFuncion;
                return false;
            }
            if (valida.htmlInyectionValida(this.txtFecha.Text.Trim(), ref mensajeFuncion, "Fecha de registro", ref this.txtFecha))
            {
                _mensaje = mensajeFuncion;
                return false;
            }

            return true;

        }


        private void ddlEstado_SelectedIndexChanged(object sender, EventArgs e)
        {
            throw new NotImplementedException();
        }

        public void setItem(ref DropDownList _control, String _value)
        {
            foreach (ListItem item in _control.Items)
            {
                if (item.Value == _value)
                {
                    item.Selected = true;

                    break;
                }
            }
            _control.Items.FindByText(_value).Selected = true;
        }


    }
}