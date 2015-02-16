using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Data.Common;
using Oracle.DataAccess.Types;
using Oracle.DataAccess.Client;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        btnLogin.Click += new EventHandler(this.LoginBtn_Click);
    }

    public void LoginBtn_Click (Object sender, EventArgs e)
    {

        string dbConnectionString = ConfigurationManager.ConnectionStrings["OracleConnection"].ConnectionString;

        OracleConnection connection = new OracleConnection();
        connection.ConnectionString = dbConnectionString;

        OracleCommand command = connection.CreateCommand();
        
        command.CommandType = CommandType.StoredProcedure;
        command.CommandText = "CHECK_USER";

        //command.Parameters.Add("Return_Value", OracleDbType.Int16,ParameterDirection.ReturnValue); // Needed for Oracle function to work

        command.Parameters.Add(new OracleParameter("inEmail", OracleDbType.Varchar2, txtEmail.Value, ParameterDirection.Input));
        command.Parameters.Add(new OracleParameter("inPassword", OracleDbType.Varchar2, txtPassword.Value, ParameterDirection.Input));

        OracleParameter userID = new OracleParameter("userID", OracleDbType.Varchar2, 10);
        userID.Direction = ParameterDirection.Output;
        command.Parameters.Add(userID);

        OracleParameter cartID = new OracleParameter("cartID", OracleDbType.Varchar2, 10);
        cartID.Direction = ParameterDirection.Output;
        command.Parameters.Add(cartID);

        connection.Open();
        command.ExecuteNonQuery();
        connection.Close();

        if (userID.Value.ToString().Equals("null"))
        {
            Label1.Text = "null";
        }
        else
        {
            Label1.Text = userID.Value.ToString();
            Label1.Text += " " + cartID.Value.ToString();
            Session["UserID"] = userID.Value.ToString();
            Session["cartID"] = cartID.Value.ToString();

            Response.Redirect("Main.aspx");
        }
    }
}