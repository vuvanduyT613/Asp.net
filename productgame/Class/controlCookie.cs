using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace productgame.Class
{
    public class controlCookie
    {
        public HttpCookie addcokie(string value)
        {
            HttpCookie ck = new HttpCookie("email");
            ck.Value = value;
            return ck;
        }
    }
}