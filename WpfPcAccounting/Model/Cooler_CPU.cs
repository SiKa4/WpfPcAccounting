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
    
    public partial class Cooler_CPU
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Cooler_CPU()
        {
            this.PC = new HashSet<PC>();
        }
    
        public int id_Cooler_CPU { get; set; }
        public string Serial_name { get; set; }
        public int id_Socket { get; set; }
    
        public virtual Socket Socket { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PC> PC { get; set; }
    }
}
