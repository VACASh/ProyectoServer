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
    private System.Web.UI.HtmlControls.HtmlGenericControl Capa;
    protected void Page_Load(object sender, EventArgs e)
    {
       
        {

        }
        if (!IsPostBack)
        {
            //sesion = Session["idUsuario"].ToString();

        }

    }

    protected void Unnamed2_Click(object sender, EventArgs e)
    {

        string StrCadenaConexion = "Data Source=(localdb)\\MSSQLLocalDB;AttachDbFilename=" +
           Server.MapPath("~/App_Data/bdAngelHelpers.mdf") +
           ";Integrated Security=True;Connect Timeout=30";


        string strComandoSql = "select " +
        "Empresa.nomEmpresa,ofertaEmpleo.idOferta, ofertaEmpleo.tipoOferta, ofertaEmpleo.descripcion, ofertaEmpleo.ciudad, ofertaEmpleo.perNecesarias,ofertaEmpleo.Especialidad "
        + "from ofertaEmpleo inner join Empresa  on ofertaEmpleo.idEmpresa = Empresa.idEmpresa " +
        "where ofertaEmpleo.ciudad = '" + txtBusqueda.Text + "' or ofertaEmpleo.Especialidad = '" + txtBusqueda.Text + "';";


        try
        {
            SqlConnection conexion = new SqlConnection(StrCadenaConexion);

            SqlCommand comando = new SqlCommand(strComandoSql, conexion);
            conexion.Open();
            SqlDataReader reader = comando.ExecuteReader();
            if (!reader.HasRows)
            {
                lblMensaje.Text = "No hay ninguna oferta de empleo con esos criterios de busqueda";
                lblResultado.Text = "";
            }
            else
            {
                while (reader.Read())
                {
                    
                        
                    resultado += "<div class='card'>";
                    resultado += "<div class='card-header bg-info text-white h4'> " + reader.GetValue(0) + "</div>";
                    resultado += "<div class='card-body'><b>Que necesitamos :</b><p> " + reader.GetValue(3) + "</p>";
                    resultado += "<p><span style=' font-weight:bold'>Tipo de contrato: </span>" + reader.GetValue(2) + " Semanales</p>";
                    resultado += "<p><span style=' font-weight:bold'>Ciudad: </span>: " + reader.GetValue(4) + "</p>";
                    resultado += "<p><span style=' font-weight:bold'>Salario: </span>: A valorar dependiendo de la experienca aportada.</p>";
                    resultado += "<p>Personas necesarias para el desempeño:" + reader.GetValue(5) + "</p>";
                    if (reader.GetString(6) != "Ninguna")
                    {
                        resultado += "<p>Se necesita una persona que tenga experiencia tratando con gente con " + reader.GetValue(6) + "</p>";

                    }
                    resultado += "<button type='button' value='" +reader.GetValue(1)+
                        "' class=' btn btn-primary text-center' id='" +reader.GetValue(1) +
                        "' onclick='llamarServidor("+reader.GetValue(1) +")'>Inscribirse</button>";
                    resultado +=  "</div></div></br>";
                   
                }
                lblMensaje.Text = "";
                lblResultado.Text = resultado;
                reader.Close();
            }


        }
        catch (SqlException ex)
        {
            lblResultado.Text = "<p>Se han producido errores en el acceso a la base de datos.</p>";
            lblResultado.Text = lblResultado.Text + "<div>Código: " + ex.Number + "</div>";
            lblResultado.Text = lblResultado.Text + "<div>Descripción: " + ex.Message + "</div>";

            return;
        }

    }

    public void inscribirse(int idOferta)
    {
        lblMensaje.Text = "hola esto funciona" + idOferta;
    }
}