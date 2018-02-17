<%@ Page Title="" Language="C#" MasterPageFile="~/AngelHelpers.master" AutoEventWireup="true" CodeFile="Perfil.aspx.cs" Inherits="Demandante_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderLogin" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="jumbotron">
            <h2 class="h2">
                <asp:label runat="server" text="Label">Configuración</asp:label>
            </h2>
        </div>

        <div class="card">
            <div class="card-header">
                <div class="row">
                    <div class="col-md-6">
                        <h4>Ajustes de perfil</h4>
                        <asp:label runat="server" text="Label">Actualiza tu nombre,tu dirección, el correo electrónico o añade idiomas  </asp:label>
                    </div>
                    <div class="col-md-6 text-right">
                        <asp:button runat="server" text="Actualizar" cssclass="btn btn-outline-primary" OnClick="Unnamed3_Click" />
                    </div>
                </div>


            </div>



            <asp:sqldatasource id="SqlDataSource1" runat="server" connectionstring="<%$ ConnectionStrings:ConnectionString %>" selectcommand="SELECT [idioma], [nivel] FROM [Sabe] WHERE ([idDemandante] = @idDemandante)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblIdDemandante" Name="idDemandante" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:sqldatasource>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group row">
                            <br />
                            <div class="col-sm-3">
                                <asp:label runat="server" id="lblNombre" associatedcontrolid="txtNombre">Nombre:</asp:label>
                            </div>
                            <div class="col-sm-9">
                                <asp:textbox runat="server" id="txtNombre" cssclass="form-control"></asp:textbox>
                            </div>

                        </div>
                        <div class="form-group row">
                            <br />
                            <div class="col-sm-3">
                                <asp:label runat="server" id="lblApellido" associatedcontrolid="txtApellido">Apellidos:</asp:label>
                            </div>
                            <div class="col-sm-9">
                                <asp:textbox runat="server" id="txtApellido" cssclass="form-control"></asp:textbox>
                            </div>

                        </div>
                        <hr />
                        <div class="form-group row">
                            <br />
                            <div class="col-sm-3">
                                <asp:label runat="server" id="lblEmail" associatedcontrolid="txtEmail">Dirección de correo electronico:</asp:label>
                            </div>
                            <div class="col-sm-9">
                                <asp:textbox runat="server" id="txtEmail" cssclass="form-control"></asp:textbox>
                            </div>
                        </div>
                        <div class="form-group row">
                            <br />
                            <div class="col-sm-3">
                                <asp:label runat="server" id="lblTlf" associatedcontrolid="txtTelefono">Número de telefono:</asp:label>
                            </div>
                            <div class="col-sm-9">
                                <asp:textbox runat="server" id="txtTelefono" cssclass="form-control"></asp:textbox>
                            </div>
                        </div>
                        <hr />
                        <div class="form-group row">
                            <br />
                            <div class="col-sm-4">
                                <asp:label runat="server" id="Label2" associatedcontrolid="txtCurri">Añade o modifica tu Currículo:</asp:label>
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
                                <asp:label runat="server" id="Label1" placeholder="Alzheimer.. " associatedcontrolid="txtEspecialidad">Especialidad:</asp:label>
                            </div>
                            <div class="col-sm-8">
                                <asp:dropdownlist runat="server" cssclass="form-control" id="txtEspecialidad">
                            <asp:ListItem Enabled="true" Text="Ninguna"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="Minusvalia"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="Alzheimer"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="Diabetes"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="Problemas auditivos"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="Hipertension"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="Parkinson      "></asp:ListItem>
                        </asp:dropdownlist>
                            </div>
                        </div>
                        <div class="col">
                            <asp:label runat="server" id="lblIdDemandante" visible="false"></asp:label>
                            <asp:listview runat="server" id="listIdiomas" datasourceid="SqlDataSource1">    
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
                                    <table runat="server" style="width:100%">
                                        <tr runat="server">
                                            <td runat="server">
                                                <table id="itemPlaceholderContainer" runat="server" border="0"  class="table table-striped table-bordered table-hover" >
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
                            </asp:listview>
                        </div>
                        <div class="col-sm-12">

                            <asp:button runat="server" text="Idiomas" width="100%" cssclass="btn btn-primary " onclick="Unnamed4_Click" />
                            <asp:placeholder runat="server" id="idiomas" visible="false">
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
                        </asp:placeholder>

                        </div>
                    </div>
                    <hr />


                </div>
                <br />
                <div class="text-center">
                    <asp:button runat="server" cssclass="btn btn-danger" text="Desactivar perfil" onclientclick=" return confirm('Seguro desea desactrivar su usario?');" onclick="Unnamed5_Click" />
                    <asp:label runat="server" id="lblMensajes"></asp:label>
                </div>

            </div>

        </div>



        <br />



    </div>




</asp:Content>

