using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Empresa_filtrarCandidatos : System.Web.UI.Page
{
    static string sesion;
    static int idEmpresa;
    protected void Page_Load(object sender, EventArgs e)
    {
    
        if (Convert.ToString(Session["idRol"]) != "empresa")
        {
            Response.Redirect("~/Index.aspx");
        }
        lblUserInfo.Text = Convert.ToString(Session["idRol"]);

        if (!IsPostBack)
        {

           
            sesion = Session["idUsuario"].ToString();

            string StrCadenaConexion = "Data Source=(localdb)\\MSSQLLocalDB;AttachDbFilename=" +
            Server.MapPath("~/App_Data/bdAngelHelpers.mdf") +
            ";Integrated Security=True;Connect Timeout=30";
            string StrComandoSql = "select idEmpresa from Empresa where idUsuario = '" + sesion + "';";

            try
            {

                SqlConnection conexion = new SqlConnection(StrCadenaConexion);
                SqlCommand comando = new SqlCommand(StrComandoSql, conexion);
                conexion.Open();
                SqlDataReader reader = comando.ExecuteReader();

                if (reader.Read())
                {
                    idEmpresa = (int)reader.GetValue(0);
                    Session.Add("idEmpresa", idEmpresa);
                }
                else
                {
                    lblMensaje.Text = "No existen registros resultantes de la consulta";
                }

                reader.Close();
                comando.Dispose();
                conexion.Close();
            }
            catch (SqlException ex)
            {
                string StrError = "<p>Se han producido errores en el acceso a la base de datos.</p>";
                StrError = StrError + "<div>Código: " + ex.Number + "</div>";
                StrError = StrError + "<div>Descripción: " + ex.Message + "</div>";
                lblMensaje.Text = StrError;
                return;
            }
        }
    }
}