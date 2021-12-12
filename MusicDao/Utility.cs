using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;
using System.Data.SqlClient;

namespace MusicDao
{
    public static class Utility
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
        public static string ToStringForJson(SqlDataReader reader)
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
            return jsonResult.ToString();
        }
    }
}
