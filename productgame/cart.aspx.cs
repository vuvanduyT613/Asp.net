using productgame.Class;
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
        DataTable dt = new DataTable();
        ArrayList arr = new ArrayList();
        connection cn = new connection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["SessionID"] == null)
            {
                Server.Transfer("./default.aspx");
            }
            else 
            {
                fetchData();
                //addColumDt(arr);
            }
        }

        protected string subStr(ArrayList s) {
            string query = null;
            for (int j = 0; j < s.Count ; j++)
            {
                query = query + "OR ProductID =" + Convert.ToString(s[j]);
            }
            return query;
        }

        protected void addColumDt(ArrayList s)
        {
            ArrayList t = new ArrayList();
            int count = 0;
            int m = 0;
            int n = 1;
            for (int j = 0; j < s.Count; j++)
            {
                for (int k = j + 1; k < s.Count; k++)
                {
                    if (s[j] == s[k])
                    {
                        ++count;
                    }
                    if (k == s.Count)
                    {
                        t.Add(s[j]);
                        t.Add(count);
                    }
                }
            }
            dt.Columns.Add("NewColumn", typeof(System.Int32));

            foreach (DataRow row in dt.Rows)
            {
                if (Convert.ToInt32( row["ProductID"].ToString()) == Convert.ToInt32(t[m].ToString()))
                {
                    row["NewColumn"] = t[n];
                    m += 2;
                    n += 2;
                }
            }
        }

        protected void fetchData() {
            if (Page.IsPostBack) return;
            SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["con"]);
            string s = Session["SessionID"].ToString();
            for (int i = 0; i < s.Length; i++)
            {
                arr.Add(s[i]);
            }
            try 
            {
                con.Open();
                string query = "SELECT * FROM Products WHERE ProductID = 0 " + subStr(arr);
                SqlDataAdapter da = new SqlDataAdapter(query, ConfigurationManager.AppSettings["con"]);
                da.Fill(dt);
                this.DataList1.DataSource = dt;
                this.DataList1.DataBind();
            }
            catch(SqlException ex)
            {
                Response.Write(""+ex);
            }
            this.lbl_prince.Text = Convert.ToString(calculator(dt) + "$");
            this.lbl_prince_red.Text = Convert.ToString(calculator(dt)+ "$");
        }

        protected int calculator(DataTable dt)
        {
            int sum = 0;
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    sum = sum + Convert.ToInt32(row["Prince"].ToString());
                }
            }
            return sum;
        }
        
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            dt.AcceptChanges();
            foreach (DataRow row in dt.Rows)
            {
                // If this row is offensive then
                row.Delete();
            }
            dt.AcceptChanges(); 
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Server.Transfer("~/default.aspx");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            string query = "INSERT INTO Bills (NemberID,TotalProduct,TotalPrince) VALUES (" + Session["NemberID"].ToString() + "," + arr.Count + "," + this.lbl_prince_red.Text + ");";
            int result = cn.Handle(query);
            if (result > 0)
            {
                Response.Write("<script>setTimeout(() => {alert('Thanh Toán thàng công');}, 1500);</script>");
            }
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            
        }
    }
}