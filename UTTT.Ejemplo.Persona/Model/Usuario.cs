//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace UTTT.Ejemplo.Persona.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Usuario
    {
        public int id { get; set; }
        public string strUsuario { get; set; }
        public string strPassword { get; set; }
        public string strFecha { get; set; }
        public int idPersona { get; set; }
        public int idCatUsuario { get; set; }
        public string token { get; set; }
    
        public virtual CatUsuario CatUsuario { get; set; }
        public virtual Persona Persona { get; set; }
    }
}
