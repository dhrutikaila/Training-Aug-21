using APISPOTIFY.IRepository;
using APISPOTIFY.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APISPOTIFY.Repository
{
    public class PaymentRepository : IPayment
    {
        private MusicAppDBContext _dB_MUSICContext;
        public PaymentRepository(MusicAppDBContext dB_MUSICContext)
        {
            _dB_MUSICContext = dB_MUSICContext;
        }
        public Payment Addpayment(Payment song)
        {
            // throw new NotImplementedException();

            song.UserId = int.Parse(Console.ReadLine());
            _dB_MUSICContext.Payments.Add(song);
            _dB_MUSICContext.SaveChanges();
            return song;
        }

        public void Deletepayment(Payment song)
        {
            _dB_MUSICContext.Payments.Remove(song);
            _dB_MUSICContext.SaveChanges();
        }

     

        public List<Payment> Getpayment()
        {
            return _dB_MUSICContext.Payments.ToList();
        }

        public Payment Getpayment(int id)
        {
            var album = _dB_MUSICContext.Payments.Find(id);
            return album;
        }
    }
}
