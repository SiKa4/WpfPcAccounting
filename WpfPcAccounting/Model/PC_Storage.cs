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
    
    public partial class PC_Storage
    {
        public int id_PC_Storage { get; set; }
        public int id_PC { get; set; }
        public int id_Storage { get; set; }
    
        public virtual PC PC { get; set; }
        public virtual Storage Storage { get; set; }
    }
}
