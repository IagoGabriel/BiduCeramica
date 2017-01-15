using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data
{
    public interface ICrudDAO<T>
    {
        void Inserir(T entity);
        void Alterar(T entity);
        void Excluir(T entity);
        T Buscar(int id);
    }
}
