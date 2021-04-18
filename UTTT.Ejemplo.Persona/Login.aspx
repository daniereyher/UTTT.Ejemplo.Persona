<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="UTTT.Ejemplo.Persona.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">

    <title>Login</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>

    <div class="container" align="center">
        <form id="form1" runat="server" class="form-horizontal">
            <br />
            <div style="color: #000000; font-size: xx-large; font-family: 'Barlow Condensed Light'; font-weight: bold" align="center">
                <center>
                    <asp:Label ID="lblTitulo" runat="server" Text="LOGIN"></asp:Label></center>
            </div>
            <br />
             
               
            <div class="mb-3" style="font-size: Large; font-family: 'Barlow Condensed Light';" align="center">
                        <asp:Label ID="lblError" runat="server" Text="Acceso denegado" ForeColor="Red" Font-Bold="True"></asp:Label>
                    
             </div>   
            <br />

            <div class="card" style="width: 23rem;" align="center">
                <center>
                    <img src="Images/Login.png" height="60px" width="60px"/>
                </center>
                
               
      
            
            <div class="form-group" style="font-family: 'Barlow Condensed Light';" align="center">
                <asp:Label ID="lblUsuario" runat="server" Text="Usuario:" Font-Size="large" Font-Bold="true"></asp:Label>
                    <asp:TextBox class="form-control" ID="txtUsuarioName" runat="server" ViewStateMode="Disabled" Width="211px"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="rvUss" runat="server" ErrorMessage="No ha escrito un usuario.*" ControlToValidate="txtUsuarioName" EnableClientScript="False" Font-Bold="True" Font-Italic="True" Font-Size="Small"></asp:RequiredFieldValidator>
            </div>

               <div class="form-group" style="font-family: 'Barlow Condensed Light';" align="center">
                <asp:Label class="col-form-label" ID="lblPassword" runat="server" Text="Password:" Font-Size="Large" Font-Bold="True"></asp:Label>
                 <asp:TextBox class="form-control" ID="txtPassword" runat="server" ViewStateMode="Disabled" Width="211px" TextMode="Password"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="rvPass" runat="server" ErrorMessage="No ha escrito un password.*" ControlToValidate="txtPassword" EnableClientScript="False" Font-Bold="True" Font-Italic="True" Font-Size="Small"></asp:RequiredFieldValidator>     
            </div>
   

            

            <div style="font-family: 'Barlow Condensed Light'; font-weight: bold" align="center">
                <asp:Button CssClass="btn btn-outline-success" ID="btnLogin" runat="server" Text="Iniciar sesión" align="center"
                            OnClick="btnLogin_Click" ViewStateMode="Disabled" Width="90px" />
                </div>
            <br />
            <div style="font-family: 'Barlow Condensed Light'; font-weight: bold" Font-Underline="True" align="center">
                <a href="/PSR/RecuperarContraseña.aspx" class="link-success">¿Ha olvidado su password?</a>
            </div>
             </div>              

            </form>
        </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js" integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js" integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG" crossorigin="anonymous"></script>


</body>
</html>
