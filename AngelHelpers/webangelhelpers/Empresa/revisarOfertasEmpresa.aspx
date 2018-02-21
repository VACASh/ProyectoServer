<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageEmpresa.master" AutoEventWireup="true" CodeFile="revisarOfertasEmpresa.aspx.cs" Inherits="Empresa_revisarOfertasEmpresa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="info" runat="server" ContentPlaceHolderID="infoUser">
    <asp:Label runat="server" ID="lblUserInfo" ForeColor="White"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:Label ID="lblMensaje" runat="server"></asp:Label>
    <div class="container">
        <div class="card">
            <div class="card-header ">
                <h3 class="h3">Administra o modifica tus ofertas de empleo</h3>
            </div>
            <div class="card-body">
                <p style="color: red" class="d-block d-xl-none">*La visluazación correcta sera mostrada en panatallas grandes.</p>
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" DataKeyNames="idOferta" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:CommandField ShowEditButton="True">
                            <ControlStyle CssClass="btn btn-outline-info" />
                        </asp:CommandField>
                        <asp:BoundField DataField="idOferta" HeaderText="idOferta" InsertVisible="False" ReadOnly="True" SortExpression="idOferta">
                            <ControlStyle CssClass="form-control" />
                            <HeaderStyle CssClass="d-none"></HeaderStyle>
                            <ItemStyle CssClass="d-none "></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="tipoOferta" HeaderText="tipoOferta" SortExpression="tipoOferta">
                            <ControlStyle CssClass="form-control" />
                            <HeaderStyle CssClass="d-none d-sm-table-cell"></HeaderStyle>
                            <ItemStyle CssClass="d-none d-sm-table-cell"></ItemStyle>
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="descripción del anuncio " SortExpression="descripcion">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" TextMode="MultiLine" Rows="5" Columns="20" runat="server" Text='<%# Bind("descripcion") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("descripcion") %>'></asp:Label>
                            </ItemTemplate>
                            <ControlStyle CssClass="form-control" />
                            <HeaderStyle CssClass="d-none d-lg-table-cell" />
                            <ItemStyle CssClass="d-none d-lg-table-cell" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="ciudad" HeaderText="ciudad" SortExpression="Ciudad">
                            <ControlStyle CssClass="form-control" />
                            <HeaderStyle CssClass="d-none d-lg-table-cell"></HeaderStyle>
                            <ItemStyle CssClass="d-none d-lg-table-cell"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="perNecesarias" HeaderText="Personas necesarias" SortExpression="perNecesarias">
                            <ControlStyle CssClass="form-control" />
                            <HeaderStyle CssClass="d-none d-md-table-cell"></HeaderStyle>
                            <ItemStyle CssClass="d-none d-md-table-cell"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Especialidad" HeaderText="Especialidad" SortExpression="Especialidad">
                            <ControlStyle CssClass="form-control" />

                        </asp:BoundField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div class="row">
                            <div class="col-md-6">
                                <asp:Label Font-Size="large" Font-Bold="true" runat="server">No dispone de ninguna oferta de trabajo publicada, si su empresa esta interesada en publicar una oferta acceda a la parte de publicación de ofertas. Si tuviera algun tipo de duda o problema pongase en contacto con nosotros en angelhelpers@trabajo.com</asp:Label>
                            </div>
                            <div class="col-md-6">
                                <image src="/imagenes/nadaquemostrar.jpg" alt="no hay ninguna oferta por revisar" style="max-width: 100%"></image>
                            </div>
                        </div>
                    </EmptyDataTemplate>
                    <HeaderStyle BackColor="#007BFF" />
                </asp:GridView>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [OfertaEmpleo] WHERE [idOferta] = @idOferta" InsertCommand="INSERT INTO [OfertaEmpleo] ([tipoOferta], [descripcion], [ciudad], [perNecesarias], [Especialidad]) VALUES (@tipoOferta, @descripcion, @ciudad, @perNecesarias, @Especialidad)" SelectCommand="SELECT [tipoOferta], [descripcion], [ciudad], [perNecesarias], [Especialidad], [idOferta] FROM [OfertaEmpleo] WHERE ([idEmpresa] = @idEmpresa)" UpdateCommand="UPDATE [OfertaEmpleo] SET [tipoOferta] = @tipoOferta, [descripcion] = @descripcion, [ciudad] = @ciudad, [perNecesarias] = @perNecesarias, [Especialidad] = @Especialidad WHERE [idOferta] = @idOferta">
                    <DeleteParameters>
                        <asp:Parameter Name="idOferta" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="tipoOferta" Type="String" />
                        <asp:Parameter Name="descripcion" Type="String" />
                        <asp:Parameter Name="ciudad" Type="String" />
                        <asp:Parameter Name="perNecesarias" Type="Int32" />
                        <asp:Parameter Name="Especialidad" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="idEmpresa" SessionField="idEmpresa" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="tipoOferta" Type="String" />
                        <asp:Parameter Name="descripcion" Type="String" />
                        <asp:Parameter Name="ciudad" Type="String" />
                        <asp:Parameter Name="perNecesarias" Type="Int32" />
                        <asp:Parameter Name="Especialidad" Type="String" />
                        <asp:Parameter Name="idOferta" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>

            </div>
        </div>
    </div>
</asp:Content>

