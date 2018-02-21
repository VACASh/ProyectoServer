<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ControlError.aspx.cs" Inherits="ControlError" %>

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
            <div class="card">
                <div class="card-header">
                    <h2 class="h2">Control de errores</h2>
                </div>
                <div class="card-body">
                    <p><span style="color: red">*</span>Comprueba que no esta intentando modificar una clave ajena o principal ligada a otras tablas</p>
                    <p>Error ASP.NET:<asp:Label runat="server" ForeColor="Red" ID="lblErrorAsp"></asp:Label></p>
                    <p>Error Ado.NET<asp:Label runat="server" ForeColor="Red" ID="lblErrorAdo"></asp:Label></p>

                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </form>
</body>
</html>
