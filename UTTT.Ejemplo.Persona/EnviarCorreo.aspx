<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EnviarCorreo.aspx.cs" Inherits="UTTT.Ejemplo.Persona.EnviarCorreo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
    <title>Enviar Correo</title>
</head>
<body>
    <div class="container-fluid">
        <div class="offset-1 col-10 align-self-center">
        <div class="row m-5">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12"> 
                <div class="card ">
                    <div class="card-body ">
                        <form id="form1" runat="server" class="form-horizontal ">
                            <div class="form-group ">
                                <asp:Label ID="lblCorreo" runat="server" Text="Correo Electronico:" CssClass="form-label col-sm-2"></asp:Label>
                                <div class="col-sm-10">
                                    <asp:TextBox ID="txtCorreo" runat="server" type="Email" placeholder="Ingresa Tu Correo Electronico:" CssClass="form-control" ValidationGroup="vgrCorreo"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvCorreo" runat="server" ErrorMessage="Es Obligatorio este Campo" ControlToValidate="txtPass"></asp:RequiredFieldValidator>
                                
                                </div>
                            </div>
                            <div>
                                <div class="form-group">
                                    <asp:Label ID="lblCorreoConfirm" runat="server" Text="Confirmacion:" CssClass="form-label col-sm-2"></asp:Label>
                                    <div class="col-sm-10">
                                        <asp:TextBox ID="txtConfirmCorreo" type="Email" runat="server" placeholder="Confirma tu correo Electronico:" CssClass="form-control" ValidationGroup="vgrCorreo"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvConfirmCorreo" runat="server" ErrorMessage="Es Obligatorio este Campo" ControlToValidate="txtPass"></asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="cvCorreo" runat="server" ErrorMessage="Los Correos no son iguales" ControlToCompare="txtCorreo" ControlToValidate="txtConfirmCorreo"></asp:CompareValidator>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="form-group">
                                    <div class="col-sm-10">
                                        <asp:Button ID="btnAceptar" runat="server" Text="Enviar Token" CssClass="form-control btn btn-outline-primary"  ValidationGroup="vgrCorreo"/>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
      </div>
</body>
</html>
