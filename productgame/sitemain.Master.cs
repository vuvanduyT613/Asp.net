using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace productgame
{
    public partial class sitemain : System.Web.UI.MasterPage
    {
        public static int one = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["email"] != null)
            {
                this.lbl_email.Text = Request.QueryString["email"];
                if(one == 0) 
                {
                    Response.Write("<script>setTimeout(() => {alert('Đăng nhập thành công');}, 1500);</script>");
                }
                one = 1;
            }

            if (Session["count"] != null) 
            {
                this.lbl_countcart.Text = Session["count"].ToString();
            }
        }

        public Label lblCountCart 
        {
            get { return this.lbl_countcart; }
            set { this.lbl_countcart = value; }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if (Session["session"] != null)
            {
                //Server.Transfer("");
                Response.Write("<script>setTimeout(() => {alert('Mua hàng thành công');}, 1500);</script>");
            }
            else 
            {
                Response.Write("<script>setTimeout(() => {alert('Đăng nhập để mua hàng');}, 1500);</script>");
            }
        }
    }
}