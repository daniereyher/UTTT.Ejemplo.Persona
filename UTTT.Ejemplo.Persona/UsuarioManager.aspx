<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsuarioManager.aspx.cs" Inherits="UTTT.Ejemplo.Persona.UsuarioManager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    

     <meta name="viewport" content="width=device-width, initial-scale=1.0"/> 
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <title>Usuario Manager</title>

     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous"/>

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
    <div class="container">
        <form id="form1" class="form-horizontal" runat="server">

            <div style="font-family: 'Barlow Condensed Light'; font-weight: bold" align="center">

                <asp:Label ID="lblPersona" runat="server" Text="Usuario" Font-Size="XX-Large"></asp:Label>
                <br />
                <asp:Label ID="lblAccion" runat="server" Text="Acción" Font-Size="X-Large"></asp:Label>

            </div>
            <br />
            <br />


           <%-- <div class="form-group" style="font-family: 'Barlow Condensed Light';" align="right">
                <asp:Label class="control-label col-sm-6" ID="lblUserInfo" runat="server" Text=""></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnCerrarSesion" runat="server" Text="Cerrar sesion" class="btn btn-outline-danger btn-sm float-right" OnClick="btnCerrarSesion_Click" />
            </div>
            <asp:ScriptManager ID="ScriptManager3" runat="server" />--%>



            <div class="form-group" style="font-family: 'Barlow Condensed Light';">
                <asp:Label class="control-label col-sm-4" ID="lblNombre" runat="server" Text="Nombre:" Font-Size="large"></asp:Label>

                <div class="col-md-4">

                    <asp:DropDownList class="form-control border-secondary" ID="ddlNombre" runat="server"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvSex" runat="server" ControlToValidate="ddlNombre" ErrorMessage="Seleccione una persona.*" InitialValue="-1" EnableClientScript="False" Font-Bold="True" Font-Italic="True" Font-Size="Small"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Label ID="lblMensajeDDL" runat="server" ForeColor="Red" Text="La persona seleccionada ya tiene un usuario.*" Visible="False" Font-Bold="True" Font-Size="Small"></asp:Label>
            
                </div>
            </div>
            <br />

            <div class="form-group" style="font-family: 'Barlow Condensed Light';">
                <asp:Label class="control-label col-sm-4" ID="lblUsuario" runat="server" Text="Usuario:" Font-Size="large"></asp:Label>
                <div class="col-md-4">
                    <asp:TextBox class="form-control" ID="txtUsuario" runat="server" ViewStateMode="Disabled" MaxLength="20" onkeypress="return check(event)"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rvAp" runat="server" ErrorMessage="No ha escrito un usuario.*" ControlToValidate="txtUsuario" EnableClientScript="False" Font-Bold="True" Font-Italic="True" Font-Size="Small"></asp:RequiredFieldValidator>
                    <br />
                    <asp:CustomValidator ID="cvUsuario" runat="server" ClientValidationFunction="sizeLetMin" ControlToValidate="txtUsuario" ErrorMessage="Escriba minímo 5 letras.*" ForeColor="#6666FF" Font-Bold="True" Font-Italic="True" Font-Overline="False" Font-Size="Small"></asp:CustomValidator>
                    <br />
                    <asp:Label  ID="lblMensajeUsuario" runat="server" ForeColor="Red" Text="El usuario ya existe.*" Visible="False" Font-Bold="True" Font-Size="Small"></asp:Label>
            
                   <%-- <asp:RegularExpressionValidator ID="re2Nombre" runat="server" ErrorMessage="Escriba solo letras y numeros.*" ControlToValidate="txtUsuario" ValidationExpression="[^a-zA-Z]" ForeColor="Black" Font-Bold="True" Font-Italic="True" Font-Size="Small"></asp:RegularExpressionValidator>
                    <br />--%>
                </div>
            </div>


            <div class="form-group" style="font-family: 'Barlow Condensed Light';">
                <asp:Label class="control-label col-sm-4" ID="Label1" runat="server" Text="Password:" Font-Size="large"></asp:Label>
                <div class="col-md-4">
                    <asp:TextBox class="form-control" ID="txtPassword" runat="server" ViewStateMode="Disabled" onkeypress="return check(event)" MaxLength="20" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rvPassword" runat="server" ErrorMessage="No ha escrito un password.*" ControlToValidate="txtPassword" EnableClientScript="False" Font-Bold="True" Font-Italic="True" Font-Size="Small"></asp:RequiredFieldValidator>
                    <br />
                    <asp:CustomValidator ID="cvPass" runat="server" ClientValidationFunction="sizeLetMin" ControlToValidate="txtPassword" ErrorMessage="Escriba minímo 5 letras.*" ForeColor="#6666FF" Font-Bold="True" Font-Italic="True" Font-Overline="False" Font-Size="Small"></asp:CustomValidator>
                    <br />
                </div>
            </div>


            <div class="form-group" style="font-family: 'Barlow Condensed Light';">
                <asp:Label class="control-label col-sm-4" ID="lblConfirmarPassword" runat="server" Text="Confirmar password:" Font-Size="large"></asp:Label>
                <div class="col-md-4">
                    <asp:TextBox class="form-control" ID="txtConfirmarPassword" runat="server" ViewStateMode="Disabled" MaxLength="20"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfCPass" runat="server" ErrorMessage="Debe confirmar el password.*" ControlToValidate="txtConfirmarPassword" EnableClientScript="False" Font-Bold="True" Font-Italic="True" Font-Size="Small"></asp:RequiredFieldValidator>
                    <br />
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmarPassword" ErrorMessage="El password no coincide.*" ForeColor="#6666FF" Font-Bold="True" Font-Italic="True" Font-Overline="False" Font-Size="Small"></asp:CompareValidator>
                    <br />
                </div>
            </div>


            <div class="form-group" style="font-family: 'Barlow Condensed Light';">
                <asp:Label runat="server" class="control-label col-sm-4" Text="Fecha de registro:" for="FechaReg" Font-Size="large"></asp:Label>
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">

                        <span class="input-group-addon"><i>
                            <asp:ImageButton ID="btnCa" runat="server" Height="20px" Width="20px" ImageUrl="~/Images/Calendar.png"></asp:ImageButton></i></span>

                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <asp:TextBox class="form-control" ID="txtFecha" runat="server" ViewStateMode="Disabled" MinLength="10" MaxLength="10"></asp:TextBox>

                    </div>

                    <asp:RequiredFieldValidator ID="rfvFechaNaci" runat="server" ControlToValidate="txtFecha" ErrorMessage="No ha escrito su fecha de nacimiento.*" Font-Bold="True" Font-Italic="True" Font-Size="Small"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="rexFecha" runat="server" ErrorMessage="Formato de fecha incorrecta.*" ControlToValidate="txtFecha" ValidationExpression="(((19|20)([2468][048]|[13579][26]|0[48])|2000)[/-]02[/-]29|((19|20)[0-9]{2}[/-](0[4678]|1[02])[/-](0[1-9]|[12][0-9]|30)|(19|20)[0-9]{2}[/-](0[1359]|11)[/-](0[1-9]|[12][0-9]|3[01])|(19|20)[0-9]{2}[/-]02[/-](0[1-9]|1[0-9]|2[0-8])))" ForeColor="Black" Font-Bold="True" Font-Italic="True" Font-Size="Small"></asp:RegularExpressionValidator>
                    <ajaxToolkit:CalendarExtender ID="CalendarExtender" runat="server" Format="yyyy-MM-dd" PopupPosition="BottomLeft" BehaviorID="Calendar1" PopupButtonID="btnCa" TargetControlID="txtFecha"></ajaxToolkit:CalendarExtender>

                </div>


            </div>

            <br />

            <div class="form-group" style="font-family: 'Barlow Condensed Light';">
                <asp:Label class="control-label col-sm-4" ID="lblEstado" runat="server" Text="Estado:" Font-Size="large"></asp:Label>

                <div class="col-md-4">

                    <asp:DropDownList class="form-control border-secondary" ID="ddlEstado" runat="server"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvEstado" runat="server" ControlToValidate="ddlEstado" ErrorMessage="Seleccione el estado del usuario.*" InitialValue="-1" EnableClientScript="False" Font-Bold="True" Font-Italic="True" Font-Size="Small"></asp:RequiredFieldValidator>
                </div>
            </div>

            <br />

            <div class="form-group" style="font-family: 'Barlow Condensed Light';" align="center">
                <asp:Label class="control-label col-sm-4" ID="lblMensaje" runat="server" ForeColor="Red" Text="Validaciones" Visible="False" Font-Bold="True" Font-Size="16pt"></asp:Label>
            </div>
            <br />


            <div class="form-group" style="font-family: 'Barlow Condensed Light'; font-weight: bold" align="center">
                <div class="col-sm-10">
                    <asp:Button class="btn btn-success" ID="btnAceptar" runat="server" Text="Aceptar" OnClick="btnAceptar_Click" ViewStateMode="Disabled" Width="130px" />
                    &nbsp;
                    <asp:Button CssClass="btn btn-default" ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" ViewStateMode="Disabled" Width="130px" />
                    <br />
                    <br />
                </div>
            </div>
            <br />
            <br />

        </form>
    </div>
    
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js" integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js" integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG" crossorigin="anonymous"></script>


</body>
</html>


