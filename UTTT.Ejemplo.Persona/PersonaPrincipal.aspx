<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonaPrincipal.aspx.cs" Inherits="UTTT.Ejemplo.Persona.PersonaPrincipal"  debug=false%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

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
    <div class="container">
        <form id="form1" runat="server">

            <div style="color: #000000; font-size: xx-large; font-family: 'Barlow Condensed Light'; font-weight: bold" align="center">
                <center>
                    <asp:Label ID="Label1" runat="server" Text="Persona"></asp:Label></center>
            </div>
            <div>
            </div>

            <div style="font-family: 'Barlow Condensed Light';">
                &nbsp;<div>

                    <center>
                        <asp:Label ID="lblNombre" runat="server" Text="Nombre"></asp:Label>
                        &nbsp;
            <asp:TextBox ID="txtNombre" runat="server" Width="174px"
                ViewStateMode="Disabled"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;
                    </center>
                    <br />

                </div>
                <center>
                    <asp:Label ID="lblSexo" runat="server" Text="Sexo"></asp:Label>
                    &nbsp;&nbsp;&nbsp;<asp:DropDownList class="btn btn-dark" CssClass="btn btn-dark dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false" ID="ddlSexo" runat="server" Height="36px" Width="177px">
                    </asp:DropDownList>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </center>
                <br />
            </div>
            <div>
            </div>

            <center>
                <div class="d-grid gap-2" style="font-family: 'Barlow Condensed Light'; width: 162px; margin-left: 0px;">

                    <asp:Button CssClass="btn btn-outline-dark" ID="btnBuscar" runat="server" Text="Buscar"
                        OnClick="btnBuscar_Click" ViewStateMode="Disabled" Width="159px" />

                    <asp:Button CssClass="btn btn-outline-info" ID="btnAgregar" runat="server" Text="Agregar"
                        OnClick="btnAgregar_Click" ViewStateMode="Disabled" Width="160px" />
                </div>
            </center>

            <br />
            <div class="form-control" style="font-family: 'Barlow Condensed Light'; font-weight: bold" align="center">
                <span id="lblDetalle" class="control-label col-sm-2" for="detalle" style="font-size: X-Large; font-weight: bold;">Detalle</span>
            </div>

            <div></div>

            <center>
                <div class="table-responsive">


                    <center>
                        <div style="font-family: 'Barlow Condensed Light';" align="center">
                            <center>
                                <div class="container float-sm-start" align="center">

                                    <center>
                                        <asp:GridView ID="dgvPersonas" runat="server" class="table"
                                            AllowPaging="True" AutoGenerateColumns="False" DataSourceID="DataSourcePersona"
                                            Width="1067px" CellPadding="3" GridLines="Horizontal"
                                            OnRowCommand="dgvPersonas_RowCommand" BackColor="White"
                                            BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px"
                                            ViewStateMode="Disabled">

                                            <AlternatingRowStyle BackColor="#E1E1E1" />

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
                                                <asp:BoundField DataField="strCorreoElectronico" HeaderText="E-mail" ReadOnly="True"
                                                    SortExpression="strCorreoElectronico" />
                                                <asp:BoundField DataField="strCodigoPostal" HeaderText="CP" ReadOnly="True"
                                                    SortExpression="strCodigoPostal" />
                                                <asp:BoundField DataField="strRfc" HeaderText="RFC" ReadOnly="True"
                                                    SortExpression="strRfc" />
                                                <asp:BoundField DataField="datFechaNacimiento" HeaderText="Fecha de Nacimiento" ReadOnly="True"
                                                    SortExpression="datFechaNacimiento" />
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
                                            <FooterStyle BackColor="White" ForeColor="#4A3C8C" />
                                            <HeaderStyle BackColor="#E1A8C5" Font-Bold="True" ForeColor="#F7F7F7" />
                                            <PagerStyle BackColor="#E1E1E1" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                                            <RowStyle BackColor="White" ForeColor="#4A3C8C" />
                                            <SelectedRowStyle BackColor="#DDDDDD" Font-Bold="True" ForeColor="#F7F7F7" />
                                            <SortedAscendingCellStyle BackColor="Black" />
                                            <SortedAscendingHeaderStyle BackColor="Black" />
                                            <SortedDescendingCellStyle BackColor="White" />
                                            <SortedDescendingHeaderStyle BackColor="White" />
                                        </asp:GridView>
                                    </center>

                                </div>
                            </center>
                        </div>
                    </center>
                </div>
            </center>

            <asp:LinqDataSource ID="DataSourcePersona" runat="server"
                ContextTypeName="UTTT.Ejemplo.Linq.Data.Entity.DcGeneralDataContext"
                OnSelecting="DataSourcePersona_Selecting"
                Select="new (strNombre, strAPaterno, strAMaterno, CatSexo, strClaveUnica, strCorreoElectronico, strCodigoPostal, strRfc, datFechaNacimiento,id)"
                TableName="Persona" EntityTypeName="">
            </asp:LinqDataSource>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js" integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js" integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG" crossorigin="anonymous"></script>

</body>
</html>
