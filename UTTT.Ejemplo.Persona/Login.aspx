<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="UTTT.Ejemplo.Persona.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
    <title>Login</title>
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
                                <asp:Label ID="lblUsuario" runat="server" Text="Usuario:" CssClass="form-label col-sm-2"></asp:Label>
                                <div class="col-sm-10">
                                    <asp:TextBox ID="txtUsuario" runat="server" placeholder="Nombre de Usuario:" CssClass="form-control align-content-center"></asp:TextBox>
                                </div>
                            </div>
                            <div>
                                <div class="form-group">
                                    <asp:Label ID="lblPassword" runat="server" Text="Password:" CssClass="form-label col-sm-2"></asp:Label>
                                    <div class="col-sm-10">
                                        <asp:TextBox ID="txtPass" type="password" runat="server" placeholder="Tu Password:" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="form-group">
                                    <div class="col-sm-10">
                                        <asp:Button ID="btnAceptar" runat="server" Text="Inicar Sesion" CssClass="form-control btn btn-outline-primary" OnClick="btnAceptar_Click" />
                                        <a href="EnviarCorreo.aspx" class="form-control btn btn-outline-success">Olvidaste tu Password</a>
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
