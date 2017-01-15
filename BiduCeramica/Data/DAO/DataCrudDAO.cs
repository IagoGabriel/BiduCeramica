using NHibernate;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.DAO
{
    public class DataCrudDAO<T> : ICrudDAO<T> where T : class
    {
        public void Alterar(T entity)
        {
            using (ISession session = NHibernateSession.OpenSession())
            {
                using (ITransaction transaction = session.BeginTransaction())
                {
                    try
                    {
                        session.Update(entity);
                        transaction.Commit();
                    }
                    catch (Exception ex)
                    {
                        if (!transaction.WasCommitted)
                            transaction.Rollback();

                        throw new Exception("Erro ao alterar entidade: " + ex.Message);
                    }
                }
            }
        }

        public T Buscar(int id)
        {
            using (ISession session = NHibernateSession.OpenSession())
            {
                return session.Get<T>(id);
            }
        }

        public void Excluir(T entity)
        {
            using (ISession session = NHibernateSession.OpenSession())
            {
                using (ITransaction transaction = session.BeginTransaction())
                {
                    try
                    {
                        session.Delete(entity);
                        transaction.Commit();
                    }
                    catch (Exception ex)
                    {
                        if (!transaction.WasCommitted)
                            transaction.Rollback();

                        throw new Exception("Erro ao excluir entidade: " + ex.Message);
                    }
                }
            }
        }

        public void Inserir(T entity)
        {
            using (ISession session = NHibernateSession.OpenSession())
            {
                using (ITransaction transaction = session.BeginTransaction())
                {
                    try
                    {
                        session.Save(entity);
                        transaction.Commit();
                    }
                    catch (Exception ex)
                    {
                        if (!transaction.WasCommitted)
                            transaction.Rollback();

                        throw new Exception("Erro ao inserir entidade: " + ex.Message);
                    }
                }
            }
        }
    }
}
