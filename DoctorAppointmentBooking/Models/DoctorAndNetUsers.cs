using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoctorAppointmentBooking.Models
{
    public class DoctorAndNetUsers
    {
        public Doctor Doctor { get; set; }
        public AllAppointment  AllAppointment { get; set; }
        //doctor model fields
        //public int DocId { get; set; }
        //public string DocName { get; set; }
        //public string DocQualification { get; set; }
        //public int DocExperience { get; set; }
        //public string DocKnownLanguage { get; set; }
        //public string DocCity { get; set; }
        //public string DocBranch { get; set; }
        //public string DocSpecialization { get; set; }
        //public string DocImagePath { get; set; }

        ////allAppointment model fields
        //public string UserName { get; set; }
        //public Nullable<int> DoctorId { get; set; }
        //public Nullable<System.DateTime> SlotDate { get; set; }
        //public string Slots { get; set; }
    }
}