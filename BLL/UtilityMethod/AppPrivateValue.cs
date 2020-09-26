using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
   public class AppPrivateValue
    {
        private static readonly String IV = "SuFjcEmp/TE=";
        private static readonly String Key = "KIPSToILGp6fl+3gXJvMsN4IajizYBBT";
    
        public static string ValueIV ()
        {
            string value = Environment.GetEnvironmentVariable("AppEncryptionIV");   // Doesn't work on Server side
            if (value == null)
                value = IV;        
            return value;
        }
        public static string ValueKey()
        {         
            string value = Environment.GetEnvironmentVariable("AppEncryptionKey"); // Doesn't work on Server side           
            if (value == null)
                value = Key;
            return value;
        }
    }
}
