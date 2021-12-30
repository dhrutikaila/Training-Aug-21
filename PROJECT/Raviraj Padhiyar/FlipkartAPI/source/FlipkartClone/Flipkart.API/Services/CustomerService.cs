using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Flipkart.API.DbContexts;
using Flipkart.API.Models;
using Flipkart.API.Services.Interfaces;

namespace Flipkart.API.Services
{
    public class CustomerService : GenericService<Customer> , ICustomerService
    {
        private readonly IMapper _mapper;

        public CustomerService(FlipkartAPIDBContext context, IMapper mapper) : base(context)
        {
            _mapper = mapper;
        }

        public IEnumerable<Vaddress> GetCustomerAddresses(int id)
        {
            var addresses = (from va in _context.Vaddresses
                             join ca in _context.CustomerAddresses
                             on va.AddressId equals ca.AddressId
                             where ca.CustomerId == id
                             select va
                             ).ToList();

            return addresses;
        }

        public Vaddress GetCustomerAddressesById(int id, int customerAddressId)
        {
            var address = (from va in _context.Vaddresses
                           join ca in _context.CustomerAddresses
                           on va.AddressId equals ca.AddressId
                           where ca.CustomerId == id
                           where ca.CustomerAddressId == customerAddressId
                           select va).FirstOrDefault();
            return address;
                          
        }

        public IEnumerable<OrderHeader> GetCustomerOrderHeaders(int id)
        {
            var orderHeaders = _context.OrderHeaders.Where(o => o.CustomerId == id).ToList();

            return orderHeaders;
        }

        public IEnumerable<OrderDetail> GetCustomerOrderHeadersById(int orderHeaderId)
        {
            var orderDetails = _context.OrderDetails.Where(od => od.OrderHeaderId == orderHeaderId).ToList();


            return orderDetails;
        }

        public IEnumerable<PaymentDetail> GetCustomerPaymentDetails(int id)
        {
            var paymentDetails = _context.PaymentDetails.Where(pd => pd.CustomerId == id);

            return paymentDetails;
        }

        public PaymentDetail GetCustomerPaymentDetailsById(int id, int paymentDetailId)
        {
            return _context.PaymentDetails.Find(paymentDetailId);
        }
    }
}
