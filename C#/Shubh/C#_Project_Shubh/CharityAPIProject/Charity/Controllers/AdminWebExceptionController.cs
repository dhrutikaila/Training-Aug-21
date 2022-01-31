
using CharityAPI.Controllers;
using CharityAPI.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Net.Http;

namespace CharityAPI.Controllers
{
    public class AdminWebExceptionController : BaseAdminController
    {
		//#region  " Public Methods "
		//[Authorize(Roles = "Admin")]
		//[HttpGet]
		//[CheckModulePermission(ModuleName = Modules.WebAppExceptionLog, ActionType = PermissionType.PermissionView)]
		//public JsonResult GetAll(HttpRequestMessage request)
		//{
		//	DataSourceRequest dataSourceRequest = Request.ToDataSourceRequest();
		//	if (dataSourceRequest != null)
		//	{
		//		FilterFieldsConfiguration.SetFilterFieldsConfiguration();
		//	}

		//	var list = new WebAppExceptionLogQueriesService().GetAll(dataSourceRequest);
		//	return Json(list, JsonRequestBehavior.AllowGet);
		//}
		//#endregion " Public Methods "
		//#region " POST APIs "
		//[AllowAnonymous]
		//[HttpPost]
		//public JsonResult Add(WebApiExceptionLog model)
		//{
		//	var validator = new WebAppExceptionLogValidator();
		//	var result = validator.Validate(model);
		//	if (!result.IsValid)
		//	{
		//		return Json(result.ToAvidResponse(), JsonRequestBehavior.AllowGet);
		//	}
		//	var actions = new WebAppExceptionLogActionService();
		//	var response = actions.Add(model);
		//	return Json(response, JsonRequestBehavior.AllowGet);
		//}
		//#endregion " POST APIs "
	}
}