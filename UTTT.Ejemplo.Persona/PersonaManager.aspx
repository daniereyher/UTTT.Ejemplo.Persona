<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonaManager.aspx.cs" Inherits="UTTT.Ejemplo.Persona.PersonaManager" debug="false"%>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta name="viewport" content="width=device-width, initial-scale=1.0"/> 
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous"/>

    


    <title>Formulario</title>

     <%--<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" />--%>
    
     
    <script src="javaScripFile.js" type="text/javascript"></script>  
    <script type="text/javascript">

       function size(sender, args) {
           args.IsValid=(args.Value.length >=3);
       }

       function sizeLetMin(sender, args) {
           args.IsValid = (args.Value.length >= 3);
       }

       function sizeLetMax(sender, args) {
           args.IsValid = (args.Value.length <= 20);
       }

       function sizeC(sender, args) {
           args.IsValid = (args.Value.length >=5);
       }

   </script>

    <script type="text/javascript">
        function Nums(n) {
            var number = window.event ? window.event.keyCode : e.which;
            if ((number == 8 || number == 48))
                return true;
            if (number <= 47 || number >= 58)
                return false;
            return /\d/.test(String.fromCharCode(number));
        }

    </script>


</head>
<body>
    <div class="container">
        <form id="form1" class="form-horizontal" runat="server">

            <div style="font-family: 'Oswald'; font-weight: bold" align="center">

                <asp:Label ID="lblPersona" runat="server" Text="Persona" Font-Size="XX-Large"></asp:Label>
                <br />
                <asp:Label ID="lblAccion" runat="server" Text="Acción" Font-Size="X-Large"></asp:Label>

            </div>
            <br />
            <br />

            <div class="form-group" style="font-family: 'Oswald';">
                <asp:Label class="control-label col-sm-4" ID="lblSexo" runat="server" Text="Sexo" Font-Size="medium"></asp:Label>

                <div class="col-md-4">

                    <asp:DropDownList class="form-control border-secondary" ID="ddlSexo" runat="server"></asp:DropDownList>
                    <br />
                    <asp:RequiredFieldValidator ID="rfvSex" runat="server" ControlToValidate="ddlSexo" ErrorMessage="Seleccione masculino o femenino.*" InitialValue="-1" EnableClientScript="False" Font-Bold="True" Font-Italic="True" Font-Size="Small"></asp:RequiredFieldValidator>
                </div>
            </div>
            <br />


            <div class="form-group" style="font-family: 'Oswald';">
                <asp:Label class="control-label col-sm-4" ID="lblClave" runat="server" Text="Clave única:" Font-Size="medium"></asp:Label>
                <div class="col-md-4">
                    <asp:TextBox class="form-control" ID="txtClaveUnica" minlength="3" MaxLength="3" onkeypress="return Nums(event);" runat="server" ViewStateMode="Disabled"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvClave" runat="server" ControlToValidate="txtClaveUnica" ErrorMessage="No ha escrito una clave única.*" EnableClientScript="False" Font-Bold="True" Font-Italic="True" Font-Size="Small"></asp:RequiredFieldValidator>
                    <br />
                    <asp:CustomValidator ID="cvClave" runat="server" BorderStyle="None" ErrorMessage="Escriba 3 números.*" ClientValidationFunction="size" ValidationGroup="facts" ControlToValidate="txtClaveUnica" ForeColor="#6666FF" Font-Bold="True" Font-Italic="True" Font-Size="Small"></asp:CustomValidator>
                    <br />
                    <asp:RangeValidator ID="rvClave" runat="server" ControlToValidate="txtClaveUnica" ErrorMessage="Escriba una clave única valida.*" ForeColor="Black" MaximumValue="999" MinimumValue="100" Type="Integer" EnableClientScript="False" Font-Bold="True" Font-Italic="True" Font-Size="Small"></asp:RangeValidator>
                </div>
            </div>

            <br />
            <div class="form-group" style="font-family: 'Oswald';">
                <asp:Label class="control-label col-sm-4" ID="Label3" runat="server" Text="Nombre:" Font-Size="medium"></asp:Label>
                <div class="col-md-4">
                    <asp:TextBox class="form-control" ID="txtNombre" runat="server" ViewStateMode="Disabled" MaxLength="20"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="No ha escrito su nombre.*" EnableClientScript="False" Font-Italic="True" Font-Size="Small"></asp:RequiredFieldValidator>
                    <br />
                    <asp:CustomValidator ID="cvNombre" runat="server" ErrorMessage="Escriba minímo 3 letras.*" ControlToValidate="txtNombre" ForeColor="#6666FF" ClientValidationFunction="sizeLetMin" OnServerValidate="cvNombre_ServerValidate" Font-Bold="True" Font-Italic="True" Font-Size="Small"></asp:CustomValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="re2Nombre" runat="server" ErrorMessage="Números no permitidos.*" ControlToValidate="txtNombre" ValidationExpression="^[a-zA-ZáéíóúÁÉÍÓÚÑñ\s]*$" ForeColor="Black" Font-Bold="True" Font-Italic="True" Font-Size="Small"></asp:RegularExpressionValidator>
                </div>
            </div>
            <br />

            <div class="form-group" style="font-family: 'Oswald';">
                <asp:Label class="control-label col-sm-4" ID="Label5" runat="server" Text="Apellido Paterno:" Font-Size="medium"></asp:Label>
                <div class="col-md-4">
                    <asp:TextBox class="form-control" ID="txtAPaterno" runat="server" ViewStateMode="Disabled" MaxLength="20"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rvAp" runat="server" ErrorMessage="No ha escrito su apellido paterno.*" ControlToValidate="txtAPaterno" EnableClientScript="False" Font-Bold="True" Font-Italic="True" Font-Size="Small"></asp:RequiredFieldValidator>
                    <br />
                    <asp:CustomValidator ID="cvAPaterno" runat="server" ClientValidationFunction="sizeLetMin" ControlToValidate="txtAPaterno" ErrorMessage="Escriba minímo 3 letras.*" ForeColor="#6666FF" Font-Bold="True" Font-Italic="True" Font-Overline="False" Font-Size="Small"></asp:CustomValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="re2AP" runat="server" ErrorMessage="Números no permitidos.*" ControlToValidate="txtAPaterno" ValidationExpression="^[a-zA-ZáéíóúÁÉÍÓÚÑñ\s]*$" ForeColor="Black" Font-Bold="True" Font-Italic="True" Font-Size="Small"></asp:RegularExpressionValidator>
                </div>
            </div>

            <br />

            <div class="form-group" style="font-family: 'Oswald';">
                <asp:Label class="control-label col-sm-4" ID="Label6" runat="server" Text="Apellido Materno:" Font-Size="medium"></asp:Label>
                <div class="col-md-4">
                    <asp:TextBox class="form-control" ID="txtAMaterno" runat="server" ViewStateMode="Disabled" MaxLength="20"></asp:TextBox>
                    <asp:CustomValidator ID="cvAMaterno" runat="server" ClientValidationFunction="sizeLetMin" ControlToValidate="txtAMaterno" ErrorMessage="Escriba minímo 3 letras.*" ForeColor="#6666FF" Font-Bold="True" Font-Italic="True" Font-Size="Small" Font-Strikeout="False"></asp:CustomValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="reAP" runat="server" ErrorMessage="Números no permitidos.*" ControlToValidate="txtAMaterno" ValidationExpression="^[a-zA-ZáéíóúÁÉÍÓÚÑñ\s]*$" ForeColor="Black" Font-Bold="True" Font-Italic="True" Font-Size="Small"></asp:RegularExpressionValidator>
                </div>
            </div>

            <br />

            <div class="form-group" style="font-family: 'Oswald';">
                <asp:Label runat="server" class="control-label col-sm-4" Text="Fecha de nacimiento:" for="FechaNac" Font-Size="medium"></asp:Label>
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">

                        <span class="input-group-addon"><i>
                            <asp:ImageButton ID="btnCa" runat="server" Height="20px" Width="20px" ImageUrl="~/Images/Calendar.png"></asp:ImageButton></i></span>

                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <asp:TextBox class="form-control" ID="TextBox1" runat="server" ViewStateMode="Disabled" MinLength="10" MaxLength="10"></asp:TextBox>

                    </div>

                    <asp:RequiredFieldValidator ID="rfvFechaNaci" runat="server" ControlToValidate="TextBox1" ErrorMessage="No ha escrito su fecha de nacimiento.*" Font-Bold="True" Font-Italic="True" Font-Size="Small"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="rexFecha" runat="server" ErrorMessage="Formato de fecha incorrecta.*" ControlToValidate="TextBox1" ValidationExpression="(((19|20)([2468][048]|[13579][26]|0[48])|2000)[/-]02[/-]29|((19|20)[0-9]{2}[/-](0[4678]|1[02])[/-](0[1-9]|[12][0-9]|30)|(19|20)[0-9]{2}[/-](0[1359]|11)[/-](0[1-9]|[12][0-9]|3[01])|(19|20)[0-9]{2}[/-]02[/-](0[1-9]|1[0-9]|2[0-8])))" ForeColor="Black" Font-Bold="True" Font-Italic="True" Font-Size="Small"></asp:RegularExpressionValidator>
                    <br />
                    <asp:Label ID="lblValFecha" runat="server" ForeColor="Red" Text="valNacimiento" Visible="False" Font-Bold="True" Font-Italic="True" Font-Overline="False" Font-Size="Small"></asp:Label>

                    <ajaxToolkit:CalendarExtender ID="CalendarExtender" runat="server" Format="yyyy-MM-dd" PopupPosition="BottomLeft" BehaviorID="Calendar1" PopupButtonID="btnCa" TargetControlID="TextBox1"></ajaxToolkit:CalendarExtender>

                </div>


            </div>


            <%-- <div class="form-group" style="font-family: 'Barlow Condensed Light';">
                <asp:Label runat="server" Text="Fecha de Nacimiento:" CssClass="control-label col-sm-4" for="FechaNac"></asp:Label>
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">

                        <span class="input-group-addon"><i>
                            <asp:ImageButton ID="btnCa" runat="server" Height="20px" Width="20px" ImageUrl="~/Images/Calendar.jpg"></asp:ImageButton></i></span>

                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control border border-secondary"></asp:TextBox>

                    </div>

                    <asp:RequiredFieldValidator ID="rfvFechaNaci" runat="server" ControlToValidate="TextBox1" ErrorMessage="Fecha de Nacimiento Obligatoria*"></asp:RequiredFieldValidator> 
                    
                    <asp:Label class="control-label col-sm-5" ID="lblValFecha" runat="server" ForeColor="Red" Text="valNacimiento" Visible="False"></asp:Label>
                    
                    <ajaxToolkit:CalendarExtender ID="CalendarExtender" runat="server" Format="dd/MM/yyyy" PopupPosition="BottomRight" BehaviorID="Calendar1" PopupButtonID="btnCa" TargetControlID="TextBox1"></ajaxToolkit:CalendarExtender>
                
                </div>

                <asp:RegularExpressionValidator class="col-sm-6" ID="rexFecha" runat="server" ErrorMessage="Formato de fecha incorrecta." ControlToValidate="TextBox1" ValidationExpression="^(?:3[01]|[12][0-9]|0?[1-9])([\-/.])(0?[1-9]|1[1-2])\1\d{4}$" ForeColor="Black"></asp:RegularExpressionValidator>
            </div>--%>


            <%-- <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <div class="form-row" style="font-family: 'Barlow Condensed Light';">
                <asp:Label class="col-sm-2 col-form-label" ID="lblFecha" runat="server" Text="Fecha de nacimiento:" Font-Size="large"></asp:Label>
                <div class="col-sm-4">
                    <asp:TextBox class="form-control" ID="TextBox1" runat="server" CssClass="form-control col-sm-auto" ></asp:TextBox>
                    <asp:Label class="control-label col-sm-5" ID="lblValFecha" runat="server" ForeColor="Red" Text="valNacimiento" Visible="False"></asp:Label>
                    <br />
                    <%--<asp:RegularExpressionValidator class="col-sm-6" ID="rexFecha" runat="server" ErrorMessage="Formato de fecha incorrecta." ControlToValidate="TextBox1" ValidationExpression="^([0-2][0-9]|3[0-1])(\/|-)(0[1-9]|1[0-2])\2(\d{4})(\s)([0-1][0-9]|2[0-3])(:)([0-5][0-9])(:)([0-5][0-9])\s?(?:[aApP](\.?)[mM]\1)?$" ForeColor="Black"></asp:RegularExpressionValidator>--%>

            <%--</div>
                <div class="col-sm-5">
                    <asp:ImageButton class="form-control col-sm-auto" ID="btnCa" runat="server" ImageUrl="~/Images/Calendar.jpg" Height="50px" Width="50px" />
                    <ajaxToolkit:CalendarExtender ID="CalendarExtender" runat="server" Format="dd-MM-yyyy" PopupPosition="BottomRight" BehaviorID="CalendarExtender" PopupButtonID="btnCa" TargetControlID="TextBox1" />

                </div>
            </div>--%>
            <br />
            <div class="form-group" style="font-family: 'Oswald';">
                <asp:Label class="control-label col-sm-4" ID="Label1" runat="server" Text="E-mail:" Font-Size="Large"></asp:Label>
                <div class="col-md-4">
                    <asp:TextBox class="form-control" ID="txtEmail" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCorreo" runat="server" ControlToValidate="txtEmail" ErrorMessage="No ha escrito un correo electronico.*" EnableClientScript="False" Font-Bold="True" Font-Italic="True" Font-Size="Small"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="revCorreo" runat="server" ControlToValidate="txtEmail" ErrorMessage="Escriba un correo electrónico valido.*" ForeColor="Black" ValidationExpression="^[^@]+@[^@]+\.[a-zA-Z]{2,}$" Font-Bold="True" Font-Italic="True" Font-Size="Small"></asp:RegularExpressionValidator>
                </div>
            </div>
            <br />

            <div class="form-group" style="font-family: 'Oswald';">
                <asp:Label class="control-label col-sm-4" ID="Label2" runat="server" Text="Código postal:" Font-Size="medium"></asp:Label>
                <div class="col-md-4">
                    <asp:TextBox class="form-control" ID="txtCP" runat="server" OnTextChanged="TextBox1_TextChanged1" MaxLength="5" onkeypress="return Nums(event);"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCodigoP" runat="server" ControlToValidate="txtCP" ErrorMessage="No ha escrito su código postal.*" EnableClientScript="False" Font-Bold="True" Font-Italic="True" Font-Size="Small"></asp:RequiredFieldValidator>
                    <br />
                    <asp:CustomValidator ID="cvCP" runat="server" ErrorMessage="Escriba 5 números.*" ClientValidationFunction="sizeC" ValidationGroup="facts" ControlToValidate="txtCP" ForeColor="#6666FF" Font-Bold="True" Font-Italic="True" Font-Size="Small"></asp:CustomValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="rexCp" runat="server" ControlToValidate="txtCP" ErrorMessage="Escriba un codigo postal valido.*" ForeColor="Black" ValidationExpression="^\d{4,5}$" Font-Bold="True" Font-Italic="True" Font-Size="Small"></asp:RegularExpressionValidator>
                </div>
            </div>
            <br />

            <div class="form-group" style="font-family: 'Oswald';">
                <asp:Label class="control-label col-sm-4" ID="Label4" runat="server" Text="RFC:" Font-Size="medium"></asp:Label>
                <div class="col-md-4">
                    <asp:TextBox class="form-control" ID="txtRfc" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvRFC" runat="server" ControlToValidate="txtRfc" ErrorMessage="No ha escrito su RFC.*" EnableClientScript="False" Font-Bold="True" Font-Italic="True" Font-Size="Small"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="revRFC" runat="server" ControlToValidate="txtRfc" ErrorMessage="El RFC no está escrito correctamente.*" ForeColor="Black" ValidationExpression="^([A-ZÑ\x26]{3,4}([0-9]{2})(0[1-9]|1[0-2])(0[1-9]|1[0-9]|2[0-9]|3[0-1]))((-)?([A-Z\d]{3}))?$" Font-Bold="True" Font-Italic="True" Font-Size="Small"></asp:RegularExpressionValidator>
                </div>

            </div>

            <div>
            </div>
            <br />

            <div class="form-group" style="font-family: 'Oswald';">
                <asp:Label class="control-label col-sm-4" ID="Label7" runat="server" Text="Estado civil:" Font-Size="medium"></asp:Label>

                <div class="col-md-4">
                    <asp:DropDownList class="form-control border-secondary" data-bs-toggle="dropdown" aria-expanded="false" ID="ddlEstadoCivil" runat="server"></asp:DropDownList>
                    <br />
                    <asp:RequiredFieldValidator ID="rvCatEstadoCivil" runat="server" ControlToValidate="ddlEstadoCivil" ErrorMessage="Seleccione un estado civil.*" InitialValue="-1" EnableClientScript="False" Font-Bold="True" Font-Italic="True" Font-Size="Small"></asp:RequiredFieldValidator>
                </div>
            </div>
            <br />
            <div class="form-group" style="font-family: 'Oswald';">
                <asp:Label class="control-label col-sm-2" ID="lblMensaje" runat="server" ForeColor="Red" Text="Validaciones" Visible="False" Font-Bold="True" Font-Size="12pt"></asp:Label>
            </div>
            <br />


            <div class="form-group" style="font-family: 'Oswald'; font-weight: bold" align="center">
                <div class="col-sm-10">
                    <asp:Button class="btn btn-success" ID="btnAceptar" runat="server" Text="Aceptar" OnClick="btnAceptar_Click" ViewStateMode="Disabled" Width="130px" />
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
