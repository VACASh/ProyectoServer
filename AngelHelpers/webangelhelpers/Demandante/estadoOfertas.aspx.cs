using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Demandante_estadoOfertas : System.Web.UI.Page
{
    static string sesion, resultado;
    static int idDemandante;
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (Convert.ToString(Session["idRol"]) != "demandante")
        {
            Response.Redirect("~/Index.aspx");
        }
        lblTipoUser.Text = Convert.ToString(Session["idRol"]);

        if (!IsPostBack)
        {

             sesion = Session["idUsuario"].ToString();
           

        }
    }
}