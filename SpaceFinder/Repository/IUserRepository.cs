using SpaceFinder.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SpaceFinder.Repository
{
    public interface IUserRepository
    {
        List<UserViewModel> GetUsers();
        void InsertUser(User user);
        User GetUserById(int id);
        void UpdateUser(User user);
    }
}
