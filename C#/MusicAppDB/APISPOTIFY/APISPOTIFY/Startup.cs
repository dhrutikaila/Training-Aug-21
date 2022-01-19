using APISPOTIFY.Authentication;
using APISPOTIFY.IRepository;
using APISPOTIFY.Models;
using APISPOTIFY.Repository;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using MusicAppDB.Authentication;
using MusicAppDB.IRepository;
using MusicAppDB.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace APISPOTIFY
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddControllersWithViews().AddNewtonsoftJson(options => options.SerializerSettings.ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore);
            services.AddControllers();
            services.AddDbContext<ApplicationDBContext>((serviceProvider, options) => { options.UseSqlServer(Configuration.GetConnectionString("Default")); });
            services.AddDbContext<MusicAppDBContext>((serviceProvider, options) => { options.UseSqlServer(Configuration.GetConnectionString("DB_MUSICContextConnectionString")); });
            services.AddTransient<ISongdata, SqlMusicData>();
            services.AddTransient<IAlbumlike, AlbumLikesSql>();
            services.AddTransient<IUser, UserRepository>();
            services.AddTransient<IAdmin, AdminRepository>();
            services.AddTransient<IAlbumdata, MockAlbumdata>();
            services.AddTransient<IPlaylist, PlaylistRepository>();
            services.AddTransient<IPodcast, PodcastRepository>();
            services.AddTransient<IPayment, PaymentRepository>();
        
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "APISPOTIFY", Version = "v1" });
                //c.ResolveConflictingActions(apiDescriptions => apiDescriptions.First());
            });
      
            services.Configure<IdentityOptions>(opts =>
            {
                opts.User.RequireUniqueEmail = true;
                opts.Password.RequiredLength = 9;

                opts.SignIn.RequireConfirmedEmail = true;
            });

            services.AddCors(options => options.AddPolicy("APISPOTIFYPolicy", builder =>
            {
                builder.AllowAnyOrigin()
                       .AllowAnyMethod()
                       .AllowAnyHeader();
            }));

            // For Identity  
            services.AddIdentity<ApplicationUser, IdentityRole>()
                .AddEntityFrameworkStores<ApplicationDBContext>()
                .AddDefaultTokenProviders();

            // Adding Authentication  
            services.AddAuthentication(options =>
            {
                options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
            })
                 .AddJwtBearer(options =>
                 {
                     options.SaveToken = true;
                     options.RequireHttpsMetadata = false;
                     options.TokenValidationParameters = new TokenValidationParameters()
                     {
                         ValidateIssuer = true,
                         ValidateAudience = true,
                         ValidAudience = Configuration["JWT:ValidAudience"],
                         ValidIssuer = Configuration["JWT:ValidIssuer"],
                         IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(Configuration["JWT:Secret"]))
                     };
                 });

        }



        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseSwagger();
                //app.UseSwagger(c =>
                //{
                //    c.RouteTemplate = "/swagger/{documentName}/swagger.json";
                //});
                app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "APISPOTIFY v1"));
            }

            app.UseHttpsRedirection();
            app.UseStaticFiles();
            app.UseCors("APISPOTIFYPolicy");

            app.UseAuthentication();

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
