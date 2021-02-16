<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Prueba.aspx.cs" Inherits="UTTT.Ejemplo.Persona.Prueba" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <meta name="viewport" content="width=device-width, initial-scale=1.0"/> 
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">

    <title>Prueba</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" />

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
    <form id="form1" runat="server">
        <div style="font-family: 'Barlow Condensed Light'; font-weight: bold" align="center">

            <asp:Label ID="lblPersona" runat="server" Text="Persona" Font-Size="XX-Large"></asp:Label>
            <br/>
            <asp:Label ID="lblAccion" runat="server" Text="Acción" Font-Size="X-Large"></asp:Label>

        </div>
        <br />
        <br />
        <div class="form-row" style="font-family: 'Barlow Condensed Light';">
            <asp:Label class="col-form-label" ID="lblSexo" runat="server" Text="Sexo" Font-Size="large"></asp:Label>
            &nbsp;
              <div class="form-group col">
                  <asp:DropDownList class="btn btn-dark" CssClass="btn btn-dark dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false" ID="ddlSexo" runat="server"
                      Height="36px" Width="120px">
                  </asp:DropDownList>
                  &nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlSexo" ErrorMessage="Seleccione masculino o femenino" InitialValue="-1"></asp:RequiredFieldValidator>
              </div>
            <asp:Label class="col-form-label" ID="lblClave" runat="server" Text="Clave unica:" Font-Size="large"></asp:Label>
            <div class="form-group col">
                <asp:TextBox class="form-control" ID="txtClaveUnica" minlength="3" MaxLength="3" onkeypress="return Nums(event);" runat="server"
                    Width="150px" ViewStateMode="Disabled"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtClaveUnica" ErrorMessage="No ha escrito una clave unica"></asp:RequiredFieldValidator>
                &nbsp;
                <asp:CustomValidator ID="cvClave" runat="server" BorderStyle="None" ErrorMessage="Escriba 3 numeros" ClientValidationFunction="size" ValidationGroup="facts" ControlToValidate="txtClaveUnica" ForeColor="#6666FF"></asp:CustomValidator>
                &nbsp;
           <asp:RangeValidator ID="rvClave" runat="server" ControlToValidate="txtClaveUnica" ErrorMessage="Escriba una clave unica valida" ForeColor="Black" MaximumValue="999" MinimumValue="100" Type="Integer"></asp:RangeValidator>
            </div>
        </div> 
        
        <div class="form-row" style="font-family: 'Barlow Condensed Light';">
            <asp:Label class="col-form-label" ID="Label3" runat="server" Text="Nombre:"></asp:Label>
            <div class="form-group col">
                <asp:TextBox class="form-control" ID="txtNombre" runat="server" ViewStateMode="Disabled" MaxLength="20"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNombre" ErrorMessage="No ha escrito su nombre"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="cvNombre" runat="server" ErrorMessage="Escriba minimo 3 letras" ControlToValidate="txtNombre" ForeColor="#6666FF" ClientValidationFunction="sizeLetMin" OnServerValidate="cvNombre_ServerValidate"></asp:CustomValidator>
                <asp:RegularExpressionValidator ID="re2Nombre" runat="server" ErrorMessage="Numeros no permitidos, eliminelos antes de continuar." ControlToValidate="txtNombre" ValidationExpression="^[a-zA-ZáéíóúÁÉÍÓÚÑñ\s]*$" ForeColor="Black"></asp:RegularExpressionValidator>
            </div>
            <asp:Label class="col-form-label" ID="Label5" runat="server" Text="Apellido Paterno:"></asp:Label>
            <div class="form-group col">
                <asp:TextBox class="form-control" ID="txtAPaterno" runat="server" ViewStateMode="Disabled" MaxLength="20"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rvAp" runat="server" ErrorMessage="No ha escrito su apellido paterno" ControlToValidate="txtAPaterno"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="cvAPaterno" runat="server" ClientValidationFunction="sizeLetMin" ControlToValidate="txtAPaterno" ErrorMessage="Escriba minimo 3 letras" ForeColor="#6666FF"></asp:CustomValidator>
                <asp:RegularExpressionValidator ID="re2AP" runat="server" ErrorMessage="Numeros no permitidos, eliminelos antes de continuar." ControlToValidate="txtAPaterno" ValidationExpression="^[a-zA-ZáéíóúÁÉÍÓÚÑñ\s]*$" ForeColor="Black"></asp:RegularExpressionValidator>
            </div>
            <asp:Label class="col-form-label" ID="Label6" runat="server" Text="Apellido Materno:"></asp:Label>
            <div class="form-group col">
                <asp:TextBox class="form-control" ID="txtAMaterno" runat="server" ViewStateMode="Disabled" MaxLength="20"></asp:TextBox>
                <asp:CustomValidator ID="cvAMaterno" runat="server" ClientValidationFunction="sizeLetMin" ControlToValidate="txtAMaterno" ErrorMessage="Escriba minimo 3 letras" ForeColor="#6666FF"></asp:CustomValidator>
                <asp:RegularExpressionValidator ID="reAP" runat="server" ErrorMessage="Numeros no permitidos, eliminelos antes de continuar." ControlToValidate="txtAMaterno" ValidationExpression="^[a-zA-ZáéíóúÁÉÍÓÚÑñ\s]*$" ForeColor="Black"></asp:RegularExpressionValidator>

            </div>
        </div>

        <div class="form-row" style="font-family: 'Barlow Condensed Light';">
            <asp:Label class="col-form-label" ID="Label7" runat="server" Text="Fecha de nacimiento:"></asp:Label>
            <asp:Label class="col-form-label" ID="lblValFecha" runat="server" ForeColor="Red" Text="valNacimiento" Visible="False"></asp:Label>
            <div>
                <br />
                <div class="form-group col">
                <asp:Calendar ID="dateCalendar" runat="server" Style="margin-left: 0px; margin-top: 8px;" Width="400px" BackColor="White" BorderColor="Black" ForeColor="Black" Height="220px" DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt" NextPrevFormat="FullMonth" OnSelectionChanged="dateCalendar_SelectionChanged">
                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" ForeColor="#333333" Height="10pt" />
                    <DayStyle Width="14%" />
                    <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" Width="1%" />
                    <TitleStyle BackColor="#E1A8C5" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="14pt" />
                    <TodayDayStyle BackColor="#CCCC99" />
                </asp:Calendar>
                    </div>
            </div>
        </div>

        <div class="form-row" style="font-family: 'Barlow Condensed Light';">
            <asp:Label class="col-form-label" ID="Label1" runat="server" Text="Correo electronico:"></asp:Label>
            <div class="form-group col-md-2">
                <asp:TextBox class="form-control" ID="txtEmail" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvCorreo" runat="server" ControlToValidate="txtEmail" ErrorMessage="No ha escrito un correo electronico"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revCorreo" runat="server" ControlToValidate="txtEmail" ErrorMessage="Escriba un correo electronico valido" ForeColor="Black" ValidationExpression="^[^@]+@[^@]+\.[a-zA-Z]{2,}$"></asp:RegularExpressionValidator>
            </div>

            <asp:Label class="col-form-label" ID="Label2" runat="server" Text="Codigo postal"></asp:Label>
            <div class="form-group col-md-2">
                <asp:TextBox class="form-control" ID="txtCP" runat="server" OnTextChanged="TextBox1_TextChanged1" MaxLength="5" onkeypress="return Nums(event);"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvCodigoP" runat="server" ControlToValidate="txtCP" ErrorMessage="No ha escrito su codigo postal"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="cvCP" runat="server" ErrorMessage="Escriba solo 5 numeros" ClientValidationFunction="sizeC" ValidationGroup="facts" ControlToValidate="txtCP" ForeColor="#6666FF"></asp:CustomValidator>
                <asp:RegularExpressionValidator ID="rexCp" runat="server" ControlToValidate="txtCP" ErrorMessage="Escriba un codigo postal valido" ForeColor="Black" ValidationExpression="^\d{4,5}$"></asp:RegularExpressionValidator>
            </div>

            <asp:Label class="col-form-label" ID="Label4" runat="server" Text="RFC"></asp:Label>
            <div class="form-group col-md-2">
                <asp:TextBox class="form-control" ID="txtRfc" runat="server" Style="margin-left: 89px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvRFC" runat="server" ControlToValidate="txtRfc" ErrorMessage="No ha escrito su RFC"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revRFC" runat="server" ControlToValidate="txtRfc" ErrorMessage="El RFC no esta escrito correctamente" ForeColor="Black" ValidationExpression="^([A-ZÑ\x26]{3,4}([0-9]{2})(0[1-9]|1[0-2])(0[1-9]|1[0-9]|2[0-9]|3[0-1]))((-)?([A-Z\d]{3}))?$"></asp:RegularExpressionValidator>
            </div>

        </div>

        <div class="form-row" style="font-family: 'Barlow Condensed Light';">
            <asp:Label class="col-form-label" ID="lblMensaje" runat="server" ForeColor="Red" Text="Validaciones" Visible="False" Font-Bold="True" Font-Size="16pt"></asp:Label>
            </div>
        </form>
        </div>
        
    

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js" integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js" integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG" crossorigin="anonymous"></script>

</body>
</html>
