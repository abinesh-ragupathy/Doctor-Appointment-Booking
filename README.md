# Doctor-Appointment-Booking
System for ‘Doctor’s Appointment Booking’ portal.

The steps for booking appointment are as follows:
  1) Provide identification (through email or mobile)
  2) Select a Health Center’s location
  3) Search a doctor based on specialization (it can also be a named search)
  4) Display doctor’s credentials, summary of expertise
  5) Check doctor’s availability (date wise, time slots)
  6) Book the appointment and display confirmation message on portal
  7) Send appointment booking notification through email (or SMS)
  
The system should also provide facility to change the appointment date/time or cancel it altogether. There may be a change in doctor’s availably (travelling, emergency etc.). In such cases the doctor informs about his/her unavailability to consult patients on specific date(s). However, the system should be able to notify the employee about cancellation of their earlier confirmed appointment, so that they can re-schedule. The system should allow to book an appointment for next three months.

To provide the above functionality as a standalone application, which have
a. Home Page
  It should have some generic information about Healthcare, upcoming event(s) or promotion(s) and past achievements; primarily static information. It should also have the login feature.
b. Search page
  To search/select a Healthcare Center and search a doctor based on specialization
c. Doctor details and Available time-slots
  It should show some details about the doctor including experience, qualifications. It should also show the available time slots for next two days, but at the same time there should be a facility to pick a future date/time up to next three months. One can book an appointment from this page and see the confirmation message. Another version of this same page should open, when the user attempts to modify or cancel the appointment. Basic rules (like no cancellation for past date appointments) should be enforced.
d. System should send email (or SMS) notification w.r.t. confirmed appointment(s), along with the
address of the Healthcare Center where patient can meet the doctor.
