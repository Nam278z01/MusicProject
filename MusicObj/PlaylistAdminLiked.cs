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
    
    public partial class PlaylistAdminLiked
    {
        public string AccountName { get; set; }
        public string PlaylistID { get; set; }
        public System.DateTime DateLiked { get; set; }
    
        public virtual AccountUser AccountUser { get; set; }
        public virtual PlaylistAdmin PlaylistAdmin { get; set; }
    }
}
