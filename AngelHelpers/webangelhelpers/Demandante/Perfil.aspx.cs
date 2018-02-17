using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Demandante_Default : Page
{
    static string sesion;
    static int idDemandante;

    protected void Page_Load(object sender, EventArgs e)
    {



        if (!IsPostBack)
        {

           sesion = Session["idUsuario"].ToString();
           
    

            string StrCadenaConexion = "Data Source=(localdb)\\MSSQLLocalDB;AttachDbFilename=" +
            Server.MapPath("~/App_Data/bdAngelHelpers.mdf") +
            ";Integrated Security=True;Connect Timeout=30";


            string strComandoSql = "select " +
            "idDemandante,nombre, apellidos, telefono, idUsuario, especialidad, Email "
            + "from Demandante " +
            "where idUsuario ='" + sesion + "';";



            try
            {

                SqlConnection conexion = new SqlConnection(StrCadenaConexion);

                SqlCommand comando = new SqlCommand(strComandoSql, conexion);
                conexion.Open();
                SqlDataReader reader = comando.ExecuteReader();


                if (reader.Read())
                {

                    idDemandante = reader.GetInt32(0);

                    lblIdDemandante.Text = idDemandante.ToString();
                    lblIdDemandante.Visible = false;

                    txtNombre.Text = reader.GetString(1);
                    txtApellido.Text = reader.GetString(2);
                    txtTelefono.Text = reader.GetString(3);
                    txtEspecialidad.SelectedIndex = -1;
                    string prueba = reader.GetString(5);
                    txtEspecialidad.Items.FindByText(reader.GetString(5)).Selected = true;
                    txtEmail.Text = reader.GetString(6);



                }


                reader.Close();
                comando.Dispose();
                conexion.Close();

            }

            catch (SqlException ex)
            {


                string StrError = "<p>Se han producido errores durante el registro</p>";
                StrError = StrError + "<div>Código: " + ex.Number + "</div>";
                StrError = StrError + "<div>Descripción: " + ex.Message + "</div>";
                lblMensajes.Text = StrError;

            }

        }



    }

    protected void Unnamed4_Click(object sender, EventArgs e)
    {
        idiomas.Visible = !idiomas.Visible;
    }


    protected void Unnamed5_Click1(object sender, EventArgs e)
    {
        string StrCadenaConexion = "Data Source=(localdb)\\MSSQLLocalDB;AttachDbFilename=" +
           Server.MapPath("~/App_Data/bdAngelHelpers.mdf") +
           ";Integrated Security=True;Connect Timeout=30";
       
        string StrComandoSql = "INSERT Sabe " +
        "(idDemandante,idioma,nivel) VALUES (" + "'" + idDemandante + "','" + ddlIdiomas.SelectedValue + "','" + ddlNivel.SelectedValue + "');";

        try
        {
            SqlConnection conexion = new SqlConnection(StrCadenaConexion);
            SqlCommand comando = new SqlCommand(StrComandoSql, conexion);
            comando.Connection.Open();
            Int32 inRegistrosAfectados = comando.ExecuteNonQuery();
            comando.Connection.Close();
            if (inRegistrosAfectados == 1)
            {
                lblMensajes.Text = "Registro insertado correctamente";

                listIdiomas.DataBind();
            }
            else
            {
                lblMensajes.Text = "Error al insertar el registro";
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



    protected void Unnamed5_Click(object sender, EventArgs e)
    {

        string StrCadenaConexion = "Data Source=(localdb)\\MSSQLLocalDB;AttachDbFilename=" +
             Server.MapPath("~/App_Data/bdAngelHelpers.mdf") +
             ";Integrated Security=True;Connect Timeout=30";
        string StrComandoSql = "UPDATE Demandante " +
       "set activado= 0  where idDemandante ='" + idDemandante + "'; ";

        try
        {
            SqlConnection conexion = new SqlConnection(StrCadenaConexion);
            SqlCommand comando = new SqlCommand(StrComandoSql, conexion);
            comando.Connection.Open();
            Int32 inRegistrosAfectados = comando.ExecuteNonQuery();
            comando.Connection.Close();
            if (inRegistrosAfectados == 1)
                lblMensajes.Text = "Registro insertado correctamente";
            else
                lblMensajes.Text = "Error al desactivar  el usuario";

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

    protected void Unnamed3_Click(object sender, EventArgs e)
    {
        string StrCadenaConexion = "Data Source=(localdb)\\MSSQLLocalDB;AttachDbFilename=" +
          Server.MapPath("~/App_Data/bdAngelHelpers.mdf") +
          ";Integrated Security=True;Connect Timeout=30";

        if (txtCurri.HasFile)
        {
            string strCurriculo;
            string ruta = "~/curriculos/" + txtCurri.FileName;
            txtCurri.SaveAs(Server.MapPath(ruta));
            strCurriculo = ruta;

            string StrComandoSql = "UPDATE Demandante " +
            "set nombre='" + txtNombre.Text + "', apellidos='" + txtApellido.Text + "', " + "telefono=" + txtTelefono.Text +
            ", especialidad='" + txtEspecialidad.SelectedValue + "', curriculum='" + strCurriculo + "'" + " where idDemandante ='" + idDemandante + "'; ";

            try
            {
                SqlConnection conexion = new SqlConnection(StrCadenaConexion);
                SqlCommand comando = new SqlCommand(StrComandoSql, conexion);
                comando.Connection.Open();
                Int32 inRegistrosAfectados = comando.ExecuteNonQuery();
                comando.Connection.Close();
                if (inRegistrosAfectados == 1)
                {
                    lblMensajes.Text = "Registro insertado correctamente";

                    listIdiomas.DataBind();
                }
                else
                {
                    lblMensajes.Text = "Error al insertar el registro";
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
        else
        {
            string StrComandoSql = "UPDATE Demandante " +
             "set nombre='" + txtNombre.Text + "', apellidos='" + txtApellido.Text + "', " + "telefono=" + txtTelefono.Text +
             ", especialidad='" + txtEspecialidad.SelectedValue  + "'" + " where idDemandante ='" + idDemandante + "'; ";
            try
            {
                SqlConnection conexion = new SqlConnection(StrCadenaConexion);
                SqlCommand comando = new SqlCommand(StrComandoSql, conexion);
                comando.Connection.Open();
                Int32 inRegistrosAfectados = comando.ExecuteNonQuery();
                comando.Connection.Close();
                if (inRegistrosAfectados == 1)
                {
                    lblMensajes.Text = "Registro insertado correctamente";

                    listIdiomas.DataBind();
                }
                else
                {
                    lblMensajes.Text = "Error al insertar el registro";
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
}
