using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.DataAccess.Client;
using Oracle.DataAccess.Types;
using System.Configuration;
using System.Data;

public partial class Product : System.Web.UI.Page
{
    String isbn;
    public double getwidth;
   
    protected void Page_Load(object sender, EventArgs e)
    {
        isbn = Request.QueryString["ISBN"];

        string dbConnectionString = ConfigurationManager.ConnectionStrings["OracleConnection"].ConnectionString;
       
        OracleConnection connection = new OracleConnection();
      
        connection.ConnectionString = dbConnectionString;
        OracleCommand cmd = connection.CreateCommand();
        connection.Open();
        cmd.CommandText = "select ratingtotal from books where ISBN = :isbn";
        cmd.Parameters.Add(new OracleParameter("ISBN", OracleDbType.Varchar2, isbn, ParameterDirection.Input));
        cmd.CommandType = CommandType.Text;
        OracleDataReader dr = cmd.ExecuteReader();
        dr.Read();
        double someColumn = dr.GetDouble(dr.GetOrdinal("ratingtotal"));

        connection.Close();
        double a = someColumn / 5 * 100;
        //string myString = getwidth. Label2.Text = a.ToString();
        rate.Style[HtmlTextWriterStyle.Width] = a+ "%" +"!important";
    }

    protected void addtocart_Click(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            lblTitle.Text = "You must sign in first.";
            return;
        }
        
        string dbConnectionString = ConfigurationManager.ConnectionStrings["OracleConnection"].ConnectionString;

        OracleConnection connection = new OracleConnection();
        connection.ConnectionString = dbConnectionString;

        OracleCommand command = connection.CreateCommand();

        command.CommandType = CommandType.StoredProcedure;
        command.CommandText = "ADDBOOKTOSHOPPINGCART";

        OracleParameter result = new OracleParameter("Return_Value", OracleDbType.Int16, ParameterDirection.ReturnValue);
        command.Parameters.Add(result);

        command.Parameters.Add(new OracleParameter("cutomerID", OracleDbType.Varchar2, (string)(Session["UserID"]), ParameterDirection.Input));
        command.Parameters.Add(new OracleParameter("ISBN", OracleDbType.Varchar2, isbn, ParameterDirection.Input));

        connection.Open();
        command.ExecuteNonQuery();

        connection.Close();

        lblTitle.Text = "You have successfully added the item to your cart.";
    }
    protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)

    {
        //ClientScriptManager script = Page.ClientScript;
        //script.RegisterClientScriptBlock(this.GetType(), "test", "<script>var t= new test(); var ab=t.value;</script>");
        //string rating = this.ListView1.SelectedIndex.ToString();
        //string dbConnectionString = ConfigurationManager.ConnectionStrings["OracleConnection"].ConnectionString;

        //OracleConnection connection = new OracleConnection();
        //connection.ConnectionString = dbConnectionString;

        //OracleCommand command = connection.CreateCommand();
        //command.CommandText = "insert into reviews values(null,null,:isbn, :ab,1)";
        //command.Parameters.Add(new OracleParameter("ISBN", OracleDbType.Varchar2, isbn, ParameterDirection.Input));
        //command.Parameters.Add(new OracleParameter("rating", OracleDbType.Varchar2, rating, ParameterDirection.Input));
        //connection.Open();
        //command.ExecuteNonQuery();

        //connection.Close();
        string display = "Pop-up!";
        ClientScript.RegisterStartupScript(this.GetType(), "yourMessage", "alert('" + display + "');", true);

    }

    protected void star5_CheckedChanged(object sender, EventArgs e)
    {
        String rating2 = rbtLstRating.SelectedItem.Value;
        lblTitle.Text = rating2;
        string dbConnectionString = ConfigurationManager.ConnectionStrings["OracleConnection"].ConnectionString;

        OracleConnection connection = new OracleConnection();
        connection.ConnectionString = dbConnectionString;
        OracleCommand cmd = new OracleCommand("INSERT INTO Reviews(Reviewid, CustomersCustomerId, ISBN, RATING)" + "VALUES(To_char(seq_review.nextval)," + Session["UserID"] + "," + isbn + "," + rating2 + ")", connection);

        //cmd.Parameters.Add("ISBN", OracleDbType.Varchar2,  isbn, ParameterDirection.Input);
        //cmd.Parameters.Add("Rating", OracleDbType.Int16, rating2, ParameterDirection.Input);



        cmd.Connection = connection;
        connection.Open();

        cmd.ExecuteNonQuery();

        connection.Close();




        string display = "You have successfully rated the book!";

        ClientScript.RegisterStartupScript(this.GetType(), "Thank you for Rating", "alert('" + display + "');", true);

    }
}