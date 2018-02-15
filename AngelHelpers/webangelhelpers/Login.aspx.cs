using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    static string idUser;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    

    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        string StrCadenaConexion = "Data Source=(localdb)\\MSSQLLocalDB;AttachDbFilename=" +
          Server.MapPath("~/App_Data/bdAngelHelpers.mdf") +
      ";Integrated Security=True;Connect Timeout=30";

        string StrComandoSql = "SELECT idUsuario, idRol FROM Usuario ";

        StrComandoSql = StrComandoSql + " WHERE idUsuario='" + Login1.UserName + "' ";
        StrComandoSql = StrComandoSql + "AND password='" + Login1.Password + "';";

        try
        {
            SqlConnection conexion = new SqlConnection(StrCadenaConexion);
            SqlCommand comando = new SqlCommand(StrComandoSql, conexion);
            conexion.Open();
            SqlDataReader reader = comando.ExecuteReader();
            if (reader.Read())
            {
               
                Session.Add("idUsuario", reader.GetString(0));
                Session.Add("idRol", reader.GetString(1));

                string id = reader.GetString(1);
                string acomparar = Convert.ToString(Session["idRol"]);
                e.Authenticated = true;
                reader.Close();
                comando.Dispose();
                conexion.Close();


                //if (String.Equals(acomparar.Trim(),"administrador"))
                if (acomparar.Trim() == "administrador")
                    Response.Redirect("~/Administrador/MenuAdmin.aspx");
                if (String.Equals(acomparar.Trim(), "demandante"))
                    Response.Redirect("~/Demandante/MenuUsuario.aspx");
                if (String.Equals(acomparar.Trim(), "empresa"))
                    Response.Redirect("~/Empresa/MenuEmpresa.aspx");


            }
            else
            {
                e.Authenticated = false;
                reader.Close();
                comando.Dispose();
                conexion.Close();

            }
        }
        catch (SqlException ex)
        {
            string StrError = "<p>Se han producido errores en el acceso a la base de datos.</p>";
            StrError = StrError + "<div>Código: " + ex.Number + "</div>";
            StrError = StrError + "<div>Descripción: " + ex.Message + "</div>";
            lblMensajes.Text = StrError;
            return;

        }
    }
}