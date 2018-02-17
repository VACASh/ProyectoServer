<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

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

    <title>Acceder</title>
    <style>
        body, html {
            height: 100%;
            background-repeat: no-repeat;
            background-color: #d3d3d3;
            font-family: 'Oxygen', sans-serif;
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

        .acceder {
            border-top: 4px solid orange;
        }

        .registrar {
            font-size: 1.5rem;
            font-weight: 300;
            border-radius: 0;
            border-top: 4px solid #ccc;
            border-bottom: 2px solid #ccc;
            border-left: 1px solid #ccc;
            border-right: 1px solid #ccc;
            background-color: #ebeced;
        }

            .registrar:hover {
                background-color: #fff;
                border-top: 4px solid orange;
            }

        .registro:hover {
            text-decoration: none !important;
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
                                 <h4> <a href="Login.aspx" class="acceso" style="color:inherit;text-decoration:none !important;">Acceder</a></h4>                          
                            </div>
                            <div class="col-6 registrar">

                                <h4><a href="registro.aspx" class="registro"  style="color:inherit"; >Registrarse</a></h4>
                            </div>
                        </div>
                        <div class="container" style="padding-left: 35px">


                            <asp:Login ID="Login1" runat="server" OnAuthenticate="Login1_Authenticate">
                                <LayoutTemplate>
                                    <div class="form-group">
                                        <div class="cols-sm-10">
                                            <div class="input-group">
                                                <asp:Label ID="UserNameLabel" CssClass="cols-sm-12 control-label" runat="server" AssociatedControlID="UserName">Nombre de usuario:</asp:Label>

                                            </div>
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
                                                <asp:TextBox ID="UserName" CssClass="form-control" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="El nombre de usuario es obligatorio." ForeColor="#dc3545" ToolTip="El nombre de usuario es obligatorio." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">

                                        <div class="cols-sm-10">
                                            <div class="input-group">
                                                <asp:Label ID="PasswordLabel" runat="server" CssClass="cols-sm-2 control-label" AssociatedControlID="Password">Contraseña:</asp:Label>
                                            </div>
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                                <asp:TextBox ID="Password" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="La contraseña es obligatoria." ForeColor="#dc3545" ToolTip="La contraseña es obligatoria." ValidationGroup="Login1">*</asp:RequiredFieldValidator>

                                            </div>
                                        </div>
                                    </div>
                                    <asp:CheckBox ID="RememberMe" runat="server" Text="Recordárme la próxima vez." />
                                    <div style="color: #dc3545">
                                        <p>
                                            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                        </p>

                                    </div>
                                    <div style="padding: 0.25rem">
                                        <asp:Button ID="LoginButton" CssClass="btn btn-outline-success btn-lg" runat="server" CommandName="Login" Text="Inicio de sesión" ValidationGroup="Login1" />
                                    </div>
                                    <div>
                                        <asp:Button runat="server" CssClass="btn btn-outline-info btn-lg" Text="Registrarse" PostBackUrl="~/registro.aspx" />
                                    </div>

                                </LayoutTemplate>
                            </asp:Login>
                            <br />
                            <br />
                            <div class="text-center">
                                <asp:Label ID="lblMensajes" runat="server" ForeColor="Red"></asp:Label>
                            </div>
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
