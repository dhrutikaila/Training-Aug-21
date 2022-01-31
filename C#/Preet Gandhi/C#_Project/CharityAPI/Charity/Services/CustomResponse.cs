using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CharityAPI.Services
{
    public class CustomResponse
    {
		#region ' Constructor '

		public CustomResponse()
		{
			Errors = new List<string>();
		}

		public CustomResponse(string errorCode)
		{
			this.Errors.Add(errorCode);
		}

		#endregion ' Constructor '

		#region ' Public Methods '

		public List<string> Errors { get; set; }

		public bool IsValid
		{
			get
			{
				return Errors.Count <= 0;
			}
		}

		public void AddError(string error)
		{
			if (!Errors.Contains(error))
			{
				Errors.Add(error);
			}
		}

		public object Model { get; set; }

		#endregion ' Public Methods '
	}
}
