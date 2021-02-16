#region Using

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UTTT.Ejemplo.Linq.Data.Entity;
using System.Data.Linq;
using System.Linq.Expressions;
using System.Collections;
using UTTT.Ejemplo.Persona.Control;
using UTTT.Ejemplo.Persona.Control.Ctrl;
using System.Text.RegularExpressions;
using EASendMail;



#endregion

namespace UTTT.Ejemplo.Persona
{
    public partial class PersonaManager : System.Web.UI.Page
    {
        #region Variables

        private SessionManager session = new SessionManager();
        private int idPersona = 0;
        private UTTT.Ejemplo.Linq.Data.Entity.Persona baseEntity;
        private DataContext dcGlobal = new DcGeneralDataContext();
        private int tipoAccion = 0;

        #endregion

        #region Eventos

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                this.Response.Buffer = true;
                this.session = (SessionManager)this.Session["SessionManager"];
                this.idPersona = this.session.Parametros["idPersona"] != null ?
                    int.Parse(this.session.Parametros["idPersona"].ToString()) : 0;
                if (this.idPersona == 0)
                {
                    this.baseEntity = new Linq.Data.Entity.Persona();
                    this.tipoAccion = 1;
                }
                else
                {
                    this.baseEntity = dcGlobal.GetTable<Linq.Data.Entity.Persona>().First(c => c.id == this.idPersona);
                    this.tipoAccion = 2;
                }

