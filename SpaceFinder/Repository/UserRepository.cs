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

        public void InsertUser(User user)
        {
            _context.Users.Add(user);
            _context.SaveChanges();
        }

        public User GetUserById(int id)
        {
            return _context.Users.Where(x => x.UserId == id).FirstOrDefault();
        }

        public void UpdateUser(User user)
        {
            var existingUser = _context.Users.Where(x => x.UserId == user.UserId).FirstOrDefault();
            if(existingUser != null)
            {
                existingUser.FirstName = user.FirstName;
                existingUser.LastName = user.LastName;
                existingUser.UserName = user.UserName;
                existingUser.Email = user.Email;
                existingUser.Password = user.Password;
                existingUser.RoleId = user.RoleId;
                _context.SaveChanges();
            }
        }
    }
}