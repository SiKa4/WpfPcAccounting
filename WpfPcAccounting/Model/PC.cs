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
    
    public partial class PC
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PC()
        {
            this.PC_Storage = new HashSet<PC_Storage>();
        }
    
        public int id_PC { get; set; }
        public int id_Type_PC { get; set; }
        public string Serial_name { get; set; }
        public int id_Motherboard { get; set; }
        public int id_RAM { get; set; }
        public int id_GPU { get; set; }
        public int id_Power_Supply { get; set; }
        public int id_CPU { get; set; }
        public int id_Cooler_CPU { get; set; }
        public int Quantity_RAM { get; set; }
    
        public virtual Barcode Barcode { get; set; }
        public virtual Cooler_CPU Cooler_CPU { get; set; }
        public virtual CPU CPU { get; set; }
        public virtual GPU GPU { get; set; }
        public virtual Motherboard Motherboard { get; set; }
        public virtual Power_Supply Power_Supply { get; set; }
        public virtual RAM RAM { get; set; }
        public virtual Type_PC Type_PC { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PC_Storage> PC_Storage { get; set; }
    }
}
