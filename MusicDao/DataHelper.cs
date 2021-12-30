using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace MusicDao
{
    public class DataHelper
    {
        string conStr = ConfigurationManager.ConnectionStrings["strconnect"].ConnectionString;

        public SqlConnection Con
        {
            get { return con; }
        }

        SqlConnection con;

        public DataHelper()
        {
            con = new SqlConnection(conStr);
        }

        public DataHelper(string conStr)
        {
            this.conStr = conStr;
            con = new SqlConnection(conStr);
        }

        public string Open()
        {
            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                return "";
            }
            catch (Exception e)
            {
                return e.Message;
            }
        }

        public void Close()
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }

        public SqlParameter CreateParameter(string name, object value, DbType dbType, ParameterDirection direction = ParameterDirection.Input)
        {
            return new SqlParameter()
            {
                ParameterName = name,
                Value = value,
                DbType = dbType,
                Direction = direction
            };
        }

        public SqlDataReader ExecuteReader(string sqlSelect)
        {
            Open();
            SqlCommand cm = new SqlCommand(sqlSelect, con);
            SqlDataReader dr = cm.ExecuteReader();
            return dr;
        }

        public object ExecuteScalar(string sqlSelect)
        {
            Open();
            SqlCommand cm = new SqlCommand(sqlSelect, con);
            object result = cm.ExecuteScalar();
            Close();
            return result;
        }

        public string ExecuteNonQuery(string sql)
        {
            Open();
            try
            {
                SqlCommand cm = new SqlCommand(sql, con);
                cm.ExecuteNonQuery();
                Close();
                return "";
            }
            catch (SqlException e)
            {
                return e.Message;
            }
        }

        public DataTable FillDataTable(string sql)
        {
            if (con.State == ConnectionState.Closed) con.Open();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(sql, conStr);
            da.Fill(dt);
            return dt;
            //SqlDataAdapter da = new SqlDataAdapter(sql, con);
            //DataTable dt = new DataTable();
            //da.Fill(dt);
            //return dt;
        }

        public void InsertRow(DataTable dt, params object[] values)
        {
            DataRow dr = dt.NewRow();
            for (int i = 0; i < values.Length; i++)
            {
                dr[i] = values[i];
            }
            dt.Rows.Add(dr);
        }

        public DataView FillRow(DataTable dt, string dieukien)
        {
            DataView dv = new DataView(dt);
            dv.RowFilter = dieukien;
            return dv;
        }

        public void UpdateRow(DataTable dt, string dieukien, params object[] values)
        {
            //Lọc các bản ghi cấn sửa
            DataView dv = FillRow(dt, dieukien);
            dv.AllowEdit = true;
            if (dv.Count > 0)
            {
                for (int i = 0; i < values.Length; i++)
                {
                    dv[0][i + 1] = values[i];
                }
            }
        }

        public void DeleteRow(DataTable dt, string dk)
        {
            DataView dv = FillRow(dt, dk);
            dv.AllowDelete = true;
            while (dv.Count > 0)
            {
                dv.Delete(0);
            }
        }

        public void UpdateDataTableToDataBase(params Object[] DataTable_TableNames)
        {
            string st = "";
            for (int i = 1; i < DataTable_TableNames.Length; i = i + 2)
            {
                if (i == DataTable_TableNames.Length - 1)
                {
                    st = st + " select * from " + DataTable_TableNames[i].ToString();
                }
                else
                {
                    st = st + " select * from " + DataTable_TableNames[i].ToString() + ";";
                }
            }
            SqlDataAdapter da = new SqlDataAdapter(st, con);
            SqlCommandBuilder cb = new SqlCommandBuilder(da);
            DataSet ds = new DataSet();
            for (int i = 1; i < DataTable_TableNames.Length; i = i + 2)
            {
                ds.Tables.Add((DataTable)DataTable_TableNames[i]);
            }
            da.Update(ds);
        }

        public void UpdateDataTableToDataBase(DataTable dt, string tableName)
        {
            SqlDataAdapter da = new SqlDataAdapter("select * from " + tableName, con);
            SqlCommandBuilder cb = new SqlCommandBuilder(da);
            da.Update(dt);
        }

        public DataTable ExecuteStoreProcedure(string storeName, params object[] values)
        {
            //Open();
            SqlCommand cm = new SqlCommand(storeName, con);
            cm.CommandType = CommandType.StoredProcedure;
            SqlCommandBuilder.DeriveParameters(cm);
            for (int i = 1; i < cm.Parameters.Count; i++)
            {
                cm.Parameters[i].Value = values[i - 1];
            }
            SqlDataAdapter da = new SqlDataAdapter(cm);
            DataTable dt = new DataTable();
            da.Fill(dt);
            //Close();
            return dt;
        }

        public SqlDataReader StoreReaders(string tenStore, params object[] values)
        {
            SqlCommand cm;
            Open();
            try
            {
                cm = new SqlCommand(tenStore, con);
                cm.CommandType = CommandType.StoredProcedure;
                SqlCommandBuilder.DeriveParameters(cm);
                for (int i = 1; i < cm.Parameters.Count; i++)
                {
                    cm.Parameters[i].Value = values[i - 1];
                }
                SqlDataReader dr = cm.ExecuteReader();
                return dr;
            }
            catch
            {
                return null;
            }
        }

        public string ExecuteNonQueryStoreProcedure(string storePName, params object[] values)
        {
            Open();
            try
            {
                SqlCommand cm = new SqlCommand(storePName, con);
                cm.CommandType = CommandType.StoredProcedure;
                SqlCommandBuilder.DeriveParameters(cm);
                for (int i = 1; i < cm.Parameters.Count; i++)
                {
                    cm.Parameters[i].Value = values[i - 1];
                }
                cm.ExecuteNonQuery();
                Close();
                return "";
            }
            catch (SqlException e)
            {
                return e.Message;
            }
        }
    }
}
