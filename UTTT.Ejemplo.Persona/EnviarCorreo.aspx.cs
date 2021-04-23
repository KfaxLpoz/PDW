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
using System.Net.Mail;
using System.Net;

namespace UTTT.Ejemplo.Persona
{
    public partial class EnviarCorreo : System.Web.UI.Page
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
                UTTT.Ejemplo.Linq.Data.Entity.Persona persona = new Linq.Data.Entity.Persona();
                UTTT.Ejemplo.Linq.Data.Entity.Usuario usuario = new Linq.Data.Entity.Usuario();
                persona = dcGuardar.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Persona>().First(c => c.strCorreo == this.txtConfirmCorreo.Text.Trim());
                if (persona.strCorreo == this.txtConfirmCorreo.Text.Trim())
                {
                    var user = dcGuardar.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Usuario>().First(c => c.personaid == persona.id);

                    string token = user.strToken;
                    string correoDestino = this.txtConfirmCorreo.Text.Trim();
                    string correoOrigen = "frankmartz1234@gmail.com";
                    string pass = "kfax1230";


                    string body = "<body>" +
                        "<h1>Estimado usuario: </h1>"+
                        "<spam>a travez de este medio le hacemos llegar su token con el cual podra cambiar su password para poder acceder a la plataforma" +
                        "lo esperamos.</spam>"+
                        "<b>"+ token+"</b>";



                    MailMessage mail = new MailMessage(correoOrigen,correoDestino,"Recuperar Password",body);
                    mail.IsBodyHtml = true;


                    SmtpClient smtp = new SmtpClient("smtp.gmail.com");
                    smtp.EnableSsl = true;
                    smtp.UseDefaultCredentials = false;
                    smtp.Port = 587;
                    smtp.Credentials = new System.Net.NetworkCredential(correoOrigen, pass);
                    smtp.DeliveryMethod = SmtpDeliveryMethod.Network;



                    //SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                    //smtp.Credentials = new NetworkCredential(correoOrigen, pass);
                    //smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                    //smtp.EnableSsl = true;
                    //smtp.UseDefaultCredentials = false;










                    //mail.From = new MailAddress(correoOrigen,"Correo Aplicacion Francisco Xavier");
                    //mail.To.Add(new MailAddress(correoDestino));
                    //mail.Subject = "Mensaje de recuperacion de Password";
                    //mail.IsBodyHtml = true;
                    //mail.Body = body;

                    smtp.Send(mail);

                    this.showMessage("Se ha enviado Un correo Con tu Token.");
                    this.Response.Redirect("~/Login.aspx", false);
                }

                this.showMessageException("Error al enviar tu Token");

            }
            catch (Exception _e)
            {
                this.showMessageException(_e.Message);
            }
        }
    }
}