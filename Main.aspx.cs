using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ProductRepeater_PreRender(object sender, EventArgs e)
    {
        for (int i = 0; i < ProductRepeater.Items.Count; i++)
        {
            Literal ltDivPrefix = (Literal)ProductRepeater.Items[i].FindControl("ltDivPrefix");
            Literal ltDivSuffix = (Literal)ProductRepeater.Items[i].FindControl("ltDivSuffix");

            if (i == 0)
                ltDivPrefix.Text = @"<div class=""item active list-carousel-item"">";
            else
                if ((i) % 4 == 0)
                {
                    ltDivPrefix.Text = @"<div class=""item list-carousel-item"">";
                }

            if ((i % 4 == 3) || (i == ProductRepeater.Items.Count - 1))
            {
                ltDivSuffix.Text = "</div>";
            }
        }
    }

    protected void ProductRepeater_PreRender2(object sender, EventArgs e)
    {
        for (int i = 0; i < Repeater1.Items.Count; i++)
        {
            Literal ltDivPrefix2 = (Literal)Repeater1.Items[i].FindControl("ltDivPrefix2");
            Literal ltDivSuffix2 = (Literal)Repeater1.Items[i].FindControl("ltDivSuffix2");

            if (i == 0)
                ltDivPrefix2.Text = @"<div class=""item active list-carousel-item"">";
            else
                if ((i) % 4 == 0)
                {
                    ltDivPrefix2.Text = @"<div class=""item list-carousel-item"">";
                }

            if ((i % 4 == 3) || (i == Repeater1.Items.Count - 1))
            {
                ltDivSuffix2.Text = "</div>";
            }
        }
    }

}

