using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MusicObj
{
    public class AcccountUser
    {
        public string PersonName { get; set; }
        public string AcccountName { get; set; }
        public string Email { get; set; }
        public string Birthday { get; set; }
        public string Image { get; set; }
        public string Gender { get; set; }
        public string Phone { get; set; }
        public string DateCreated { get; set; }
        public string DueOn { get; set; }
        public AcccountUser(string personname, string accountname, string email,string birthday,  string image,string gender, string phone, string datecreated, string dueon)
        {
            this.PersonName = personname;
            this.AcccountName = accountname;
            this.Email = email;
            this.Birthday = birthday;
            this.Image = image;
            this.Gender = gender;
            this.Phone = phone;
            this.DateCreated = datecreated;
            this.DueOn = dueon;
        }
        public AcccountUser()
        {

        }
    }
   
}
