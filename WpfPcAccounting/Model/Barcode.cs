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
    
    public partial class Barcode
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Barcode()
        {
            this.Barcode_Inventory = new HashSet<Barcode_Inventory>();
        }
    
        public int id_Barcode { get; set; }
        public long Barcode_Value { get; set; }
        public string Barcode_Datas { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Barcode_Inventory> Barcode_Inventory { get; set; }
        public virtual PC PC { get; set; }
    }
}
