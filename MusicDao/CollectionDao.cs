using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MusicObj;

namespace MusicDao
{
    public class CollectionDao : ICollectionDao
    {
        MusicEntities dtc;
        DataHelper dh;
        public CollectionDao()
        {
            dtc = new MusicEntities();
            dtc.Configuration.ProxyCreationEnabled = false;
            dh = new DataHelper();
        }
        public List<Collection> GetCollections()
        {
            List<Collection> collectionList = dtc.Collections.ToList<Collection>();
            return collectionList;
        }
    }
}
