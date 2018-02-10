using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class registro : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {




    }







    protected void tipoUser_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (tipoUser.SelectedItem.Text == "Empresa")
        {
            Apellidos.Visible = false;

            Ciudad.Visible = true;

            Direccion.Visible = true;
            lblEspecialidad.Visible = false;
            especialidad.Visible = false;
            lblCurriculo.Visible = false;
            curriculo.Visible = false;
            
        }
        else
        {

            Ciudad.Visible = false;
            Apellidos.Visible = true;
            Direccion.Visible = false;
            lblEspecialidad.Visible = true;
            especialidad.Visible = true;
            lblCurriculo.Visible = true;
            curriculo.Visible = true;
            
        }




    }

    protected void btnEnviar_Click(object sender, EventArgs e)
    {
        if (tipoUser.SelectedValue == "Candidato")
        {
            if (txtPassword.Text == txtPass2.Text)
            {
                string strLogin, strNombre, strApellidos, strTel, strCurriculo, strEspecialidad, strEmail;
                string strPassword, strRol;
                int activado;

                strLogin = nomUsuario.Text;
                strPassword = txtPassword.Text;
                strRol = "demandante";
                strNombre = nombre.Text;
                strApellidos = Apellidos.Text;
                strEmail = Email.Text;
                activado = 0;
                strTel = Tlf.Text;

                strCurriculo = "";
                strEspecialidad = especialidad.SelectedValue;

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



                string StrCadenaConexion = "Data Source=(localdb)\\MSSQLLocalDB;AttachDbFilename=" +
                Server.MapPath("~/App_Data/bdAngelHelpers.mdf") +
                ";Integrated Security=True;Connect Timeout=30";
                string strComandoSql_1 = "INSERT Usuario " +
               "(idUsuario,idRol,password) VALUES (" + "'" + strLogin + "','" + strRol + "','" + strPassword + "');";

                string strComandoSql_2 = "INSERT Demandante " +
                "(nombre, apellidos, activado, telefono, idUsuario,curriculum, especialidad, Email) VALUES (" +
                "'" + strNombre + "','" + strApellidos + "','" + activado + "','" + strTel + "','" + strLogin +
                "','" + strCurriculo + "','" + strEspecialidad + "','" + strEmail + "');";



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
                    comando.CommandText = strComandoSql_2;
                    comando.ExecuteNonQuery();
                    tran.Commit();
                    Response.Redirect("~/RegistadosOk.aspx");
                    lblMensajes.Text = "Usuario registrado correctamente";

                }

                catch (SqlException ex)
                {
                    tran.Rollback();

                    string StrError = "<p>Se han producido errores durante el registro</p>";
                    StrError = StrError + "<div>Código: " + ex.Number + "</div>";
                    StrError = StrError + "<div>Descripción: " + ex.Message + "</div>";
                    lblMensajes.Text = StrError;

                }
                finally
                {
                    conexion.Close();

                }
            }
            else
            {
                lblMensajes.Text = " Las contraseñas no coinciden";
            }

        }
        else
        {
            if (txtPassword.Text == txtPass2.Text)
            {
                string strLogin, strNombre,  strCiudad, strTel, strEmail, strDirecc;
                string strPassword, strRol;
                int activado;

                strLogin = nomUsuario.Text;
                strPassword = txtPassword.Text;
                strRol = "empresa";
                strNombre = nombre.Text;
                strCiudad = Ciudad.Text;
                strDirecc = Direccion.Text;
                strEmail = Email.Text;
                activado = 0;
                strTel = Tlf.Text;




                string StrCadenaConexion = "Data Source=(localdb)\\MSSQLLocalDB;AttachDbFilename=" +
                Server.MapPath("~/App_Data/bdAngelHelpers.mdf") +
                ";Integrated Security=True;Connect Timeout=30";
                string strComandoSql_1 = "INSERT Usuario " +
               "(idUsuario,idRol,password) VALUES (" + "'" + strLogin + "','" + strRol + "','" + strPassword + "');";

                string strComandoSql_2 = "INSERT Empresa " +
                "(nomEmpresa, ciudad, direccion, idUsuario, telefono,activado, Email) VALUES (" +
                "'" + strNombre + "','" + strCiudad + "','" + strDirecc + "','" + strLogin + "','" + strTel +
                "','" + activado  + "','" + strEmail + "');";



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
                    comando.CommandText = strComandoSql_2;
                    comando.ExecuteNonQuery();
                    tran.Commit();
                    Response.Redirect("~/RegistadosOk.aspx");
                    lblMensajes.Text = "Usuario registrado correctamente";

                }

                catch (SqlException ex)
                {
                    tran.Rollback();

                    string StrError = "<p>Se han producido errores durante el registro</p>";
                    StrError = StrError + "<div>Código: " + ex.Number + "</div>";
                    StrError = StrError + "<div>Descripción: " + ex.Message + "</div>";
                    lblMensajes.Text = StrError;

                }
                finally
                {
                    conexion.Close();

                }
            }
            else
            {
                lblMensajes.Text = "Se ha producido un error. Valores de contraseña no coincidentes";
            }

        }




    }
    protected void verificarRequired()
    {

    }

}