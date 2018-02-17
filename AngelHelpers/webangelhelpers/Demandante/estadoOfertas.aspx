<%@ Page Title="" Language="C#" MasterPageFile="~/AngelHelpers.master" AutoEventWireup="true" CodeFile="estadoOfertas.aspx.cs" Inherits="Demandante_estadoOfertas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <asp:Label runat="server" ID="lblMensaje"></asp:Label>
    <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="id_oferta_demanda">
        <Columns>
            <asp:CommandField DeleteText="Eliminar candidatura" ShowDeleteButton="True">
            <ControlStyle CssClass="btn btn-danger" />
            </asp:CommandField>
            <asp:BoundField DataField="id_oferta_demanda" HeaderText="id_oferta_demanda" InsertVisible="False" ReadOnly="True" SortExpression="id_oferta_demanda">
            <ControlStyle CssClass="form-control" />
            </asp:BoundField>
            <asp:BoundField DataField="nomEmpresa" HeaderText="nomEmpresa" SortExpression="nomEmpresa" >
            <ControlStyle CssClass="form-control" />
            </asp:BoundField>
            <asp:BoundField DataField="fecha_inscripcio" HeaderText="fecha_inscripcio" SortExpression="fecha_inscripcio" >
            <ControlStyle CssClass="form-control" />
            </asp:BoundField>
            <asp:BoundField DataField="estado" HeaderText="estado" SortExpression="estado" >
            <ControlStyle CssClass="form-control" />
            </asp:BoundField>
        </Columns>
         <EmptyDataTemplate>
                        <div class="row">
                            <div class="col-md-6">
                                <asp:Label Font-Size="large" Font-Bold="true" runat="server">No tienes ninguna candidatura actualmente. Inscribete en alguna de nuestras miles de ofertas de empleo</asp:Label>
                            </div>
                            <div class="col-md-6 ">
                                <image src="/imagenes/cuidando.jpg" class="img-thumbnail rounded " alt="no hay ninguna oferta por revisar" style="max-width: 100%"></image>
                            </div>
                        </div>
                    </EmptyDataTemplate>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT inscritos.estado, inscritos.fecha_inscripcio, Empresa.nomEmpresa, inscritos.id_oferta_demanda FROM inscritos INNER JOIN Demandante ON inscritos.idDemandante = Demandante.idDemandante INNER JOIN OfertaEmpleo ON inscritos.idOferta = OfertaEmpleo.idOferta INNER JOIN Empresa ON OfertaEmpleo.idEmpresa = Empresa.idEmpresa WHERE (Demandante.idUsuario = @idUsuario)" DeleteCommand="DELETE FROM inscritos WHERE (id_oferta_demanda = @id_oferta_demanda)">
            <DeleteParameters>
                <asp:Parameter Name="id_oferta_demanda" />
            </DeleteParameters>
            <SelectParameters>
                <asp:SessionParameter Name="idUsuario" SessionField="idUsuario" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    
</asp:Content>

