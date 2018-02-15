<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="administrarEmpresas.aspx.cs" Inherits="Administrador_administrarEmpresas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="card">
            <div class="card-header">
                <h2 class="h2">Empresas</h2>
                <asp:Label Font-Bold="true" Font-Size="Larger" runat="server">Administración de empresas </asp:Label>
            </div>
            <div class="card-body">
                <p style="color: red" class="d-block d-xl-none">*La visluazación correcta sera mostrada en panatallas grandes.</p>
                <asp:GridView runat="server" ID="grdEmpresas" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
                    PageSize="5" HorizontalAlign="Center" CssClass="table table-striped table-bordered table-hover"
                    DataKeyNames="idEmpresa" OnSelectedIndexChanged="grdEmpresas_SelectedIndexChanged" Style="font-size: small">
                    <Columns>
                        <asp:BoundField ItemStyle-CssClass="d-none d-lg-table-cell" HeaderStyle-CssClass="d-none d-lg-table-cell" DataField="idUsuario" HeaderText="ID" SortExpression="idUsuario">
                            <ControlStyle CssClass="form-control" />
                            <HeaderStyle CssClass="d-none d-lg-table-cell"></HeaderStyle>

                            <ItemStyle CssClass="d-none d-lg-table-cell"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="nomEmpresa" HeaderText="Nombre" SortExpression="nomEmpresa">
                            <ControlStyle CssClass="form-control" />
                        </asp:BoundField>
                        <asp:BoundField ItemStyle-CssClass="d-none" HeaderStyle-CssClass="d-none" DataField="idEmpresa" HeaderText="ID" SortExpression="idEmpresa" InsertVisible="False">
                            <ControlStyle CssClass="form-control" />
                            <HeaderStyle CssClass="d-none"></HeaderStyle>

                            <ItemStyle CssClass="d-none"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ItemStyle-CssClass="d-none d-sm-table-cell" HeaderStyle-CssClass="d-none d-sm-table-cell" DataField="ciudad" HeaderText="Ciudad" SortExpression="ciudad">
                            <ControlStyle CssClass="form-control" />
                            <HeaderStyle CssClass="d-none d-sm-table-cell"></HeaderStyle>
                            <ItemStyle CssClass="d-none d-sm-table-cell"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ItemStyle-CssClass="d-none d-lg-table-cell" HeaderStyle-CssClass="d-none d-lg-table-cell" DataField="direccion" HeaderText="Dirección" SortExpression="direccion">
                            <ControlStyle CssClass="form-control" />
                            <HeaderStyle CssClass="d-none d-lg-table-cell"></HeaderStyle>

                            <ItemStyle CssClass="d-none d-lg-table-cell"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ItemStyle-CssClass="d-none d-xl-table-cell" HeaderStyle-CssClass="d-none d-xl-table-cell" DataField="telefono" HeaderText="Teléfono" SortExpression="telefono">
                            <ControlStyle CssClass="form-control" />
                            <HeaderStyle CssClass="d-none d-xl-table-cell"></HeaderStyle>
                            <ItemStyle CssClass="d-none d-xl-table-cell"></ItemStyle>
                        </asp:BoundField>
                        <asp:CheckBoxField DataField="activado" HeaderText="Activado" SortExpression="activado">
                            <ControlStyle CssClass="form-control" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:CheckBoxField>
                        <asp:BoundField DataField="Email" HeaderText="Email"
                            SortExpression="Email">
                            <ControlStyle CssClass="form-control" />
                            <HeaderStyle CssClass="d-none d-md-table-cell"></HeaderStyle>
                            <ItemStyle CssClass="d-none d-md-table-cell"></ItemStyle>
                        </asp:BoundField>
                        <asp:CommandField ShowEditButton="True" ShowSelectButton="True">
                            <ControlStyle CssClass="btn btn-outline-primary" />
                        </asp:CommandField>
                    </Columns>
                    <HeaderStyle BackColor="#17A2B8" Font-Size="small" />
                    <PagerSettings FirstPageText="Prímera" LastPageText="Última" NextPageText="Siguiente" PreviousPageText="Anterior" Mode="NextPreviousFirstLast" />
                    <PagerStyle HorizontalAlign="Center" VerticalAlign="Bottom" />
                </asp:GridView>
                <asp:Label ID="lblResultado" runat="server" Text="Label" Visible="false"></asp:Label>
                <asp:Label ID="lblTotal" runat="server" Text="Label" Visible="false"></asp:Label>
                <br />


                <asp:Label ID="lblMensajes" runat="server" ForeColor="Red"></asp:Label>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Empresa]" DeleteCommand="DELETE FROM [Empresa] WHERE [idEmpresa] = @idEmpresa" InsertCommand="INSERT INTO [Empresa] ([nomEmpresa], [ciudad], [direccion], [idUsuario], [telefono], [activado], [Email]) VALUES (@nomEmpresa, @ciudad, @direccion, @idUsuario, @telefono, @activado, @Email)" UpdateCommand="UPDATE [Empresa] SET [nomEmpresa] = @nomEmpresa, [ciudad] = @ciudad, [direccion] = @direccion, [idUsuario] = @idUsuario, [telefono] = @telefono, [activado] = @activado, [Email] = @Email WHERE [idEmpresa] = @idEmpresa">
                    <DeleteParameters>
                        <asp:Parameter Name="idEmpresa" Type="Int64" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="nomEmpresa" Type="String" />
                        <asp:Parameter Name="ciudad" Type="String" />
                        <asp:Parameter Name="direccion" Type="String" />
                        <asp:Parameter Name="idUsuario" Type="String" />
                        <asp:Parameter Name="telefono" Type="String" />
                        <asp:Parameter Name="activado" Type="Boolean" />
                        <asp:Parameter Name="Email" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="nomEmpresa" Type="String" />
                        <asp:Parameter Name="ciudad" Type="String" />
                        <asp:Parameter Name="direccion" Type="String" />
                        <asp:Parameter Name="idUsuario" Type="String" />
                        <asp:Parameter Name="telefono" Type="String" />
                        <asp:Parameter Name="activado" Type="Boolean" />
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="idEmpresa" Type="Int64" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT o.idEmpresa, e.nomEmpresa, SUM(o.precioOferta) AS TOTAL FROM OfertaEmpleo AS o INNER JOIN Empresa AS e ON o.idEmpresa = e.idEmpresa GROUP BY e.nomEmpresa, o.idEmpresa HAVING (o.idEmpresa = @idEmpresa)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="grdEmpresas" Name="idEmpresa" PropertyName="SelectedValue" Type="Int64" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" CssClass="table table-striped table-bordered table-hover">
                    <Columns>
                        <asp:BoundField DataField="nomEmpresa" HeaderText="Nombre de empresa" SortExpression="Nombre " />
                        <asp:BoundField DataField="TOTAL" HeaderText="Total Gastado" ReadOnly="True" SortExpression="Total " DataFormatString="{0:C}" />
                    </Columns>
                    <HeaderStyle BackColor="#007bff" Font-Size="Small" />
                      
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>

