<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="administrarEmpresas.aspx.cs" Inherits="Administrador_administrarEmpresas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="card">
            <p style="color: red" class="d-block d-xl-none">*La visluazación correcta sera mostrada en panatallas grandes.</p>
            <asp:GridView runat="server" ID="grdEmpresas" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
                PageSize="5" HorizontalAlign="Center" CssClass="table table-striped table-bordered table-hover" 
                DataKeyNames="idEmpresa" OnSelectedIndexChanged="grdEmpresas_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField ItemStyle-CssClass="d-none d-lg-table-cell" HeaderStyle-CssClass="d-none d-lg-table-cell" DataField="idUsuario" HeaderText="idUsuario" SortExpression="idUsuario">
                        <ControlStyle CssClass="form-control" />
                        <HeaderStyle CssClass="d-none d-lg-table-cell"></HeaderStyle>

                        <ItemStyle CssClass="d-none d-lg-table-cell"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="nomEmpresa" HeaderText="nomEmpresa" SortExpression="nomEmpresa">
                        <ControlStyle CssClass="form-control" />
                    </asp:BoundField>
                    <asp:BoundField ItemStyle-CssClass="d-none" HeaderStyle-CssClass="d-none" DataField="idEmpresa" HeaderText="idEmpresa" SortExpression="idEmpresa" InsertVisible="False" ReadOnly="True">
                        <ControlStyle CssClass="form-control" />
                        <HeaderStyle CssClass="d-none"></HeaderStyle>

                        <ItemStyle CssClass="d-none"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField ItemStyle-CssClass="d-none d-sm-table-cell" HeaderStyle-CssClass="d-none d-sm-table-cell" DataField="ciudad" HeaderText="ciudad" SortExpression="ciudad">
                        <ControlStyle CssClass="form-control" />
                        <HeaderStyle CssClass="d-none d-sm-table-cell"></HeaderStyle>

                        <ItemStyle CssClass="d-none d-sm-table-cell"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField ItemStyle-CssClass="d-none d-lg-table-cell" HeaderStyle-CssClass="d-none d-lg-table-cell" DataField="direccion" HeaderText="direccion" SortExpression="direccion">
                        <ControlStyle CssClass="form-control" />
                        <HeaderStyle CssClass="d-none d-lg-table-cell"></HeaderStyle>

                        <ItemStyle CssClass="d-none d-lg-table-cell"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField ItemStyle-CssClass="d-none d-xl-table-cell" HeaderStyle-CssClass="d-none d-xl-table-cell" DataField="telefono" HeaderText="telefono" SortExpression="telefono">
                        <ControlStyle CssClass="form-control" />
                        <HeaderStyle CssClass="d-none d-xl-table-cell"></HeaderStyle>

                        <ItemStyle CssClass="d-none d-xl-table-cell"></ItemStyle>
                    </asp:BoundField>
                    <asp:CheckBoxField DataField="activado" HeaderText="activado" SortExpression="activado">
                        <ControlStyle CssClass="form-control" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:CheckBoxField>
                    <asp:BoundField DataField="Email" HeaderText="Email"
                        SortExpression="Email">
                        <HeaderStyle CssClass="d-none d-md-table-cell"></HeaderStyle>
                        <ItemStyle CssClass="d-none d-md-table-cell"></ItemStyle>
                    </asp:BoundField>
                    <asp:CommandField ShowEditButton="True" ShowSelectButton="True" >
                        <ControlStyle CssClass="btn btn-outline-primary" />
                    </asp:CommandField>
                </Columns>
                <HeaderStyle BackColor="#17A2B8" Font-Size="Medium" />
                <PagerSettings FirstPageText="Prímera" LastPageText="Última" NextPageText="Siguiente" PreviousPageText="Anterior" Mode="NextPreviousFirstLast" Position="TopAndBottom" />
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
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [tipoOferta], [ciudad], [perNecesarias], [precioOferta] FROM [OfertaEmpleo] WHERE ([idEmpresa] = @idEmpresa) ORDER BY [idEmpresa]">
                <SelectParameters>
                    <asp:ControlParameter ControlID="grdEmpresas" Name="idEmpresa" PropertyName="SelectedValue" Type="Int64" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
                <Columns>
                    <asp:BoundField DataField="tipoOferta" HeaderText="tipoOferta" SortExpression="tipoOferta" />
                    <asp:BoundField DataField="ciudad" HeaderText="ciudad" SortExpression="ciudad" />
                    <asp:BoundField DataField="perNecesarias" HeaderText="perNecesarias" SortExpression="perNecesarias" />
                    <asp:BoundField DataField="precioOferta" HeaderText="precioOferta" SortExpression="precioOferta" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>

