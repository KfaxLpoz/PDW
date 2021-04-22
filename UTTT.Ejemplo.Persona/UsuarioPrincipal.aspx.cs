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
                if (!this.IsPostBack)
                {
                    List<Status> lista = dcTemp.GetTable<Status>().ToList();
                    Status catTemp = new Status();
                    catTemp.id = -1;
                    catTemp.strDescripcion = "Todos";
                    lista.Insert(0, catTemp);
                    this.ddlStatus.DataTextField = "strDescripcion";
                    this.ddlStatus.DataValueField = "id";
                    this.ddlStatus.DataSource = lista;
                    this.ddlStatus.DataBind();
                }
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

        }
    }
}