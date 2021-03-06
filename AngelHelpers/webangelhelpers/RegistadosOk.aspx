﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegistadosOk.aspx.cs" Inherits="RegistadosOk" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css"
        integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous" />
    <style>
        *{
            background-color:ghostwhite;
        }
        body {
            font-family: roboto;
            max-width: 600px;
            margin: 0 auto;
           
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <h2 class="text-center">El registro se ha realizado correctamente</h2>
            <p>Su cuenta va a ser revisada por un administrador en un plazo masimo de 24h se le enviara un E-mail confirmando la activación de la cuenta.</p>
            <div class="text-center">
                <asp:HyperLink runat="server" NavigateUrl="~/Index.aspx" > <img src="/imagenes/ok.png" class="rounded" alt="Registro ok" /></asp:HyperLink>      
            </div>
        </div>
    </form>
</body>
</html>
