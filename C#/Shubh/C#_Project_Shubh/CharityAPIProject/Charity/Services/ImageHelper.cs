using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace CharityAPI.Services
{
	public static class AnchorPosition
	{
		public static string Left = "LEFT";
		public static string Right = "RIGHT";
		public static string Bottom = "BOTTOM";
		public static string Top = "TOP";
		public static string Center = "CENTER";
	}
	public class ImagesPath
	{
		public string Big { get; set; }
		public string Medium { get; set; }
		public string Small { get; set; }
		public string Icon { get; set; }
	}
	public class ImageHelper
    {
		public static void SmartCrop(int templateWidth, int templateHeight, string outputPath, Image originalImage)
		{
			var imageToProcess = (System.Drawing.Image)originalImage.Clone();
			if (imageToProcess.Width <= templateWidth && imageToProcess.Height <= templateHeight)
			{
				imageToProcess.Save(outputPath);
				//imageToProcess.Save(System.Web.HttpContext.Current.Server.MapPath(outputPath), System.Drawing.Imaging.ImageFormat.Jpeg);
			}
			else
			{
				double templateRate = double.Parse(templateWidth.ToString()) / templateHeight;
				double initRate = double.Parse(imageToProcess.Width.ToString()) / imageToProcess.Height;
				if (templateRate == initRate)
				{

					System.Drawing.Image templateImage = new System.Drawing.Bitmap(templateWidth, templateHeight);
					System.Drawing.Graphics templateG = System.Drawing.Graphics.FromImage(templateImage);
					templateG.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.High;
					templateG.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality;
					//templateG.Clear(Color.White);
					templateG.DrawImage(imageToProcess, new System.Drawing.Rectangle(0, 0, templateWidth, templateHeight), new System.Drawing.Rectangle(0, 0, imageToProcess.Width, imageToProcess.Height), System.Drawing.GraphicsUnit.Pixel);
					templateImage.Save(outputPath);
					//templateImage.Save(System.Web.HttpContext.Current.Server.MapPath(outputPath), System.Drawing.Imaging.ImageFormat.Jpeg);
				}

				else
				{

					System.Drawing.Image pickedImage = null;
					System.Drawing.Graphics pickedG = null;


					Rectangle fromR = new Rectangle(0, 0, 0, 0);
					Rectangle toR = new Rectangle(0, 0, 0, 0);


					if (templateRate > initRate)
					{

						pickedImage = new System.Drawing.Bitmap(imageToProcess.Width, int.Parse(Math.Floor(imageToProcess.Width / templateRate).ToString()));
						pickedG = System.Drawing.Graphics.FromImage(pickedImage);


						fromR.X = 0;
						fromR.Y = int.Parse(Math.Floor((imageToProcess.Height - imageToProcess.Width / templateRate) / 2).ToString());
						fromR.Width = imageToProcess.Width;
						fromR.Height = int.Parse(Math.Floor(imageToProcess.Width / templateRate).ToString());


						toR.X = 0;
						toR.Y = 0;
						toR.Width = imageToProcess.Width;
						toR.Height = int.Parse(Math.Floor(imageToProcess.Width / templateRate).ToString());
					}

					else
					{
						pickedImage = new System.Drawing.Bitmap(int.Parse(Math.Floor(imageToProcess.Height * templateRate).ToString()), imageToProcess.Height);
						pickedG = System.Drawing.Graphics.FromImage(pickedImage);

						fromR.X = int.Parse(Math.Floor((imageToProcess.Width - imageToProcess.Height * templateRate) / 2).ToString());
						fromR.Y = 0;
						fromR.Width = int.Parse(Math.Floor(imageToProcess.Height * templateRate).ToString());
						fromR.Height = imageToProcess.Height;

						toR.X = 0;
						toR.Y = 0;
						toR.Width = int.Parse(Math.Floor(imageToProcess.Height * templateRate).ToString());
						toR.Height = imageToProcess.Height;
					}


					pickedG.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic;
					pickedG.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality;


					pickedG.DrawImage(imageToProcess, toR, fromR, System.Drawing.GraphicsUnit.Pixel);


					System.Drawing.Image templateImage = new System.Drawing.Bitmap(templateWidth, templateHeight);
					System.Drawing.Graphics templateG = System.Drawing.Graphics.FromImage(templateImage);
					templateG.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.High;
					templateG.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality;
					//templateG.Clear(Color.Transparent);
					templateG.DrawImage(pickedImage, new System.Drawing.Rectangle(0, 0, templateWidth, templateHeight), new System.Drawing.Rectangle(0, 0, pickedImage.Width, pickedImage.Height), System.Drawing.GraphicsUnit.Pixel);
					templateImage.Save(outputPath);
					//templateImage.Save(System.Web.HttpContext.Current.Server.MapPath(outputPath));


					templateG.Dispose();
					templateImage.Dispose();

					pickedG.Dispose();
					pickedImage.Dispose();
				}
			}


			imageToProcess.Dispose();
		}

		public static void ScaleByPercent(Image imgPhoto, int Width, int Height, int Percent, string imageName, string path)
		{
			//var imageToProcess = (System.Drawing.Image)imgPhoto.Clone();
			//if (imageToProcess.Width <= Width && imageToProcess.Height <= Height)
			//{
			//	imageToProcess.Save(System.Web.HttpContext.Current.Server.MapPath(path +imageName), System.Drawing.Imaging.ImageFormat.Jpeg);
			//}
			//else
			//{
			imgPhoto = Crop(imgPhoto, Width, Height, AnchorPosition.Center);
			//CheckAndGeneratedDirectory(HttpContext.Current.Server.MapPath(path));
			float nPercent = ((float)Percent / 100);


			int sourceWidth = imgPhoto.Width;
			int sourceHeight = imgPhoto.Height;
			int sourceX = 0;
			int sourceY = 0;

			int destX = 0;
			int destY = 0;
			int destWidth = Width;
			int destHeight = Height;

			Bitmap bmPhoto = new Bitmap(destWidth, destHeight,
									 PixelFormat.Format24bppRgb);
			bmPhoto.SetResolution(imgPhoto.HorizontalResolution,
									imgPhoto.VerticalResolution);

			Graphics grPhoto = Graphics.FromImage(bmPhoto);
			grPhoto.Clear(Color.White);
			grPhoto.InterpolationMode =
					InterpolationMode.HighQualityBicubic;

			grPhoto.DrawImage(imgPhoto,
				new Rectangle(destX, destY, destWidth, destHeight),
				new Rectangle(sourceX, sourceY, sourceWidth, sourceHeight),
				GraphicsUnit.Pixel);

			var fileSavePath = Path.Combine(path, imageName);
			Image ConvertImage = new Bitmap(bmPhoto);
			grPhoto.Dispose();
			bmPhoto.Dispose();
			// Encoder parameter for image quality 
			EncoderParameter qualityParam = new EncoderParameter(System.Drawing.Imaging.Encoder.Quality, Percent);
			// JPEG image codec 
			ImageCodecInfo jpegCodec = GetEncoderInfo("image/jpeg");
			EncoderParameters encoderParams = new EncoderParameters(1);
			encoderParams.Param[0] = qualityParam;
			ConvertImage.Save(fileSavePath, jpegCodec, encoderParams);
			//  ConvertImage.Save(fileSavePath);
			ConvertImage.Dispose();
			//}
		}

		public static Image Crop(Image imgPhoto, int Width, int Height, string anchor)
		{
			int sourceWidth = imgPhoto.Width;
			int sourceHeight = imgPhoto.Height;
			int sourceX = 0;
			int sourceY = 0;
			int destX = 0;
			int destY = 0;

			float nPercent = 0;
			float nPercentW = 0;
			float nPercentH = 0;

			nPercentW = ((float)Width / (float)sourceWidth);
			nPercentH = ((float)Height / (float)sourceHeight);

			if (nPercentH < nPercentW)
			{
				nPercent = nPercentW;
				switch (anchor)
				{
					case "TOP":
						destY = 0;
						break;
					case "BOTTOM":
						destY = (int)
							(Height - (sourceHeight * nPercent));
						break;
					default:
						destY = (int)
							((Height - (sourceHeight * nPercent)) / 2);
						break;
				}
			}
			else
			{
				nPercent = nPercentH;
				switch (anchor)
				{
					case "LEFT":
						destX = 0;
						break;
					case "RIGHT":
						destX = (int)
						  (Width - (sourceWidth * nPercent));
						break;
					default:
						destX = (int)
						  ((Width - (sourceWidth * nPercent)) / 2);
						break;
				}
			}

			int destWidth = (int)(sourceWidth * nPercent);
			int destHeight = (int)(sourceHeight * nPercent);

			Bitmap bmPhoto = new Bitmap(Width,
					Height, PixelFormat.Format24bppRgb);
			bmPhoto.SetResolution(imgPhoto.HorizontalResolution,
					imgPhoto.VerticalResolution);

			Graphics grPhoto = Graphics.FromImage(bmPhoto);
			grPhoto.Clear(Color.White);
			grPhoto.InterpolationMode =
					InterpolationMode.HighQualityBicubic;

			grPhoto.DrawImage(imgPhoto,
				new Rectangle(destX, destY, destWidth, destHeight),
				new Rectangle(sourceX, sourceY, sourceWidth, sourceHeight),
				GraphicsUnit.Pixel);

			grPhoto.Dispose();
			return bmPhoto;
		}
		private static ImageCodecInfo GetEncoderInfo(string mimeType)
		{
			// Get image codecs for all image formats 
			ImageCodecInfo[] codecs = ImageCodecInfo.GetImageEncoders();

			// Find the correct image codec 
			for (int i = 0; i < codecs.Length; i++)
				if (codecs[i].MimeType == mimeType)
					return codecs[i];

			return null;
		}
	}
}
