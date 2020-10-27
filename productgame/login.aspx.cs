using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Security.Principal;
using System.Web.Services.Description;
using Facebook;
using GoogleApi;
using System.Web.Script.Serialization;
using System.Security.Policy;
using System.Configuration;
using ASPSnippets.GoogleAPI;
using ASPSnippets.FaceBookAPI;
using System.EnterpriseServices;
using System.Dynamic;
using productgame.Class;

namespace productgame.stylesheet
{
    public partial class Login : System.Web.UI.Page
    {
        connection cn = new connection();
        public class FaceBookUser
        {
            public string Id { get; set; }
            public string Name { get; set; }
            public string PictureUrl { get; set; }
            public string Email { get; set; }
        }
        public class GoogleProfile
        {
            public string Id { get; set; }
            public string DisplayName { get; set; }
            public Image Image { get; set; }
            public List<Email> Emails { get; set; }
            public string Gender { get; set; }
            public string ObjectType { get; set; }
        }

        public class Email
        {
            public string Value { get; set; }
            public string Type { get; set; }
        }

        public class Image
        {
            public string Url { get; set; }
        }

        
        protected void Page_Load(object sender, EventArgs e)
        {
            checkConect();
            getApiGoogle();
            getApiFacebook();
        }

        // logic login
        protected void checkLogin() {
            string email = this.txt_email.Text;
            string pass = this.txt_pass.Text;
            string query = "SELECT * FROM Nembers WHERE Email = '" + email + "'AND PassWord = '" + pass + "'";
            DataTable dt = new DataTable();

            try
            {
                SqlDataAdapter da = new SqlDataAdapter(query, ConfigurationManager.AppSettings["con"]);
                da.Fill(dt);
            }
            catch (SqlException ex)
            {
                Response.Write("Fail" + ex.Message);
            }

            if (dt.Rows.Count > 0)
            {
                Session["email"] = email;
                Server.Transfer("Home.aspx");
            }
            if (dt.Rows.Count <= 0)
            {
                this.Label1.Text = "Gmail và mật khẩu không hợp lệ!";
                //this.Panel1.Attributes.Add("class", "alert alert-danger");
                this.txt_email.Text = email;
                this.txt_pass.Text = pass;
                //Server.Transfer("Login.aspx");
            }
        }

        protected void checkConect(){
            if (Page.IsPostBack) return;
            try
            {
                cn.conOpen();
            }
            catch (SqlException ex)
            {
                Response.Write("Fail" + ex.Message);
            }
        }

        protected void getApiGoogle() {
            GoogleConnect.ClientId = ConfigurationManager.AppSettings["g_id"];
            GoogleConnect.ClientSecret = ConfigurationManager.AppSettings["g_secret"];
            GoogleConnect.RedirectUri = Request.Url.AbsoluteUri.Split('?')[0];

            if (!string.IsNullOrEmpty(Request.QueryString["code"]))
            {
                string code = Request.QueryString["code"];
                string json = GoogleConnect.Fetch("me", code);
                GoogleProfile profile = new JavaScriptSerializer().Deserialize<GoogleProfile>(json);
                Session["email"] = profile.Emails.Find(email => email.Type == "account").Value;
                Server.Transfer("./home.aspx");
                Request.QueryString.Remove("code");
            }
            if (Request.QueryString["error"] == "access_denied")
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('Access denied.')", true);
            }
        }

        protected void getApiFacebook() {
            FaceBookConnect.API_Key = ConfigurationManager.AppSettings["fb_app_id"];
            FaceBookConnect.API_Secret = ConfigurationManager.AppSettings["fb_app_secret"];
            FaceBookUser faceBookUser = new FaceBookUser();
            if (!string.IsNullOrEmpty(Request.QueryString["code"]))
            {
                string data = FaceBookConnect.Fetch("code", "me?fields=id,name,email");
                faceBookUser = new JavaScriptSerializer().Deserialize<FaceBookUser>(data);
                Session["email"] = faceBookUser.Name;
                Server.Transfer("./home.aspx");
                Request.QueryString.Remove("code");
            }
            if (Request.QueryString["error"] == "access_denied")
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('Access denied.')", true);
            }
        }
        //action click
        protected void btn_dangnhap_Click1(object sender, EventArgs e)
        {
            checkLogin();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            FaceBookConnect.Authorize("user_photos,email", string.Format("{0}://{1}/{2}", Request.Url.Scheme, Request.Url.Authority, "./home.aspx"));
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            GoogleConnect.Authorize("profile", "email");
        }
    }
}