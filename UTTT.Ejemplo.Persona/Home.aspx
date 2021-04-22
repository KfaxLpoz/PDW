<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="UTTT.Ejemplo.Persona.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" ></script>
    <title>Bienvenido</title>
</head>
<body>
    <div class="row">
  <div class="col-sm-6">
    <div class="card text-white bg-dark ">
    <div class="card-header">Usuarios</div>

      <div class="card-body">
        <h5 class="card-title">Menu de Usuarios</h5>
        <p class="card-text">Acceder al modulo de personas, donde podremos consultar los registros en la base de datos o agregar Personas nuevas a la base.</p>
        <a href="UsuarioPrincipal.aspx" class="btn btn-primary">Ingresar</a>
      </div>
    </div>
  </div>
  <div class="col-sm-6">
    <div class="card text-white bg-secondary">
    <div class="card-header">Personas</div>

      <div class="card-body">
        <h5 class="card-title">Menu de Personas</h5>
        <p class="card-text">Acceder al modulo de personas, donde podremos consultar los registros en la base de datos o agregar Personas nuevas a la base. </p>
        <a href="PersonaPrincipal.aspx" class="btn btn-primary">Ingresar</a>
      </div>
    </div>
  </div>
</div>
</body>
</html>
