<%@ Page Title="" Language="C#" MasterPageFile="~/AngelHelpers.master" AutoEventWireup="true" CodeFile="Perfil.aspx.cs" Inherits="Demandante_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderLogin" runat="Server">
    <asp:Label runat="server" ID="lblTipoUser"></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="jumbotron">
            <h2 class="h2">
                <asp:Label runat="server" Text="Label">Configuración</asp:Label>
            </h2>
        </div>

        <div class="card">
            <div class="card-header bg-success text-white">
                <div class="row">
                    <div class="col-md-6">
                        <h4>Ajustes de perfil</h4>
                        <asp:Label runat="server" Text="Label">Actualiza tu nombre,tu dirección, el correo electrónico o añade idiomas  </asp:Label>
                        <asp:Label runat="server" ID="lblActualuizar" Font-Bold="true" ForeColor="#dc3545"></asp:Label>
                    </div>
                    <div class="col-md-6 text-right">
                        <asp:Button runat="server" Text="Actualizar" CssClass="btn btn-outline-dark" OnClick="Unnamed3_Click" />
                    </div>
                </div>


            </div>



            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [idioma], [nivel] FROM [Sabe] WHERE ([idDemandante] = @idDemandante)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblIdDemandante" Name="idDemandante" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group row">
                            <br />
                            <div class="col-sm-3">
                                <asp:Label runat="server" ID="lblNombre" AssociatedControlID="txtNombre">Nombre:</asp:Label>
                            </div>
                            <div class="col-sm-9">
                                <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control"></asp:TextBox>
                            </div>

                        </div>
                        <div class="form-group row">
                            <br />
                            <div class="col-sm-3">
                                <asp:Label runat="server" ID="lblApellido" AssociatedControlID="txtApellido">Apellidos:</asp:Label>
                            </div>
                            <div class="col-sm-9">
                                <asp:TextBox runat="server" ID="txtApellido" CssClass="form-control"></asp:TextBox>
                            </div>

                        </div>
                        <hr />
                        <div class="form-group row">
                            <br />
                            <div class="col-sm-3">
                                <asp:Label runat="server" ID="lblEmail" AssociatedControlID="txtEmail">Dirección de correo electronico:</asp:Label>
                            </div>
                            <div class="col-sm-9">
                                <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <br />
                            <div class="col-sm-3">
                                <asp:Label runat="server" ID="lblTlf" AssociatedControlID="txtTelefono">Número de telefono:</asp:Label>
                            </div>
                            <div class="col-sm-9">
                                <asp:TextBox runat="server" ID="txtTelefono" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <hr />
                        <div class="form-group row">
                            <br />
                            <div class="col-sm-4">
                                <asp:Label runat="server" ID="Label2" AssociatedControlID="txtCurri">Añade o modifica tu Currículo:</asp:Label>
                            </div>
                            <div class="col-sm-8">
                                <asp:FileUpload CssClass=" custom-file" ID="txtCurri" runat="server" />
                            </div>
                        </div>
                        <hr />
                    </div>

                    <div class="col-md-6">
                        <h5>Idiomas y especialidad</h5>
                        <div class="form-group row">
                            <br />

                            <div class="col-sm-4">
                                <asp:Label runat="server" ID="Label1" placeholder="Alzheimer.. " AssociatedControlID="txtEspecialidad">Especialidad:</asp:Label>
                            </div>
                            <div class="col-sm-8">
                                <asp:DropDownList runat="server" CssClass="form-control" ID="txtEspecialidad">
                                    <asp:ListItem Enabled="true" Text="Ninguna"></asp:ListItem>
                                    <asp:ListItem Enabled="true" Text="Minusvalia"></asp:ListItem>
                                    <asp:ListItem Enabled="true" Text="Alzheimer"></asp:ListItem>
                                    <asp:ListItem Enabled="true" Text="Diabetes"></asp:ListItem>
                                    <asp:ListItem Enabled="true" Text="Problemas auditivos"></asp:ListItem>
                                    <asp:ListItem Enabled="true" Text="Hipertension"></asp:ListItem>
                                    <asp:ListItem Enabled="true" Text="Parkinson"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col">
                            <asp:Label runat="server" ID="lblIdDemandante" Visible="false"></asp:Label>
                            <asp:ListView runat="server" ID="listIdiomas" DataSourceID="SqlDataSource1">
                                <EmptyDataTemplate>
                                    <table runat="server" style="">
                                        <tr>
                                            <td>No ha añadido ningun idioma.</td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
                                <ItemTemplate>
                                    <tr style="">
                                        <td class="col-6">
                                            <asp:Label ID="idiomaLabel" runat="server" Text='<%# Eval("idioma") %>' />
                                        </td>
                                        <td class="col-6">
                                            <asp:Label ID="nivelLabel" runat="server" Text='<%# Eval("nivel") %>' />
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <table runat="server" style="width: 100%">
                                        <tr runat="server">
                                            <td runat="server">
                                                <table id="itemPlaceholderContainer" runat="server" border="0" class="table table-striped table-bordered table-hover">
                                                    <tr runat="server" style="">
                                                        <th runat="server" class="col-6">idioma</th>
                                                        <th runat="server" class="col-6">nivel</th>
                                                    </tr>
                                                    <tr id="itemPlaceholder" runat="server">
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </LayoutTemplate>
                            </asp:ListView>
                        </div>
                        <div class="col-sm-12">

                            <asp:Button runat="server" Text="Idiomas" Width="100%" CssClass="btn btn-primary " OnClick="Unnamed4_Click" />
                            <asp:PlaceHolder runat="server" ID="idiomas" Visible="false">
                                <div class="card">
                                    <br />
                                    <asp:DropDownList runat="server" CssClass="form-control" ID="ddlIdiomas">
                                        <asp:ListItem Enabled="true">Inglés</asp:ListItem>
                                        <asp:ListItem Enabled="true">Francés</asp:ListItem>
                                        <asp:ListItem Enabled="true">Aleman</asp:ListItem>
                                        <asp:ListItem Enabled="true">Chino</asp:ListItem>
                                        <asp:ListItem Enabled="true">Griego</asp:ListItem>
                                        <asp:ListItem Enabled="true">Italiano</asp:ListItem>
                                        <asp:ListItem Enabled="true">Noruego</asp:ListItem>
                                        <asp:ListItem Enabled="true">Portugues</asp:ListItem>
                                        <asp:ListItem Enabled="true">Ruso</asp:ListItem>
                                    </asp:DropDownList>
                                    <br />
                                    <asp:DropDownList runat="server" CssClass="form-control" ID="ddlNivel">
                                        <asp:ListItem Enabled="true">Básico</asp:ListItem>
                                        <asp:ListItem Enabled="true">Intermedio</asp:ListItem>
                                        <asp:ListItem Enabled="true">Avanzado</asp:ListItem>
                                    </asp:DropDownList>
                                    <br />
                                    <asp:Button runat="server" Text="Añadir" CssClass="btn btn-success" OnClick="Unnamed5_Click1" />
                                </div>
                            </asp:PlaceHolder>

                        </div>
                    </div>
                    <hr />


                </div>
                <br />
                <div class="text-center">
                    <asp:Button runat="server" CssClass="btn btn-danger" Text="Desactivar perfil" OnClientClick=" return confirm('Seguro desea desactrivar su usario?');" OnClick="Unnamed5_Click" />
                    <asp:Label runat="server" ID="lblMensajes"></asp:Label>
                </div>

            </div>

        </div>



        <br />



    </div>




</asp:Content>

