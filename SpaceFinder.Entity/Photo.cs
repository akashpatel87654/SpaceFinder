//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SpaceFinder.Entity
{
    using System;
    using System.Collections.Generic;
    
    public partial class Photo
    {
        public int PhotoId { get; set; }
        public string Name { get; set; }
        public Nullable<int> ProjectId { get; set; }
        public Nullable<bool> Active { get; set; }
        public Nullable<System.DateTime> Created { get; set; }
        public Nullable<System.DateTime> Modified { get; set; }
    
        public virtual Project Project { get; set; }
    }
}
