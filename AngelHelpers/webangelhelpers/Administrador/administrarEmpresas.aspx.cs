using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administrador_administrarEmpresas : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }



    protected void grdEmpresas_SelectedIndexChanged(object sender, EventArgs e)
    {

        //repasar
        int InNumeroFilas;
        string StrResultado, StrError;
        string StrCadenaConexion = "Data Source=(localdb)\\MSSQLLocalDB;AttachDbFilename=" +
        Server.MapPath("~/App_Data/Tienda.mdf") +
        ";Integrated Security=True;Connect Timeout=30";
        string strClienteSeleccionado = grdEmpresas.SelectedRow.Cells[1].Text;
        string StrComandoSql = "SELECT ofertaEmpleo.ciudad,FecPed,SerPed,CobPed," +
        "SUM(precioOferta) AS Total " +
        "FROM PEDIDO INNER JOIN DETALLE ON PEDIDO.IdPedido = DETALLE.IdPedido " +
        "GROUP BY PEDIDO.IdPedido, PEDIDO.FecPed, PEDIDO.CobPed, PEDIDO.SerPed, PEDIDO.IdCliente " +
        "HAVING (PEDIDO.IdCliente = '" + strClienteSeleccionado + "');";
        decimal DcTotal = 0;
        lblMensajes.Text = "";
        lblResultado.Visible = false;
        lblTotal.Visible = false;
        try
        {
            SqlConnection conexion = new SqlConnection(StrCadenaConexion);
            SqlCommand comando = new SqlCommand(StrComandoSql, conexion);
            conexion.Open();
            SqlDataReader reader = comando.ExecuteReader();
            if (reader.HasRows)
            {
                InNumeroFilas = 0;
                lblResultado.Visible = true;
                lblTotal.Visible = true;
                StrResultado = "<div style='display:table; border-color:#336699;width:35%'>";
                StrResultado += "<div style='display:table-row; background:#336699;color:white'>";
                StrResultado += "<div style='display:table-cell; font-weight:bold'>Núm.Pedido</div>";
                StrResultado += "<div style='display:table-cell; font-weight:bold'>Fecha</div>";
                StrResultado += "<div style='display:table-cell; font-weight:bold'>Servido</div>";
                StrResultado += "<div style='display:table-cell; font-weight:bold'>Cobrado</div>";
                StrResultado += "<div style='display:table-cell; font-weight:bold'>Total</div>";
                StrResultado += "</div>";
                while (reader.Read())
                {
                    StrResultado += "<div style='display:table-row'>";
                    StrResultado += "<div style='display:table-cell; text-align: center'>" +
                    reader.GetValue(0) + "</div>";
                    StrResultado += "<div style='display:table-cell'>" +
                    string.Format("{0:d}", reader.GetValue(1)) + "</div>";
                    if (reader.GetBoolean(2) == true)
                        StrResultado += "<div style='display:table-cell'> Sí </div>";
                    else
                        StrResultado += "<div style='display:table-cell'> No </div>";
                    if (reader.GetBoolean(3) == true)
                        StrResultado += "<div style='display:table-cell'> Sí </div>";
                    else
                        StrResultado += "<div style='display:table-cell'> No </div>";
                    StrResultado += "<div style='display:table-cell; text-align: right'>" +
                    string.Format("{0:c}", reader.GetValue(4)) + "&nbsp; </div>";
                    StrResultado += "</div>";
                    InNumeroFilas++;
                }
                StrResultado += "</div>";
                lblResultado.Text = StrResultado;
                string StrComandoSql1 = "SELECT SUM(CanDet*PreDet-CanDet*PreDet*DtoDet/100) AS Total " +
                "FROM CLIENTE INNER JOIN PEDIDO ON CLIENTE.IdCliente = PEDIDO.IdCliente " +
                "INNER JOIN DETALLE ON PEDIDO.IdPedido = DETALLE.IdPedido " +
                "GROUP BY CLIENTE.IdCliente " +
                "HAVING (CLIENTE.IdCliente = '" + strClienteSeleccionado + "');";
                SqlConnection conexion1 = new SqlConnection(StrCadenaConexion);
                conexion1.Open();
                SqlCommand comando1 = new SqlCommand(StrComandoSql1, conexion1);
                DcTotal = Convert.ToDecimal(comando1.ExecuteScalar());
                comando1.Dispose();
                conexion1.Close();
                lblTotal.Text = "<div> Número pedidos realizados: " + InNumeroFilas + "</div>" +
                "<div>Importe total de los pedidos realizados por el cliente: " +
                string.Format("{0:c}", DcTotal) + "</div>";
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
            StrError = "<p>Se han producido errores en el acceso a la base de datos.</p>";
            StrError = StrError + "<div>Código: " + ex.Number + "</div>";
            StrError = StrError + "<div>Descripción: " + ex.Message + "</div>";
            lblMensajes.Text = StrError;
            return;
        }
    }
}