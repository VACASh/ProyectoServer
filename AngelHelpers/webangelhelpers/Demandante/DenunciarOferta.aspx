<%@ Page Title="" Language="C#" MasterPageFile="~/AngelHelpers.master" AutoEventWireup="true" CodeFile="DenunciarOferta.aspx.cs" Inherits="Demandante_DenunciarOferta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderLogin" runat="Server">
    <asp:Label runat="server" ID="lblTipoUser"></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="jumbotron">
            <h3 class="h3">Denuncia anuncios falsos o abusivos</h3>
            <asp:Label runat="server" ID="lblMensajes" ForeColor="#dc3545"></asp:Label>
        </div>
        <div class="card">
             <p style="color: red" class="d-block d-xl-none">*La visluazación correcta sera mostrada en panatallas grandes.</p>

            <asp:PlaceHolder ID="plcDenunicia" runat="server" Visible="false">
                <asp:Label runat="server" ID="lblDenuncia" AssociatedControlID="txtDenuncia">Motivo de la denuncia:</asp:Label>
                <asp:TextBox runat="server" ID="txtDenuncia" TextMode="MultiLine" Rows="6" CssClass="form-control"></asp:TextBox>
                <div class="text-center">
                    <br />
                    <asp:Button runat="server" OnClick="Unnamed_Click" CssClass="btn btn-primary" Text="Confirmar" />
                    <br />
                    <br />
                </div>
            </asp:PlaceHolder>
            <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="idOferta" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True" PageSize="3">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" SelectText="Denunciar oferta">
                        <ControlStyle CssClass="btn btn-danger" />
                    </asp:CommandField>
                    <asp:BoundField DataField="idOferta" HeaderText="idOferta" InsertVisible="False" ReadOnly="True" SortExpression="idOferta">
                        <ControlStyle CssClass="form-control" />
                        <HeaderStyle CssClass="d-none "></HeaderStyle>
                        <ItemStyle CssClass="d-none "></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="idEmpresa" HeaderText="idEmpresa" SortExpression="idEmpresa">
                        <ControlStyle CssClass="form-control" />
                        <HeaderStyle CssClass="d-none  "></HeaderStyle>
                        <ItemStyle CssClass="d-none "></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="tipoOferta" HeaderText="Jornada laboral" SortExpression="tipoOferta">
                        <ControlStyle CssClass="form-control" />
                        <HeaderStyle CssClass="d-none d-xl-table-cell"></HeaderStyle>
                        <ItemStyle CssClass="d-none d-xl-table-cell"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="descripcion" HeaderText="Descripción" SortExpression="descripcion">
                        <ControlStyle CssClass="form-control" />
                        
                    </asp:BoundField>
                    <asp:BoundField DataField="ciudad" HeaderText="Ciudad" SortExpression="ciudad">
                        <ControlStyle CssClass="form-control" />
                        <HeaderStyle CssClass="d-none d-lg-table-cell"></HeaderStyle>
                        <ItemStyle CssClass="d-none  d-lg-table-cell"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="perNecesarias" HeaderText="Nº puestos" SortExpression="perNecesarias">
                        <ControlStyle CssClass="form-control" />
                        <HeaderStyle CssClass="d-none d-lg-table-cell"></HeaderStyle>
                        <ItemStyle CssClass="d-none d-lg-table-cell"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Especialidad" HeaderText="Especialidad" SortExpression="Especialidad">
                        <HeaderStyle CssClass="d-none d-lg-table-cell"></HeaderStyle>
                        <ItemStyle CssClass="d-none d-lg-table-cell"></ItemStyle>
                        <ControlStyle CssClass="form-control" />
                    </asp:BoundField>
                </Columns>
                <HeaderStyle BackColor="#17A2B8" CssClass="text-white rounded" Font-Size="small" />
                <PagerSettings FirstPageText="Início" LastPageText="Última" Mode="NextPreviousFirstLast" NextPageText="Siguiente" PreviousPageText="Anterior" />
                <PagerStyle HorizontalAlign="Center" />
            </asp:GridView>
            <br />



        </div>
        <br />

    </div>
    <br />


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [idOferta], [idEmpresa], [tipoOferta], [descripcion], [ciudad], [perNecesarias], [Especialidad] FROM [OfertaEmpleo]"></asp:SqlDataSource>

</asp:Content>

