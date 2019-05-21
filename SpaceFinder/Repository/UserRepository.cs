using SpaceFinder.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SpaceFinder.Repository
{
    public class UserRepository : IUserRepository
    {
        private SpaceFinderEntities1 _context;

        public UserRepository(SpaceFinderEntities1 userContext)
        {
            _context = userContext;
        }

        public List<UserViewModel> GetUsers()
        {
            return _context.GetUsers();
        }
    }
}