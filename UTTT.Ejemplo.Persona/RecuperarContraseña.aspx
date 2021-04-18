<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecuperarContraseña.aspx.cs" Inherits="UTTT.Ejemplo.Persona.RecuperarContraseña" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <meta name="viewport" content="width=device-width, initial-scale=1.0"/> 
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">

    <title>Recuperar password</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <div class="container" align="center">
        <form id="form1" class="form-horizontal" runat="server">

            <div style="font-family: 'Barlow Condensed Light'; font-weight: bold" align="center">

                <asp:Label ID="lblRecuperar" runat="server" Text="Recuperar contraseña" Font-Size="XX-Large"></asp:Label>
                <br />

                <div align="right">
            <asp:Button ID="btnLogin" runat="server" Text="Volver" class="btn btn-outline-secondary" OnClick="btnLogin_Click"  Width="100px" />
            </div>

                <br />
                </div>
                <div style="font-family: 'Barlow Condensed Light'"; align="center">
                <asp:Label ID="lblTexto" runat="server" Text="Para recuperar su contraseña y pueda acceder al sistema escriba su correo electrónico" Font-Size="Medium"></asp:Label>
            </div>
            <br />
            <br />
            <br />

            
            <div class="card" style="width: 23rem;" align="center">
                <div class="form-group" style="font-family: 'Barlow Condensed Light'; font-weight: bold" align="center">
                    <br />
                    <asp:Label ID="lblCorreo" runat="server" Text="Correo:" Font-Size="large"></asp:Label>
                    <asp:TextBox class="form-control" ID="txtCorreo" runat="server" placeholder="example@gmail.com" ViewStateMode="Disabled" MaxLength="30" Width="224px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rvCorreo" runat="server" ErrorMessage="No ha escrito un correo.*" ControlToValidate="txtCorreo" EnableClientScript="False" Font-Bold="True" Font-Italic="True" Font-Size="Small"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="rexCorreo" runat="server" ControlToValidate="txtCorreo" ErrorMessage="Escriba un correo electrónico valido.*" ForeColor="Black" ValidationExpression="^[^@]+@[^@]+\.[a-zA-Z]{2,}$" Font-Bold="True" Font-Italic="True" Font-Size="Small"></asp:RegularExpressionValidator>
                    <br />
                    <br />
                    <asp:Label ID="lblError" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Small"></asp:Label>
                    <br />
                    <br />
                    <asp:Button ID="btnRecPass" runat="server" class="btn btn-outline-success" Text="Obtener password" OnClick="btnRecPass_Click" />


                </div>
            </div>
        </form>
    </div>

    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js" integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js" integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG" crossorigin="anonymous"></script>

</body>
</html>
