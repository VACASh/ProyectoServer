using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Empresa_publicarOferta : System.Web.UI.Page
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

    protected void lblOferta_Click(object sender, EventArgs e)
    {
        decimal precio;
        int personas;
        personas = Convert.ToInt32(txtPersonas.Text);
        if (ddlDuracion.SelectedValue == "1 mes")
        {
            precio = 39;
        }
        else
        {
            if (ddlDuracion.SelectedValue == "3 meses")
            {
                precio = 99;
            }
            else
            {
                precio = 279;
            }
        }

        string StrCadenaConexion = "Data Source=(localdb)\\MSSQLLocalDB;AttachDbFilename=" +
            Server.MapPath("~/App_Data/bdAngelHelpers.mdf") +
            ";Integrated Security=True;Connect Timeout=30";
        string strComandoSql_1 = "INSERT ofertaEmpleo " +
              "(idEmpresa,tipoOferta,descripcion,ciudad,perNecesarias,precioOferta,Especialidad,Revisada)" +
              " VALUES (" + "'" + idEmpresa + "','" + txtJornada.Text + "','" + txtDescripcion.Text + "','" +
              txtCiudad.Text + "','" + personas + "','" + precio + "','" + txtEspecialidad.Text + "','" +"0" + "');";

        SqlConnection conexion = new SqlConnection(StrCadenaConexion);
        conexion.Open();
        SqlCommand comando = new SqlCommand();
        comando.Connection = conexion;
        SqlTransaction tran = conexion.BeginTransaction();
        comando.Transaction = tran;

        try
        {
            comando.CommandText = strComandoSql_1;
            comando.ExecuteNonQuery();
            tran.Commit();
            Response.Redirect("~/Empresa/registroOferta.aspx");
            lblMensaje.Text = "Usuario registrado correctamente";

        }

        catch (SqlException ex)
        {
            tran.Rollback();

            string StrError = "<p>Se han producido errores durante el registro</p>";
            StrError = StrError + "<div>Código: " + ex.Number + "</div>";
            StrError = StrError + "<div>Descripción: " + ex.Message + "</div>";
            lblMensaje.Text = StrError;

        }
        finally
        {
            conexion.Close();

        }
    }
}