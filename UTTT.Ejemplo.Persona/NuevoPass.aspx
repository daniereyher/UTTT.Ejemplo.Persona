<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NuevoPass.aspx.cs" Inherits="UTTT.Ejemplo.Persona.NuevoPass" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Nuevo password</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" />

    <script type="text/javascript">

       function size(sender, args) {
           args.IsValid=(args.Value.length >=3);
       }

       function sizeLetMin(sender, args) {
           args.IsValid = (args.Value.length >= 5);
       }

       function sizeLetMax(sender, args) {
           args.IsValid = (args.Value.length <= 20);
       }

       function sizeC(sender, args) {
           args.IsValid = (args.Value.length >=5);
        }

        function check(e) {
            tecla = (document.all) ? e.keyCode : e.which;

            //Tecla de retroceso para borrar, siempre la permite
            if (tecla == 8) {
                return true;
            }

            // Patron de entrada, en este caso solo acepta numeros y letras
            patron = /[A-Za-z0-9]/;
            tecla_final = String.fromCharCode(tecla);
            return patron.test(tecla_final);
        }

    </script>
</head>
<body>

    <div class="container" align="center">
        <form id="form1" runat="server" class="form-horizontal">
            <br />
            <div style="color: #000000; font-size: xx-large; font-family: 'Oswald Light'; font-weight: bold" align="center">
                <center>
                    <asp:Label ID="lblTitulo" runat="server" Text="Cambiar Password"></asp:Label></center>
            </div>
            <br />
             
               
            <div class="mb-3" style="font-size: Large; font-family: 'Oswald Light';" align="center">
                        <asp:Label ID="lblError" runat="server" Text="Escriba su nueva contraseña" ForeColor="Black" Font-Bold="False"></asp:Label>
                    
             </div>   
            <br />

            <div class="card" style="width: 23rem;" align="center">
                <center>
                    <img src="Images/Password.png" height="50px" width="50px"/>
                </center>
                
               
      
            
            <div class="form-group" style="font-family: 'Oswald Light';" align="center">
                 <asp:Label ID="lblUsuario" runat="server" Text="Usuario:" Font-Size="Medium" Font-Bold="True"></asp:Label>
                <asp:TextBox ID="txtUsuario" runat="server" class="form-control" Width="211px" Enabled="False"></asp:TextBox>
                </div>

                <div class="form-group" style="font-family: 'Oswald Light';" align="center">
                <asp:Label ID="lblPassword" runat="server" Text="Password:" Font-Size="Medium" Font-Bold="True"></asp:Label>
                    <asp:TextBox class="form-control" ID="txtPasswordN" runat="server" ViewStateMode="Disabled" Width="211px" onkeypress="return check(event)" TextMode="Password" MaxLength="20"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="rvPass" runat="server" ErrorMessage="No ha escrito un password.*" ControlToValidate="txtPasswordN" EnableClientScript="False" Font-Bold="True" Font-Italic="True" Font-Size="Small"></asp:RequiredFieldValidator>
                     <br />
                    <asp:CustomValidator ID="cvPassword" runat="server" ClientValidationFunction="sizeLetMin" ControlToValidate="txtPasswordN" ErrorMessage="Escriba minímo 5 carácteres.*" ForeColor="#6666FF" Font-Bold="True" Font-Italic="True" Font-Overline="False" Font-Size="Small"></asp:CustomValidator>
                    
            </div>

               <div class="form-group" style="font-family: 'Oswald Light';" align="center">
                <asp:Label class="col-form-label" ID="lblPassConfirmar" runat="server" Text="Confirmar password:" Font-Size="Medium" Font-Bold="True"></asp:Label>
                 <asp:TextBox class="form-control" ID="txtPasswordConfirm" runat="server" ViewStateMode="Disabled" Width="211px" onkeypress="return check(event)" TextMode="Password" MaxLength="20"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="rfCPass" runat="server" ErrorMessage="Debe confirmar el password.*" ControlToValidate="txtPasswordConfirm" EnableClientScript="False" Font-Bold="True" Font-Italic="True" Font-Size="Small"></asp:RequiredFieldValidator>
                   <br />
                    <asp:CompareValidator ID="cvPasswordConfirm" runat="server" ControlToCompare="txtPasswordN" ControlToValidate="txtPasswordConfirm" ErrorMessage="El password no coincide.*" ForeColor="#6666FF" Font-Bold="True" Font-Italic="True" Font-Overline="False" Font-Size="Small"></asp:CompareValidator>
                    
                   </div>
   

            

            <div style="font-family: 'Oswald'; font-weight: bold" align="center">
                <asp:Button CssClass="btn btn-outline-success" ID="btnAceptar" runat="server" Text="Actualizar" align="center"
                            OnClick="btnAceptar_Click" ViewStateMode="Disabled" Width="100px" />
                </div>
            <br />
             </div>              

            </form>
        </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js" integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js" integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG" crossorigin="anonymous"></script>

</body>
</html>