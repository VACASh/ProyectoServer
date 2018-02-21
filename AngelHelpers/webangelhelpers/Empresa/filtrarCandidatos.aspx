<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageEmpresa.master" AutoEventWireup="true" CodeFile="filtrarCandidatos.aspx.cs" Inherits="Empresa_filtrarCandidatos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    
</asp:Content>
<asp:Content ID="info" runat="server" ContentPlaceHolderID="infoUser">
    <asp:Label runat="server" ID="lblUserInfo" ForeColor="White"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="jumbotron">
            <h3 class="h3">Filtrar candidatos</h3>
            <asp:Label ID="lblBusqueda" AssociatedControlID="txtBusqueda" runat="server">Filtra candidatos por idioma o especialidad:</asp:Label>

            <div class="row">
                <div class="col-md-8">
                    <asp:TextBox runat="server" ID="txtBusqueda" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-4">
                    <asp:Button runat="server" ID="btnBusqueda" CssClass="btn btn-primary" Text="Busqueda" />
                </div>

            </div>

        </div>
        <div class="card">
            <div class=" card-body">
                <p style="color: red" class="d-block d-xl-none">*La visluazación correcta sera mostrada en panatallas grandes.</p>
                <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="idDemandante">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True">
                            <ControlStyle CssClass="btn btn-success" />
                        </asp:CommandField>
                        <asp:BoundField DataField="idDemandante" HeaderText="idDemandante" InsertVisible="False" ReadOnly="True" SortExpression="idDemandante">
                            <ControlStyle CssClass="form-control" />
                            <HeaderStyle CssClass="d-none "></HeaderStyle>
                            <ItemStyle CssClass="d-none "></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre">
                            <ControlStyle CssClass="form-control" />
                            
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Curriculo" SortExpression="curriculum">
                            <ItemTemplate>
                                <asp:HyperLink runat="server" ID="hpkCurriculum" Target="_blank" NavigateUrl='<%# Bind("curriculum") %>'>Curriculo</asp:HyperLink>
                            </ItemTemplate>
                             <HeaderStyle CssClass="d-none d-sm-table-cell"></HeaderStyle>
                            <ItemStyle CssClass="d-none d-sm-table-cell"></ItemStyle>
                        </asp:TemplateField>
                        <asp:BoundField DataField="especialidad" HeaderText="Especialidad" SortExpression="especialidad">
                            <ControlStyle CssClass="form-control" />
                            <HeaderStyle CssClass="d-none d-sm-table-cell"></HeaderStyle>
                            <ItemStyle CssClass="d-none d-sm-table-cell"></ItemStyle>
                        </asp:BoundField>
                        
                    </Columns>
                    <EmptyDataTemplate>
                        <div class="row">
                            <div class="col-md-6">
                                <asp:Label Font-Size="large" Font-Bold="true" runat="server">Filtra por idiomas o alguna habilidad que requiera los puestos de trabajo.</asp:Label>
                            </div>
                            <div class="col-md-6">
                                <image src="/imagenes/idiomas.jpg" alt="no hay ninguna oferta por revisar" style="max-width: 100%"></image>
                            </div>
                        </div>
                    </EmptyDataTemplate> 
                    <HeaderStyle BackColor="#007bff" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT Demandante.nombre, Demandante.curriculum, Demandante.especialidad, Demandante.idDemandante FROM Demandante INNER JOIN Sabe ON Demandante.idDemandante = Sabe.idDemandante INNER JOIN inscritos ON Demandante.idDemandante = inscritos.idDemandante INNER JOIN OfertaEmpleo ON inscritos.idOferta = OfertaEmpleo.idOferta WHERE (OfertaEmpleo.idEmpresa = @idEmpresa) AND (Sabe.idioma = @textbox) OR (OfertaEmpleo.idEmpresa = @idEmpresa) AND (Demandante.especialidad = @textbox)">
                    <SelectParameters>
                        <asp:SessionParameter Name="idEmpresa" SessionField="idEmpresa" />
                        <asp:ControlParameter ControlID="txtBusqueda" Name="textbox" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="GridView2" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
                    <Columns>
                        <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
                        <asp:BoundField DataField="idioma" HeaderText="Idioma" SortExpression="idioma" />
                        <asp:BoundField DataField="nivel" HeaderText="Nivel" SortExpression="nivel" />
                    </Columns>
                      <HeaderStyle BackColor="#28a745" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Demandante.nombre, Sabe.idioma, Sabe.nivel FROM Demandante INNER JOIN Sabe ON Demandante.idDemandante = Sabe.idDemandante WHERE (Demandante.idDemandante = @demandante)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridView1" Name="demandante" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>


    <asp:Label ID="lblMensaje" runat="server"></asp:Label>
</asp:Content>

