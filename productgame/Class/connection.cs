using System;
using System.Data.SqlClient;
using System.Data;


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
        
        public int Handle(string sql)
        {
            
            int kq = 0;
            try
            {
                conOpen();
                SqlCommand cmd = new SqlCommand(sql, con);
                kq = cmd.ExecuteNonQuery();
            }
            catch
            {
                kq = 0;
            }
            finally
            {
                conClose();
            }
            return kq;
        }


      
    }
}