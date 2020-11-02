using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace productgame
{
    public partial class detail : System.Web.UI.Page
    {
        string stcn = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename='C:\Users\vuvan\OneDrive\Documents\ASP\END GAME\productgame\productgame\App_Data\product.mdf';Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            FetchData();
        }

        protected void FetchData()
        {
            
            if (Page.IsPostBack) return;
            SqlConnection con = new SqlConnection(stcn);
            DataTable dt = new DataTable();
            string query = "SELECT * FROM Products WHERE ProductID = " + Request.QueryString["id"];
            try
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(query, ConfigurationManager.AppSettings["con"]);
                da.Fill(dt);
            }
            catch (SqlException ex)
            {
                Response.Write("<script>setTimeout(() => { alert('server gặp sự cố vui lòng quay lại sau'); }, 1500);</script>");
            }
            finally
            {
                con.Close();
            }

            if (dt.Rows.Count <= 0)
            {
                Server.Transfer("~/default.aspx");
            }

            if (dt.Rows.Count > 0) {
              foreach(DataRow row in dt.Rows) {
                    foreach(DataColumn  column in dt.Columns)
                    {
                        this.lbl_name.Text = row["ProductName"].ToString();
                        this.llb_name2.Text = row["ProductName"].ToString();
                        this.Image1.ImageUrl = "./Stylesheet/img/" + row["ImageSource"].ToString();
                        this.lbl_msp.Text = row["ProductID"].ToString() + "VnGame";
                        this.lbl_status.Text = row["Status"].ToString();
                        this.lbl_price.Text = row["prince"].ToString()+"$";
                        this.lbl_description.Text = row["Description"].ToString();
                    }
              }
            }
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            int i = Convert.ToInt32(Master.lblCountCart.Text) + 1;
            Master.lblCountCart.Text = Convert.ToString(i);
            Session["count"] = i;
            Session[String.Format("Session{0}", i)] = ((LinkButton)sender).CommandArgument;
            Response.Write("<script>setTimeout(() => { alert('Mua hàng thành công'); }, 1500);</script>");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            int i = Convert.ToInt32(Master.lblCountCart.Text) + 1;
            Master.lblCountCart.Text = Convert.ToString(i);
            Session["count"] = i;
            Session[String.Format("Session{0}", i)] = Request.QueryString["id"];

        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            int x = Convert.ToInt32(TextBox1.Text);
            if(x <= 0)
            {
                TextBox1.Text = "1";
            }
            else
            {
                int sum = x - 1;
                TextBox1.Text = Convert.ToString(sum);
            }
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            int x = Convert.ToInt32(TextBox1.Text);
            if (x <= 0)
            {
                TextBox1.Text = "1";
            }
            else
            {
                int sum = x + 1;
                TextBox1.Text = Convert.ToString(sum);
            }
        }
    }
}
