using SpaceFinder.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SpaceFinder.Repository
{
    public interface IHomeRepository
    {
        List<DashboardViewModel> GetCompanies(string name);
        List<DashboardViewModel> GetTopCompanies();
    }
}
