<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="RevisarOfertas.aspx.cs" Inherits="Administrador_Revisar_Ofertas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="contentnav" ContentPlaceHolderID="nav" runat="server">
     <asp:Label ID="lblDatosUsuario" runat="server" ForeColor="#bd2130"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
       
        <div class="card">
            <div class="card-header">
                <h2 class="h2">Revisión de ofertas de empleo</h2>
                <b><span style="color: red">*</span>Una vez revisada confirmar marcando la revisión</b>
            </div>
            <div class="card-body">
                 <p style="color: red" class="d-block d-xl-none">*La visluazación correcta sera mostrada en panatallas grandes.</p>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [OfertaEmpleo] WHERE [idOferta] = @idOferta" InsertCommand="INSERT INTO [OfertaEmpleo] ([tipoOferta], [descripcion], [ciudad], [perNecesarias], [precioOferta], [Revisada]) VALUES (@tipoOferta, @descripcion, @ciudad, @perNecesarias, @precioOferta, @Revisada)" SelectCommand="SELECT OfertaEmpleo.idOferta, OfertaEmpleo.tipoOferta, OfertaEmpleo.descripcion, OfertaEmpleo.ciudad, OfertaEmpleo.perNecesarias, OfertaEmpleo.precioOferta, OfertaEmpleo.Revisada, Empresa.nomEmpresa FROM OfertaEmpleo INNER JOIN Empresa ON OfertaEmpleo.idEmpresa = Empresa.idEmpresa WHERE (OfertaEmpleo.Revisada = @Revisada)" UpdateCommand="UPDATE [OfertaEmpleo] SET [tipoOferta] = @tipoOferta, [descripcion] = @descripcion, [ciudad] = @ciudad, [perNecesarias] = @perNecesarias, [precioOferta] = @precioOferta, [Revisada] = @Revisada WHERE [idOferta] = @idOferta">
                    <DeleteParameters>
                        <asp:Parameter Name="idOferta" Type="Int64" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="tipoOferta" Type="String" />
                        <asp:Parameter Name="descripcion" Type="String" />
                        <asp:Parameter Name="ciudad" Type="String" />
                        <asp:Parameter Name="perNecesarias" Type="Int32" />
                        <asp:Parameter Name="precioOferta" Type="Decimal" />
                        <asp:Parameter Name="Revisada" Type="Boolean" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:Parameter DefaultValue="false" Name="Revisada" Type="Boolean" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="tipoOferta" Type="String" />
                        <asp:Parameter Name="descripcion" Type="String" />
                        <asp:Parameter Name="ciudad" Type="String" />
                        <asp:Parameter Name="perNecesarias" Type="Int32" />
                        <asp:Parameter Name="precioOferta" Type="Decimal" />
                        <asp:Parameter Name="Revisada" Type="Boolean" />
                        <asp:Parameter Name="idOferta" Type="Int64" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:Label runat="server" ID="lblOferas" ForeColor="Red"></asp:Label>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="idOferta" DataSourceID="SqlDataSource1" CssClass="table table-striped table-bordered table-hover" OnRowEditing="GridView1_SelectedIndexChanged" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" HeaderStyle-BackColor="#007BFF" PageSize="3" AllowPaging="True">
                    <Columns>
                        <asp:BoundField DataField="idOferta" HeaderText="idOferta" InsertVisible="False" ReadOnly="True" SortExpression="idOferta">
                            <ControlStyle CssClass="form-control" />
                            <HeaderStyle CssClass="d-none "></HeaderStyle>
                            <ItemStyle CssClass="d-none"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="nomEmpresa" HeaderText="Empresa" SortExpression="nomEmpresa" >
                        <ControlStyle CssClass="form-control" />
                            <HeaderStyle CssClass="d-none d-md-table-cell "></HeaderStyle>
                            <ItemStyle CssClass="d-none d-md-table-cell"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="tipoOferta" HeaderText="Tipo" SortExpression="tipoOferta">
                            <ControlStyle CssClass="form-control" />
                            <HeaderStyle CssClass="d-none d-lg-table-cell"></HeaderStyle>
                            <ItemStyle CssClass="d-none d-lg-table-cell"></ItemStyle>
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Descripción" SortExpression="descripcion">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" TextMode="MultiLine" Rows="5"  runat="server" Text='<%# Bind("descripcion") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("descripcion") %>'></asp:Label>
                            </ItemTemplate>

                            <ControlStyle CssClass="form-control" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="ciudad" HeaderText="Ciudad" SortExpression="ciudad">
                            <ControlStyle CssClass="form-control" />
                            <HeaderStyle CssClass="d-none d-xl-table-cell"></HeaderStyle>
                            <ItemStyle CssClass="d-none d-xl-table-cell"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="perNecesarias" HeaderText="Personas" SortExpression="perNecesarias">
                            <ControlStyle CssClass="form-control" />
                            <HeaderStyle CssClass="d-none d-lg-table-cell"></HeaderStyle>
                            <ItemStyle CssClass="d-none d-lg-table-cell"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="precioOferta" HeaderText="Precio" SortExpression="precioOferta" DataFormatString="{0:c}">
                            <ControlStyle CssClass="form-control" />
                            <HeaderStyle CssClass="d-none d-lg-table-cell"></HeaderStyle>
                            <ItemStyle CssClass="d-none d-lg-table-cell"></ItemStyle>
                        </asp:BoundField>
                        <asp:CheckBoxField DataField="Revisada" HeaderText="Revisada" SortExpression="Revisada">
                            <ControlStyle CssClass="form-control" />
                            <HeaderStyle CssClass="d-none d-md-table-cell"></HeaderStyle>
                            <ItemStyle CssClass="d-none d-md-table-cell"></ItemStyle>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:CheckBoxField>
                        <asp:CommandField ShowEditButton="True">
                            
                            <ControlStyle CssClass="btn btn-outline-primary" />
                        </asp:CommandField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div class="row">
                            <div class="col-md-6">
                                <asp:Label Font-Size="large" Font-Bold="true" runat="server">Todos los anuncios han sido revisados, si hubiera algun anuncio por revisar sera mostrado aqui.</asp:Label>
                            </div>
                            <div class="col-md-6">
                                <image src="/imagenes/nadaquemostrar.jpg" alt="no hay ninguna oferta por revisar" style="max-width: 100%"></image>
                            </div>
                        </div>
                    </EmptyDataTemplate>      
                    <HeaderStyle BackColor="#17a2b8" Font-Size="Small"></HeaderStyle>
                    <PagerSettings FirstPageText="Prímera" LastPageText="Última" NextPageText="Siguiente" PreviousPageText="Anterior" Mode="NextPreviousFirstLast" />
                    <PagerStyle HorizontalAlign="Center" VerticalAlign="Bottom" />
                </asp:GridView>
            </div>
        </div>

    </div>
</asp:Content>

