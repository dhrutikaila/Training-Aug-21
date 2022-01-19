using APISPOTIFY.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APISPOTIFY.IRepository
{
    public interface IPayment
    {
        List<Payment> Getpayment();
        Payment Getpayment(int id);
        Payment Addpayment(Payment song);
        void Deletepayment(Payment song);
        
    }
}
