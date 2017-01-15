using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Data.Entities;
using Data.Data;

namespace Interface
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Cliente model = new Cliente();
            ClienteData dao = new ClienteData();

            model.BairroId = int.Parse(txtId.Text);
            model.Nome = txtNome.Text;
            model.Numero = txtNumero.Text;
            model.Observacao = txtDescricao.Text;

            dao.Inserir(model);
        }
    }
}
