using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ORMPrac2
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            using (Model.DB2EntityContainer db = new Model.DB2EntityContainer()) 
            {
                var oAgents = db.AGENTSSet.ToList();
                if(oAgents.Count > 0)
                {
                    MessageBox.Show("La base de datos ya contiene información", "Operación Exitosa", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                else
                {
                    MessageBox.Show("La base de datos ha sido poblada con éxito", "Operación Exitosa", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                button1.Enabled = false;
            }
        }
    }
}
