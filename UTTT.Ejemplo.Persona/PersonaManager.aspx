<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonaManager.aspx.cs" Inherits="UTTT.Ejemplo.Persona.PersonaManager" debug="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

<script src="javaScripFile.js" type="text/javascript"></script>    

    <title></title>

   <script type="text/javascript">

       function size(sender, args) {
           args.IsValid=(args.Value.length >=3);
       }

       function sizeLet(sender, args) {
           args.IsValid = (args.Value.length >= 3 && args.Value.length <= 50);
       }

       function sizeC(sender, args) {
           args.IsValid = (args.Value.length >=5);
       }

   </script>

</head>
<body style="height: 910px">
    <form id="form1" runat="server" onsubmit="validarForm() ">
    <div style="font-family: 'Barlow Condensed ExtraLight'; font-size: xx-large; font-weight: bold; width: 1145px; margin-left: 89px;" align="center">
    
        Persona</div>

        <div>
        
        </div>
          <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <asp:Label ID="lblAccion" runat="server" Text="Accion" Font-Bold="True"></asp:Label>
        
        </div>
        <div>

        </div>
        <div>

        </div>
            <div>

        <div style="width: 1014px"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Sexo:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:DropDownList ID="ddlSexo" runat="server" 
                Height="25px" Width="253px" 
                onselectedindexchanged="ddlSexo_SelectedIndexChanged">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlSexo" EnableClientScript="False" ErrorMessage="Seleccione masculino o femenino" InitialValue="-1"></asp:RequiredFieldValidator>
    </div>

        </div>
        <div style="width: 1336px"> 
        
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        
            Clave Unica:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; 
            <asp:TextBox ID="txtClaveUnica" minlength="3" MaxLength="3" runat="server" 
                Width="249px" ViewStateMode="Disabled"></asp:TextBox>
            
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtClaveUnica" ErrorMessage="No ha escrito una clave unica"></asp:RequiredFieldValidator>
&nbsp;&nbsp;&nbsp;<asp:CustomValidator ID="cvClave" runat="server" BorderStyle="None" ErrorMessage="Escriba solo 3 numeros" ClientValidationFunction="size" ValidationGroup="facts" ControlToValidate="txtClaveUnica" ForeColor="#6666FF"></asp:CustomValidator>
        
        </div>
        <div style="width: 1335px">
        
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
            Nombre:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<asp:TextBox 
                ID="txtNombre" runat="server" Width="249px" ViewStateMode="Disabled" MaxLength="50"></asp:TextBox>
        
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNombre" ErrorMessage="No ha escrito su nombre"></asp:RequiredFieldValidator>
&nbsp; <asp:CustomValidator ID="cvNombre" runat="server" ErrorMessage="Escriba minimo 3 letras" ControlToValidate="txtNombre" ForeColor="#6666FF" ValidationGroup="facts" ClientValidationFunction="sizeLet" OnServerValidate="cvNombre_ServerValidate"></asp:CustomValidator>
                    
        &nbsp;
                    
            </div>
        <div style="width: 1336px"> 
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            A Paterno:&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox 
                ID="txtAPaterno" runat="server" Width="249px" ViewStateMode="Disabled" MaxLength="50"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvApellidoP" runat="server" ControlToValidate="txtAPaterno" ErrorMessage="No ha escrito su apellido paterno"></asp:RequiredFieldValidator>
&nbsp;
            <asp:CustomValidator ID="cvAPaterno" runat="server" ClientValidationFunction="sizeLet" ControlToValidate="txtAPaterno" ErrorMessage="Escriba minimo 3 letras" ForeColor="#6666FF" ValidationGroup="facts"></asp:CustomValidator>
            </div>
        <div style="width: 1338px">
        
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
            A Materno:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            <asp:TextBox ID="txtAMaterno" runat="server" Width="248px" 
                ViewStateMode="Disabled" MaxLength="50"></asp:TextBox>
        
            <asp:CustomValidator ID="cvAMaterno" runat="server" ClientValidationFunction="sizeLet" ControlToValidate="txtAMaterno" ErrorMessage="Escriba minimo 3 letras" ForeColor="#6666FF" ValidationGroup="facts"></asp:CustomValidator>
        
        </div>
    <div>
     
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div align="center" style="height: 18px; width: 667px"> 
    
            Fecha de nacimiento</div>
        <asp:Calendar ID="dateCalendar" runat="server" style="margin-left: 405px" Width="270px"></asp:Calendar>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;
            
    </div>
        <p style="height: 24px; width: 550px; margin-left: 0px">
     
            &nbsp;</p>
        <p align="left" style="width: 1051px; height: 21px; margin-left: 280px">
            Correo electronico<asp:TextBox ID="txtEmail" runat="server" OnTextChanged="TextBox1_TextChanged" Width="277px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvCorreo" runat="server" ControlToValidate="txtEmail" ErrorMessage="No ha escrito un correo electronico"></asp:RequiredFieldValidator>
&nbsp;
            <asp:RegularExpressionValidator ID="revCorreo" runat="server" ControlToValidate="txtEmail" ErrorMessage="Escriba un correo electronico valido" ForeColor="Black" ValidationExpression="^[^@]+@[^@]+\.[a-zA-Z]{2,}$"></asp:RegularExpressionValidator>
        </p>
        <p style="width: 1048px; margin-left: 280px">
            Codigo Postal<asp:TextBox ID="txtCP" runat="server" OnTextChanged="TextBox1_TextChanged1" style="margin-left: 30px" Width="275px" MaxLength="5"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvCodigoP" runat="server" ControlToValidate="txtCP" ErrorMessage="No ha escrito su codigo postal"></asp:RequiredFieldValidator>
&nbsp;      <asp:CustomValidator ID="cvCP" runat="server" ErrorMessage="Escriba solo 5 numeros" ClientValidationFunction ="sizeC" ValidationGroup="facts" ControlToValidate="txtCP" ForeColor="#6666FF"></asp:CustomValidator>
            </p>
        <p style="width: 1047px; margin-left: 280px">
            RFC<asp:TextBox ID="txtRfc" runat="server" style="margin-left: 89px" Width="268px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvRFC" runat="server" ControlToValidate="txtRfc" ErrorMessage="No ha escrito su RFC"></asp:RequiredFieldValidator>
&nbsp;
            <asp:RegularExpressionValidator ID="revRFC" runat="server" ControlToValidate="txtRfc" ErrorMessage="El RFC no esta escrito correctamente" ForeColor="Black" ValidationExpression="[A-Z]{4}[0-9]{6}[A-Z0-9]{3}"></asp:RegularExpressionValidator>
        </p>
        <p style="width: 97px; margin-left: 280px">
            &nbsp;</p>
     
        <asp:Button ID="btnAceptar" runat="server" Text="Aceptar"
            onclick="btnAceptar_Click" ViewStateMode="Disabled" style="margin-left: 433px; margin-bottom: 0px;" Width="107px" Height="24px" />
        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" 
            onclick="btnCancelar_Click" ViewStateMode="Disabled" Height="27px" style="margin-left: 24px; margin-bottom: 0px; margin-top: 0px;" Width="96px" />
    
        <p style="width: 588px; margin-left: 280px">
            <asp:Label ID="lblMensaje" runat="server" ForeColor="#25C559" Text="..."></asp:Label>
        </p>
    
    </form>

 


        <p style="width: 97px; margin-left: 280px">
            &nbsp;</p>
     
         


</body>
</html>
