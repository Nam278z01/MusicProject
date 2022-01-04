﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class MusicEntities : DbContext
    {
        public MusicEntities()
            : base("name=MusicEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<AccountAdmin> AccountAdmins { get; set; }
        public virtual DbSet<AccountUser> AccountUsers { get; set; }
        public virtual DbSet<Admin> Admins { get; set; }
        public virtual DbSet<Album> Albums { get; set; }
        public virtual DbSet<AlbumLiked> AlbumLikeds { get; set; }
        public virtual DbSet<AlbumListened> AlbumListeneds { get; set; }
        public virtual DbSet<Artist> Artists { get; set; }
        public virtual DbSet<Collection> Collections { get; set; }
        public virtual DbSet<Comment> Comments { get; set; }
        public virtual DbSet<PlaylistAdmin> PlaylistAdmins { get; set; }
        public virtual DbSet<PlaylistAdmin_Song> PlaylistAdmin_Song { get; set; }
        public virtual DbSet<PlaylistAdminLiked> PlaylistAdminLikeds { get; set; }
        public virtual DbSet<PlaylistAdminListened> PlaylistAdminListeneds { get; set; }
        public virtual DbSet<PlaylistUser> PlaylistUsers { get; set; }
        public virtual DbSet<PlaylistUser_Song> PlaylistUser_Song { get; set; }
        public virtual DbSet<PlaylistUserLiked> PlaylistUserLikeds { get; set; }
        public virtual DbSet<PlaylistUserListened> PlaylistUserListeneds { get; set; }
        public virtual DbSet<Song> Songs { get; set; }
        public virtual DbSet<SongLiked> SongLikeds { get; set; }
        public virtual DbSet<SongListened> SongListeneds { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<View> Views { get; set; }
    
        public virtual ObjectResult<string> AddPlaylistAdmin(string jsonPlaylist)
        {
            var jsonPlaylistParameter = jsonPlaylist != null ?
                new ObjectParameter("jsonPlaylist", jsonPlaylist) :
                new ObjectParameter("jsonPlaylist", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("AddPlaylistAdmin", jsonPlaylistParameter);
        }
    
        public virtual ObjectResult<string> AddSong(string jsonSong)
        {
            var jsonSongParameter = jsonSong != null ?
                new ObjectParameter("jsonSong", jsonSong) :
                new ObjectParameter("jsonSong", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("AddSong", jsonSongParameter);
        }
    
        public virtual ObjectResult<string> CheckAccountAM(string accountName, string password)
        {
            var accountNameParameter = accountName != null ?
                new ObjectParameter("AccountName", accountName) :
                new ObjectParameter("AccountName", typeof(string));
    
            var passwordParameter = password != null ?
                new ObjectParameter("Password", password) :
                new ObjectParameter("Password", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("CheckAccountAM", accountNameParameter, passwordParameter);
        }
    
        public virtual int EditPlaylistAdmin(string jsonPlaylistAM)
        {
            var jsonPlaylistAMParameter = jsonPlaylistAM != null ?
                new ObjectParameter("jsonPlaylistAM", jsonPlaylistAM) :
                new ObjectParameter("jsonPlaylistAM", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("EditPlaylistAdmin", jsonPlaylistAMParameter);
        }
    
        public virtual int EditSong(string jsonSong)
        {
            var jsonSongParameter = jsonSong != null ?
                new ObjectParameter("jsonSong", jsonSong) :
                new ObjectParameter("jsonSong", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("EditSong", jsonSongParameter);
        }
    
        public virtual int Get10AlbumsRandom(string accountName)
        {
            var accountNameParameter = accountName != null ?
                new ObjectParameter("accountName", accountName) :
                new ObjectParameter("accountName", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("Get10AlbumsRandom", accountNameParameter);
        }
    
        public virtual int Get10PlaylistsNewest(string accountName)
        {
            var accountNameParameter = accountName != null ?
                new ObjectParameter("accountName", accountName) :
                new ObjectParameter("accountName", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("Get10PlaylistsNewest", accountNameParameter);
        }
    
        public virtual int Get10PlaylistsRandom(string accountName)
        {
            var accountNameParameter = accountName != null ?
                new ObjectParameter("accountName", accountName) :
                new ObjectParameter("accountName", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("Get10PlaylistsRandom", accountNameParameter);
        }
    
        public virtual int Get10PlaylistsRandomCollection(string accountName, string collectionID, string playlistID)
        {
            var accountNameParameter = accountName != null ?
                new ObjectParameter("accountName", accountName) :
                new ObjectParameter("accountName", typeof(string));
    
            var collectionIDParameter = collectionID != null ?
                new ObjectParameter("collectionID", collectionID) :
                new ObjectParameter("collectionID", typeof(string));
    
            var playlistIDParameter = playlistID != null ?
                new ObjectParameter("playlistID", playlistID) :
                new ObjectParameter("playlistID", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("Get10PlaylistsRandomCollection", accountNameParameter, collectionIDParameter, playlistIDParameter);
        }
    
        public virtual ObjectResult<string> Get10SongsNewest(string accountName)
        {
            var accountNameParameter = accountName != null ?
                new ObjectParameter("accountName", accountName) :
                new ObjectParameter("accountName", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("Get10SongsNewest", accountNameParameter);
        }
    
        public virtual ObjectResult<string> Get10SongsRandom(string accountName)
        {
            var accountNameParameter = accountName != null ?
                new ObjectParameter("accountName", accountName) :
                new ObjectParameter("accountName", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("Get10SongsRandom", accountNameParameter);
        }
    
        public virtual ObjectResult<string> Get10SongsRandomCollection(string accountName, string collectionID, string songID)
        {
            var accountNameParameter = accountName != null ?
                new ObjectParameter("accountName", accountName) :
                new ObjectParameter("accountName", typeof(string));
    
            var collectionIDParameter = collectionID != null ?
                new ObjectParameter("collectionID", collectionID) :
                new ObjectParameter("collectionID", typeof(string));
    
            var songIDParameter = songID != null ?
                new ObjectParameter("songID", songID) :
                new ObjectParameter("songID", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("Get10SongsRandomCollection", accountNameParameter, collectionIDParameter, songIDParameter);
        }
    
        public virtual int Get3RankSongsofWeek(string accountName, Nullable<int> quantity, Nullable<int> week, Nullable<int> year)
        {
            var accountNameParameter = accountName != null ?
                new ObjectParameter("accountName", accountName) :
                new ObjectParameter("accountName", typeof(string));
    
            var quantityParameter = quantity.HasValue ?
                new ObjectParameter("quantity", quantity) :
                new ObjectParameter("quantity", typeof(int));
    
            var weekParameter = week.HasValue ?
                new ObjectParameter("week", week) :
                new ObjectParameter("week", typeof(int));
    
            var yearParameter = year.HasValue ?
                new ObjectParameter("year", year) :
                new ObjectParameter("year", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("Get3RankSongsofWeek", accountNameParameter, quantityParameter, weekParameter, yearParameter);
        }
    
        public virtual ObjectResult<string> GetAlbumDetail(string albumID, string accountName)
        {
            var albumIDParameter = albumID != null ?
                new ObjectParameter("albumID", albumID) :
                new ObjectParameter("albumID", typeof(string));
    
            var accountNameParameter = accountName != null ?
                new ObjectParameter("accountName", accountName) :
                new ObjectParameter("accountName", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("GetAlbumDetail", albumIDParameter, accountNameParameter);
        }
    
        public virtual int GetAlbumsByArtist(Nullable<int> pageIndex, Nullable<int> pageSize, string artistID, string accountName)
        {
            var pageIndexParameter = pageIndex.HasValue ?
                new ObjectParameter("pageIndex", pageIndex) :
                new ObjectParameter("pageIndex", typeof(int));
    
            var pageSizeParameter = pageSize.HasValue ?
                new ObjectParameter("pageSize", pageSize) :
                new ObjectParameter("pageSize", typeof(int));
    
            var artistIDParameter = artistID != null ?
                new ObjectParameter("artistID", artistID) :
                new ObjectParameter("artistID", typeof(string));
    
            var accountNameParameter = accountName != null ?
                new ObjectParameter("accountName", accountName) :
                new ObjectParameter("accountName", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("GetAlbumsByArtist", pageIndexParameter, pageSizeParameter, artistIDParameter, accountNameParameter);
        }
    
        public virtual ObjectResult<string> GetAlbumsForMana()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("GetAlbumsForMana");
        }
    
        public virtual ObjectResult<string> GetAlbumsGenresArtistsForManaSong()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("GetAlbumsGenresArtistsForManaSong");
        }
    
        public virtual int GetAlbumsNewAHot(Nullable<int> pageIndex, Nullable<int> pageSize, Nullable<int> time, string accountName)
        {
            var pageIndexParameter = pageIndex.HasValue ?
                new ObjectParameter("pageIndex", pageIndex) :
                new ObjectParameter("pageIndex", typeof(int));
    
            var pageSizeParameter = pageSize.HasValue ?
                new ObjectParameter("pageSize", pageSize) :
                new ObjectParameter("pageSize", typeof(int));
    
            var timeParameter = time.HasValue ?
                new ObjectParameter("time", time) :
                new ObjectParameter("time", typeof(int));
    
            var accountNameParameter = accountName != null ?
                new ObjectParameter("accountName", accountName) :
                new ObjectParameter("accountName", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("GetAlbumsNewAHot", pageIndexParameter, pageSizeParameter, timeParameter, accountNameParameter);
        }
    
        public virtual int GetAlbumsPage(Nullable<int> pageIndex, Nullable<int> pageSize, Nullable<int> nation, string accountName)
        {
            var pageIndexParameter = pageIndex.HasValue ?
                new ObjectParameter("pageIndex", pageIndex) :
                new ObjectParameter("pageIndex", typeof(int));
    
            var pageSizeParameter = pageSize.HasValue ?
                new ObjectParameter("pageSize", pageSize) :
                new ObjectParameter("pageSize", typeof(int));
    
            var nationParameter = nation.HasValue ?
                new ObjectParameter("nation", nation) :
                new ObjectParameter("nation", typeof(int));
    
            var accountNameParameter = accountName != null ?
                new ObjectParameter("accountName", accountName) :
                new ObjectParameter("accountName", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("GetAlbumsPage", pageIndexParameter, pageSizeParameter, nationParameter, accountNameParameter);
        }
    
        public virtual int GetAlbumsSearch(Nullable<int> pageIndex, Nullable<int> pageSize, string textSearch, string accountName)
        {
            var pageIndexParameter = pageIndex.HasValue ?
                new ObjectParameter("pageIndex", pageIndex) :
                new ObjectParameter("pageIndex", typeof(int));
    
            var pageSizeParameter = pageSize.HasValue ?
                new ObjectParameter("pageSize", pageSize) :
                new ObjectParameter("pageSize", typeof(int));
    
            var textSearchParameter = textSearch != null ?
                new ObjectParameter("textSearch", textSearch) :
                new ObjectParameter("textSearch", typeof(string));
    
            var accountNameParameter = accountName != null ?
                new ObjectParameter("accountName", accountName) :
                new ObjectParameter("accountName", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("GetAlbumsSearch", pageIndexParameter, pageSizeParameter, textSearchParameter, accountNameParameter);
        }
    
        public virtual int GetArtistsHot(Nullable<int> pageIndex, Nullable<int> pageSize, Nullable<int> time, Nullable<int> genderorband)
        {
            var pageIndexParameter = pageIndex.HasValue ?
                new ObjectParameter("pageIndex", pageIndex) :
                new ObjectParameter("pageIndex", typeof(int));
    
            var pageSizeParameter = pageSize.HasValue ?
                new ObjectParameter("pageSize", pageSize) :
                new ObjectParameter("pageSize", typeof(int));
    
            var timeParameter = time.HasValue ?
                new ObjectParameter("time", time) :
                new ObjectParameter("time", typeof(int));
    
            var genderorbandParameter = genderorband.HasValue ?
                new ObjectParameter("genderorband", genderorband) :
                new ObjectParameter("genderorband", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("GetArtistsHot", pageIndexParameter, pageSizeParameter, timeParameter, genderorbandParameter);
        }
    
        public virtual ObjectResult<string> GetArtistSongForAlbumMana()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("GetArtistSongForAlbumMana");
        }
    
        public virtual int GetArtistsPage(Nullable<int> pageIndex, Nullable<int> pageSize, Nullable<int> nation, Nullable<int> genderorband)
        {
            var pageIndexParameter = pageIndex.HasValue ?
                new ObjectParameter("pageIndex", pageIndex) :
                new ObjectParameter("pageIndex", typeof(int));
    
            var pageSizeParameter = pageSize.HasValue ?
                new ObjectParameter("pageSize", pageSize) :
                new ObjectParameter("pageSize", typeof(int));
    
            var nationParameter = nation.HasValue ?
                new ObjectParameter("nation", nation) :
                new ObjectParameter("nation", typeof(int));
    
            var genderorbandParameter = genderorband.HasValue ?
                new ObjectParameter("genderorband", genderorband) :
                new ObjectParameter("genderorband", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("GetArtistsPage", pageIndexParameter, pageSizeParameter, nationParameter, genderorbandParameter);
        }
    
        public virtual int GetArtistsSearch(Nullable<int> pageIndex, Nullable<int> pageSize, string textSearch)
        {
            var pageIndexParameter = pageIndex.HasValue ?
                new ObjectParameter("pageIndex", pageIndex) :
                new ObjectParameter("pageIndex", typeof(int));
    
            var pageSizeParameter = pageSize.HasValue ?
                new ObjectParameter("pageSize", pageSize) :
                new ObjectParameter("pageSize", typeof(int));
    
            var textSearchParameter = textSearch != null ?
                new ObjectParameter("textSearch", textSearch) :
                new ObjectParameter("textSearch", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("GetArtistsSearch", pageIndexParameter, pageSizeParameter, textSearchParameter);
        }
    
        public virtual ObjectResult<string> GetCollectionsSongsForManaPlaylistAdmin()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("GetCollectionsSongsForManaPlaylistAdmin");
        }
    
        public virtual ObjectResult<string> GetPlaylistAdminwithSongs(string accountName, string playlistAdminID)
        {
            var accountNameParameter = accountName != null ?
                new ObjectParameter("accountName", accountName) :
                new ObjectParameter("accountName", typeof(string));
    
            var playlistAdminIDParameter = playlistAdminID != null ?
                new ObjectParameter("playlistAdminID", playlistAdminID) :
                new ObjectParameter("playlistAdminID", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("GetPlaylistAdminwithSongs", accountNameParameter, playlistAdminIDParameter);
        }
    
        public virtual int GetPlaylistsByCollectionPage(Nullable<int> pageIndex, Nullable<int> pageSize, string collectionID, string accountName)
        {
            var pageIndexParameter = pageIndex.HasValue ?
                new ObjectParameter("pageIndex", pageIndex) :
                new ObjectParameter("pageIndex", typeof(int));
    
            var pageSizeParameter = pageSize.HasValue ?
                new ObjectParameter("pageSize", pageSize) :
                new ObjectParameter("pageSize", typeof(int));
    
            var collectionIDParameter = collectionID != null ?
                new ObjectParameter("collectionID", collectionID) :
                new ObjectParameter("collectionID", typeof(string));
    
            var accountNameParameter = accountName != null ?
                new ObjectParameter("accountName", accountName) :
                new ObjectParameter("accountName", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("GetPlaylistsByCollectionPage", pageIndexParameter, pageSizeParameter, collectionIDParameter, accountNameParameter);
        }
    
        public virtual int GetPlaylistsByCollectionsPage(Nullable<int> pageIndex, Nullable<int> pageSize, string genre, string mood, string scene, string topic, string accountName)
        {
            var pageIndexParameter = pageIndex.HasValue ?
                new ObjectParameter("pageIndex", pageIndex) :
                new ObjectParameter("pageIndex", typeof(int));
    
            var pageSizeParameter = pageSize.HasValue ?
                new ObjectParameter("pageSize", pageSize) :
                new ObjectParameter("pageSize", typeof(int));
    
            var genreParameter = genre != null ?
                new ObjectParameter("genre", genre) :
                new ObjectParameter("genre", typeof(string));
    
            var moodParameter = mood != null ?
                new ObjectParameter("mood", mood) :
                new ObjectParameter("mood", typeof(string));
    
            var sceneParameter = scene != null ?
                new ObjectParameter("scene", scene) :
                new ObjectParameter("scene", typeof(string));
    
            var topicParameter = topic != null ?
                new ObjectParameter("topic", topic) :
                new ObjectParameter("topic", typeof(string));
    
            var accountNameParameter = accountName != null ?
                new ObjectParameter("accountName", accountName) :
                new ObjectParameter("accountName", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("GetPlaylistsByCollectionsPage", pageIndexParameter, pageSizeParameter, genreParameter, moodParameter, sceneParameter, topicParameter, accountNameParameter);
        }
    
        public virtual ObjectResult<string> GetPlaylistsForMana()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("GetPlaylistsForMana");
        }
    
        public virtual int GetPlaylistsSearch(Nullable<int> pageIndex, Nullable<int> pageSize, string textSearch, string accountName)
        {
            var pageIndexParameter = pageIndex.HasValue ?
                new ObjectParameter("pageIndex", pageIndex) :
                new ObjectParameter("pageIndex", typeof(int));
    
            var pageSizeParameter = pageSize.HasValue ?
                new ObjectParameter("pageSize", pageSize) :
                new ObjectParameter("pageSize", typeof(int));
    
            var textSearchParameter = textSearch != null ?
                new ObjectParameter("textSearch", textSearch) :
                new ObjectParameter("textSearch", typeof(string));
    
            var accountNameParameter = accountName != null ?
                new ObjectParameter("accountName", accountName) :
                new ObjectParameter("accountName", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("GetPlaylistsSearch", pageIndexParameter, pageSizeParameter, textSearchParameter, accountNameParameter);
        }
    
        public virtual int GetPlaylistsUser(Nullable<int> pageIndex, Nullable<int> pageSize, string accountName)
        {
            var pageIndexParameter = pageIndex.HasValue ?
                new ObjectParameter("pageIndex", pageIndex) :
                new ObjectParameter("pageIndex", typeof(int));
    
            var pageSizeParameter = pageSize.HasValue ?
                new ObjectParameter("pageSize", pageSize) :
                new ObjectParameter("pageSize", typeof(int));
    
            var accountNameParameter = accountName != null ?
                new ObjectParameter("accountName", accountName) :
                new ObjectParameter("accountName", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("GetPlaylistsUser", pageIndexParameter, pageSizeParameter, accountNameParameter);
        }
    
        public virtual ObjectResult<string> GetPlaylistsUserBySong(string accountName)
        {
            var accountNameParameter = accountName != null ?
                new ObjectParameter("accountName", accountName) :
                new ObjectParameter("accountName", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("GetPlaylistsUserBySong", accountNameParameter);
        }
    
        public virtual ObjectResult<string> GetPlaylistUserwithSongs(string accountName, string playlistUserID)
        {
            var accountNameParameter = accountName != null ?
                new ObjectParameter("accountName", accountName) :
                new ObjectParameter("accountName", typeof(string));
    
            var playlistUserIDParameter = playlistUserID != null ?
                new ObjectParameter("playlistUserID", playlistUserID) :
                new ObjectParameter("playlistUserID", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("GetPlaylistUserwithSongs", accountNameParameter, playlistUserIDParameter);
        }
    
        public virtual int GetRankSongsofWeek(string accountName, Nullable<int> quantity, Nullable<int> nation, Nullable<int> week, Nullable<int> year)
        {
            var accountNameParameter = accountName != null ?
                new ObjectParameter("accountName", accountName) :
                new ObjectParameter("accountName", typeof(string));
    
            var quantityParameter = quantity.HasValue ?
                new ObjectParameter("quantity", quantity) :
                new ObjectParameter("quantity", typeof(int));
    
            var nationParameter = nation.HasValue ?
                new ObjectParameter("nation", nation) :
                new ObjectParameter("nation", typeof(int));
    
            var weekParameter = week.HasValue ?
                new ObjectParameter("week", week) :
                new ObjectParameter("week", typeof(int));
    
            var yearParameter = year.HasValue ?
                new ObjectParameter("year", year) :
                new ObjectParameter("year", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("GetRankSongsofWeek", accountNameParameter, quantityParameter, nationParameter, weekParameter, yearParameter);
        }
    
        public virtual ObjectResult<string> GetSong(string accountName, string songID)
        {
            var accountNameParameter = accountName != null ?
                new ObjectParameter("accountName", accountName) :
                new ObjectParameter("accountName", typeof(string));
    
            var songIDParameter = songID != null ?
                new ObjectParameter("songID", songID) :
                new ObjectParameter("songID", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("GetSong", accountNameParameter, songIDParameter);
        }
    
        public virtual int GetSongsByArtistPage(Nullable<int> pageIndex, Nullable<int> pageSize, string artistID, string accountName)
        {
            var pageIndexParameter = pageIndex.HasValue ?
                new ObjectParameter("pageIndex", pageIndex) :
                new ObjectParameter("pageIndex", typeof(int));
    
            var pageSizeParameter = pageSize.HasValue ?
                new ObjectParameter("pageSize", pageSize) :
                new ObjectParameter("pageSize", typeof(int));
    
            var artistIDParameter = artistID != null ?
                new ObjectParameter("artistID", artistID) :
                new ObjectParameter("artistID", typeof(string));
    
            var accountNameParameter = accountName != null ?
                new ObjectParameter("accountName", accountName) :
                new ObjectParameter("accountName", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("GetSongsByArtistPage", pageIndexParameter, pageSizeParameter, artistIDParameter, accountNameParameter);
        }
    
        public virtual int GetSongsByCollectionPage(Nullable<int> pageIndex, Nullable<int> pageSize, string collectionID, Nullable<int> nation, string accountName)
        {
            var pageIndexParameter = pageIndex.HasValue ?
                new ObjectParameter("pageIndex", pageIndex) :
                new ObjectParameter("pageIndex", typeof(int));
    
            var pageSizeParameter = pageSize.HasValue ?
                new ObjectParameter("pageSize", pageSize) :
                new ObjectParameter("pageSize", typeof(int));
    
            var collectionIDParameter = collectionID != null ?
                new ObjectParameter("collectionID", collectionID) :
                new ObjectParameter("collectionID", typeof(string));
    
            var nationParameter = nation.HasValue ?
                new ObjectParameter("nation", nation) :
                new ObjectParameter("nation", typeof(int));
    
            var accountNameParameter = accountName != null ?
                new ObjectParameter("accountName", accountName) :
                new ObjectParameter("accountName", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("GetSongsByCollectionPage", pageIndexParameter, pageSizeParameter, collectionIDParameter, nationParameter, accountNameParameter);
        }
    
        public virtual ObjectResult<string> GetSongsForMana()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("GetSongsForMana");
        }
    
        public virtual ObjectResult<string> GetSongsForManaPlaylistAdmin()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("GetSongsForManaPlaylistAdmin");
        }
    
        public virtual int GetSongsNewAHot(Nullable<int> pageIndex, Nullable<int> pageSize, string accountName, Nullable<int> time)
        {
            var pageIndexParameter = pageIndex.HasValue ?
                new ObjectParameter("pageIndex", pageIndex) :
                new ObjectParameter("pageIndex", typeof(int));
    
            var pageSizeParameter = pageSize.HasValue ?
                new ObjectParameter("pageSize", pageSize) :
                new ObjectParameter("pageSize", typeof(int));
    
            var accountNameParameter = accountName != null ?
                new ObjectParameter("accountName", accountName) :
                new ObjectParameter("accountName", typeof(string));
    
            var timeParameter = time.HasValue ?
                new ObjectParameter("time", time) :
                new ObjectParameter("time", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("GetSongsNewAHot", pageIndexParameter, pageSizeParameter, accountNameParameter, timeParameter);
        }
    
        public virtual int GetSongsSearch(Nullable<int> pageIndex, Nullable<int> pageSize, string textSearch, string accountName)
        {
            var pageIndexParameter = pageIndex.HasValue ?
                new ObjectParameter("pageIndex", pageIndex) :
                new ObjectParameter("pageIndex", typeof(int));
    
            var pageSizeParameter = pageSize.HasValue ?
                new ObjectParameter("pageSize", pageSize) :
                new ObjectParameter("pageSize", typeof(int));
    
            var textSearchParameter = textSearch != null ?
                new ObjectParameter("textSearch", textSearch) :
                new ObjectParameter("textSearch", typeof(string));
    
            var accountNameParameter = accountName != null ?
                new ObjectParameter("accountName", accountName) :
                new ObjectParameter("accountName", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("GetSongsSearch", pageIndexParameter, pageSizeParameter, textSearchParameter, accountNameParameter);
        }
    
        public virtual ObjectResult<string> GetTop100Songs(string accountName, string collectionID, Nullable<int> nation)
        {
            var accountNameParameter = accountName != null ?
                new ObjectParameter("accountName", accountName) :
                new ObjectParameter("accountName", typeof(string));
    
            var collectionIDParameter = collectionID != null ?
                new ObjectParameter("collectionID", collectionID) :
                new ObjectParameter("collectionID", typeof(string));
    
            var nationParameter = nation.HasValue ?
                new ObjectParameter("nation", nation) :
                new ObjectParameter("nation", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("GetTop100Songs", accountNameParameter, collectionIDParameter, nationParameter);
        }
    
        public virtual ObjectResult<GetUser_Result> GetUser(string accountName, string passWord)
        {
            var accountNameParameter = accountName != null ?
                new ObjectParameter("AccountName", accountName) :
                new ObjectParameter("AccountName", typeof(string));
    
            var passWordParameter = passWord != null ?
                new ObjectParameter("PassWord", passWord) :
                new ObjectParameter("PassWord", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetUser_Result>("GetUser", accountNameParameter, passWordParameter);
        }
    }
}
