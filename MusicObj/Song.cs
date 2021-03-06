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
    
    public partial class Song
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Song()
        {
            this.PlaylistAdmin_Song = new HashSet<PlaylistAdmin_Song>();
            this.PlaylistUser_Song = new HashSet<PlaylistUser_Song>();
            this.Views = new HashSet<View>();
            this.SongLikeds = new HashSet<SongLiked>();
            this.SongListeneds = new HashSet<SongListened>();
            this.Artists = new HashSet<Artist>();
            this.Collections = new HashSet<Collection>();
        }
    
        public string SongID { get; set; }
        public string SongName { get; set; }
        public string Lyric { get; set; }
        public System.DateTime ReleaseDate { get; set; }
        public int Nation { get; set; }
        public string Image { get; set; }
        public string SongPath { get; set; }
        public string MV { get; set; }
        public bool isVip { get; set; }
        public string AlbumID { get; set; }
    
        public virtual Album Album { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PlaylistAdmin_Song> PlaylistAdmin_Song { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PlaylistUser_Song> PlaylistUser_Song { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<View> Views { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SongLiked> SongLikeds { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SongListened> SongListeneds { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Artist> Artists { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Collection> Collections { get; set; }
    }
}
