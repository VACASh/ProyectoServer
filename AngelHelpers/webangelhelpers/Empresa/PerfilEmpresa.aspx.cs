using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Empresa_PerfilEmpresa : System.Web.UI.Page
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

            string strComandoSql = "select " +
           "idEmpresa,nomEmpresa, ciudad, telefono, direccion, Email "
           + "from Empresa where idUsuario ='" + sesion + "';"; 
           

            try
            {

                SqlConnection conexion = new SqlConnection(StrCadenaConexion);
                SqlCommand comando = new SqlCommand(strComandoSql, conexion);
                conexion.Open();
                SqlDataReader reader = comando.ExecuteReader();

                if (reader.Read())
                {

                    idEmpresa = reader.GetInt32(0);

                    

                    txtNombre.Text = reader.GetString(1);
                    txtCiudad.Text = reader.GetString(2);
                    txtTelefono.Text = reader.GetString(3);
                    txtDireccion.Text= reader.GetString(4);
                    txtEmail.Text = reader.GetString(5);



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

    protected void Unnamed2_Click(object sender, EventArgs e)
    {
        string StrCadenaConexion = "Data Source=(localdb)\\MSSQLLocalDB;AttachDbFilename=" +
          Server.MapPath("~/App_Data/bdAngelHelpers.mdf") +
          ";Integrated Security=True;Connect Timeout=30";

        string StrComandoSql = "UPDATE Empresa " +
           "set nomEmpresa='" + txtNombre.Text + "', ciudad='" + txtCiudad.Text + "', " + "telefono=" + txtTelefono.Text +
           ", direccion='" + txtDireccion.Text + "', Email='" + txtEmail.Text + "'" + " where idEmpresa ='" + idEmpresa + "'; ";

        try
        {
            SqlConnection conexion = new SqlConnection(StrCadenaConexion);
            SqlCommand comando = new SqlCommand(StrComandoSql, conexion);
            comando.Connection.Open();
            Int32 inRegistrosAfectados = comando.ExecuteNonQuery();
            comando.Connection.Close();
            if (inRegistrosAfectados == 1)
            {
                lblMensaje.Text = "Perfil actualizado correctamente";

               
            }
            else
            {
                lblMensaje.Text = "Error al insertar el registro";
            }



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

    protected void Unnamed8_Click(object sender, EventArgs e)
    {
        string StrCadenaConexion = "Data Source=(localdb)\\MSSQLLocalDB;AttachDbFilename=" +
         Server.MapPath("~/App_Data/bdAngelHelpers.mdf") +
         ";Integrated Security=True;Connect Timeout=30";

        string StrComandoSql = "UPDATE Empresa " +
           "set activado= 0  where idEmpresa = '" + idEmpresa + "';";

        try
        {
            SqlConnection conexion = new SqlConnection(StrCadenaConexion);
            SqlCommand comando = new SqlCommand(StrComandoSql, conexion);
            comando.Connection.Open();
            Int32 inRegistrosAfectados = comando.ExecuteNonQuery();
            comando.Connection.Close();
            if (inRegistrosAfectados == 1)
            {
                lblMensaje.Text = "Perfil desactivado correctamente";


            }
            else
            {
                lblMensaje.Text = "Error al insertar el registro";
            }



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