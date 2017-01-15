using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NHibernate;
using FluentNHibernate.Cfg.Db;
using FluentNHibernate.Cfg;

namespace Data.DAO
{
    class NHibernateSession
    {
        private static string ConnectionString = "Data Source=LAPTOP-Q6S5MJE7\\SQLEXPRESS;Initial Catalog=sysbacon;Integrated Security=True";

        private static ISessionFactory session;

        public static ISessionFactory CreateSession()
        {
            if (session != null)
                return session;

            IPersistenceConfigurer configDB = MsSqlConfiguration.MsSql2012.ConnectionString(ConnectionString);
            var configMap = Fluently.Configure().Database(configDB).Mappings(c => c.FluentMappings.AddFromAssemblyOf<Mapping.ClienteMap>());
            session = configMap.BuildSessionFactory();
            return session;

        }

        public static ISession OpenSession()
        {
            return CreateSession().OpenSession();
        }
    }
}
