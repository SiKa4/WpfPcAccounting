//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WpfPcAccounting
{
    using System;
    using System.Collections.Generic;
    
    public partial class GPU
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public GPU()
        {
            this.PC = new HashSet<PC>();
        }
    
        public int id_GPU { get; set; }
        public string Serial_name { get; set; }
        public int Video_memory { get; set; }
        public int id_Type_Video_Memory { get; set; }
    
        public virtual Type_Video_Memory Type_Video_Memory { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PC> PC { get; set; }
    }
}
