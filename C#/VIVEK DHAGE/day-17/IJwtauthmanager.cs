using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Day17_1
{
    interface IJwtauthmanager
    {
        string Authenticate(string username, string password);
    }
}
