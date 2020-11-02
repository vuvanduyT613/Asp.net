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
using System.Web.Script.Serialization;
using System.Security.Policy;
using System.Configuration;
using ASPSnippets.GoogleAPI;
using ASPSnippets.FaceBookAPI;
using GoogleApi.Exceptions;
using System.EnterpriseServices;
using System.Dynamic;
using productgame.Class;
using Newtonsoft.Json;
using System.Runtime.Serialization.Formatters;
using Org.BouncyCastle.Asn1.Ocsp;

namespace productgame.stylesheet
{
    public partial class Login : System.Web.UI.Page
    {
        connection cn = new connection();
        controlCookie ck = new controlCookie();

        protected void Page_Load(object sender, EventArgs e)
        {
            checkConect();
            getApiGoogle();
            getApiFacebook();
            loadDataCookie();

            if (Request.QueryString["not"] != null) 
            {
                Response.Write("<script>setTimeout(() => {alert('Đăng Kí thành công');}, 1500);</script>");
            }
        }

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

        // logic login
        protected void checkLogin() {
            string email = this.txt_email.Text;
            string pass = this.txt_pass.Text;
            string query = "SELECT * FROM Nembers WHERE Email = '" + email + "'AND PassWord = '" + pass + "'";
            DataTable dt = new DataTable();

            if (pass.Length < 6)
            {
                this.Label1.Text = "Vui lòng nhập mật khẩu lớn hơn 6 kí tự!";
            }
            else 
            {
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

                    Random r = new Random();
                    //set session
                    Session["session"] = Convert.ToString(r.Next());
                    //set cookie
                    HttpCookie ckEmail = new HttpCookie("email", email);
                    HttpCookie ckPass = new HttpCookie("pass", pass);
                    //check save infomation
                    if (checkbox.Checked == true) 
                    {
                        ckEmail.Expires = DateTime.Now.AddMinutes(20);
                        ckPass.Expires = DateTime.Now.AddMinutes(20);

                        Session["Email"] = email;
                        Session["Date"] = DateTime.Now;
                    }
                    else 
                    {
                        ckEmail.Expires = DateTime.Now.AddMinutes(-20);
                        ckPass.Expires = DateTime.Now.AddMinutes(-20);
                    }
                    Response.Cookies.Add(ckEmail);
                    Response.Cookies.Add(ckPass);
                    Response.Write("<script>setTimeout(() => {alert('Đăng nhập thành công');}, 1500);</script>");
                    Response.Redirect("~/default.aspx?email=" + email);
                }

                if (dt.Rows.Count <= 0)
                {
                    this.Label1.Text = "Gmail và mật khẩu không hợp lệ!";
                    this.txt_email.Text = email;
                    this.txt_pass.Text = pass;
                }

            }
        }

        protected void loadDataCookie() {
            if(Request.Cookies["email"] != null && Request.Cookies["pass"] != null) 
            {
                txt_email.Text = Request.Cookies["email"].Value;
                txt_pass.Text = Request.Cookies["pass"].Value;
                checkbox.Checked = true;
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
                try
                {
                   /* var jsonSettings = new JsonSerializerSettings
                    {
                        TypeNameHandling = TypeNameHandling.Objects,
                        TypeNameAssemblyFormat = FormatterAssemblyStyle.Simple
                    };
                    GoogleProfile json = new GoogleProfile();
                    var code = Request.QueryString["code"];
                    json = JsonConvert.DeserializeObject<GoogleProfile>( GoogleConnect.Fetch("me", code), jsonSettings);
                    //GoogleProfile profile = new JavaScriptSerializer().Deserialize<GoogleProfile>(json);*/
                    Server.Transfer("~/default.aspx");
                    Request.QueryString.Remove("code");
                }
                catch (GoogleApiException ex) {
                    Response.Write(ex);
                }
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
                try
                {
                    /*string data = FaceBookConnect.Fetch("code", "me?fields=id,name,email");
                    faceBookUser = new JavaScriptSerializer().Deserialize<FaceBookUser>(data);
                    Response.Cookies.Add(ck.addcokie(faceBookUser.Name));*/
                    Server.Transfer("default.aspx");
                    Request.QueryString.Remove("code");
                }
                catch (Exception ex)
                {
                    Response.Write(ex);
                }
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
            FaceBookConnect.Authorize("user_photos,email", string.Format("{0}://{1}/{2}", Request.Url.Scheme, Request.Url.Authority, "default.aspx"));
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            GoogleConnect.Authorize("profile", "email");
            GoogleConnect.Clear(Request.QueryString["code"]);
        }
    }
}