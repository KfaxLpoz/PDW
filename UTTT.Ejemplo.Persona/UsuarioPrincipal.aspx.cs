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
        #region Variables

        private SessionManager session = new SessionManager();

        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Response.Buffer = true;
                DataContext dcTemp = new DcGeneralDataContext();
                //if (!this.IsPostBack)
                //{
                //    List<Status> lista = dcTemp.GetTable<Status>().ToList();
                //    Status catTemp = new Status();
                //    catTemp.id = -1;
                //    catTemp.strDescripcion = "Todos";
                //    lista.Insert(0, catTemp);
                //    this.ddlStatus.DataTextField = "strDescripcion";
                //    this.ddlStatus.DataValueField = "id";
                //    this.ddlStatus.DataSource = lista;
                //    this.ddlStatus.DataBind();
                //}
            }
            catch (Exception _e)
            {
                this.showMessage("Ha ocurrido un problema al cargar la página");
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
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

        protected void btnAgregar_Click(object sender, EventArgs e)
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




        protected void DataSourcePersona_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            try
            {
                DataContext dcConsulta = new DcGeneralDataContext();
                bool nombreBool = false;
                
                if (!this.txtNombre.Text.Equals(String.Empty))
                {
                    nombreBool = true;
                }
                
                Expression<Func<UTTT.Ejemplo.Linq.Data.Entity.Usuario, bool>>
                    predicate =
                    (c =>
                    ((nombreBool) ? (((nombreBool) ? c.strUsuario.Contains(this.txtNombre.Text.Trim()) : false)) : true)
                    );

                predicate.Compile();

                List<UTTT.Ejemplo.Linq.Data.Entity.Usuario> listaUsuario =
                    dcConsulta.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Usuario>().Where(predicate).ToList();
                e.Result = listaUsuario;
            }
            catch (Exception _e)
            {
                throw _e;
            }
        }

        protected void dgvUsuarios_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int idPersona = int.Parse(e.CommandArgument.ToString());
                switch (e.CommandName)
                {
                    case "Editar":
                        this.editar(idPersona);
                        break;
                    case "Eliminar":
                        this.eliminar(idPersona);
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
                this.session.Pantalla = "~/EditarUsuario.aspx";
                this.Response.Redirect(this.session.Pantalla, false);

            }
            catch (Exception _e)
            {
                throw _e;
            }
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
                this.showMessage("El registro se elimino correctamente.");
                this.DataSourcePersona.RaiseViewChanged();
            }
            catch (Exception _e)
            {
                throw _e;
            }
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            try
            {
                this.Response.Redirect("~/Home.aspx", false);
            }
            catch (Exception _e)
            {
                this.showMessage("Ha ocurrido un error inesperado");
            }
        }
    }
}