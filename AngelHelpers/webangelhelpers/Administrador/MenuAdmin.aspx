<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="MenuAdmin.aspx.cs" Inherits="Administrador_MenuAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="contentnav" ContentPlaceHolderID="nav" runat="server">
    <asp:Label ID="lblDatosUsuario" runat="server" ForeColor="#bd2130"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="jumbotron">
            <h3 class="h3">Administrador
            </h3>
            <p>
                Apartado de administrador donde podras activar/desactivar usuarios ya sea empresa o candidato.
            </p>
            <p>
                Tambien puedes revisar las ofertas y activarlas, y consultar si tienen denuncias por ser falso o abusivo.           
            </p>
        </div>

        <div class="row">
            <div class="col-md-4">
                <div class="card bg-light mb-3 ">
                    <div class="text-center">
                        <img class="card-img-top text-center" src="/imagenes/revisar.jpg" alt="Publicar oferta">
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Revisar y activar ofertas de empleo</h5>
                        <p class="card-text">
                            Gestiona las ofertas de empleo realizadas por las empresas para poder activarlas en caso de ser adecuadas.
                        </p>
                        <a href="RevisarOfertas.aspx" class="btn btn-primary">Revisar</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card bg-light mb-3 ">
                    <div class="text-center">
                        <img class="card-img-top text-center" src="/imagenes/usuarios.jpg" alt="Publicar oferta">
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Gestion de usuarios</h5>
                        <p class="card-text">
                            Administra desactivando o activando cualquier tipo de usuario. Si el usuario es desactivado no podra conectar a la aplicación.
                        </p>                      
                        <a href="administrarCandidatos.aspx" class="btn btn-primary">Candidatos</a>
                        <a href="administrarEmpresas.aspx" class="btn btn-primary">Empresa</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card bg-light mb-3 ">
                    <div class="text-center">
                        <img class="card-img-top text-center" src="/imagenes/dinero.jpg" alt="Editar oferta">
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Contabilidad</h5>
                        <p class="card-text">
                            Muestra la contabilidad de la empresa mostrando todo lo gastado por cada empresa y el total de beneficios. </p>

                        <a href="Contabilidad.aspx" class="btn btn-primary">Mostrar</a>
                    </div>
                </div>
            </div>

        </div>
    </div>
</asp:Content>

