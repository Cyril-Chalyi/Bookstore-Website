using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.DataAccess.Client;
using Oracle.DataAccess.Types;
using System.Data;
using System.Configuration;

public partial class CheckOut : System.Web.UI.Page
{
    static double shpPrice = 0,
                  orderTotal = 0;



    protected void Page_Load(object sender, EventArgs e)
    {
  

    } 

    protected void dlstShipMethod_SelectedIndexChanged(object sender, EventArgs e)
    {
        shpPrice = Convert.ToDouble(dViewShipPrice.Rows[0].Cells[1].Text);  
    }

    protected void dViewShipPrice_DataBound(object sender, EventArgs e)
    {
        shpPrice = Convert.ToDouble(dViewShipPrice.Rows[0].Cells[1].Text);
        lblTotal.Text = (shpPrice + orderTotal).ToString();
    }

    protected void dViewOrderTotal_DataBound(object sender, EventArgs e)
    {
        orderTotal = Convert.ToDouble(dViewOrderTotal.Rows[0].Cells[1].Text);

        lblTotal.Text = (shpPrice + orderTotal).ToString();
    }

    protected void btnPayment_Click(object sender, EventArgs e)
    {
        double amount = shpPrice + orderTotal;

        string dbConnectionString = ConfigurationManager.ConnectionStrings["OracleConnection"].ConnectionString;

        OracleConnection connection = new OracleConnection();
        connection.ConnectionString = dbConnectionString;

        OracleCommand command = connection.CreateCommand();

        command.CommandType = CommandType.StoredProcedure;
        command.CommandText = "CHECKOUT";

        OracleParameter result = new OracleParameter("InvoiceID", OracleDbType.Varchar2, ParameterDirection.ReturnValue);
        result.Size = 15;
        command.Parameters.Add(result);

        command.Parameters.Add(new OracleParameter("ShipingMethod", OracleDbType.Varchar2, dlstShipMethod.SelectedItem.Value.ToString(), ParameterDirection.Input));
        command.Parameters.Add(new OracleParameter("CartID", OracleDbType.Varchar2, (string)(Session["CartID"]), ParameterDirection.Input));
        command.Parameters.Add(new OracleParameter("UserID", OracleDbType.Varchar2, (string)(Session["UserID"]), ParameterDirection.Input));

        connection.Open();
        command.ExecuteNonQuery();

        connection.Close();

        string invoiceID = result.Value.ToString();

        string siteName = "COMP229Project";

        string redirect = "";
        redirect += "https://www.paypal.com/xclick/business=COMP229Project@gmail.com";
        redirect += "&item_name=" + siteName + " Order " + invoiceID;
        redirect += "&item_number=" + invoiceID;
        redirect += "&amount=" + amount.ToString();
        redirect += "&currency=USD";
        redirect += "&return=http://www." + siteName + ".com";
        redirect += "&cancel_return=http://www." + siteName + ".com";

        Response.Redirect(redirect);
    }
}