<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageEmpresa.master" AutoEventWireup="true" CodeFile="indexEmpresa.aspx.cs" Inherits="Empresa_indexEmpresa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="info" runat="server" ContentPlaceHolderID="infoUser">
    <asp:Label runat="server" ID="lblUserInfo" ForeColor="White"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="jumbotron">
            <h3 class="h3">Empresa
            </h3>
            <p>
                Apartado de empresa aqui podras administrar tus ofertas,publicar nuevas ofertas, filtrar candidatos,
            y consultar sus curriculums, asi como descartar o modificar el estado de su candidatura.
            </p>
        </div>

        <div class="row">
            <div class="col-md-4">
                <div class="card bg-light mb-3 ">
                    <div class="text-center">
                        <img class="card-img-top text-center" src="/imagenes/publicarOferta.jpg" alt="Publicar oferta">
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Publica un oferta de empleo</h5>
                        <p class="card-text">
                            Publica una nueva oferta de empleo para encontrar a tu candidato ideal. 
                                El anuncio sera revisado por nuestros administradores con la mayor brevedad posible.
                        </p>
                        <p>
                            Sera informado vía E-mail en cuanto la oferta este activa.
                        </p>
                        <a href="publicarOferta.aspx" class="btn btn-primary">Publicar</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card bg-light mb-3 ">
                    <div class="text-center">
                        <img class="card-img-top text-center" src="/imagenes/proceso.png" alt="Publicar oferta">
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Proceso de selección</h5>
                        <p class="card-text">
                            Haz el seguimiento del proceso de seleccion y modificalor a tu gusto el estado, pudiendo consultar los currículos de los candidatos.
                            
                        </p>
                        <p>
                            Sera informado vía E-mail en cuanto la oferta este activa.
                        </p>
                        <a href="gestionCandidatos.aspx" class="btn btn-primary">Consultar</a>
                    </div>
                </div>

            </div>
            <div class="col-md-4">
                <div class="card bg-light mb-3 ">
                    <div class="text-center">
                        <img class="card-img-top text-center" src="/imagenes/editar.png" alt="Editar oferta">
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Editar publicaciones</h5>
                        <p class="card-text">
                            Modifica tus ofertas de empleo para adaptarlos a las necesidades de tu empresa o modificala para que sea otro tipo de oferta adaptada a las nuevas necesidades de la empresa
                        </p>

                        <a href="revisarOfertasEmpresa.aspx" class="btn btn-primary">Editar</a>
                    </div>
                </div>
            </div>

        </div>
    </div>
</asp:Content>

