//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WpfPcAccounting.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Barcode_Inventory
    {
        public int id_Barcode_Inventory { get; set; }
        public int id_Barcode { get; set; }
        public int id_Inventory { get; set; }
        public int Count { get; set; }
    
        public virtual Barcode Barcode { get; set; }
        public virtual Inventory Inventory { get; set; }
    }
}
