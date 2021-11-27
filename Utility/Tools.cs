using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Newtonsoft.Json;

namespace Utility
{
    public static class Tools
    {
        public static T ToList<T>(SqlDataReader reader)
        {
            var jsonResult = new StringBuilder();
            if (!reader.HasRows)
            {
                return default;
            }
            else
            {
                while (reader.Read())
                {
                    jsonResult.Append(reader.GetValue(0).ToString());
                }
            }
            T obj = JsonConvert.DeserializeObject<T>(jsonResult.ToString());
            return obj;
        }
        public static int Nation(string nation)
        {
            int nationInt;
            if (nation == "vn")
            {
                nationInt = 1;
            }
            else if (nation == "usuk")
            {
                nationInt = 2;
            }
            else if (nation == "ca")
            {
                nationInt = 3;
            }
            else
            {
                nationInt = 4;
            }
            return nationInt;
        }
        public static string GetUserName()
        {
            //GetUser_Result user = (GetUser_Result)Session["user"];
            //string accountName = "";
            //if (user != null)
            //{
            //    accountName = user.AccountName;
            //}
        }
    }
}
