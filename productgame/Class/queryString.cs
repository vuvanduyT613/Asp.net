using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace productgame.Class
{
    public class queryString
    {
        // sử dụng để thay thế những lần gọi hàm qurẻy trong database
        public string queryAll(string s) {
            return "SELECT * FROM " + s;
        }

        public string queryInsert(string s) {
            return "INSERT INTO " + s + "VALUE";
        }

        public string Update(string s) {
            return "UPDATE";
        }
    }
}