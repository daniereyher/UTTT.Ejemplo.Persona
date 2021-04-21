<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="UTTT.Ejemplo.Persona.Inicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">

    <title>Inicio</title>

    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" />

</head>
<body>
    <div class="container" align="center">
        <form id="form1" runat="server" class="form-horizontal">
            <br />
             <div style="color: #000000; font-size: xx-large; font-family: 'Oswald'; font-weight: bold" align="center">
                <center>
                    <asp:Label ID="Label1" runat="server" Text="Bienvenido"></asp:Label></center>
            </div>
            <br />
            <br />
            <div style=" font-family: 'Oswald';" align="right">
            <asp:Button ID="btnCerrarSesion" runat="server" Text="Cerrar sesión"   class="btn btn-outline-danger" OnClick="btnCerrarSesion_Click"/>
        </div>
            <br />
            
            <div style="font-family: 'Oswald';">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="card" style="width: 27rem;">
                            <div class="card-body">
                                <h4 class="card-title">PERSONAS</h4>
                                <img class="card-img-top" src="Images/Personas.png" style="height: 60%; width: 70%;" />
                                <p class="card-text">
                                    En está sección puede agregar/editar/eliminar una persona.
                                </p>
                                <a href="PersonaPrincipal.aspx" class="btn btn-outline-success" style="width: 20%;">Entrar</a>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <div class="card" style="width: 26rem;">
                            <div class="card-body">
                                <h4 class="card-title">USUARIOS</h4>
                                <img class="card-img-top" src="Images/Usuarios.png" style="height: 60%; width: 40%;" />
                                <p class="card-text">
                                    En está sección puede agregar/editar/eliminar un usuario.
                                </p>
                                <a href="UsuarioPrincipal.aspx" class="btn btn-outline-success" style="width: 20%;">Entrar</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
           
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js" integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js" integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG" crossorigin="anonymous"></script>

</body>
</html>
