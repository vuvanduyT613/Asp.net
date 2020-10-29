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
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public Label lblCountCart 
        {
            get { return this.lbl_countcart; }
            set { this.lbl_countcart = value; }
        }
    }
}