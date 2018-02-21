using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{   static int  activar;
    static string idUser;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            activar = (int)Session["activado"];
            if (activar == 1)
            {
                lblMensajes.Text = "usuario desactivado contacte con nosotros en angelhelpers@trabajo.com";
            }
        }
        catch (Exception)
        {
            lblMensajes.Text = "info en angelhelpers@trabajo.com";


        }
       

        
    }



    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        string StrCadenaConexion = "Data Source=(localdb)\\MSSQLLocalDB;AttachDbFilename=" +
          Server.MapPath("~/App_Data/bdAngelHelpers.mdf") +
      ";Integrated Security=True;Connect Timeout=30";

        string StrComandoSql = "SELECT idUsuario, idRol FROM Usuario ";

        StrComandoSql = StrComandoSql + " WHERE idUsuario='" + Login1.UserName + "' ";
        StrComandoSql = StrComandoSql + "AND password='" + Login1.Password + "';";
        string strComandoSql2 = "Select activado from Empresa where idUsuario ='" + Login1.UserName + "'";
        string strComandoSql3 = "Select activado from Demandante where idUsuario ='" + Login1.UserName + "'";
        try
        {
            SqlConnection conexion = new SqlConnection(StrCadenaConexion);
            SqlCommand comando = new SqlCommand(StrComandoSql, conexion);
            conexion.Open();
            SqlDataReader reader = comando.ExecuteReader();

            SqlConnection cnxEmpresa = new SqlConnection(StrCadenaConexion);
            SqlCommand cmdEmpresa = new SqlCommand(strComandoSql2, cnxEmpresa);
            cnxEmpresa.Open();
            SqlDataReader rdrEmpresa = cmdEmpresa.ExecuteReader();

            SqlConnection cnxDeman = new SqlConnection(StrCadenaConexion);
            SqlCommand cmdDemand = new SqlCommand(strComandoSql3, cnxDeman);
            cnxDeman.Open();
            SqlDataReader rdrDemand = cmdDemand.ExecuteReader();
            bool activado = true;
            if (reader.Read())
            {
                if (rdrEmpresa.Read())
                {
                    activado = rdrEmpresa.GetBoolean(0);
                    rdrEmpresa.Close();
                    cnxEmpresa.Dispose();
                    cnxEmpresa.Close();
                }
                if ( rdrDemand.Read())
                {
                    activado = rdrDemand.GetBoolean(0);
                    rdrDemand.Close();
                    cmdDemand.Dispose();
                    cnxDeman.Close();
                }


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
                Session.Add("activado", 0);
                if (activado)
                {
                    Session.Add("activado", 0);
                    if (String.Equals(acomparar.Trim(), "demandante"))
                        Response.Redirect("~/Demandante/MenuUsuario.aspx");
                    if (String.Equals(acomparar.Trim(), "empresa"))
                        Response.Redirect("~/Empresa/indexEmpresa.aspx");
                }
                else
                {
                    Session.Add("activado", 1);
                   
                    Response.Redirect("~/Login.aspx");
                }



            }
            else
            {
                e.Authenticated = false;
                reader.Close();
                comando.Dispose();
                conexion.Close();
                rdrEmpresa.Close();
                cnxEmpresa.Dispose();
                cnxEmpresa.Close();
                rdrDemand.Close();
                cmdDemand.Dispose();
                cnxDeman.Close();

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