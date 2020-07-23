using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoctorAppointmentBooking.Models;
namespace DoctorAppointmentBooking.Controllers
{
    public class HomeController : Controller
    {
        public static MyEntities myEntities = new MyEntities();

        public static List<SelectListItem> CityList = myEntities.dCities.Select(c => new SelectListItem()
        {
            Value = c.cName,
            Text = c.cName
        }).ToList();

        public static List<SelectListItem> BranchList = myEntities.dBranches.Select(b => new SelectListItem()
        {
            Value = b.bName,
            Text = b.bName
        }).ToList();

        public static List<SelectListItem> SpecializationList = myEntities.dSpecializations.Select(s => new SelectListItem()
        {
            Value = s.specName,
            Text = s.specName
        }).ToList();

        public ActionResult Index()
        {
            return View();
        }
        [Authorize]
        [HttpGet]
        public ActionResult BookAppointment()
        {
            ViewBag.DoctorCity = CityList;
            ViewBag.DoctorBranch = BranchList;
            ViewBag.DoctorSpecialization = SpecializationList;
            ViewBag.Message = null;
            return View();
        }
        [HttpPost]
        public ActionResult BookAppointment(CityBranchViewModel cityBranchView)
        {
            if(cityBranchView.DoctorCity == null || cityBranchView.DoctorBranch == null || cityBranchView.DoctorSpecialization == null)
            {
                ViewBag.DoctorCity = CityList;
                ViewBag.DoctorBranch = BranchList;
                ViewBag.DoctorSpecialization = SpecializationList;
                ViewBag.Message  = "Select All Field(s) !";
                return View("BookAppointment");
            }
            else
            {
                List<Doctor> doctorsList = new List<Doctor>();
                try
                {
                    foreach (var doctor in myEntities.Doctors)
                    {
                        if (cityBranchView.DoctorCity == doctor.DocCity && cityBranchView.DoctorBranch == doctor.DocBranch && cityBranchView.DoctorSpecialization == doctor.DocSpecialization)
                        {
                            doctorsList.Add(doctor);
                        }
                    }
                }
                catch (Exception)
                {
                    throw new Exception("Doctor Not Added to list.");
                }
                
                TempData["doctors"] = doctorsList;
                return RedirectToAction("FilteredDoctors");
            }            
        }
        [Authorize]
        [HttpGet]
        public ActionResult FilteredDoctors()
        {
            List<Doctor> doctors =(List<Doctor>) TempData["doctors"];           
            return View(doctors);
        }

        [HttpGet]
        public ActionResult Schedule(int id)
        {
            ViewBag.Slots = new SelectList(myEntities.doctorSlots.Where(d => d.doctorId == id), "slotTimes", "slotTimes");
            var doctor = myEntities.Doctors.Where(d => d.DocId == id).FirstOrDefault();
            DoctorAndNetUsers doctorAndNetUser = new DoctorAndNetUsers();
            doctorAndNetUser.Doctor = doctor;
            doctorAndNetUser.AllAppointment = new AllAppointment();
            doctorAndNetUser.AllAppointment.SlotDate = Convert.ToDateTime(DateTime.Now);
            doctorAndNetUser.AllAppointment.Slots = "";

            return View(doctorAndNetUser);
        }
       [HttpPost]
        public ActionResult ConfirmAppointment(DoctorAndNetUsers model)
        {
            string UserName = User.Identity.Name;
            int DoctorId = model.Doctor.DocId;
            DateTime AptDate = Convert.ToDateTime(model.AllAppointment.SlotDate);
            string AptTime = model.AllAppointment.Slots;
            var existsOrNot = myEntities.AllAppointments.Where(c=>c.DoctorId == DoctorId && c.SlotDate == AptDate && c.Slots == AptTime);
            var count = existsOrNot.Count();
            if (count == 0)
            {
                if(AptTime == null)
                {
                    ViewBag.Slots = new SelectList(myEntities.doctorSlots.Where(d => d.doctorId == DoctorId), "slotTimes", "slotTimes");
                    var doctor = myEntities.Doctors.Where(d => d.DocId == DoctorId).FirstOrDefault();
                    DoctorAndNetUsers doctorAndNetUser = new DoctorAndNetUsers();
                    doctorAndNetUser.Doctor = doctor;
                    doctorAndNetUser.AllAppointment = new AllAppointment();
                    doctorAndNetUser.AllAppointment.SlotDate = Convert.ToDateTime(DateTime.Now);
                    doctorAndNetUser.AllAppointment.Slots = "";
                    return View("Schedule",doctorAndNetUser);
                }
                else
                {
                    AllAppointment appointment = new AllAppointment();
                    appointment.UserName = UserName;
                    appointment.DoctorId = DoctorId;
                    appointment.SlotDate = AptDate;
                    appointment.Slots = AptTime;
                    appointment.DrAvailability = "yes";
                    myEntities.AllAppointments.Add(appointment);
                    myEntities.SaveChanges();
                    ViewBag.Message = "Appointment Confirmed !";
                    return View();
                }
            }
            else
            {
                ViewBag.Message = "Slots not Available Now !";
                return View();
            }
        }

