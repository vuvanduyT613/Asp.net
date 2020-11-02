using System;
using System.Collections;
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
    public partial class cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write(Session["SessionID"].ToString());
            //Label1.Text = Session["SessionID"].ToString();
            fetchData();
        }

        protected string subStr(ArrayList s) {
            string query = null;
            for (int j = 0; j < s.Count; j++)
            {
                query = query + "OR ProductID =" + Convert.ToString(s[j]);
            }
            return query;
        }
        protected void fetchData() {
            if (Page.IsPostBack) return;
            SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["con"]);
            ArrayList arr = new ArrayList();
            string s = Session["SessionID"].ToString();
            for (int i = 0; i < s.Length; i++)
            {
                arr.Add(s[i]);
            }
            try 
            {
                con.Open();
                string query = "SELECT * FROM Products WHERE ProductID = 0 " + subStr(arr);
                SqlCommand command = new SqlCommand(query, con);
                SqlDataReader reader = command.ExecuteReader();
                this.DataList1.DataSource = reader;
                this.DataList1.DataBind();
            }
            catch(SqlException ex)
            {
                Response.Write(""+ex);
            }
        }
    }
}