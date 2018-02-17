<%@ Page Title="" Language="C#" MasterPageFile="~/AngelHelpers.master" AutoEventWireup="true" CodeFile="Empleo.aspx.cs" Inherits="Empleo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderLogin" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container">
        <div class="jumbotron">
            <h4 class="h4">Busca empleo por Ciudad o Especialidad
            </h4>
            <div class="row">
                <asp:TextBox runat="server" ID="txtBusqueda" CssClass="col-sm-7 form-control">  </asp:TextBox>&nbsp;
                <asp:Button runat="server" CssClass="btn col-sm-4 text-center" Text="Buscar ofertas" />
            </div>
            <asp:Label ID="lblMensaje" CssClass="text-center" ForeColor="Red" runat="server"></asp:Label>
        </div>

        <div class="card">

            <div class="card-body">
                <p style="color: red" class="d-block d-xl-none">*La visluazación correcta sera mostrada en panatallas grandes.</p>

                <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered table-hover" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="idOferta" AllowPaging="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" PageSize="5">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True">
                            <ControlStyle CssClass="btn btn-success" />

                        </asp:CommandField>
                        <asp:BoundField DataField="idOferta" HeaderText="idOferta" InsertVisible="False" ReadOnly="True" SortExpression="idOferta">
                            <ControlStyle CssClass="form-control" />
                            <HeaderStyle CssClass="d-none "></HeaderStyle>
                            <ItemStyle CssClass="d-none "></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="tipoOferta" HeaderText="nº horas semana" SortExpression="tipoOferta">
                            <ControlStyle CssClass="form-control" />
                            <HeaderStyle CssClass="d-none d-xl-table-cell"></HeaderStyle>
                            <ItemStyle CssClass="d-none d-xl-table-cell"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="descripcion" HeaderText="Oferta" SortExpression="descripcion">
                            <ControlStyle CssClass="form-control" />
                            <HeaderStyle CssClass="d-none d-md-table-cell"></HeaderStyle>
                            <ItemStyle CssClass="d-none d-md-table-cell"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="ciudad" HeaderText="Ciudad" SortExpression="ciudad">
                            <ControlStyle CssClass="form-control" />
                            <HeaderStyle CssClass="d-none d-sm-table-cell"></HeaderStyle>
                            <ItemStyle CssClass="d-none d-sm-table-cell"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="perNecesarias" HeaderText="Puestos a cubrir" SortExpression="perNecesarias">
                            <ControlStyle CssClass="form-control" />
                            <HeaderStyle CssClass="d-none d-sm-table-cell"></HeaderStyle>
                            <ItemStyle CssClass="d-none d-sm-table-cell"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Especialidad" HeaderText="Especialidad" SortExpression="Especialidad">
                            <ControlStyle CssClass="form-control" />
                        </asp:BoundField>
                        <asp:BoundField DataField="nomEmpresa" HeaderText="Nombre de la empresa" SortExpression="nomEmpresa">
                            <ControlStyle CssClass="form-control" />
                        </asp:BoundField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div class="row">
                            <div class="col-md-6">
                                <asp:Label Font-Size="large" Font-Bold="true" runat="server">Tu portal de busqueda de empleo para cuidado de personas mayores, un empleo de vocación.</asp:Label>
                            </div>
                            <div class="col-md-6 ">
                                <image src="/imagenes/cuidando.jpg" class="img-thumbnail rounded " alt="no hay ninguna oferta por revisar" style="max-width: 100%"></image>
                            </div>
                        </div>
                    </EmptyDataTemplate>
                    <HeaderStyle BackColor="#17A2B8" CssClass="text-white rounded" Font-Size="small" />

                    <PagerSettings FirstPageText="Primera" LastPageText="Última" Mode="NextPreviousFirstLast" NextPageText="Siguiente" PreviousPageText="Anterior" />
                    <PagerStyle HorizontalAlign="Center" VerticalAlign="Bottom" />
                </asp:GridView>
            </div>
        </div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT OfertaEmpleo.idOferta, OfertaEmpleo.tipoOferta, OfertaEmpleo.descripcion, OfertaEmpleo.ciudad, OfertaEmpleo.perNecesarias, OfertaEmpleo.Especialidad, Empresa.nomEmpresa FROM OfertaEmpleo INNER JOIN Empresa ON OfertaEmpleo.idEmpresa = Empresa.idEmpresa WHERE (OfertaEmpleo.ciudad = @ciudad) OR (OfertaEmpleo.Especialidad = @Especialidad)">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtBusqueda" Name="ciudad" PropertyName="Text" />
                <asp:ControlParameter ControlID="txtBusqueda" Name="Especialidad" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Label ID="lblResultado" runat="server"></asp:Label>
    </div>

</asp:Content>

