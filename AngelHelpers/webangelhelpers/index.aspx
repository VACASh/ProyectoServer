<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <nav class="navbar navbar-expand-lg navbar-dark bg-primary">

                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarText">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="Index.aspx">AngelHelpers <span class="sr-only">(current)</span></a>
                        </li>
                    </ul>
                    <asp:HyperLink runat="server" Text="Iniciar sesión/Registrarse" NavigateUrl="~/Login.aspx" ForeColor="Black">Iniciar sesión/Registrarse</asp:HyperLink>
                </div>
            </nav>
        </div>
        <div class="container">
            <div class="jumbotron">
                <h3 class="h3">AngelHelpers
                </h3>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="card border-success">
                        <img class="card-img-top" src="/imagenes/cuidadoanciano1.jpg" alt="Busca trabajo">
                        <div class="card-header">
                            <h5>Trabajo</h5>
                        </div>

                        <div class="card-body">
                            <p>
                                Hoy en día, debido en gran medida a la situación económica por la 
                                    que hemos y estamos pasando, se ha incrementado de manera significativa
                                    la oferta de personas dispuestas a cuidar o asistir a personas mayores a domicilio.
                            </p>
                            <p>
                                Nuestro objetivo es centrarnos en ese sector para que reciba una mayor exclusividad y asi
                                    poder ser un puto de referencia especializado en este sector.
                            </p>
                            <p>
                                Las mejores empresas de este sector se anuncian con nosotros y tambien gente que busca cuidado de sus mayores.
                            </p>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card border-success">
                        <img class="card-img-top" src="/imagenes/empresas.jpg" alt="empresas">
                        <div class="card-header">
                            <h4>Empresas</h4>
                        </div>
                        <div class="card-body">
                            <p>Anuncia aqui tu oferta de empleo ya sea para trabajar en una residencia o cuidado en el hogar.</p>
                            <p>
                                Nuestra exclusividad en este sector hace que los mejores profesionales busquen su empleo aqui. Gente especializada
                                 en cuidado de personas con Alzheimer, Minusvalia, Parkinson .....
                            </p>
                            <p>
                                Nuestros filtros de candidatos te ayudaran a encontrar la persona adecuada para
                                el puesto solicitado, dando una mejor experiencia a la familia y a la persona que necesita atención.
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card border-success">
                        <img class="card-img-top" src="/imagenes/banderas.png" alt="empresas">
                        <div class="card-header">
                            <h4>Nosotros</h4>
                        </div>
                        <div class="card-body">
                            <p>
                                <b>AngelHelpers</b> esta en más de 10 paises dando servicio desde 1998, la experiencia
                                en este sector es nuestro mayor aval.
                            </p>
                            <p>
                                Hemos encontrado puesto de trabajo para mas de 15.684 personas , y nuestra expansión continua pronto
                                comenzaremos nuestra expansión hacia América Latina dando servicio a un continente donde la gente ya
                                tiene la vocazión del cuidado arraigada y que esto supondra una ayuda hacia el crecimiento de estos servicios.

                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <br />
    </form>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
