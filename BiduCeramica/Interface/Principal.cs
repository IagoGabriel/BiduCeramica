using DevComponents.DotNetBar.Metro;
using DevComponents.DotNetBar;
using DevComponents.AdvTree;
using DevComponents.DotNetBar.Metro.ColorTables;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Interface
{
    public partial class Principal : MetroAppForm
    {
        public Principal()
        {
            InitializeComponent();
        }

        private void mtiCliente_Click(object sender, EventArgs e)
        {
            ucAddCliente telaClientes = new ucAddCliente();
            if (Application.OpenForms.OfType<ucAddCliente>().Count() == 0)
            {
                telaClientes.Show();
            }
        }
    }
}
