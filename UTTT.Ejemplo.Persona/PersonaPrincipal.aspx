<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonaPrincipal.aspx.cs" Inherits="UTTT.Ejemplo.Persona.PersonaPrincipal"  debug=false%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">

    <title>Persona principal</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <div class="container">
        <form id="form1" runat="server" class="form-horizontal">

            <div style="color: #000000; font-size: xx-large; font-family: 'Barlow Condensed Light'; font-weight: bold" align="center">
                <center>
                    <asp:Label ID="Label1" runat="server" Text="Persona"></asp:Label></center>
            </div>
           
                <br />
             <div class="row" style="font-family: 'Barlow Condensed Light';">
                <div align="left">
                    &nbsp;&nbsp;&nbsp;
                </div>

                <%--<div class="align-content-end d-grid gap-2 d-md-flex justify-content-md-end" style="font-family: 'Barlow Condensed Light';" align="right">--%>
                <div align="right">
            <asp:Button ID="btnInicio" runat="server" Text="Inicio" class="btn btn-outline-secondary" OnClick="btnInicio_Click"  Width="100px" />
            &nbsp;&nbsp;
            <asp:Button ID="btnCerrarSesion" runat="server" Text="Cerrar sesion" class="btn btn-outline-danger" OnClick="btnCerrarSesion_Click" Width="100px" align="right"/>
                </div>
            </div>

            <div class="form-row" style="font-family: 'Barlow Condensed Light'";>
                <asp:ScriptManager runat="server" />   
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <input type="submit" name="btnTrick" value="" id="btnTrick" style="display: none;" />
</ContentTemplate>
                </asp:UpdatePanel>
                <asp:Label class="control-label col-sm-2" ID="lblNombre" runat="server" Text="Nombre:" Font-Size="large"></asp:Label>
                 <div class="col-sm-2">
                    <asp:TextBox class="form-control" ID="txtNombre" runat="server" ViewStateMode="Disabled" AutoPostBack="True" OnTextChanged="txtNombre_TextChanged" Width="211px"></asp:TextBox>
                </div>
            </div>

    <%--<asp:ScriptManager runat="server" />         
      <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
             <div class="form-row" style="font-family: 'Barlow Condensed Light'";>
                <asp:Label class="control-label col-sm-2" ID="lblNombre" runat="server" Text="Nombre:" Font-Size="large"></asp:Label>
                <div class="col-sm-2">
                    <asp:TextBox class="form-control" ID="txtNombre" runat="server" ViewStateMode="Disabled" AutoPostBack="True" OnTextChanged="txtNombre_TextChanged"></asp:TextBox>
                </div>
            </div>
       </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="txtNombre" EventName="TextChanged" />
    </Triggers>
   </asp:UpdatePanel>--%>


            <br />
            <div class="form-row" style="font-family: 'Barlow Condensed Light';">
                <asp:Label class="control-label col-sm-2" ID="lblSexo" runat="server" Text="Sexo:" Font-Size="large"></asp:Label>
                <div class="col-sm-3">
                    <asp:DropDownList class="form-control" CssClass="btn btn-outline-secondary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false" ID="ddlSexo" runat="server" Height="36px" Width="209px">
                    </asp:DropDownList>
                </div>
            </div>
            <br />

            <div class="form-row" style="font-family: 'Barlow Condensed Light';">
                <asp:Label class="control-label col-sm-2" ID="Label2" runat="server" Text="Estado civil:" Font-Size="large"></asp:Label>
                <div class="col-sm-3">
                    <asp:DropDownList class="form-control" CssClass="btn btn-outline-secondary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false" ID="ddlEstadoCivil" runat="server" Height="36px" Width="209px">
                    </asp:DropDownList>
                </div>
            </div>
            <div>
                <br />
            </div>
           <br />

         <%--  <div class="form-row" style="font-family: 'Barlow Condensed Light'; font-weight: bold">
                <div class="form-group col-sm-8">
                    <div class="d-grid gap-2 col-3 mx-auto">

                        <asp:Button CssClass="btn btn-outline-secondary" ID="btnBuscar" runat="server" Text="Buscar" align="center"
                            OnClick="btnBuscar_Click" ViewStateMode="Disabled" />
                    </div>
                </div>
            </div>

            <div class="form-row" style="font-family: 'Barlow Condensed Light'; font-weight: bold">
                <div class="form-group col-sm-8">
                    <div class="d-grid gap-2 col-3 mx-auto">
                        <asp:Button CssClass="btn btn-outline-secondary" ID="btnAgregar" runat="server" Text="Agregar" align="center"
                            OnClick="btnAgregar_Click" ViewStateMode="Disabled" />

                    </div>
                </div>
            </div>--%>

            <div style="font-family: 'Barlow Condensed Light'; font-weight: bold" align="left">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button CssClass="btn btn-outline-secondary" ID="btnBuscar" runat="server" Text="Buscar" align="center"
                            OnClick="btnBuscar_Click" ViewStateMode="Disabled" Width="85px" />
                 &nbsp;&nbsp;
                 <asp:Button CssClass="btn btn-outline-secondary" ID="btnAgregar" runat="server" Text="Agregar" align="center"
                            OnClick="btnAgregar_Click" ViewStateMode="Disabled" Width="85px" />
                </div>
           <br />

            <div class="form-control" style="font-family: 'Barlow Condensed Light'; font-weight: bold" align="center">
                <span id="lblDetalle" class="control-label col-sm-3" for="detalle" style="font-size: X-Large; font-weight: bold;">Detalle</span>
            </div>

            <div></div>

            <center>
                
                <div class="table-responsive">

                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
                        <ContentTemplate>

                    <div style="font-family: 'Barlow Condensed Light';" align="center">

                        <div class="container float-sm-start" align="center">


                            <asp:GridView ID="dgvPersonas" runat="server" class="table table-hover" aling="center"
                                AllowPaging="True" AutoGenerateColumns="False" DataSourceID="DataSourcePersona"
                                Width="1067px" CellPadding="3" GridLines="Horizontal"
                                OnRowCommand="dgvPersonas_RowCommand" BackColor="White"
                                BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px"
                                ViewStateMode="Disabled">


                                <Columns>
                                    <asp:BoundField DataField="strClaveUnica" HeaderText="Clave Unica"
                                        ReadOnly="True" SortExpression="strClaveUnica" />
                                    <asp:BoundField DataField="CatSexo" HeaderText="Sexo"
                                        SortExpression="CatSexo" />
                                    <asp:BoundField DataField="strNombre" HeaderText="Nombre" ReadOnly="True"
                                        SortExpression="strNombre" />
                                    <asp:BoundField DataField="strAPaterno" HeaderText="APaterno" ReadOnly="True"
                                        SortExpression="strAPaterno" />
                                    <asp:BoundField DataField="strAMaterno" HeaderText="AMaterno" ReadOnly="True"
                                        SortExpression="strAMaterno" />
                                    <asp:BoundField DataField="CatEstadoCivil" HeaderText="Estado Civil" ReadOnly="True"
                                        SortExpression="CatEstadoCivil" />

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

                                    <asp:TemplateField HeaderText="Direccion">
                                        <ItemTemplate>
                                            <asp:ImageButton runat="server" ID="imgDireccion" CommandName="Direccion" CommandArgument='<%#Bind("id") %>' ImageUrl="~/Images/editrecord_16x16.png" />
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" Width="50px" />

                                    </asp:TemplateField>
                                </Columns>
                                <%--<FooterStyle BackColor="White" ForeColor="#4A3C8C" />--%>
                                <HeaderStyle BackColor="#00CC66" Font-Bold="True" />
                                <%--<PagerStyle BackColor="#E1E1E1" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                                <RowStyle BackColor="White" ForeColor="#4A3C8C" />
                                <SelectedRowStyle BackColor="#DDDDDD" Font-Bold="True" ForeColor="#F7F7F7" />
                                <SortedAscendingCellStyle BackColor="Black" />
                                <SortedAscendingHeaderStyle BackColor="Black" />
                                <SortedDescendingCellStyle BackColor="White" />
                                <SortedDescendingHeaderStyle BackColor="White" />--%>
                            </asp:GridView>
                            
                        </div>

                    </div>
                      </ContentTemplate>  
            </asp:UpdatePanel>
            
                </div>
                   </center>
               
            

            <asp:LinqDataSource ID="DataSourcePersona" runat="server"
                ContextTypeName="UTTT.Ejemplo.Linq.Data.Entity.DcGeneralDataContext"
                OnSelecting="DataSourcePersona_Selecting"
                Select="new (strNombre, strAPaterno, strAMaterno, CatSexo, strClaveUnica, CatEstadoCivil, id)"
                TableName="Persona" EntityTypeName="">
            </asp:LinqDataSource>
        </form>
    </div>

    <script type="text/javascript">
        var nombre = document.getElementById("txtNombre").value;
        document.querySelector('#txtNombre').addEventListener('keyup', function () {
            const btnTrick = document.querySelector('#btnTrick');
            btnTrick.click();
        });

    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js" integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js" integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG" crossorigin="anonymous"></script>

</body>
</html>
