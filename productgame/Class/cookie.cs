using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Caching;

namespace productgame.Class
{
    public class addCockie
    {
        public void addcokie(string name, string value) {
            HttpCookie ck = new HttpCookie(name);
            ck.Value = value;
            
        }
    }
}