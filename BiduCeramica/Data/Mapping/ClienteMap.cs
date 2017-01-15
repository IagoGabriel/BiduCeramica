using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FluentNHibernate.Mapping;
using Data.Entities;

namespace Data.Mapping
{
    public class ClienteMap : ClassMap<Cliente>
    {
        public ClienteMap()
        {
            Id(c => c.Id);
            Map(c => c.BairroId);
            Map(c => c.Nome);
            Map(c => c.Numero);
            Map(c => c.Observacao);
            Table("clientes");
        }
    }
}
