using SpaceFinder.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SpaceFinder.Repository
{
    public class HomeRepository : IHomeRepository
    {
        private SpaceFinderEntities1 _context;

        public HomeRepository(SpaceFinderEntities1 homeContext)
        {
            _context = homeContext;
        }

        public List<DashboardViewModel> GetCompanies(string name)
        {
            var result = _context.GetCompanies(name);
            var model = new List<DashboardViewModel>();
            if (result != null)
            {
                var dashboardViewModel = new DashboardViewModel();
                dashboardViewModel.Projects = new List<ProjectViewModel>();

                foreach (var item in result)
                {
                    if (model.Find(x => x.CompanyId == item.CompanyId) == null)
                    {
                        dashboardViewModel.CompanyId = item.CompanyId;
                        dashboardViewModel.CompanyName = item.CompanyName;
                        dashboardViewModel.TotalProjects = item.TotalProjects;
                        dashboardViewModel.OpenProjects = item.OpenProjects;
                        dashboardViewModel.Customers = item.Customers;
                        dashboardViewModel.Awards = item.Awards;
                    }

                    ProjectViewModel project = new ProjectViewModel()
                    {
                        ProjectId = item.ProjectId,
                        Name = item.Name,
                        Active = item.Active,
                        Address = item.Address,
                        ContactNo = item.ContactNo,
                        TypeId = item.TypeId,
                        TypeName = item.TypeName,
                    };

                    project.Video = new VideoViewModel()
                    {
                        VideoId = item.VideoId.GetValueOrDefault(),
                        VideoName = item.VideoName
                    };

                    project.Photos = new List<PhotoViewModel>();
                    PhotoViewModel photo = new PhotoViewModel()
                    {
                        PhotoId = item.PhotoId.GetValueOrDefault(),
                        PhotoName = item.PhotoName
                    };

                    project.Photos.Add(photo);

                    if (model.Find(x => x.CompanyId == item.CompanyId) == null)
                    {
                        dashboardViewModel.Projects.Add(project);
                        model.Add(dashboardViewModel);
                    }
                    else
                    {
                        var existingModel = model.Find(x => x.CompanyId == item.CompanyId);
                        existingModel.Projects.Add(project);
                    }
                }

                return model;
            }

            return new List<DashboardViewModel>();
        }
    }
}