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
    
    public partial class Power_Supply
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Power_Supply()
        {
            this.PC = new HashSet<PC>();
        }
    
        public int id_Power_Supply { get; set; }
        public string Serial_name { get; set; }
        public int Power { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PC> PC { get; set; }
    }
}
