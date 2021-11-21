using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MusicDao;
using MusicObj;

namespace MusicBus
{
    public class CollectionBus : ICollectionBus
    {
        ICollectionDao cdao;
        public CollectionBus()
        {
            cdao = new CollectionDao();
        }
        public List<Collection> GetCollections()
        {
            return cdao.GetCollections();
        }
    }
}
