using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Flipkart.API.Models;

namespace Flipkart.API.Services.Interfaces
{
    public interface ICustomerService : IGenericService<Customer>
    {
        IEnumerable<Vaddress> GetCustomerAddresses(int id);
        Vaddress GetCustomerAddressesById(int id, int customerAddressId);
        IEnumerable<PaymentDetail> GetCustomerPaymentDetails(int id);
        PaymentDetail GetCustomerPaymentDetailsById(int id, int paymentDetailId);
        IEnumerable<OrderHeader> GetCustomerOrderHeaders(int id);
        IEnumerable<OrderDetail> GetCustomerOrderHeadersById(int orderHeaderId);
    }
}
