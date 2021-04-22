<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsuarioPrincipal.aspx.cs" Inherits="UTTT.Ejemplo.Persona.UsuarioPrincipal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Usuario Principal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" ></script>

</head>
<body style="background-color : ghostwhite">
    <form id="form1" runat="server">
    
    <div style="color: #000000; font-size: medium; font-family: Arial;  font-weight: bold">    
   <h2>Usuario</h2>

    </div>
    <div>


    <p>
        Normbre:&nbsp;&nbsp;&nbsp;

        <asp:TextBox ID="txtNombre" runat="server" Width="350px" 
            ViewStateMode="Disabled" CssClass="form-control card"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnBuscar" runat="server" Text="Buscar" 
            onclick="btnBuscar_Click" ViewStateMode="Disabled" CssClass="form-control btn btn-outline-primary" Width="150px"/>
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnAgregar" runat="server" Text="Agregar" 
            onclick="btnAgregar_Click" ViewStateMode="Disabled" CssClass="form-control btn btn-outline-secondary" Width="150px"/>
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnHome" runat="server" Text="Regresar Inicio" 
            ViewStateMode="Disabled" CssClass="form-control btn btn-outline-success" Width="150px" OnClick="btnHome_Click"/>

    </p>
    </div>
<%--    <div>
    
        Status:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddlStatus" runat="server" Height="35px" Width="177px" 
            ForeColor="White" CssClass="form-select btn bg-secondary ">
        </asp:DropDownList>
    
    </div>--%>
    <div style="font-weight: bold">
    
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Detalle</div>

        <div>
        
        </div>
       
        <div>
<%--                Width="1067px" CellPadding="3" GridLines="Horizontal" 
                 BackColor="White" 
                BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px"--%>        
             <asp:GridView ID="dgvPersonas" runat="server" onrowcommand="dgvUsuarios_RowCommand"
                AllowPaging="True" AutoGenerateColumns="False" DataSourceID="DataSourcePersona" 
                ViewStateMode="Disabled" CssClass="table table-responsive-lg ">
                <%--<AlternatingRowStyle BackColor="WhiteSmoke" />--%>
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" 
                        ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="strUsuario" HeaderText="strUsuario" ReadOnly="True" 
                        SortExpression="strUsuario"  />
                    <asp:BoundField DataField="strPassword" HeaderText="strPassword" ReadOnly="True" 
                        SortExpression="strPassword" />
                    <asp:BoundField DataField="strStatus" HeaderText="strStatus" ReadOnly="True" 
                        SortExpression="strStatus" />
                    <asp:BoundField DataField="personaid" HeaderText="personaid" 
                        SortExpression="personaid" ReadOnly="True" />
                    <asp:BoundField DataField="strToken" HeaderText="strToken" ReadOnly="True" SortExpression="strToken" />
                     
                    <asp:TemplateField HeaderText="Editar">
                        <ItemTemplate>
                            <asp:ImageButton runat="server" ID="imgEditar" CommandName="Editar" CommandArgument='<%#Bind("id") %>' ImageUrl="~/Images/editrecord_16x16.png" />
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="50px" />

                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Eliminar" Visible="True">
                        <ItemTemplate>
                            <asp:ImageButton runat="server" ID="imgEliminar" CommandName="Eliminar" CommandArgument='<%#Bind("id") %>' ImageUrl="~/Images/delrecord_16x16.png" OnClientClick="javascript:return confirm('¿Está seguro de querer eliminar el registro seleccionado?', 'Mensaje de sistema')" />
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#B5C7DE" ForeColor="#F7F7F7" />
                <HeaderStyle BackColor="ControlDarkDark" Font-Bold="True" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="SlateGray" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <RowStyle BackColor="ButtonShadow" ForeColor="#F7F7F7" />
                <SelectedRowStyle BackColor="Coral" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#F7F7F7" />
                <SortedDescendingCellStyle BackColor="#F7F7F7" />
                <SortedDescendingHeaderStyle BackColor="#3E3277" />
            </asp:GridView>
        
        </div>
    <asp:LinqDataSource ID="DataSourcePersona" runat="server" 
        ContextTypeName="UTTT.Ejemplo.Linq.Data.Entity.DcGeneralDataContext" 
        onselecting="DataSourcePersona_Selecting" 
        Select="new (id, strUsuario, strPassword, strStatus, personaid, strToken)" 
        TableName="Usuario" EntityTypeName="">
    </asp:LinqDataSource>
    </form>
</body>
</html>
