<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="Contabilidad.aspx.cs" Inherits="Administrador_Contabilidad" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            font-size: medium;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="row">
            <div class="card col-lg-6">
                <div class="card-header">
                    <h5 class="h5">Desglose total gastado por cada empresa</h5>
                </div>
                <div class="card-body">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" style="font-size: small">
                        <Columns>
                            <asp:BoundField DataField="nomEmpresa" HeaderText="nomEmpresa" SortExpression="nomEmpresa">
                                <ControlStyle CssClass="form-control" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Nº de ofertas" HeaderText="Nº de ofertas" ReadOnly="True" SortExpression="Nº de ofertas">
                                <ControlStyle CssClass="form-control" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Total gastado" HeaderText="Total gastado" ReadOnly="True" SortExpression="Total gastado" DataFormatString="{0:c}">
                                <ControlStyle CssClass="form-control" />
                            </asp:BoundField>
                        </Columns>
                        <HeaderStyle BackColor="#17A2B8" />
                    </asp:GridView>
                </div>
            </div>

            <div class="card col-lg-6">
                <div class=" card-header">
                     <h5 class="h5">Desglose de ganancias totales</h5>
                </div>
                <div class="card-body text-center">
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" CssClass="table table-striped table-bordered table-hover" HorizontalAlign="Center">
                        <Columns>
                            <asp:BoundField DataField="Total" HeaderText="Total" ReadOnly="True" SortExpression="Total" DataFormatString="{0:c}" />
                        </Columns>
                        <HeaderStyle BackColor="#007BFF" />
                    </asp:GridView>
                    <div>

                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT SUM(precioOferta) AS Total FROM OfertaEmpleo"></asp:SqlDataSource>
                    </div>
                </div>
            </div>
        </div>

    </div>


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Empresa.nomEmpresa, COUNT(OfertaEmpleo.precioOferta) AS [Nº de ofertas], SUM(OfertaEmpleo.precioOferta) AS [Total gastado] FROM Empresa INNER JOIN OfertaEmpleo ON Empresa.idEmpresa = OfertaEmpleo.idEmpresa GROUP BY Empresa.nomEmpresa"></asp:SqlDataSource>
</asp:Content>

