using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Empresa_indexEmpresa : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToString(Session["idRol"]) != "empresa")
        {
            Response.Redirect("~/Index.aspx");
        }
        lblUserInfo.Text = Convert.ToString(Session["idRol"]);
    }
}