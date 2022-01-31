using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace CharityAPI.Models
{
    public partial class WebApiRequestLog
    {
        public int LogId { get; set; }
        public string LogDescription { get; set; }
        public int? SiteId { get; set; }
        public string RequestUri { get; set; }
        public string ControllerName { get; set; }
        public string ActionName { get; set; }
        public TimeSpan? StartTime { get; set; }
        public TimeSpan? Timespan { get; set; }
        public DateTimeOffset? CreatedOn { get; set; }
        public string CreatedBy { get; set; }
        public string IpAddress { get; set; }
    }
}
