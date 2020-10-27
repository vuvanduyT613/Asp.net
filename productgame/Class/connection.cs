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

namespace productgame.Class
{
    public class connection
    {
        string stcn = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename='C:\Users\vuvan\OneDrive\Documents\ASP\END GAME\productgame\productgame\App_Data\product.mdf';Integrated Security=True";
        SqlConnection con;

        public void conOpen()
        {
            con = new SqlConnection(stcn);
            con.Open();
        }

        public void conClose() 
        {
            if ((con.State & ConnectionState.Open) > 0) {
                con.Close();
            }
        }


       
    }
}