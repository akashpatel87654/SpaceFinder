﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SpaceFinder.Entity
{
    using System;
    using System.Collections.Generic;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.SqlClient;
    using System.Linq;

    public partial class SpaceFinderEntities1 : DbContext
    {
        public SpaceFinderEntities1()
            : base("name=DefaultConnection")
        {
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            // throw new UnintentionalCodeFirstException();
        }

        public virtual DbSet<Company> Companies { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<Project> Projects { get; set; }
        public virtual DbSet<ProjectType> ProjectTypes { get; set; }
        public virtual DbSet<Photo> Photos { get; set; }
        public virtual DbSet<Video> Videos { get; set; }

        #region StoredProcedures

        public List<DashboardSPViewModel> GetCompanies(string name)
        {
            if (string.IsNullOrEmpty(name))
            {
                return Database.SqlQuery<DashboardSPViewModel>("ComapniesGetAll").ToList();
            }
            else
            {
                SqlParameter SearchText = new SqlParameter("@SearchText", name);
                return Database.SqlQuery<DashboardSPViewModel>("ComapniesGetAll @SearchText", SearchText).ToList();
            }
        }

        #endregion
    }
}
