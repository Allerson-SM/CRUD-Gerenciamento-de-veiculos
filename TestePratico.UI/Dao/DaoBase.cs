using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Threading.Tasks;

namespace TestePratico.UI.Dao
{
    public class DaoBase : IDisposable
    {
        protected readonly string cs = ConfigurationManager.ConnectionStrings["dbCon"].ConnectionString;
        protected readonly SqlConnection con;

        public DaoBase()
        {
            con = new SqlConnection(cs);
        }

        public void ComandoBd(string comando)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand(comando, con);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public void Dispose()
        {
            con?.Dispose();
            con?.Close();
        }
    }
}