        [Authorize]
        public ActionResult MyAppointments()
        {
            var myAppointment = myEntities.AllAppointments.Where(a => a.UserName == User.Identity.Name).ToList();
            TempData["today"] = DateTime.Today;
            return View(myAppointment);
        }

        [HttpGet]
        public ActionResult Edit(int id)
        {
            try
            {
                var appointment = myEntities.AllAppointments.SingleOrDefault(a => a.AptId == id);
                int dId = int.Parse(Request.QueryString["dId"]);
                ViewBag.Slots = new SelectList(myEntities.doctorSlots.Where(d => d.doctorId == dId), "slotTimes", "slotTimes");
                var doctor = myEntities.Doctors.SingleOrDefault(d => d.DocId == dId);
                var doctorAndAppointment = new DoctorAndNetUsers
                {
                    AllAppointment = appointment,
                    Doctor = doctor
                };
                return View(doctorAndAppointment);
            }
            catch (Exception)
            {
                throw new Exception("Problem with updation."); ;
            }
            
        }

        [HttpPost]
        public ActionResult Edit(DoctorAndNetUsers model)
        {
            string UserName = User.Identity.Name;
            int DoctorId = model.Doctor.DocId;
            DateTime AptDate = Convert.ToDateTime(model.AllAppointment.SlotDate);
            string AptTime = model.AllAppointment.Slots;
            var existsOrNot = myEntities.AllAppointments.Where(c => c.DoctorId == DoctorId && c.SlotDate == AptDate && c.Slots == AptTime);
            var count = existsOrNot.Count();
            if (count == 0)
            {
                AllAppointment appointment = myEntities.AllAppointments.FirstOrDefault(a => a.AptId == model.AllAppointment.AptId);
                appointment.SlotDate = AptDate;
                appointment.Slots = AptTime;
                myEntities.SaveChanges();
                ViewBag.Message = "Appointment Confirmed !";
            }
            else
            {
                ViewBag.Message = "Slots not Available Now !";
            }
            return View("ConfirmAppointment");
        }

        [HttpGet]
        public ActionResult Delete(int id)
        {
            var appointment = myEntities.AllAppointments.SingleOrDefault(a => a.AptId == id);
            int dId = int.Parse(Request.QueryString["dId"]);
            ViewBag.Slots = new SelectList(myEntities.doctorSlots.Where(d => d.doctorId == dId), "slotTimes", "slotTimes");
            var doctor = myEntities.Doctors.SingleOrDefault(d => d.DocId == dId);
            var doctorAndAppointment = new DoctorAndNetUsers
            {
                AllAppointment = appointment,
                Doctor = doctor
            };
            return View(doctorAndAppointment);
        }

        [HttpPost]
        public ActionResult Delete(DoctorAndNetUsers model)
        {
            ViewBag.Message = "Appointment Cancelled !";
            AllAppointment deleteAppointment = myEntities.AllAppointments.FirstOrDefault(a => a.AptId == model.AllAppointment.AptId);
            myEntities.AllAppointments.Remove(deleteAppointment);
            myEntities.SaveChanges();
            return View("ConfirmAppointment");
        }

        public ActionResult Contact()
        {
            return View();
        }        
    }
}