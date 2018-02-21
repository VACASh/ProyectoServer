using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Demandante_DenunciarOferta : System.Web.UI.Page
{
   
    static int idOferta, idDemandante;
    DateTime fechaHoy = DateTime.Now;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Convert.ToString(Session["idRol"]) != "demandante")
        {
            Response.Redirect("~/Index.aspx");
        }
        lblTipoUser.Text = Convert.ToString(Session["idRol"]);

        if (!IsPostBack)
        {

           
            string StrCadenaConexion = "Data Source=(localdb)\\MSSQLLocalDB;AttachDbFilename=" +
            Server.MapPath("~/App_Data/bdAngelHelpers.mdf") +
            ";Integrated Security=True;Connect Timeout=30";
            string StrComandoSql = "select idDemandante from Demandante where idUsuario = '" + Session["idUsuario"].ToString() + "';";

            try
            {
                SqlConnection conexion = new SqlConnection(StrCadenaConexion);
                SqlCommand comando = new SqlCommand(StrComandoSql, conexion);
                conexion.Open();
                SqlDataReader reader = comando.ExecuteReader();

                if (reader.Read())
                {
                    idDemandante = (int)reader.GetValue(0);

                }
                else
                {
                    lblMensajes.Text = "No existen registros resultantes de la consulta";
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
                lblMensajes.Text = StrError;
                return;
            }
        }
    }

    protected void Unnamed_Click(object sender, EventArgs e)
    {
        if (txtDenuncia.Text!="")
        {
            string wFechaHoy = fechaHoy.ToString("yyyy/MM/dd HH:mm:ss");
            string StrCadenaConexion = "Data Source=(localdb)\\MSSQLLocalDB;AttachDbFilename=" +
                Server.MapPath("~/App_Data/bdAngelHelpers.mdf") +
                 ";Integrated Security=True;Connect Timeout=30";
            string StrComandoSql = "INSERT Denuncia " +
            "(idOferta,idDemandante,fecha_denuncia,descripcion_denuncia) VALUES (" +
           "'" + idOferta + "','" + idDemandante +
           "','" + wFechaHoy + "','" + txtDenuncia.Text + "' );";

            try
            {
                SqlConnection conexion = new SqlConnection(StrCadenaConexion);
                SqlCommand comando = new SqlCommand(StrComandoSql, conexion);
                comando.Connection.Open();

                Int32 inRegistrosAfectados = comando.ExecuteNonQuery();
                if (inRegistrosAfectados == 1)
                {
                    lblMensajes.Text = "Se ha realizado la denuncia";
                    comando.Connection.Close();
                    GridView1.DataBind();
                    GridView1.SelectedIndex = -1;
                    plcDenunicia.Visible = false;
                }
                else
                {
                    lblMensajes.Text = "Ya estas inscrito en esta oferta";
                }
                comando.Dispose();
                conexion.Close();

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
        else
        {
            lblMensajes.Text = "Debe comentar porque cree que este anuncio es abusivo o falso";
        }
       

    }




    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        idOferta = (int)GridView1.SelectedValue;
        plcDenunicia.Visible = true;




    }
}