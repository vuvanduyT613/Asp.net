using productgame.Class;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace productgame
{
    public partial class _default : System.Web.UI.Page
    {
        const int count = 0;
        string stcn = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename='C:\Users\vuvan\OneDrive\Documents\ASP\END GAME\productgame\productgame\App_Data\product.mdf';Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)   {
            fetchData();
        }

        //control logic
        protected void fetchData() {
            if (Page.IsPostBack) return;
            SqlConnection con = new SqlConnection(stcn);
            string query = "SELECT * FROM Products";
            try
            {
                con.Open();
                SqlCommand command = new SqlCommand(query,con);
                SqlDataReader reader = command.ExecuteReader();
                this.DataList1.DataSource = reader;
                this.DataList1.DataBind();
            }
            catch (SqlException ex)
            {
                Response.Write("<script>setTimeout(() => { alert('server gặp sự cố vui lòng quay lại sau'); }, 1500);</script>");
            }
            finally
            {
                con.Close();
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            int i = Convert.ToInt32(Master.lblCountCart.Text) + 1;
            Master.lblCountCart.Text = Convert.ToString(i);
            Session["count"] = i;
           /* Session[String.Format("Session{0}", ((LinkButton)sender).CommandArgument)] = ((LinkButton)sender).CommandArgument;*/
            if(Session["SessionID"] == null)
            {
                Session["SessionID"] = ((LinkButton)sender).CommandArgument;
            }
            else
            {
                Session["SessionID"] = Session["SessionID"].ToString() + ((LinkButton)sender).CommandArgument;
            }
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/detail.aspx?id=" + ((LinkButton)sender).CommandArgument);
        }
    }
}