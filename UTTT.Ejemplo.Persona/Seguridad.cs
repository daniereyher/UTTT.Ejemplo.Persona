using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UTTT.Ejemplo.Persona
{
    public static class Seguridad
    {

        /// Encripta una cadena
        public static string Encriptar(this string _passwordEn)
        {
            string result = string.Empty;
            byte[] encryted = System.Text.Encoding.Unicode.GetBytes(_passwordEn);
            result = Convert.ToBase64String(encryted);
            return result;
        }

        /// Esta función desencripta la cadena que le envíamos en el parámentro de entrada.
        public static string DesEncriptar(this string _passwordSimp)
        {
            string result = string.Empty;
            byte[] decryted = Convert.FromBase64String(_passwordSimp);
            //result = System.Text.Encoding.Unicode.GetString(decryted, 0, decryted.ToArray().Length);
            result = System.Text.Encoding.Unicode.GetString(decryted);
            return result;
        }
    }

}