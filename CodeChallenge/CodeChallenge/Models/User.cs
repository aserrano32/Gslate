namespace CodeChallenge.Models
{
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("User")]
    public partial class User
    {
        public User()
        {
            UserProjects = new HashSet<UserProject>();
        }

        public int Id { get; set; }

        [Required]
        [StringLength(50)]
        public string FirstName { get; set; }

        [Required]
        [StringLength(50)]
        public string LastName { get; set; }

        public string FullName {
            get
            {
                return FirstName + ' ' + LastName;
            }
        }
       
        public virtual ICollection<UserProject> UserProjects { get; set; }
    }
}
