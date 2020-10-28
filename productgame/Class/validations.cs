using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

namespace productgame.Class
{
    public class validation
    {
        public bool checkEmail(string email)
        {
            string pattern = @"^[a-z][a-z|0-9|]*([_][a-z|0-9]+)*([.][a-z|0-9]+([_][a-z|0-9]+)*)?@[a-z][a-z|0-9|]*\.([a-z][a-z|0-9]*(\.[a-z][a-z|0-9]*)?)$";
            Match match = Regex.Match(email, pattern, RegexOptions.IgnoreCase);
            if (match.Success)
                return true;
            else
                return false;
        }

        public bool checkPass(string pass, string repass)
        {
            /* if (pass == null)
             {
                 return false;
             }
             else
             {
                 for (int i = 0; i <= pass.Length; i++)
                 {
                     int j = 0;
                     if (pass[i] == repass[j])
                     {
                         j++;
                     }
                     if (j == pass.Length)
                     {
                         return true;
                     }
                 }
             }
             return false;*/

            if (pass == repass)
            {
                return true;
            }
            else 
            {
                return false;
            }
        }


    }
}