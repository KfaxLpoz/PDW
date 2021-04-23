<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditarUsuario.aspx.cs" Inherits="UTTT.Ejemplo.Persona.EditarUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Formulario de Registro Usuario</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body style="background-color: ghostwhite">

    <div class="container well contenedor " style="background-color: aliceblue">
        <div class="row">
            <div class="col-xs-12">
                <h2>
                    <asp:Label ID="lblAccion" runat="server" Text="Registro" Font-Bold="True" CssClass="align-content-center"></asp:Label></h2>

            </div>
        </div>
        <form runat="server" class="form-horizontal">
            <div class="form-group">
                <asp:Label ID="lblPersona" runat="server" Text="Persona:" CssClass="control-label col-sm-2"></asp:Label>
                <div class="col-sm-10">
                        <asp:TextBox ID="txtPersona" Enabled="false" minlength="3" MaxLength="15" runat="server" title="Escribe el nombre de usuario que quieras" required
                            CssClass="form-control" placeholder="Escribe el nombre de usuario que quieras"></asp:TextBox>
                </div>
            </div>

            <div>
                <div class="form-group">
                    <asp:Label ID="lblUsuario" runat="server" Text="Nombre de Usuario:" CssClass="control-label col-sm-2"></asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtUsuario" minlength="3" MaxLength="15" runat="server" title="Escribe el nombre de usuario que quieras" required
                            CssClass="form-control" placeholder="Escribe el nombre de usuario que quieras"></asp:TextBox>

                        <div>
                            <asp:RequiredFieldValidator ID="rsvUsuario" runat="server"
                                ErrorMessage="El campo de Nombre de Usuario es obligatorio"
                                ControlToValidate="txtUsuario"
                                CssClass="form-control alert-danger text-center"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

            </div>
            <div class="form-group">
                <asp:Label ID="LblPassword" runat="server" Text="Password:" CssClass="control-label col-sm-2"></asp:Label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtPassword" runat="server"
                        placeholder="Password" minlength="3" MaxLength="15"
                        CssClass="form-control" oncopy="return false" type="Password" onpaste="return false" required></asp:TextBox>

                    <script type="text/javascript">
                        function letrasonly(e) {
                            var unicode = e.charCode ? e.charCode : e.KeyCode
                            if (unicode < 65 || unicode > 90) {
                                if (unicode != 20 && unicode != 241) {
                                    if (unicode < 96 || unicode > 122) {
                                        return false
                                    }
                                }
                            }
                        }
                    </script>

                    <div>
                        <asp:RequiredFieldValidator ID="rsvPassword" runat="server"
                            ErrorMessage="El campo Password es oblogatorio"
                            ControlToValidate="txtPassword"
                            CssClass="form-control alert-danger text-center"></asp:RequiredFieldValidator>
                    </div>

                </div>
            </div>

            <div>
                <div class="form-group">
                    <asp:Label ID="lblConfirmPass" runat="server" Text="Confirmar Password:" CssClass="control-label col-sm-2"></asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtConfirmPass" runat="server"
                            placeholder="Ingresa nuevamente tu Password" minlength="3" MaxLength="15"
                            CssClass="form-control" oncopy="return false" type="Password" onpaste="return false" required></asp:TextBox>

                        <div>
                            <asp:RequiredFieldValidator ID="rfvConfirmPass" runat="server"
                                ErrorMessage="El campo Confirmar Password es obligatorio"
                                ControlToValidate="txtConfirmPass"
                                CssClass="form-control alert-danger text-center"></asp:RequiredFieldValidator>
                        </div>
                        <div>
                            <asp:CompareValidator ID="cvPass" runat="server" ErrorMessage="Los Passwords no son iguales"
                                ControlToCompare="txtPassword" ControlToValidate="txtConfirmPass" CssClass="form-control alert-danger text-center"></asp:CompareValidator>
                        </div>
                    </div>

                </div>

            </div>

            
            <div>
                <div class="form-group">
                    <asp:Label ID="lblStatus" runat="server" Text="Status del usuario:" CssClass="control-label col-sm-2"></asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtStatus" Enabled="false" minlength="3" MaxLength="15" runat="server" title="Status del Usuario" required
                            CssClass="form-control" placeholder="Escribe el nombre de usuario que quieras"></asp:TextBox>

                    </div>
                </div>

            </div>
                        <div>
                <div class="form-group">
                    <asp:Label ID="lblFrcha" runat="server" Text="Fecha de Registro:" CssClass="control-label col-sm-2"></asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtFecha" Enabled="false" minlength="3" MaxLength="15" runat="server" title="Fecha de Registro" required
                            CssClass="form-control" placeholder="Escribe el nombre de usuario que quieras"></asp:TextBox>

                    </div>
                </div>

            </div>

            <div class="form-group">
                <asp:Button ID="btnAceptar" runat="server" Text="Aceptar"
                    OnClick="btnAceptar_Click" CssClass="form-control btn btn-outline-primary" />
            </div>



            <div>
                <br />
            </div>

            <div class="form-group">
                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar"
                    OnClick="btnCancelar_Click" CssClass="form-control btn btn-outline-secondary " />
            </div>
        </form>


    </div>

</body>
</html>
