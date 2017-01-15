using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Entities
{
    public class Cliente
    {
        public virtual int Id { get; set; }
        public virtual int BairroId { get; set; }
        public virtual String Nome { get; set; }
        public virtual String Numero { get; set; }
        public virtual String Observacao { get; set; }
    }
}
