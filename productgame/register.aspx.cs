using Microsoft.SqlServer.Server;
using productgame.Class;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace productgame.Stylesheet
{
    public partial class Register : System.Web.UI.Page
    {
        connection cn = new connection();
        validation val = new validation();

        //callback
        protected void Page_Load(object sender, EventArgs e)
        {
            checkConect();
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            checkInfo();
        }

        // controller logic
        protected void checkConect()
        {
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

        protected void checkInfo() {
            string email = this.txt_email.Text;
            string fullname = this.txt_fullname.Text;
            string numberphone = this.txt_numberphone.Text;
            string pass = this.txt_password.Text;
            string username = this.txt_username.Text;
            string repass = this.txt_repassword.Text;
            string query = "INSERT INTO Nembers(FullName,UserName,Email,NumberPhone,PassWord) VALUES ('" + fullname + "','" + username + "','" + email + "','" + numberphone + "','" + pass + "')";

            if (email != "" && fullname != "" && numberphone != "" && pass != "" && username != "" && repass != "")
            {
                if (pass != repass)
                {
                    Response.Write("<script>setTimeout(() => { alert('Vui lòng kiểm tra lại mật khẩu'); }, 1500);</script>");
                }
                else
                {
                    try
                    {
                        int result = cn.Handle(query);
                        if (result > 0)
                        {
                            Response.Write("<script>setTimeout(() => {alert('Đăng ký thành công');}, 1500);</script>");
                            Server.Transfer("~/login.aspx");
                        }
                        else
                        {
                            Response.Write("<script>setTimeout(() => { alert('Đăng ký không thành công'); }, 1500);</script>");
                            Server.Transfer("~/register.aspx");
                        }
                    }
                    catch (SqlException ex)
                    {
                        Response.Write(ex);
                    }
                }
            }
            else
            {
                Response.Write("<script>setTimeout(() => { alert('Đăng ký không thành công vui lòng kiểm tra lại thông tin !'); }, 1500);</script>");            }
        }
    }
}