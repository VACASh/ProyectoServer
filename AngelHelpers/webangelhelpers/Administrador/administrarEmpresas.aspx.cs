using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administrador_administrarEmpresas : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string admin = Convert.ToString(Session["idRol"]);
        if (Convert.ToString(Session["idRol"]) != "administrador")
        {
            Response.Redirect("~/Index.aspx");
        }
        lblDatosUsuario.Text = Convert.ToString(Session["idRol"]);
    }



    protected void grdEmpresas_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
}