                if (!this.IsPostBack)
                {
                    if (this.session.Parametros["baseEntity"] == null)
                    {
                        this.session.Parametros.Add("baseEntity", this.baseEntity);
                    }
                    List<CatSexo> lista = dcGlobal.GetTable<CatSexo>().ToList();
                    CatSexo catTemp = new CatSexo();
                    catTemp.id = -1;
                    catTemp.strValor = "Seleccionar";
                    lista.Insert(0, catTemp);
                    this.ddlSexo.DataTextField = "strValor";
                    this.ddlSexo.DataValueField = "id";
                    this.ddlSexo.DataSource = lista;
                    this.ddlSexo.DataBind();

                    this.ddlSexo.SelectedIndexChanged += new EventHandler(ddlSexo_SelectedIndexChanged);
                    this.ddlSexo.AutoPostBack = true;
                    if (this.idPersona == 0)
                    {
                        this.lblAccion.Text = "Agregar";
                        DateTime tiempo = new DateTime((DateTime.Now.Year)-21, DateTime.Now.Month, DateTime.Now.Day);
                        this.dateCalendar.TodaysDate = tiempo;
                        this.dateCalendar.SelectedDate = tiempo;
                    }
                    else
                    {
                        this.lblAccion.Text = "Editar";
                        this.txtNombre.Text = this.baseEntity.strNombre;
                        this.txtAPaterno.Text = this.baseEntity.strAPaterno;
                        this.txtAMaterno.Text = this.baseEntity.strAMaterno;
                        this.txtClaveUnica.Text = this.baseEntity.strClaveUnica;
                        this.txtEmail.Text = this.baseEntity.strCorreoElectronico;
                        this.txtCP.Text = this.baseEntity.strCodigoPostal;
                        this.txtRfc.Text = this.baseEntity.strRfc;
                        DateTime? fechaNacimiento = this.baseEntity.datFechaNacimiento;
                        if (fechaNacimiento != null)
                        {
                            this.dateCalendar.TodaysDate = (DateTime)fechaNacimiento;
                            this.dateCalendar.SelectedDate = (DateTime)fechaNacimiento;
                            
                        }

                        this.enSeleccionar(ref this.ddlSexo, baseEntity.CatSexo.strValor);


                    }                
                }

            }
            catch (Exception _e)
            {
                this.showMessage("Ha ocurrido un problema al cargar la página");
                this.Response.Redirect("~/PersonaPrincipal.aspx", false);
            }

        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {


            try
            {

                DateTime fechaNacimiento1 = this.dateCalendar.SelectedDate.Date;
                DateTime fechaHoy = DateTime.Today;
                int edad = fechaHoy.Year - fechaNacimiento1.Year;
             
                if (fechaHoy < fechaNacimiento1.AddYears(edad)) edad--;

                if (edad < 18)
                {
                   
                    this.lblValFecha.Text = "El registro está prohibido para menores de edad";
                    this.lblValFecha.Visible = true;
                }
                else
                {
                    
                    if (!Page.IsValid)
                {
                        
                    return;
                }

                DataContext dcGuardar = new DcGeneralDataContext();
                    UTTT.Ejemplo.Linq.Data.Entity.Persona persona = new Linq.Data.Entity.Persona();

                    if (this.idPersona == 0)
                    {

                        persona.strClaveUnica = this.txtClaveUnica.Text.Trim();
                        persona.strNombre = this.txtNombre.Text.Trim();
                        persona.strAMaterno = this.txtAMaterno.Text.Trim();
                        persona.strAPaterno = this.txtAPaterno.Text.Trim();
                        persona.strCorreoElectronico = this.txtEmail.Text.Trim();
                        persona.strCodigoPostal = this.txtCP.Text.Trim();
                        persona.strRfc = this.txtRfc.Text.Trim();

                        persona.idCatSexo = int.Parse(this.ddlSexo.Text);

                        DateTime fechaNacimiento = this.dateCalendar.SelectedDate.Date;
                        persona.datFechaNacimiento = fechaNacimiento;


                        String mensaje = String.Empty;

                        if (!this.validacion(persona, ref mensaje))
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


                        if (!this.validaHTML(ref mensaje))
                        {
                            this.lblMensaje.Text = mensaje;
                            this.lblMensaje.Visible = true;
                            return;
                        }


                        dcGuardar.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Persona>().InsertOnSubmit(persona);
                        dcGuardar.SubmitChanges();
                        this.showMessage("El registro se agrego correctamente.");
                        this.Response.Redirect("~/PersonaPrincipal.aspx", false);

                    }

                    // Seccion de editar un registro 

                    if (this.idPersona > 0)
                    {
                        persona = dcGuardar.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Persona>().First(c => c.id == idPersona);
                        persona.strClaveUnica = this.txtClaveUnica.Text.Trim();
                        persona.strNombre = this.txtNombre.Text.Trim();
                        persona.strAMaterno = this.txtAMaterno.Text.Trim();
                        persona.strAPaterno = this.txtAPaterno.Text.Trim();
                        persona.strCorreoElectronico = this.txtEmail.Text.Trim();
                        persona.strCodigoPostal = this.txtCP.Text.Trim();
                        persona.strRfc = this.txtRfc.Text.Trim();
                        persona.idCatSexo = int.Parse(this.ddlSexo.Text);
                     
                        persona.datFechaNacimiento = Convert.ToDateTime(this.dateCalendar.SelectedDate.Date);
                       

                        String mensaje = String.Empty;

                        if (!this.validacion(persona, ref mensaje))
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


                        if (!this.validaHTML(ref mensaje))
                        {
                            this.lblMensaje.Text = mensaje;
                            this.lblMensaje.Visible = true;
                            return;
                        }

                     
                        dcGuardar.SubmitChanges();
                        this.showMessage("El registro se edito correctamente.");
                        this.Response.Redirect("~/PersonaPrincipal.aspx", false);
                        

                    }

                    }
            }


            catch (Exception _e)
            {
                this.showMessageException(_e.Message);

                // Happend
                var mensaje = "Error message: " + _e.Message;
                // Información sobre la excepción interna
                if (_e.InnerException != null)
                {
                    mensaje = mensaje + " Inner exception: " + _e.InnerException.Message;
                }
                // Site
                mensaje = mensaje + " Stack trace: " + _e.StackTrace;
                this.Response.Redirect("~/ErrorPage.aspx", false);


                this.sendCorreo("dayra.daniela.reyes.hernandez@gmail.com", "Exception", mensaje);

            }

        }

