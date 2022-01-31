using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.IdentityModel.Tokens;
using Microsoft.Extensions.Configuration;
using ZomatoApp.Authentication;
using ZomatoApp.Models;
using ZomatoApp.Repository;
using ZomatoApp.Repository.Interfaces;
using System.Text;
using ZomatoApp.DBContext;
using Microsoft.AspNetCore.Authentication.JwtBearer;

namespace ZomatoApp
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }
        public IConfiguration Configuration { get; }
        // This method gets called by the runtime. Use this method to add services to the container.
        // For more information on how to configure your application, visit https://go.microsoft.com/fwlink/?LinkID=398940
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddCors(options =>
            {
                options.AddPolicy(name: "policy1",
                builder =>
                {
                    builder.AllowAnyOrigin()
    .AllowAnyMethod()
    .AllowAnyHeader();
                });
            });

            //services.AddDbContext<ZomatoApp_ProjectContext>(options => options.UseSqlServer("Server=PC0610\\MSSQL2019;Database=WebAPIZomato;Integrated Security=True"));
            // For Entity Framework  
            services.AddDbContext<ZomatoApp_ProjectContext>(options => options.UseSqlServer(Configuration.GetConnectionString("ZomatoApp")));
            services.AddControllers().AddNewtonsoftJson(options =>
                options.SerializerSettings.ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore);
            //AutoMapper
            services.AddAutoMapper(typeof(Startup));

            // Adding Authentication  
            //services.AddAuthentication(options =>
            //{
            //    options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
            //    options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
            //    options.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
            //})

            // Adding Jwt Bearer
            //.AddJwtBearer(options =>
            //{
            //    options.SaveToken = true;
            //    options.RequireHttpsMetadata = false;
            //    options.TokenValidationParameters = new Microsoft.IdentityModel.Tokens.TokenValidationParameters()
            //    {
            //        ValidateIssuer = true,
            //        ValidateAudience = true,
            //        ValidAudience = Configuration["JWT:ValidAudience"],
            //        ValidIssuer = Configuration["JWT:ValidIssuer"],
            //        IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(Configuration["JWT:Secret"]))
            //    };
            //});
            services.AddTransient<ICategory, CategoryRepository>();
            services.AddTransient<ICart, CartRepository>();
            services.AddTransient<IOrder, OrderRepository>();
            services.AddTransient<IOrderStatus, OrderStatusRepository>();
            services.AddTransient<IPayment, PaymentRepository>();
            services.AddTransient<IProduct, ProductRepository>();
            services.AddTransient<IRestaurant, RestaurantRepository>();
            services.AddTransient<IViewProduct, ViewProductRepository>();
            services.AddTransient<IProduct, ProductRepository>();
            services.AddTransient<IUserSignup, UserSignupRepository>();
            services.AddTransient<ICity, CityRepository>();
            services.AddTransient<IPaymenttable, paymenttableRepository>();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }


            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
