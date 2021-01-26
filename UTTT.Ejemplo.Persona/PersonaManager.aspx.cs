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
                        DateTime tiempo = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day);
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

                        this.setItem(ref this.ddlSexo, baseEntity.CatSexo.strValor);
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

                ////DateTime fechaNacimiento1 = this.dateCalendar.SelectedDate.Date;
                ////DateTime fechaHoy = DateTime.Today;
                ////int edad = fechaHoy.Year - fechaNacimiento1.Year;
                ////if (fechaHoy < fechaNacimiento1.AddYears(edad)) edad--;

                ////if (edad < 18)
                ////{
                ////    this.showMessage("El registro está prohibido para menores de edad");
                ////}
                ////else
                ////{
                    
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

                        if(!this.validacion(persona, ref mensaje))
                        {
                            this.lblMensaje.Text= mensaje;
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
                        }


                    dcGuardar.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Persona>().InsertOnSubmit(persona);
                        dcGuardar.SubmitChanges();
                        this.showMessage("El registro se agrego correctamente.");
                        this.Response.Redirect("~/PersonaPrincipal.aspx", false);

                    }

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
                        dcGuardar.SubmitChanges();
                        this.showMessage("El registro se edito correctamente.");
                        this.Response.Redirect("~/PersonaPrincipal.aspx", false);
                    }

                    //}
            }


            catch (Exception _e)
            {
                this.showMessageException(_e.Message);
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

            if (int.Parse(_persona.strClaveUnica) < 100 || int.Parse(_persona.strClaveUnica) > 999)
            {
                _mensaje = "La clave unica debe ser de 3 números";
                return false;
            }

            // Nombre 

            if (_persona.strNombre.Equals(String.Empty))
            {
                _mensaje = "El nombre está vacío";
                return false;
            }

            bool vNombre = Regex.IsMatch(_persona.strNombre, @"^[a-zA-Z]+$");
            if (!vNombre)
            {
                _mensaje = "Escriba solo letras en el nombre";
                return false; 
            }

            // ApellidoPaterno 

            if (_persona.strAPaterno.Equals(String.Empty))
            {
                _mensaje = "El apellido paterno está vacío";
                return false;
            }

            bool vApellidoP = Regex.IsMatch(_persona.strAPaterno, @"^[a-zA-Z]+$");
            if (!vApellidoP)
            {
                _mensaje = "Escriba solo letras en el apellido paterno";
                return false;
            }

            //Apellido materno 

            bool vApellidoM = Regex.IsMatch(_persona.strAMaterno, @"^[a-zA-Z]+$");
            if (!vApellidoM)
            {
                _mensaje = "Escriba solo letras en el apellido materno";
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

            if (int.Parse(_persona.strCodigoPostal) < 10000 || int.Parse(_persona.strCodigoPostal) > 999999)
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

            bool vRFC = Regex.IsMatch(_persona.strRfc, "[A-Z]{4}[0-9]{6}[A-Z0-9]{3}");
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
    }
}