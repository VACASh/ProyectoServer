<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="administrarCandidatos.aspx.cs" Inherits="Administrador_administrarCandidatos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="contentnav" ContentPlaceHolderID="nav" runat="server">
     <asp:Label ID="lblDatosUsuario" runat="server" ForeColor="#bd2130"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container">
        <div class="card">
            <div class="card-header">
                <h2 class="h2">Candidatos</h2>
                <asp:Label Font-Bold="true" Font-Size="Larger" runat="server">Administración de candidatos </asp:Label>
            </div>
            <div class="card-body">
                <p style="color: red" class="d-block d-xl-none">*La visluazación correcta sera mostrada en panatallas grandes.</p>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [nombre], [apellidos], [especialidad], [telefono], [Email], [activado], [idUsuario], [idDemandante] FROM [Demandante]" DeleteCommand="DELETE FROM [Demandante] WHERE [idDemandante] = @idDemandante" InsertCommand="INSERT INTO [Demandante] ([nombre], [apellidos], [especialidad], [telefono], [Email], [activado], [idUsuario]) VALUES (@nombre, @apellidos, @especialidad, @telefono, @Email, @activado, @idUsuario)" UpdateCommand="UPDATE [Demandante] SET [nombre] = @nombre, [apellidos] = @apellidos, [especialidad] = @especialidad, [telefono] = @telefono, [Email] = @Email, [activado] = @activado, [idUsuario] = @idUsuario WHERE [idDemandante] = @idDemandante">
                    <DeleteParameters>
                        <asp:Parameter Name="idDemandante" Type="Int64" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="nombre" Type="String" />
                        <asp:Parameter Name="apellidos" Type="String" />
                        <asp:Parameter Name="especialidad" Type="String" />
                        <asp:Parameter Name="telefono" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="activado" Type="Boolean" />
                        <asp:Parameter Name="idUsuario" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="nombre" Type="String" />
                        <asp:Parameter Name="apellidos" Type="String" />
                        <asp:Parameter Name="especialidad" Type="String" />
                        <asp:Parameter Name="telefono" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="activado" Type="Boolean" />
                        <asp:Parameter Name="idUsuario" Type="String" />
                        <asp:Parameter Name="idDemandante" Type="Int64" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:GridView runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" CssClass="table table-striped table-bordered table-hover" PageSize="5" DataKeyNames="idDemandante" Style="font-size: small">
                    <Columns>
                        <asp:BoundField DataField="idDemandante" HeaderText="ID Demandante" SortExpression="idDemandante" InsertVisible="False" ReadOnly="True">
                            <ControlStyle CssClass="form-control" />
                            <HeaderStyle CssClass="d-none "></HeaderStyle>
                            <ItemStyle CssClass="d-none "></ItemStyle>
                        </asp:BoundField>

                        <asp:BoundField DataField="idUsuario" HeaderText="ID" SortExpression="idUsuario">
                            <ControlStyle CssClass="form-control" />
                            <HeaderStyle CssClass="d-none "></HeaderStyle>
                            <ItemStyle CssClass="d-none "></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre">
                            <ControlStyle CssClass="form-control" />
                            <HeaderStyle CssClass="d-none d-sm-table-cell"></HeaderStyle>
                            <ItemStyle CssClass="d-none d-sm-table-cell"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="apellidos" HeaderText="Apellidos" SortExpression="apellidos">
                            <ControlStyle CssClass="form-control" />
                            <HeaderStyle CssClass="d-none d-lg-table-cell"></HeaderStyle>
                            <ItemStyle CssClass="d-none d-lg-table-cell"></ItemStyle>
                        </asp:BoundField>
                        <asp:CheckBoxField DataField="activado" HeaderText="Activado" SortExpression="activado">
                            <ControlStyle CssClass="form-control" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:CheckBoxField>
                        <asp:BoundField DataField="especialidad" HeaderText="Especialidad" SortExpression="especialidad">
                            <ControlStyle CssClass="form-control" />
                            <HeaderStyle CssClass="d-none d-md-table-cell"></HeaderStyle>
                            <ItemStyle CssClass="d-none d-md-table-cell"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="telefono" HeaderText="Teléfono" SortExpression="telefono">
                            <ControlStyle CssClass="form-control" />
                            <HeaderStyle CssClass="d-none d-xl-table-cell"></HeaderStyle>
                            <ItemStyle CssClass="d-none d-xl-table-cell"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email">
                            <ControlStyle CssClass="form-control" />
                            <HeaderStyle CssClass="d-none d-xl-table-cell"></HeaderStyle>
                            <ItemStyle CssClass="d-none d-xl-table-cell"></ItemStyle>
                        </asp:BoundField>

                        <asp:CommandField ShowEditButton="True">
                            <ControlStyle CssClass="btn btn-outline-primary" />
                        </asp:CommandField>

                    </Columns>
                    <FooterStyle HorizontalAlign="Center" BackColor="Red" />
                    <HeaderStyle BackColor="#17A2B8" Font-Size="Small" />
                    <PagerSettings FirstPageText="Prímera" Mode="NextPreviousFirstLast" NextPageText="Siguiente" PreviousPageText="Anterior" LastPageText="Última" />
                    <PagerStyle HorizontalAlign="Center" VerticalAlign="Bottom" />
                </asp:GridView>
                <asp:Label ID="lblMensajes" runat="server" ForeColor="Red"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>

