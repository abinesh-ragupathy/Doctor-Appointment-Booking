//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DoctorAppointmentBooking.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class dBranch
    {
        public int bId { get; set; }
        public string bName { get; set; }
        public Nullable<int> cId { get; set; }
    
        public virtual dCity dCity { get; set; }
    }
}
