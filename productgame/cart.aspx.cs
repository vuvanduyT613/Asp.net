using Org.BouncyCastle.Crypto;
using Org.BouncyCastle.Utilities.Encoders;
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
        LinkedList<productCount> t = new LinkedList<productCount>();
        string sessionPriveous = null;
        //create class a object
        public class productCount
        {
            string id, count;
            public string Id
            {
                get { return id; }
                set { this.id = value; }
            }
            public string Count {
                get { return count;  }
                set { this.count = value; }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["SessionID"] == null)
            {
                Server.Transfer("./default.aspx");
            }
            else 
            {
                sessionPriveous = Session["SessionID"].ToString();
                fetchData();
                //addColumDt(arr);
            }
            if (!sessionPriveous.Equals(Session["SessionID"].ToString())) {
                string sessionNext = Session["SessionID"].ToString();
                for (int i = 0; i < sessionNext.Length; i++)
                {
                    arr.Add(sessionNext[i]);
                }
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
            for (int j = 0; j < s.Count-1; j++)
            {
                int count = 1;
                for (int k = j + 1; k < s.Count; k++)
                {
                    if (Convert.ToInt32(s[j]) == Convert.ToInt32(s[k]))
                    {
                        ++count;
                        s.RemoveAt(k);
                    }
                    if (count > 1)
                    {
                        productCount p = new productCount();
                        p.Id = Convert.ToString(s[j]);
                        p.Count = Convert.ToString(count);
                        t.AddLast(p);
                    }
                    if (count == 1)
                    {
                        productCount p = new productCount();
                        p.Id = Convert.ToString(s[j]);
                        p.Count = "1";
                        t.AddLast(p);
                    }
                }
            }
            dt.Columns.Add("NewColumn", typeof(System.Int32));
            foreach (DataRow row in dt.Rows)
            {
                foreach (productCount item in t)
                {
                    if (item.Id.Equals(row["ProductID"].ToString()))
                    {
                        row["NewColumn"] = item.Count;
                    }
                    else
                    {
                        row["NewColumn"] = "1";
                    }
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
                addColumDt(arr);
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
            DataColumnCollection columns = dt.Columns;
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    try
                    {
                        sum = sum + (Convert.ToInt32(row["Prince"].ToString()) * Convert.ToInt32(row["NewColumn"].ToString()));
                    }
                    catch
                    {
                        sum = sum + (Convert.ToInt32(row["Prince"].ToString()));
                    }
                }
            }
            return sum;
        }
        
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
           /* foreach (DataRow row in dt.Rows)
            {
                // If this row is offensive then
                if (Convert.ToInt32(row["productID"].ToString()).Equals(Convert.ToInt32(((LinkButton)sender).CommandArgument)))
                {
                    string hex = null;
                    row.Delete();
                    for (int i = 0; i < arr.Count; i++)
                    {
                        if (Convert.ToInt32(((LinkButton)sender).CommandArgument).Equals(Convert.ToInt32(arr[i].ToString()))) 
                        {
                            arr.RemoveAt(i);
                        }
                        else
                        {
                            hex += arr[i].ToString();
                        }
                    }
                    Session["SessionID"] = hex;
                }
            }
            dt.AcceptChanges();
            Server.Transfer("~/cart.aspx");*/
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Server.Transfer("~/default.aspx");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            string query = "INSERT INTO Bills (NemberID,TotalProduct,TotalPrince) VALUES (" + Session["NemberID"].ToString() + ",'" + arr.Count + "','" + this.lbl_prince_red.Text + "')";
            int result = cn.Handle(query);
            if (result > 0)
            {
                Response.Write("<script>setTimeout(() => {alert('Thanh Toán thàng công');}, 1500);</script>");
            }
            else 
            {
                Response.Write("<script>setTimeout(() => {alert('Giao dịch thất bại');}, 1500);</script>");
            }
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            foreach (DataRow row in dt.Rows)
            {
                if (Convert.ToInt32(row["productID"].ToString()) == Convert.ToInt32(((LinkButton)sender).CommandArgument))
                {
                    int tmp = Convert.ToInt32(row["NewColumn"].ToString()) - 1;
                    row["NewColumn"] = Convert.ToString(tmp);
                }
            }
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {

        }
    }
}