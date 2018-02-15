<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="ControlError.aspx.cs" Inherits="ControlError" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="card">
            <div class="card-header">
                <h2 class="h2">Control de errores</h2>
            </div>
            <div class="card-body">
                <p><span style="color:red">*</span>Comprueba que no esta intentando modificar una clave ajena o principal ligada a otras tablas</p>
                <p>Erro ASP.NET:<asp:Label runat="server" ForeColor="Red" ID="lblErrorAsp"></asp:Label></p>
                <p>Error Ado.NET<asp:Label runat="server" ForeColor="Red" ID="lblErrorAdo"></asp:Label></p>

            </div>
        </div>
    </div>

</asp:Content>

