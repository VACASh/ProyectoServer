<%@ Page Title="" Language="C#" MasterPageFile="~/AngelHelpers.master" AutoEventWireup="true" CodeFile="MenuUsuario.aspx.cs" Inherits="MenuUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderLogin" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="jumbotron">
            <h3 class="h3">AngelHelpers</h3>
            <p>Somos una ampresa dedicada a la busqueda de empleo en el ambito del cuidado de personas de la 3ª edad</p>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="card bg-light mb-3 ">
                    <div class="text-center">
                        <img class="card-img-top text-center" style="max-width: 50%" src="/imagenes/uk.png" alt="Bootstrap image">
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Añade aptitudes a tu curriculum</h5>
                        <p class="card-text">
                            Muchas empresas filtran candidatos por Idiomas o por especialidad actualiza tu 
                                 currículum para ser más accesible a las empresas que buscan candidatos
                        </p>
                        <a href="Perfil.aspx" class="btn btn-primary">Perfil</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card bg-light mb-3 ">
                    <img class="card-img-top " src="/imagenes/buscar.jpg" alt="Bootstrap image">

                    <div class="card-body">
                        <h5 class="card-title">Encuentra tu trabajo</h5>
                        <p class="card-text">Busca tu empleo basandote en en tu localidad o en una aptitud</p>
                        <a href="#" class="btn btn-primary">Buscar</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card bg-light mb-3 ">
                    <img class="card-img-top " src="/imagenes/revisar.png" alt="Bootstrap image">

                    <div class="card-body">
                        <h5 class="card-title">Revisar candidaturas</h5>
                        <p class="card-text">Consulta el estado de tu candidatura o date de baja en cualquier momento de una candidatura</p>
                        <a href="#" class="btn btn-primary">Candidaturas</a>
                    </div>
                </div>
            </div>

        </div>

    </div>
</asp:Content>

