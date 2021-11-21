//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MusicObj
{
    using System;
    using System.Collections.Generic;
    
    public partial class PlaylistUser
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PlaylistUser()
        {
            this.PlaylistUser_Song = new HashSet<PlaylistUser_Song>();
            this.PlaylistUserLikeds = new HashSet<PlaylistUserLiked>();
            this.PlaylistUserListeneds = new HashSet<PlaylistUserListened>();
        }
    
        public string PlaylistID { get; set; }
        public string PlaylistName { get; set; }
        public string Description { get; set; }
        public System.DateTime DateCreated { get; set; }
        public string AccountName { get; set; }
        public bool isPublic { get; set; }
    
        public virtual AccountUser AccountUser { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PlaylistUser_Song> PlaylistUser_Song { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PlaylistUserLiked> PlaylistUserLikeds { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PlaylistUserListened> PlaylistUserListeneds { get; set; }
    }
}
