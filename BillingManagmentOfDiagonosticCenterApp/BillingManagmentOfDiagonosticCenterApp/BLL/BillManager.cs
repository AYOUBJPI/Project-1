﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BillingManagmentOfDiagonosticCenterApp.DAL;
using BillingManagmentOfDiagonosticCenterApp.Model;

namespace BillingManagmentOfDiagonosticCenterApp.BLL
{
    public class BillManager
    {
        BillGateway _billGateway=new BillGateway();

        public int Save(Bill bill)
        {
            return _billGateway.Save(bill);
        }

        public Bill GetBillByBillNo(string billNo)
        {
            return _billGateway.GetBillByBillNo(billNo);
        }

        public Bill GetBillByMobileNo(string mobileNo)
        {
            return _billGateway.GetBillByMobileNo(mobileNo);
        }

        public int UpdateBillStatus(string billNo)
        {
            return _billGateway.UpdateBillStatus(billNo);

        }
    }
}