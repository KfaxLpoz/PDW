using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UTTT.Ejemplo.Linq.Data.Entity;
using UTTT.Ejemplo.Persona.Control;
using UTTT.Ejemplo.Persona.Control.Ctrl;

namespace UTTT.Ejemplo.Persona
{
    public partial class RecuperarPass : System.Web.UI.Page
    {
        #region Variables

        private SessionManager session = new SessionManager();
        private DataContext dcGlobal = new DcGeneralDataContext();

        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {

            try
            {
                DataContext dcGuardar = new DcGeneralDataContext();
                UTTT.Ejemplo.Linq.Data.Entity.Usuario persona = new Linq.Data.Entity.Usuario();
                persona = dcGuardar.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Usuario>().First(c => c.strToken == this.txtToken.Text.Trim());
                if (persona.strToken == this.txtToken.Text.Trim())
                {

                    persona.strPassword = this.txtConfirmPass.Text.Trim();

                    dcGuardar.SubmitChanges();
                    this.showMessage("Se cambio el Password Correctamente correctamente.");
                    this.Response.Redirect("~/Login.aspx", false);
                }

                this.showMessageException("Error al Cambiar el Password Error en tu Token");

            }
            catch (Exception _e)
            {
                this.showMessageException(_e.Message);
            }
        }
    }
}