using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SpaceFinder.Entity
{
    public class ProjectViewModel
    {
        public int ProjectId { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public string ContactNo { get; set; }
        public bool Active { get; set; }
        public int TypeId { get; set; }
        public string TypeName { get; set; }
        public VideoViewModel Video { get; set; }
        public List<PhotoViewModel> Photos { get; set; }
    }

    public class PhotoViewModel
    {
        public int PhotoId { get; set; }
        public string PhotoName { get; set; }
    }

    public class VideoViewModel
    {
        public int VideoId { get; set; }
        public string VideoName { get; set; }
    }
}