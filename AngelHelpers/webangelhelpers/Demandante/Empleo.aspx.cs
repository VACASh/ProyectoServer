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

       
        if (Convert.ToString(Session["idRol"]) != "demandante")
        {
            Response.Redirect("~/Index.aspx");
        }
        lblTipoUser.Text = Convert.ToString(Session["idRol"]);

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
        
        lblMensaje.Text = "";
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
                int apuntado=1;

                SqlConnection conexion = new SqlConnection(StrCadenaConexion);
                SqlCommand comando = new SqlCommand(StrComandoSql, conexion);
                comando.Connection.Open();
                ///por aqui
                string srtComandoSql2 = " IF EXISTS (select *  from inscritos where idDemandante = " + idDemandante +
                "and  idOferta = " + GridView1.SelectedValue + ")"
                + "begin select 0  end else begin select 1 end";
                SqlConnection cnxRevisar = new SqlConnection(StrCadenaConexion);
                SqlCommand cmdRevisar = new SqlCommand(srtComandoSql2, cnxRevisar);
                cmdRevisar.Connection.Open();

                SqlDataReader rdrDemand = cmdRevisar.ExecuteReader();

                if (rdrDemand.Read())
                {
                    apuntado = rdrDemand.GetInt32(0);
                  
                }

                
                
                if (apuntado !=0)
                {
                    Int32 inRegistrosAfectados = comando.ExecuteNonQuery();
                    if (inRegistrosAfectados == 1)
                    {
                        lblMensaje.Text = "Se ha realizado la inscripción";
                        GridView1.DataBind();
                        GridView1.SelectedIndex = -1;
                        txtBusqueda.Text = "";
                    }  
                    else
                        lblResultado.Text = "Error al insertar el registro";
                }
                else
                {
                    lblMensaje.Text = "Ya estas inscrito en esta oferta";
                }
                comando.Connection.Close();
                rdrDemand.Close();
                cmdRevisar.Dispose();
                cnxRevisar.Close();
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
        else
        {
            lblMensaje.Text = "no hay un usuario logeado";
        }
       
        
    }

    protected void Unnamed1_Click(object sender, EventArgs e)
    {
        lblMensaje.Text = "";
    }
}