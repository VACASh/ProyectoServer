<%@ Page Language="C#" AutoEventWireup="true" CodeFile="registro.aspx.cs" Inherits="registro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Registro</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <!-- Website Font style -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css" />

    <!-- Google Fonts -->
    <link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css' />
    <link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css' />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <!-- bootstrap-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css"
        integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous" />


    <style>
        /* color rojo = #dc3545*/
        body, html {
            height: 100%;
            background-repeat: no-repeat;
            background-color: #d3d3d3;
        }

        .main {
            margin-top: 70px;
        }

        h1.title {
            font-size: 50px;
            font-family: 'Passion One', cursive;
            font-weight: 400;
        }

        hr {
            width: 10%;
            color: #fff;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            margin-bottom: 15px;
            font-size: 0.75em;
        }

        input,
        input::-webkit-input-placeholder {
            font-size: 11px;
            padding-top: 3px;
        }

        .main-login {
            background-color: #fff;
            /* shadows and rounded borders */
            -moz-border-radius: 2px;
            -webkit-border-radius: 2px;
            border-radius: 2px;
            -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
            -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
            box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        }

        .main-center {
            margin-top: 30px;
            margin: 0 auto;
            max-width: 330px;
            padding: 15px;
        }

        .login-button {
            margin-top: 5px;
        }

        .login-register {
            font-size: 11px;
            text-align: center;
        }

        .registrar {
            border-top: 4px solid orange;
        }

        .acceder {
            font-size: 1.5rem;
            font-weight: 300;
            border-radius: 0;
            border-top: 4px solid #ccc;
            border-bottom: 2px solid #ccc;
            border-left: 1px solid #ccc;
            border-right: 1px solid #ccc;
            background-color: #ebeced;
        }

            .acceder:hover {
                background-color: #fff;
                border-top: 4px solid orange;
            }

        .margenbot {
            margin-bottom: 0.25em !important;
        }

        label {
            margin: 0px;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="css/general.css" />
</head>
<body>
    <form id="form1" runat="server">

        <div class="container">
            <div class="panel-heading col">
                <div class="panel-title text-center">
                    <h1 class="title ">
                        <asp:LinkButton ID="linkInicio" CssClass="badge badge badge-info" PostBackUrl="~/Index.aspx" runat="server">Angel Helpers</asp:LinkButton></h1>
                    <hr />
                    <div class="main-login main-center" style="padding-top: 0">
                        <div class="row">
                            <div class="col-6 acceder">
                                <h4><a href="Login.aspx" class="acceso" style="color: inherit; text-decoration: none !important;">Acceder</a></h4>
                            </div>
                            <div class="col-6 registrar">
                                <h4><a href="registro.aspx" class="registro" style="color: inherit; text-decoration: none !important;">Registrarse</a></h4>
                            </div>
                        </div>
                        <div class="container" style="padding-left: 35px">
                            <div class="input-group">
                                <asp:Label runat="server" AssociatedControlID="tipoUser">Soy un:</asp:Label>
                            </div>
                            <div class="input-group" style="text-align: justify">
                                <asp:RadioButtonList CssClass="custom-radio" runat="server" AutoPostBack="true" ID="tipoUser" OnSelectedIndexChanged="tipoUser_SelectedIndexChanged">
                                    <asp:ListItem Text="Candidato" Value="Candidato" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="Empresa" Value="Empresa"></asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                            <div>
                                <div>
                                    <div class="input-group">
                                        <asp:TextBox runat="server" required="required" ID="nomUsuario" placeholder="Nombre de Usuario..." CssClass="margenbot form-control"></asp:TextBox>
                                    </div>  
                                </div>
                                <div>
                                    <div class="input-group">
                                        <asp:TextBox runat="server" required="required" ID="nombre" placeholder="Nombre de Candadidato/Empresa..." CssClass="margenbot form-control"></asp:TextBox>
                                    </div>
                                    
                                </div>
                                <div>
                                    <div class="input-group">
                                        <asp:TextBox runat="server" required="required" ID="txtPassword" placeholder="Ingrese el password..." TextMode="Password" CssClass="form-control margenbot"></asp:TextBox>
                                    </div>
                                   
                                </div>
                                <div>
                                    <div class="input-group">
                                        <asp:TextBox runat="server" required="required" ID="txtPass2" placeholder="Vuelva a ingresar el password..." TextMode="Password" CssClass="form-control margenbot"></asp:TextBox>
                                    </div>
                                    
                                </div>
                                <div>
                                    <div class="input-group">
                                        <asp:TextBox runat="server" required="required" ID="Apellidos" placeholder="Apellidos..." CssClass="form-control margenbot"></asp:TextBox>
                                    </div>
                                    
                                </div>
                                <div>
                                    <div class="input-group">
                                        <asp:TextBox runat="server" required="required" placeholder="Ciudad...." Visible="false" ID="Ciudad" CssClass="form-control margenbot"></asp:TextBox>
                                    </div>
                                    
                                </div>
                                <div>
                                    <div class="input-group">
                                        <asp:TextBox runat="server" required="required" placeholder="Dirección..." Visible="false" ID="Direccion" CssClass="form-control margenbot"></asp:TextBox>
                                    </div>
                                   
                                </div>
                                <div>
                                    <div class="input-group">
                                        <asp:TextBox runat="server" required="required" ID="Tlf" placeholder="Número de telefono...." CssClass="form-control margenbot"></asp:TextBox>
                                    </div>
                                    
                                </div>
                                <div>
                                    <div class="input-group">
                                        <asp:TextBox runat="server" required="required" ID="Email" placeholder="Correo Electrónico..." CssClass="form-control margenbot"></asp:TextBox>
                                    </div>
                                    
                                </div>

                                <div>
                                    <div class="input-group">
                                        <asp:Label runat="server" required="required" ID="lblEspecialidad" AssociatedControlID="especialidad">Especialdiad:</asp:Label>
                                    </div>
                                    <div class="input-group">
                                        <asp:DropDownList ID="especialidad" CssClass="form-control margenbot" runat="server">
                                            <asp:ListItem Selected="True" Text="Ninguna" Value="Ninguna"></asp:ListItem>
                                            <asp:ListItem Text="Alzhemier" Value="alzhemier"></asp:ListItem>
                                            <asp:ListItem Text="Minusvalía" Value="minusvalia"></asp:ListItem>
                                            <asp:ListItem Text="Parkinson" Value="parkinson"></asp:ListItem>
                                            <asp:ListItem Text="Diabetes" Value="Diabetes"></asp:ListItem>
                                            <asp:ListItem Text="Problemas auditivos" Value="problemas auditivos"></asp:ListItem>
                                            <asp:ListItem Text="Hipertensión" Value="hipertension"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div>
                                    <div class="input-group">
                                        <asp:Label runat="server" ID="lblCurriculo" AssociatedControlID="curriculo">Currículo:</asp:Label>
                                    </div>
                                    <div class="input-group">
                                        <asp:FileUpload runat="server" CssClass="form-control-file" ID="curriculo" />
                                    </div>
                                </div>
                            </div>
                            <br />
                            <asp:Button runat="server" ID="btnEnviar" Text="Registrar" CssClass="btn btn-outline-success" OnClick="btnEnviar_Click" /><br />
                            <asp:Label ID="lblMensajes" runat="server" Text="" CssClass="text-center" ForeColor="Red"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js" integrity="sha384-a5N7Y/aK3qNeh15eJKGWxsqtnX/wWdSZSKp+81YjTmS15nvnvxKHuzaWwXHDli+4" crossorigin="anonymous"></script>

</body>
</html>
