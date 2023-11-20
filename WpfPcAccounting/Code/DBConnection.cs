using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WpfPcAccounting.Model;

namespace WpfPcAccounting.Code
{
    static class DBConnection
    {
        public static AccountingOfEquipmentEntities DB = new AccountingOfEquipmentEntities();
    }
}
