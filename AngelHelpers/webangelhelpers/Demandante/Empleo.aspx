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
                <asp:Button runat="server" CssClass="btn col-sm-4 text-center" Text="Buscar ofertas" OnClick="Unnamed2_Click" />
            </div>
            <asp:Label ID="lblMensaje" runat="server"></asp:Label>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="idOferta" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField SelectText="Inscribirse" ShowSelectButton="True">
                <ControlStyle CssClass="btn btn-success" />
                </asp:CommandField>
                <asp:BoundField DataField="idOferta" HeaderText="idOferta" InsertVisible="False" ReadOnly="True" SortExpression="idOferta" />
                <asp:BoundField DataField="tipoOferta" HeaderText="tipoOferta" SortExpression="tipoOferta" />
                <asp:BoundField DataField="descripcion" HeaderText="descripcion" SortExpression="descripcion" />
                <asp:BoundField DataField="ciudad" HeaderText="ciudad" SortExpression="ciudad" />
                <asp:BoundField DataField="perNecesarias" HeaderText="perNecesarias" SortExpression="perNecesarias" />
                <asp:BoundField DataField="Especialidad" HeaderText="Especialidad" SortExpression="Especialidad" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT idOferta, tipoOferta, descripcion, ciudad, perNecesarias, Especialidad FROM OfertaEmpleo WHERE (ciudad = @ciudad) OR (Especialidad = @Especialidad)">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtBusqueda" Name="ciudad" PropertyName="Text" />
                <asp:ControlParameter ControlID="txtBusqueda" Name="Especialidad" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Label ID="lblResultado" runat="server"></asp:Label>
    </div>
    
</asp:Content>

