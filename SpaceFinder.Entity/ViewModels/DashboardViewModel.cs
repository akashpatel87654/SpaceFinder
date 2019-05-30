using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SpaceFinder.Entity
{
    public class DashboardViewModel
    {
        public int CompanyId { get; set; }
        public string CompanyName { get; set; }
        public int TotalProjects { get; set; }
        public int OpenProjects { get; set; }
        public int Customers { get; set; }
        public int Awards { get; set; }
        public string Description { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
        public string ContactNo { get; set; }
        public List<ProjectViewModel> Projects { get; set; }
    }

    public class DashboardSPViewModel
    {
        public int CompanyId { get; set; }
        public string CompanyName { get; set; }
        public int TotalProjects { get; set; }
        public int OpenProjects { get; set; }
        public int Customers { get; set; }
        public int Awards { get; set; }
        public string Description { get; set; }
        public int ProjectId { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public string ContactNo { get; set; }
        public bool Active { get; set; }
        public int TypeId { get; set; }
        public string TypeName { get; set; }
        public int? PhotoId { get; set; }
        public string PhotoName { get; set; }
        public int? VideoId { get; set; }
        public string VideoName { get; set; }
    }
}