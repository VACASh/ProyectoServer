<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageEmpresa.master" AutoEventWireup="true" CodeFile="gestionCandidatos.aspx.cs" Inherits="Empresa_gestionCandidatos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="info" runat="server" ContentPlaceHolderID="infoUser">
    <asp:Label runat="server" ID="lblUserInfo" ForeColor="White"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">

        <div class="jumbotron">
            <h3 class="h3">Gestion de candidatos y revisión de curriculos</h3>
        </div>
        <div class="card">
            <div class="card-body">
                <p style="color: red" class="d-block d-xl-none">*La visluazación correcta sera mostrada en panatallas grandes.</p>

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover" DataKeyNames="idOferta" DataSourceID="SqlDataSource1" AllowPaging="True">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True">
                            <ControlStyle CssClass="btn btn-outline-primary" />
                        </asp:CommandField>
                        <asp:BoundField DataField="tipoOferta" HeaderText="Contrato" SortExpression="tipoOferta">
                            <ControlStyle CssClass="form-control" />

                        </asp:BoundField>
                        <asp:BoundField DataField="descripcion" HeaderText="descripcion" SortExpression="descripcion">
                            <ControlStyle CssClass="form-control" />
                            <HeaderStyle CssClass="d-none d-lg-table-cell"></HeaderStyle>
                            <ItemStyle CssClass="d-none d-lg-table-cell"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="ciudad" HeaderText="ciudad" SortExpression="ciudad">
                            <ControlStyle CssClass="form-control" />
                            <HeaderStyle CssClass="d-none d-lg-table-cell"></HeaderStyle>
                            <ItemStyle CssClass="d-none d-lg-table-cell"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="perNecesarias" HeaderText="número de plazas" SortExpression="perNecesarias">
                            <ControlStyle CssClass="form-control" />
                            <HeaderStyle CssClass="d-none d-sm-table-cell"></HeaderStyle>
                            <ItemStyle CssClass="d-none d-sm-table-cell"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="precioOferta" HeaderText="precioOferta" SortExpression="precioOferta">
                            <ControlStyle CssClass="form-control" />
                            <HeaderStyle CssClass="d-none d-xl-table-cell"></HeaderStyle>
                            <ItemStyle CssClass="d-none d-xl-table-cell"></ItemStyle>
                        </asp:BoundField>
                        <asp:CheckBoxField DataField="Revisada" HeaderText="Revisada" SortExpression="Revisada">
                            <ControlStyle CssClass="form-control" />
                            <ItemStyle HorizontalAlign="Center" />
                            <HeaderStyle CssClass="d-none d-lg-table-cell"></HeaderStyle>
                            <ItemStyle CssClass="d-none d-lg-table-cell"></ItemStyle>
                        </asp:CheckBoxField>
                        <asp:BoundField DataField="Especialidad" HeaderText="Especialidad" SortExpression="Especialidad">
                            <HeaderStyle CssClass="d-none d-sm-table-cell"></HeaderStyle>
                            <ItemStyle CssClass="d-none d-sm-table-cell"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="idOferta" HeaderText="idOferta" InsertVisible="False" ReadOnly="True" SortExpression="idOferta">
                            <HeaderStyle CssClass="d-none  "></HeaderStyle>
                            <ItemStyle CssClass="d-none "></ItemStyle>
                        </asp:BoundField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div class="row">
                            <div class="col-md-6">
                                <asp:Label Font-Size="large" Font-Bold="true" runat="server">Por el momento no hay ningun candidato para su oferta de trabajo , en el momento que se vayan inscribiendo apareceran aqui sus candidaturas. </asp:Label>
                            </div>
                            <div class="col-md-6">
                                <image src="/imagenes/nadaquemostrar.jpg" alt="no hay ninguna oferta por revisar" style="max-width: 100%"></image>
                            </div>
                        </div>
                    </EmptyDataTemplate>
                    <HeaderStyle BackColor="#007bff" Font-Size="Small" />
                </asp:GridView>
                <br />
                <asp:GridView ID="GridView2" runat="server" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" DataKeyNames="id_oferta_demanda">
                    <Columns>
                        <asp:CommandField ShowEditButton="True">
                            <ControlStyle CssClass="btn btn-outline-success" />
                        </asp:CommandField>
                        <asp:BoundField DataField="id_oferta_demanda" HeaderText="id_oferta_demanda" InsertVisible="False" ReadOnly="True" SortExpression="id_oferta_demanda">
                            <ControlStyle CssClass="form-control" />
                            <HeaderStyle CssClass="d-none  "></HeaderStyle>
                            <ItemStyle CssClass="d-none "></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" ReadOnly="True">
                            <ControlStyle CssClass="form-control" />
                            <HeaderStyle CssClass="d-none d-sm-table-cell "></HeaderStyle>
                            <ItemStyle CssClass="d-none d-sm-table-cell"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="fecha_inscripcio" HeaderText="fecha_inscripcio" SortExpression="fecha_inscripcio" ReadOnly="True">
                            <ControlStyle CssClass="form-control" />
                            <HeaderStyle CssClass="d-none d-lg-table-cell  "></HeaderStyle>
                            <ItemStyle CssClass="d-none d-lg-table-cell"></ItemStyle>
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="curriculum" SortExpression="curriculum">
                            <ItemTemplate>
                                <asp:HyperLink runat="server" Target="_blank" CssClass="btn btn-dark" NavigateUrl='<%# Eval("curriculum") %>'>Currículo</asp:HyperLink>
                            </ItemTemplate>
                            <HeaderStyle CssClass="d-none d-md-table-cell "></HeaderStyle>
                            <ItemStyle CssClass="d-none d-md-table-cell"></ItemStyle>
                        </asp:TemplateField>
                        <asp:BoundField DataField="especialidad" HeaderText="especialidad" SortExpression="especialidad" HeaderStyle-CssClass="bg-info text-white" ReadOnly="True">
                            <ControlStyle CssClass="form-control" />
                            <HeaderStyle CssClass="d-none d-lg-table-cell "></HeaderStyle>
                            <ItemStyle CssClass="d-none d-lg-table-cell"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="estado" HeaderText="estado" SortExpression="estado">
                            <HeaderStyle CssClass="bg-info text-white"></HeaderStyle>
                            <ControlStyle CssClass="form-control" />
                            
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [inscritos] WHERE [id_oferta_demanda] = @id_oferta_demanda" InsertCommand="INSERT INTO [inscritos] ([idOferta], [idDemandante], [estado], [fecha_inscripcio]) VALUES (@idOferta, @idDemandante, @estado, @fecha_inscripcio)" SelectCommand="SELECT inscritos.estado, inscritos.fecha_inscripcio, Demandante.nombre, Demandante.curriculum, Demandante.especialidad, inscritos.id_oferta_demanda FROM inscritos INNER JOIN Demandante ON inscritos.idDemandante = Demandante.idDemandante WHERE (inscritos.idOferta = @idOferta)" UpdateCommand="UPDATE inscritos SET  estado = @estado WHERE (id_oferta_demanda = @id_oferta_demanda)">
                    <DeleteParameters>
                        <asp:Parameter Name="id_oferta_demanda" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="idOferta" Type="Int32" />
                        <asp:Parameter Name="idDemandante" Type="Int32" />
                        <asp:Parameter Name="estado" Type="String" />
                        <asp:Parameter Name="fecha_inscripcio" Type="DateTime" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridView1" Name="idOferta" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="estado" Type="String" />
                        <asp:Parameter Name="id_oferta_demanda" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <br />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [tipoOferta], [descripcion], [ciudad], [perNecesarias], [precioOferta], [Revisada], [Especialidad], [idOferta] FROM [OfertaEmpleo] WHERE ([idEmpresa] = @idEmpresa)">
                    <SelectParameters>
                        <asp:SessionParameter Name="idEmpresa" SessionField="idEmpresa" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
            <asp:Label runat="server" ID="lblMensaje"></asp:Label>
        </div>
    </div>
</asp:Content>