        public void sendCorreo(string correoDestino, string asunto, string mensajeCorreo)
        {
            string mensaje = "Correo no enviado.";

            try
            {
                SmtpMail objetoCorreo = new SmtpMail("TryIt");

                objetoCorreo.From = "daniela.hernandez.dr@gmail.com";
                objetoCorreo.To = correoDestino;
                objetoCorreo.Subject = asunto;
                objetoCorreo.TextBody = mensajeCorreo;

                SmtpServer objetoServidor = new SmtpServer("smtp.gmail.com");//servidor proporcionado desde la configuracion de google

                objetoServidor.User = "daniela.hernandez.dr@gmail.com";
                objetoServidor.Password = "D4niela.241000";
                objetoServidor.Port = 587;
                objetoServidor.ConnectType = SmtpConnectType.ConnectSSLAuto;

                SmtpClient objetoCliente = new SmtpClient();
                objetoCliente.SendMail(objetoServidor, objetoCorreo);
                mensaje = "Correo Enviado Correctamente.";


            }
            catch (Exception ex)
            {
                mensaje = "El correo no pudo enviarse" + ex.Message;
            }
        }


        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            try
            {              
                this.Response.Redirect("~/PersonaPrincipal.aspx", false);
            }
            catch (Exception _e)
            {
                this.showMessage("Ha ocurrido un error inesperado");
            }
        }

        protected void ddlSexo_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int idSexo = int.Parse(this.ddlSexo.Text);
                Expression<Func<CatSexo, bool>> predicateSexo = c => c.id == idSexo;
                predicateSexo.Compile();
                List<CatSexo> lista = dcGlobal.GetTable<CatSexo>().Where(predicateSexo).ToList();
                CatSexo catTemp = new CatSexo();            
                this.ddlSexo.DataTextField = "strValor";
                this.ddlSexo.DataValueField = "id";
                this.ddlSexo.DataSource = lista;
                this.ddlSexo.DataBind();
            }
            catch (Exception)
            {
                this.showMessage("Ha ocurrido un error inesperado");
            }
        }


        public void enSeleccionar(ref DropDownList _control, String _value)
        {
            foreach(ListItem item in _control.Items)
            {
                if (item.Value != _value)
                    item.Enabled = false;

                break;

            }

            _control.Items.FindByText(_value).Selected = true;
        }

        #endregion

        #region Metodos

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

        #endregion


        public bool validacion(UTTT.Ejemplo.Linq.Data.Entity.Persona _persona, ref String _mensaje)
        {

            ////Sexo 
            if (_persona.idCatSexo == -1)
            {
                _mensaje = "Seleccione masculino/femenino";
                return false;
            }

            // Clave 
            if (_persona.strClaveUnica.Equals(String.Empty))
            {
                _mensaje = "La clave unica está vacía";
                return false;
            }

            int i = 0;

            if (int.TryParse(_persona.strClaveUnica, out i) == false)
            {
                _mensaje = "La clave unica debe ser número";
                return false;
            }

            if (int.Parse(_persona.strClaveUnica) < 100 || int.Parse(_persona.strClaveUnica) > 1000)
            {
                _mensaje = "La clave unica debe ser de 3 números válidos";
                return false;
            }

            if (_persona.strClaveUnica.Length < 3)
            {
                _mensaje = "La clave unica debe ser de 3 numeros";
                return false;
            }


            // Nombre 

            if (_persona.strNombre.Equals(String.Empty))
            {
                _mensaje = "El nombre está vacío";
                return false;
            }

            bool vNombre = Regex.IsMatch(_persona.strNombre, @"^[a-zA-ZáéíóúÁÉÍÓÚÑñ\s]*$");
            if (!vNombre)
            {
                _mensaje = "Escriba solo letras en el nombre";
                return false;
            }

            if(_persona.strNombre.Length <3 || _persona.strNombre.Length>20)
            {
                _mensaje = "El campo nombre permite la entrada de 3 a 20 caracteres";
                return false; 
            }

            // ApellidoPaterno 

            if (_persona.strAPaterno.Equals(String.Empty))
            {
                _mensaje = "El apellido paterno está vacío";
                return false;
            }

            bool vApellidoP = Regex.IsMatch(_persona.strAPaterno, @"^[a-zA-ZáéíóúÁÉÍÓÚÑñ\s]*$");
            if (!vApellidoP)
            {
                _mensaje = "Escriba solo letras en el apellido paterno";
                return false;
            }

            if (_persona.strAPaterno.Length < 3 || _persona.strAPaterno.Length > 20)
            {
                _mensaje = "El campo apellido paterno permite la entrada de 3 a 20 caracteres";
                return false;
            }

            string aPaterno = _persona.strAPaterno.Trim();
            if (aPaterno.Length < 3)
            {
                _mensaje = "La cantidad mínima de caracteres para Apellido Paterno es 3";
                return false; 
            }

            //Apellido materno 

            bool vApellidoM = Regex.IsMatch(_persona.strAMaterno, @"^[a-zA-ZáéíóúÁÉÍÓÚÑñ\s]*$");
            if (!vApellidoM)
            {
                _mensaje = "Escriba solo letras en el apellido materno";
                return false;
            }

            if (_persona.strAMaterno.Length < 3 || _persona.strAMaterno.Length > 20)
            {
                _mensaje = "El campo apellido materno permite la entrada de 3 a 20 caracteres";
                return false;
            }

            string aMaterno = _persona.strAMaterno.Trim();
            if (aMaterno.Length < 3)
            {
                _mensaje = "La cantidad mínima de caracteres para Apellido Materno es 3";
                return false;
            }

            // Correo 

            if (_persona.strCorreoElectronico.Equals(String.Empty))
            {
                _mensaje = "El correo electronico está vacío";
                return false;
            }

            bool vCorreo = Regex.IsMatch(_persona.strCorreoElectronico, "^[_a-z0-9-]+(.[_a-z0-9-]+)*@[a-z0-9-]+(.[a-z0-9-]+)*(.[a-z]{2,4})$");
            if (!vCorreo)
            {
                _mensaje = "Escriba una direccion de correo electronico valida";
                return false;
            }

            // Codigo Postal 

            if (_persona.strCodigoPostal.Equals(String.Empty))
            {
                _mensaje = "El codigo postal está vacío";
                return false;
            }

            int c = 0;

            if (int.TryParse(_persona.strCodigoPostal, out c) == false)
            {
                _mensaje = "El codigo postal debe ser escrito con números";
                return false;
            }

            if (_persona.strCodigoPostal.Length < 5)
            {
                _mensaje = "El codigo postal debe ser de 5 números";
                return false;
            }

            // RFC 

            if (_persona.strRfc.Equals(String.Empty))
            {
                _mensaje = "El RFC está vacío";
                return false;
            }

            bool vRFC = Regex.IsMatch(_persona.strRfc, @"^([A-ZÑ\x26]{3,4}([0-9]{2})(0[1-9]|1[0-2])(0[1-9]|1[0-9]|2[0-9]|3[0-1]))((-)?([A-Z\d]{3}))?$");
            if (!vRFC)
            {
                _mensaje = "Escriba un RFC valido";
                return false;
            }

            return true;


        }



        private bool validaSql(ref String _mensaje)
        {
            CtrlValidaInyeccion valida = new CtrlValidaInyeccion();
            string mensajeFuncion = string.Empty;


            if (valida.sqlInyectionValida(this.txtNombre.Text.Trim(), ref mensajeFuncion, "Nombre", ref this.txtNombre))
            {
                _mensaje = mensajeFuncion;
                return false;
            }
            if (valida.sqlInyectionValida(this.txtAPaterno.Text.Trim(), ref mensajeFuncion, "APaterno", ref this.txtAPaterno))
            {
                _mensaje = mensajeFuncion;
                return false;
            }
            if (valida.sqlInyectionValida(this.txtAMaterno.Text.Trim(), ref mensajeFuncion, "AMaterno", ref this.txtAMaterno))
            {
                _mensaje = mensajeFuncion;
                return false;
            }
            if (valida.sqlInyectionValida(this.txtEmail.Text.Trim(), ref mensajeFuncion, "Correo electronico", ref this.txtEmail))
            {
                _mensaje = mensajeFuncion;
                return false;
            }
            if (valida.sqlInyectionValida(this.txtCP.Text.Trim(), ref mensajeFuncion, "Codigo postal", ref this.txtCP))
            {
                _mensaje = mensajeFuncion;
                return false;
            }
            if (valida.sqlInyectionValida(this.txtRfc.Text.Trim(), ref mensajeFuncion, "Rfc", ref this.txtRfc))
            {
                _mensaje = mensajeFuncion;
                return false;
            }

            return true;
        }
        

        private bool validaHTML(ref String _mensaje)
        {
            CtrlValidaInyeccion valida = new CtrlValidaInyeccion();
            string mensajeFuncion = string.Empty;
            
            if (valida.htmlInyectionValida(this.txtNombre.Text.Trim(), ref mensajeFuncion, "Nombre", ref this.txtNombre))
            {
                _mensaje = mensajeFuncion;
                return false;
            }
            if (valida.htmlInyectionValida(this.txtAPaterno.Text.Trim(), ref mensajeFuncion, "A paterno", ref this.txtAPaterno))
            {
                _mensaje = mensajeFuncion;
                return false;
            }
            if (valida.htmlInyectionValida(this.txtAMaterno.Text.Trim(), ref mensajeFuncion, "A Materno", ref this.txtAMaterno))
            {
                _mensaje = mensajeFuncion;
                return false;
            }

            if (valida.htmlInyectionValida(this.txtEmail.Text.Trim(), ref mensajeFuncion, "Correo electronico", ref this.txtEmail))
            {
                _mensaje = mensajeFuncion;
                return false;
            }
            if (valida.htmlInyectionValida(this.txtCP.Text.Trim(), ref mensajeFuncion, "Codigo postal", ref this.txtCP))
            {
                _mensaje = mensajeFuncion;
                return false;
            }
            if (valida.htmlInyectionValida(this.txtRfc.Text.Trim(), ref mensajeFuncion, "Rfc", ref this.txtRfc))
            {
                _mensaje = mensajeFuncion;
                return false;
            }



            return true;
        }


       













        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox1_TextChanged1(object sender, EventArgs e)
        {

        }

        protected void cvClave_ServerValidate(object source, ServerValidateEventArgs args)
        {

        }

        protected void cvNombre_ServerValidate(object source, ServerValidateEventArgs args)
        {

        }

        protected void dateCalendar_SelectionChanged(object sender, EventArgs e)
        {

        }


    }
}