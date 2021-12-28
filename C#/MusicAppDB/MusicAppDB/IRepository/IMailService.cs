using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MailKit;
namespace MusicAppDB.IRepository
{
   public interface IMailService
    {
        void SendEmailAsync(MailRequest mailRequest);
    }
}
