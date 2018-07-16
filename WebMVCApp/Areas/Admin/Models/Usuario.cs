using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebMVCApp.Areas.Admin.Models
{
    public class Usuario
    {
        public int id { get; set; }

        public string nomape { get; set; }

        [Required(ErrorMessage = "Username required.", AllowEmptyStrings = false)]
        public string nomuser { get; set; }

        [Required(ErrorMessage = "Password required.", AllowEmptyStrings = false)]
        [DataType(System.ComponentModel.DataAnnotations.DataType.Password)]
        public string passuser { get; set; }

        public string email { get; set; }

        public DateTime ultLogin { get; set; }
        
        public int idRol { get; set; }

        public string nomRol { get; set; }

        public DateTime fecreg { get; set; }

    }
}