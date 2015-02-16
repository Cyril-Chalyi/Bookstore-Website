using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Category : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string isbn =Request.QueryString["ISBN"];
        string cat = Request.QueryString["CategoryID"];
        if (cat == "1")
        {
            catlabel.Text = " Science-Fiction ";
        }
        if(cat == "2")
        {
            catlabel.Text = " Children ";
        }
        if (cat == "3")
        {
            catlabel.Text = " Romance ";
        }
        if (cat == "4")
        { 
            catlabel.Text = " Social Science ";
        }
        if (cat == "5")
        {
            catlabel.Text = " Crafts-Hobbies ";
        }
        if (cat == "6")
        {
            catlabel.Text = " Biography ";
        }
    }
}