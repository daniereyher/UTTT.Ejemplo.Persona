<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ErrorPage.aspx.cs" Inherits="UTTT.Ejemplo.Persona.fatalError" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <meta name="viewport" content="width=device-width, initial-scale=1.0"/> 
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">

    

    <title>ErrorPage</title>

     <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" />
</head>

<body>
    <div class="container">
        <form id="form1" runat="server">
            <div>
            </div>
            <br />
            <div style="font-family: 'Barlow Condensed Light'; font-weight: bold" align="center">

                <asp:Label class="col-form-label" ID="lblPersona" runat="server" Text="Fatal error" Font-Size="65px"></asp:Label>

            </div>

            <div align="center">
                <img src="Images/sad.png"
                    width="400" height="400" />
            </div>
            <div style="font-family: 'Barlow Condensed Light'; font-weight: bold" align="center">

                <asp:Label class="col-form-label" ID="Label1" runat="server" Text="De clic en el enlace de abajo para volver a la HomePage" Font-Size="large"></asp:Label>
                <br />
                <br />
                <a href="/PSR/PersonaPrincipal.aspx" class="link-primary">Pagina de inicio</a>
            </div>
        </form>
    </div>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js" integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js" integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG" crossorigin="anonymous"></script>

    
</body>
</html>
