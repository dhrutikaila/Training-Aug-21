using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace CharityAPI.Services
{
	public class CommonHelper
	{
		#region ' Public Methods '
		public string GenerateCodeForTitle(string titleCode)
		{
			var code = "";
			try
			{
				code = titleCode.ToLower().Replace(" ", "-")
										   .Replace("&", "-")
										   .Replace("-", "-").Replace("/", "-").Replace(".", "-")
										   .Replace("|", "-").Replace("%", "-").Replace("(", "-")
										   .Replace(")", "-").Replace("[", "-").Replace("]", "-")
										   .Replace("_", "-").Replace(",", "-").Replace("@", "-")
										   .Replace("?", "-").Replace(",", "-").Replace("?", "-");
			}
			catch (Exception)
			{
			}
			return code;
		}
		public string GenerateCodeForImage(long id, string code)
		{
			var imageCode = "";
			try
			{
				imageCode = ToUrlCode(code) + "_" + id + ".jpg";
				imageCode = imageCode.Replace("|", "_");

			}
			catch (Exception ex)
			{
			}
			return imageCode;
		}
		public string ToUrlCode(string name)
		{
			name = (name.ToLower().Replace(" ", "-")
				.Replace("'", "")
						.Replace("&", "-and-")
						.Replace("-", "-")
						.Replace("/", "-")
						.Replace(".", "-"));
			return name;
		}
		public string GenrateCode(string name)
		{
			name = (name.ToLower().Replace(" ", "")
				.Replace("'", "")
						.Replace("&", "")
						.Replace(")", "")
						.Replace("\"", "")
						.Replace("(", "")
						.Replace("_", "")
						.Replace("-", "")
						.Replace("/", "")
						.Replace(".", ""));
			return name;
		}
		public string GenerateCodeForImageWithExtension(long id, string code, string extension)
		{
			var imageCode = "";
			try
			{
				imageCode = ToUrlCode(code) + "_" + id + extension;
				imageCode = imageCode.Replace("|", "_");

			}
			catch (Exception ex)
			{
			}
			return imageCode;
		}

		//public string UploadEventBanner(long eventOrganiserId, long eventId, Image file)
		//{
		//	var fileName = new CommonHelper().GenerateCodeForTitle(file.FileName) + "_" + eventOrganiserId + "." + file.FileName.Split(".").Last();
		//	var rootPath = Path.Combine(
		//		   Directory.GetCurrentDirectory(), new CommonHelper().GetEventBannerPath(eventOrganiserId, eventId));
		//	var uploadPath = Path.Combine(
		//			 Directory.GetCurrentDirectory(), rootPath,
		//			fileName);

		//	try
		//	{
		//		var commonHelper = new CommonHelper();
		//		commonHelper.CreateDirectory(rootPath);
		//		commonHelper.DeleteAllfile(rootPath);

		//		using (var stream = new FileStream(uploadPath, FileMode.Create))
		//		{
		//			file.CopyTo(stream);
		//		}
		//		return fileName;
		//	}
		//	catch (Exception)
		//	{
		//		return "";
		//	}
		//}
		//public static Response ToResponse(this ValidationResult result)
		//{
		//	var returnData = new Response();
		//	if (!result.IsValid)
		//	{
		//		foreach (var item in result.Errors)
		//		{
		//			returnData.Errors.Add(item.ErrorMessage);
		//		}
		//	}
		//	return returnData;
		//}
		public string GetEventBannerPath(long eventOrganiserId,long eventId)
		{
			var path = Path.Combine(
			Directory.GetCurrentDirectory(), "wwwroot/assets/images/organisations/events/banner/" + eventOrganiserId) + "/" + eventId;
			return path;
		}
		public string GetEventPostPath( long postId)
		{
			var path = Path.Combine(
			Directory.GetCurrentDirectory(), "wwwroot/assets/images/organisations/events/posts/" ) + "/" + postId;
			return path;
		}
		public string GetPostPath(long userId, long postId)
		{
			var path = Path.Combine(
			Directory.GetCurrentDirectory(), "wwwroot/assets/images/users/posts/" + userId) + "/" + postId;
			return path;
		}
		public string GetUserPath(long userId)
		{
			var path = Path.Combine(
			Directory.GetCurrentDirectory(), "wwwroot/assets/images/users/profile/") + "/" + userId;
			return path;
		}
		public string GetOrganisationPath( long orgId)
		{
			var path = Path.Combine(
			Directory.GetCurrentDirectory(), "wwwroot/assets/images/organisations/profile" ) + "/" + orgId;
			return path;
		}
		public void CreateDirectory(string location)
		{
			var path = Path.Combine(Directory.GetCurrentDirectory(), location);
			FileInfo fie = new FileInfo(path);
			if (!fie.Exists)
			{
				System.IO.Directory.CreateDirectory(path);
			}
		}
		public void DeleteFilePath(string location, string fileName)
		{
			if (Directory.Exists(location))
			{
				var path = Path.Combine(location, fileName);
				FileInfo fi = new FileInfo(path);
				if (fi.Exists)
				{
					fi.Delete();
				}
			}

		}
		public void DeleteFolder(string location)
		{
			if (Directory.Exists(location))
			{
				Directory.Delete(location, true);
			}

		}
		public void DeleteAllfile(string location)
		{
			if (Directory.Exists(location))
			{
				string[] filePaths = Directory.GetFiles(location);

				if (filePaths.Length > 0)
				{
					foreach (string filePath in filePaths)
					{
						FileInfo fie = new FileInfo(filePath);
						if (fie.Exists)
						{
							fie.Delete();
						}
					}
				}
			}

		}
		public void DeleteImage(string imagePath, string fileName)
		{
			if (!string.IsNullOrEmpty(fileName))
			{
				fileName = GetFileNameWithoutTime(fileName);

				var filePath = Path.Combine(imagePath, fileName);
				FileInfo fi = new FileInfo(filePath);
				if (fi.Exists)
				{
					fi.Delete();
				}
			}
		}
		public string GetFileNameWithoutTime(string fileName)
		{
			var ImageName = fileName;
			if (!string.IsNullOrEmpty(fileName))
			{
				if (fileName.Contains('?'))
				{
					var array = fileName.Split('?');
					if (array.Count() > 0)
					{
						ImageName = array[0];
					}
				}
			}
			return ImageName;
		}
		public static string GeneratePassword(bool includeLowercase, bool includeUppercase, bool includeNumeric, bool includeSpecial, bool includeSpaces, int lengthOfPassword)
		{
			const int MAXIMUM_IDENTICAL_CONSECUTIVE_CHARS = 2;
			const string LOWERCASE_CHARACTERS = "abcdefghijklmnopqrstuvwxyz";
			const string UPPERCASE_CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
			const string NUMERIC_CHARACTERS = "0123456789";
			const string SPECIAL_CHARACTERS = @"!#$%&*@\";
			const string SPACE_CHARACTER = " ";



			string characterSet = "";

			if (includeLowercase)
			{
				characterSet += LOWERCASE_CHARACTERS;
			}

			if (includeUppercase)
			{
				characterSet += UPPERCASE_CHARACTERS;
			}

			if (includeNumeric)
			{
				characterSet += NUMERIC_CHARACTERS;
			}

			if (includeSpecial)
			{
				characterSet += SPECIAL_CHARACTERS;
			}

			if (includeSpaces)
			{
				characterSet += SPACE_CHARACTER;
			}

			char[] password = new char[lengthOfPassword];
			int characterSetLength = characterSet.Length;

			System.Random random = new System.Random();
			for (int characterPosition = 0; characterPosition < lengthOfPassword; characterPosition++)
			{
				password[characterPosition] = characterSet[random.Next(characterSetLength - 1)];

				bool moreThanTwoIdenticalInARow =
					characterPosition > MAXIMUM_IDENTICAL_CONSECUTIVE_CHARS
					&& password[characterPosition] == password[characterPosition - 1]
					&& password[characterPosition - 1] == password[characterPosition - 2];

				if (moreThanTwoIdenticalInARow)
				{
					characterPosition--;
				}
			}

			return string.Join(null, password);
		}
		#endregion ' Public Methods '
	}
}
