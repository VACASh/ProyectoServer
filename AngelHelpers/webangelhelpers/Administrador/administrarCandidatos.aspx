<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="administrarCandidatos.aspx.cs" Inherits="Administrador_administrarCandidatos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="card">
            <p style="color: red" class="d-block d-xl-none">*La visluazación correcta sera mostrada en panatallas grandes.</p>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [nombre], [idUsuario], [apellidos], [activado], [telefono], [especialidad], [Email] FROM [Demandante]"></asp:SqlDataSource>
            <asp:GridView  runat="server" AutoGenerateColumns="False"  DataSourceID="SqlDataSource1" AllowPaging="True" CssClass="table table-striped table-bordered table-hover" PageSize="5">
                <Columns>
                    <asp:BoundField DataField="idUsuario" HeaderText="ID" SortExpression="idUsuario">
                        <ControlStyle CssClass="form-control" />             
                    </asp:BoundField>
                    <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre">
                        <ControlStyle CssClass="form-control" />
                        <HeaderStyle CssClass="d-none d-md-table-cell"></HeaderStyle>
                        <ItemStyle CssClass="d-none d-md-table-cell"></ItemStyle>
                    </asp:BoundField>
                    
                    <asp:BoundField DataField="apellidos" HeaderText="apellidos" SortExpression="apellidos">
                        <ControlStyle CssClass="form-control" />
                        <HeaderStyle CssClass="d-none d-lg-table-cell"></HeaderStyle>
                        <ItemStyle CssClass="d-none d-lg-table-cell"></ItemStyle>
                    </asp:BoundField>
                    <asp:CheckBoxField DataField="activado" HeaderText="activado" SortExpression="activado">
                        <ControlStyle CssClass="form-control" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:CheckBoxField>
                    <asp:BoundField DataField="telefono" HeaderText="telefono" SortExpression="telefono">
                        <ControlStyle CssClass="form-control" />
                        <HeaderStyle CssClass="d-none d-lg-table-cell"></HeaderStyle>
                        <ItemStyle CssClass="d-none d-lg-table-cell"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="especialidad" HeaderText="especialidad" SortExpression="especialidad">
                        <ControlStyle CssClass="form-control" />
                        <HeaderStyle CssClass="d-none d-sm-table-cell"></HeaderStyle>
                        <ItemStyle CssClass="d-none d-sm-table-cell"></ItemStyle>

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
                <HeaderStyle BackColor="#17A2B8" />
                <PagerSettings  FirstPageText="Prímera" Mode="NextPreviousFirstLast" NextPageText="Siguiente" PreviousPageText="Anterior" LastPageText="Última" />
            </asp:GridView>
            <asp:Label ID="lblMensajes" runat="server" ForeColor="Red"></asp:Label>
        </div>
    </div>
</asp:Content>

