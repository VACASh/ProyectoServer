<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="Denuncias.aspx.cs" Inherits="Denuncias" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="card">
            <div class="card-header">
                <h2 class="h2">Denuncias de ofertas de empleo</h2>
                <asp:Label runat="server">Revisión de las denuncias realizadas por usuarios a una oferta de empleo falsa u ofensiva</asp:Label>
            </div>
            <div class="card-body">
                <p style="color: red" class="d-block d-xl-none">*La visluazación correcta sera mostrada en panatallas grandes.</p>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover" DataKeyNames="idOferta">
                    <Columns>
                        <asp:BoundField DataField="idOferta" HeaderText="idOferta" ReadOnly="True" SortExpression="idOferta" InsertVisible="False">
                            <ControlStyle CssClass="form-control" />
                            <HeaderStyle CssClass="d-none d-sm-table-cell"></HeaderStyle>
                            <ItemStyle CssClass="d-none d-sm-table-cell"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="nomEmpresa" HeaderText="Nombre empresa" SortExpression="nomEmpresa">
                            <ControlStyle CssClass="form-control" />

                        </asp:BoundField>
                        <asp:BoundField DataField="Total denuncias" HeaderText="Total denuncias" SortExpression="Total denuncias" ReadOnly="True">
                            <ControlStyle CssClass="form-control" />

                        </asp:BoundField>
                        <asp:CommandField ShowSelectButton="True">
                            <ControlStyle CssClass="btn btn-outline-success" />
                        </asp:CommandField>
                    </Columns>
                    <HeaderStyle BackColor="#17A2B8" Font-Size="Small" />
                </asp:GridView>
                <div class="row">
                    <div class="col-md-6">
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover" DataKeyNames="idOferta" DataSourceID="SqlDataSource2">
                            <Columns>
                                <asp:BoundField DataField="idOferta" HeaderText="idOferta" InsertVisible="False" ReadOnly="True" SortExpression="idOferta"></asp:BoundField>
                                <asp:CheckBoxField DataField="Revisada" HeaderText="Activar" SortExpression="Revisada">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />

                                </asp:CheckBoxField>
                                <asp:TemplateField HeaderText="descripcion" SortExpression="descripcion">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" TextMode="MultiLine" Rows="7"  width="15em" runat="server" Text='<%# Bind("descripcion") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("descripcion") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ControlStyle CssClass="form-control" />
                                    <HeaderStyle CssClass="d-none d-xl-table-cell" />
                                    <ItemStyle CssClass="d-none d-xl-table-cell" />
                                </asp:TemplateField>
                                <asp:CommandField ShowEditButton="True">
                                    <ControlStyle CssClass="btn btn-outline-primary" />
                                </asp:CommandField>
                            </Columns>
                            <HeaderStyle BackColor="#007bff" Font-Size="Small" />
                        </asp:GridView>
                    </div>
                    <div class="col-md-6">
                        <asp:GridView ID="GridView3" runat="server" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" DataSourceID="SqlDataSource3">
                            <Columns>
                                <asp:BoundField DataField="idOferta" HeaderText="idOferta" SortExpression="idOferta">
                                    <ControlStyle CssClass="form-control" />
                                    <HeaderStyle CssClass="d-none "></HeaderStyle>
                                    <ItemStyle CssClass="d-none "></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="idDemandante" HeaderText="ID Demandante" SortExpression="idDemandante" />
                                <asp:BoundField DataField="descripcion_denuncia" HeaderText="Descripción denuncia" SortExpression="descripcion_denuncia" />
                            </Columns>
                            <HeaderStyle BackColor="#dc3545" Font-Size="Small" />
                        </asp:GridView>
                    </div>
                </div>


                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [idOferta], [Revisada], [descripcion] FROM [OfertaEmpleo] WHERE ([idOferta] = @idOferta)" DeleteCommand="DELETE FROM [OfertaEmpleo] WHERE [idOferta] = @idOferta" InsertCommand="INSERT INTO [OfertaEmpleo] ([Revisada], [descripcion]) VALUES (@Revisada, @descripcion)" UpdateCommand="UPDATE [OfertaEmpleo] SET [Revisada] = @Revisada, [descripcion] = @descripcion WHERE [idOferta] = @idOferta">
                    <DeleteParameters>
                        <asp:Parameter Name="idOferta" Type="Int64" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Revisada" Type="Boolean" />
                        <asp:Parameter Name="descripcion" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridView1" Name="idOferta" PropertyName="SelectedValue" Type="Int64" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Revisada" Type="Boolean" />
                        <asp:Parameter Name="descripcion" Type="String" />
                        <asp:Parameter Name="idOferta" Type="Int64" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>



    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT COUNT(Denuncia.idOferta) AS [Total denuncias], Empresa.nomEmpresa, OfertaEmpleo.idOferta FROM Denuncia INNER JOIN OfertaEmpleo ON Denuncia.idOferta = OfertaEmpleo.idOferta INNER JOIN Empresa ON OfertaEmpleo.idEmpresa = Empresa.idEmpresa GROUP BY Empresa.nomEmpresa, OfertaEmpleo.idOferta HAVING (COUNT(Denuncia.idOferta) &gt; 4)"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [idOferta], [idDemandante], [descripcion_denuncia] FROM [Denuncia] WHERE ([idOferta] = @idOferta)">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="idOferta" PropertyName="SelectedValue" Type="Int64" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>

