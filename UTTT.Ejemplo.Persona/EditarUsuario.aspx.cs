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
    public partial class EditarUsuario : System.Web.UI.Page
    {
        #region Variables

        private SessionManager session = new SessionManager();
        private int idUsuario = 0;
        private UTTT.Ejemplo.Linq.Data.Entity.Usuario baseEntity;
        private DataContext dcGlobal = new DcGeneralDataContext();
        private int tipoAccion = 0;

        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                this.Response.Buffer = true;
                this.session = (SessionManager)this.Session["SessionManager"];
                this.idUsuario = this.session.Parametros["idUsuario"] != null ?
                    int.Parse(this.session.Parametros["idUsuario"].ToString()) : 0;
                if (this.idUsuario == 0)
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
                        this.lblAccion.Text = "Editar";

                        this.txtPersona.Text = this.baseEntity.personaid.ToString();
                        this.txtUsuario.Text = this.baseEntity.strUsuario;
                        this.txtStatus.Text = this.baseEntity.strStatus;
                        this.txtFecha.Text = this.baseEntity.fechaRegistro.ToString();
                        //this.setItem(ref this.ddlSexo, baseEntity.CatSexo.strValor);
                        //DateTime? fechaNacimiento = this.baseEntity.dteFechaNacimiento;

                        
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
                DataContext dcGuardar = new DcGeneralDataContext();
                UTTT.Ejemplo.Linq.Data.Entity.Usuario persona = new Linq.Data.Entity.Usuario();
                persona = dcGuardar.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Usuario>().First(c => c.id == idUsuario);

                persona.strUsuario = this.txtUsuario.Text.Trim();
                persona.strPassword = this.txtConfirmPass.Text.Trim();
                var Token = "123" + this.txtUsuario.Text.Trim() + "321";
                persona.strToken = Token;

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