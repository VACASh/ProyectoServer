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

    protected void Page_Load(object sender, EventArgs e)
    {

        lblPrueba.Text = sesion;
        if (!IsPostBack)
        {

            sesion = Session["idUsuario"].ToString();






            /*
            if (curriculo.HasFile)
            {

                string ruta = "~/curriculos/" + curriculo.FileName;
                curriculo.SaveAs(Server.MapPath(ruta));
                strCurriculo = ruta;

            }
            else
            {
                strCurriculo = null;
            }

    */

            string StrCadenaConexion = "Data Source=(localdb)\\MSSQLLocalDB;AttachDbFilename=" +
            Server.MapPath("~/App_Data/bdAngelHelpers.mdf") +
            ";Integrated Security=True;Connect Timeout=30";


            string strComandoSql = "select" +
            "(nombre, apellidos, telefono, idUsuario,curriculum, especialidad, Email)"
            + "from Demandante" +
            "where idUsuario ='" + sesion + "';";


            SqlConnection conexion = new SqlConnection(StrCadenaConexion);
            conexion.Open();
            SqlCommand comando = new SqlCommand( strComandoSql,conexion);
            comando.Connection = conexion;
            SqlTransaction tran = conexion.BeginTransaction();
            
            comando.Transaction = tran;
            SqlDataReader reader = comando.ExecuteReader();
            try
            {

                comando.CommandText = strComandoSql;
                comando.ExecuteNonQuery();
                tran.Commit();
                if (reader.Read())
                {
                    txtNombre.Text = reader.GetString(1);
                    txtApellidos.Text = reader.GetString(2);
                    txtEspecialidad.Text = reader.GetString(3);
                    ;
                }

                lblPrueba.Text = "Usuario registrado correctamente";

            }

            catch (SqlException ex)
            {
                tran.Rollback();

                string StrError = "<p>Se han producido errores durante el registro</p>";
                StrError = StrError + "<div>Código: " + ex.Number + "</div>";
                StrError = StrError + "<div>Descripción: " + ex.Message + "</div>";
                lblPrueba.Text = StrError;

            }
            finally
            {
                conexion.Close();

            }
        }



    }
}