
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using CharityAPI.Authentication;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Configuration;
using Microsoft.EntityFrameworkCore;
using System.IO;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Logging.Console;
using Microsoft.Extensions.Logging.Debug;
using Microsoft.Extensions.Caching.Memory;
using Microsoft.AspNetCore.Http;

namespace CharityAPI.Controllers
{
    //[System.Web.Mvc.Authorize(Roles = "superuser,admin,organisations")]
   [Authorize]
    public class BaseAdminController : ControllerBase
    {


        #region ' Variable Declaration '

        private ApplicationDBContext _context;
        private UserManager<ApplicationUser> _userManager;
        private IHttpContextAccessor _accessor;
        #endregion ' Variable Declaration '

        #region ' Constructor '
        //public IConfiguration Config { get; set; }
        //public BaseAdminController(IConfiguration configuration)
        //{
        //    this.Config = configuration;
        //    IPasswordHasher<ApplicationUser> passwordHasher = new PasswordHasher<ApplicationUser>();
        //    var userValidator = new UserValidator<ApplicationUser>();
        //    var uservalidators = new List<UserValidator<ApplicationUser>> { userValidator };
        //    IdentityErrorDescriber identityErrorDescriber = new IdentityErrorDescriber();
        //    ILoggerFactory userloggerFactory = new LoggerFactory().AddDebug(); // We may change this to log file
        //    userloggerFactory.AddProvider(new ConsoleLoggerProvider((category, logLevel) => logLevel >= LogLevel.Information, false));
        //    userloggerFactory.AddConsole();
        //    var userlogger = userloggerFactory.CreateLogger<UserManager<ApplicationUser>>();
        //    userlogger.LogInformation("Executing Configure()");
        //    _context = _context = new ApplicationDBContext(new DbContextOptionsBuilder<ApplicationDBContext>().UseSqlServer(
        //                    new ConfigurationBuilder()
        //                    .AddJsonFile(Path.Combine(Directory.GetCurrentDirectory(), $"appsettings.json"))
        //                    .Build()
        //           .GetConnectionString("DefaultConnection")
        //       ).Options);
        //    _userManager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(_context), null, passwordHasher, uservalidators, null, null, identityErrorDescriber, null, userlogger);
        //}

        public BaseAdminController( )
        {
            //AuthenticationService = new AuthenticationService();
            _context = new ApplicationDBContext();
            _accessor = new HttpContextAccessor();
        }
        #endregion ' Constructor '

        #region ' Properties '

        public Microsoft.AspNetCore.Identity.UserManager<ApplicationUser> UserManager
        {
            get
            {
                return _userManager;
            }
        }
        public string CurrentUserName
        {
            get
            {
                return this.User == null ? null : this.User.Identity.Name;
            }
        }
        public bool IsAuthenticated
        {
            get
            {
                return User.Identity.IsAuthenticated;
            }
        }



        public string UserId
        {
            get
            {
                if (User == null) return null;
                var user = User.Identity.Name;
                return user;
            }
        }

        public string IpAddress
        {
            get
            {
                var ip = _accessor.HttpContext.Connection.RemoteIpAddress.ToString();
                return ip;
            }
        }
        #endregion ' Properties '

        #region ' Methods '


        #endregion ' Methods '
    }

}