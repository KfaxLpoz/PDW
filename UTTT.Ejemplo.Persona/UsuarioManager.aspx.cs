using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UTTT.Ejemplo.Linq.Data.Entity;
using UTTT.Ejemplo.Persona.Control.Ctrl;

namespace UTTT.Ejemplo.Persona
{
    public partial class UsuarioManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                DataContext dcGuardar = new DcGeneralDataContext();
                UTTT.Ejemplo.Linq.Data.Entity.Usuario persona = new Linq.Data.Entity.Usuario();
                //accion agregar

                persona.strUsuario = this.txtUsuario.Text.Trim();
                persona.strPassword = this.txtConfirmPass.Text.Trim();
                string status = "Activo";
                persona.strStatus = status;
                DateTime tiempo = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day);
                persona.fechaRegistro = tiempo;
                persona.personaid = int.Parse(this.ddlPersona.Text);
                var Token = "123"+ this.txtUsuario.Text.Trim()+"321";
                persona.strToken = Token;
                
                dcGuardar.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Usuario>().InsertOnSubmit(persona);
                dcGuardar.SubmitChanges();
                this.showMessage("El registro se agrego correctamente.");
                this.Response.Redirect("~/UsuarioPrincipal.aspx", false);
                
              
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
                this.Response.Redirect("~/UsuarioPrincipal.aspx", false);
            }
            catch (Exception _e)
            {
                this.showMessage("Ha ocurrido un error inesperado");
            }
        }
    }
}