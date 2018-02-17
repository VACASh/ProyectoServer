using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Empleo : System.Web.UI.Page
{
    static string sesion, resultado;
    static int idDemandante;
    protected void Page_Load(object sender, EventArgs e)
    {



        if (!IsPostBack)
        {
           
           sesion = Session["idUsuario"].ToString();
            string StrCadenaConexion = "Data Source=(localdb)\\MSSQLLocalDB;AttachDbFilename=" +
            Server.MapPath("~/App_Data/bdAngelHelpers.mdf") +
            ";Integrated Security=True;Connect Timeout=30";
            string StrComandoSql = "select idDemandante from Demandante where idUsuario = '" + sesion + "';";

            try
            {
                SqlConnection conexion = new SqlConnection(StrCadenaConexion);
                SqlCommand comando = new SqlCommand(StrComandoSql, conexion);
                conexion.Open();
                SqlDataReader reader = comando.ExecuteReader();

                if (reader.Read())
                {
                    idDemandante= (int)reader.GetValue(0);
                
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














    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (sesion!=null)
        {
            DateTime fechaHoy = DateTime.Now;
            string wFechaHoy = fechaHoy.ToString("yyyy/MM/dd HH:mm:ss");

            string StrIdProducto = GridView1.SelectedRow.Cells[1].Text;
            string StrCadenaConexion = "Data Source=(localdb)\\MSSQLLocalDB;AttachDbFilename=" +
            Server.MapPath("~/App_Data/bdAngelHelpers.mdf") +
             ";Integrated Security=True;Connect Timeout=30";
            string StrComandoSql = "INSERT inscritos " +
            "(idOferta,idDemandante,estado,fecha_inscripcio) VALUES (" +
           "'" + StrIdProducto + "','" + idDemandante +
           "', 'Sin revisar','" + wFechaHoy + "');";
            try
            {
                SqlConnection conexion = new SqlConnection(StrCadenaConexion);
                SqlCommand comando = new SqlCommand(StrComandoSql, conexion);
                comando.Connection.Open();
                Int32 inRegistrosAfectados = comando.ExecuteNonQuery();
                comando.Connection.Close();
                if (inRegistrosAfectados == 1)
                    lblMensaje.Text = "Registro insertado correctamente";
                else
                    lblResultado.Text = "Error al insertar el registro";

            }
            catch (SqlException ex)
            {
                string StrError = "<p>Se han producido errores en el acceso a la base de datos.</p>";
                StrError = StrError + "<div>Código: " + ex.Number + "</div>";
                StrError = StrError + "<div>Descripción: " + ex.Message + "</div>";
                lblMensaje.Text = StrError;
                return;
            }
            GridView1.DataBind();
            GridView1.SelectedIndex = -1;
        }
        else
        {
            lblMensaje.Text = "no hay un usuario logeado";
        }
       
        
    }
}