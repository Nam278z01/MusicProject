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
    
    public partial class AccountUser
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public AccountUser()
        {
            this.AlbumLikeds = new HashSet<AlbumLiked>();
            this.AlbumListeneds = new HashSet<AlbumListened>();
            this.PlaylistAdminLikeds = new HashSet<PlaylistAdminLiked>();
            this.PlaylistAdminListeneds = new HashSet<PlaylistAdminListened>();
            this.PlaylistUsers = new HashSet<PlaylistUser>();
            this.PlaylistUserLikeds = new HashSet<PlaylistUserLiked>();
            this.PlaylistUserListeneds = new HashSet<PlaylistUserListened>();
            this.SongLikeds = new HashSet<SongLiked>();
            this.SongListeneds = new HashSet<SongListened>();
        }
    
        public string AccountName { get; set; }
        public string Password { get; set; }
        public byte Role { get; set; }
        public bool State { get; set; }
        public System.DateTime DateCreated { get; set; }
        public string PersonID { get; set; }
        public string Image { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<AlbumLiked> AlbumLikeds { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<AlbumListened> AlbumListeneds { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PlaylistAdminLiked> PlaylistAdminLikeds { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PlaylistAdminListened> PlaylistAdminListeneds { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PlaylistUser> PlaylistUsers { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PlaylistUserLiked> PlaylistUserLikeds { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PlaylistUserListened> PlaylistUserListeneds { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SongLiked> SongLikeds { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SongListened> SongListeneds { get; set; }
        public virtual User User { get; set; }
    }
}
