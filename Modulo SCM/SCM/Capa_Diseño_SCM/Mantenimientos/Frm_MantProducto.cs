using Capa_Logica_SCM;
using CapaDiseño.Consulta;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Odbc;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Net.NetworkInformation;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;


namespace Capa_Diseño_SCM.Mantenimientos
{
    public partial class Frm_MantProducto : Form
    {
        LIPSCM logic = new LIPSCM();
        Validaciones v = new Validaciones();

        public Frm_MantProducto()
        {
            InitializeComponent();
            bloqueartxt();
        }

        public void bloqueartxt()
        {
            /*------------------------*/
            Btn_guardar.Enabled = false;
            Btn_editar.Enabled = false;
            Btn_borrar.Enabled = false;
            /*------------------------*/
            Txt_IdP.Enabled = false;
            Txt_nombre.Enabled = false;
            Txt_Costo.Enabled = false;
            Txt_Descripcion.Enabled = false;
            Txt_Existencias.Enabled = false;
            Txt_Precio.Enabled = false;

            Cbo_estado.Enabled = false;
            Cbo_Proveedor.Enabled = false;
            Txt_Presentacion.Enabled = false;

        }
        public void desbloqueartxt()
        {
            /*------------------------*/
            Btn_guardar.Enabled = true;
            Btn_editar.Enabled = true;
            Btn_borrar.Enabled = true;
            /*------------------------*/
            Txt_IdP.Enabled = true;
            Txt_nombre.Enabled = true;
            Txt_Costo.Enabled = true;
            Txt_Descripcion.Enabled = true;
            Txt_Existencias.Enabled = true;
            Txt_Precio.Enabled = true;

            Cbo_estado.Enabled = true;
            Cbo_Proveedor.Enabled = true;
            Txt_Presentacion.Enabled = true;
        }

        private void Btn_ingresar_Click(object sender, EventArgs e)
        {
            desbloqueartxt();
        }

        private void Btn_minimizar_Click(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Minimized;
        }

        private void Btn_cerrar_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }

        private void Cbo_Proveedor_SelectedIndexChanged(object sender, EventArgs e)
        {
            OdbcDataReader cita = logic.consultaproveedor();
        }
    }
}
