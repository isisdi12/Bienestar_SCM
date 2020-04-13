using Capa_Datos_SCM;
using System;
using System.Collections.Generic;
using System.Data.Odbc;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Capa_Logica_SCM
{
    public class LIPSCM
    {

        SIPSCM sn = new SIPSCM();

        // consulta proveedor combo

        public OdbcDataReader consultaproveedor()
        {
            return sn.consultaproveedor();
        }

        // consulta presentacion combo

    }
}
