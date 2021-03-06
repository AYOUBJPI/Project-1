﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using BillingManagmentOfDiagonosticCenterApp.Model;
using BillingManagmentOfDiagonosticCenterApp.Model.ViewModels;

namespace BillingManagmentOfDiagonosticCenterApp.DAL
{
    public class BillGateway
    {
        string connectionString =
           WebConfigurationManager.ConnectionStrings["DiagnosticCenterManagementDBConnectionString"].ConnectionString;

        public int Save(Bill bill)
        {
            SqlConnection connection = new SqlConnection(connectionString);

            string query = "INSERT INTO Bills(BillNo,Date,TotalAmount,Status) VALUES('" + bill.BillNo + "','" + bill.Date +"',"+bill.Amount+",'" + bill.Status + "')";

            SqlCommand command = new SqlCommand(query, connection);

            connection.Open();
            int rowAffected = command.ExecuteNonQuery();
            connection.Close();
            return rowAffected;
        }

        public Bill GetBillByBillNo(string billNo)
        {
            SqlConnection connection = new SqlConnection(connectionString);

            string query = "SELECT *FROM Bills WHERE BillNo='"+billNo+"'";

            SqlCommand command = new SqlCommand(query, connection);

            connection.Open();
            Bill bill = null;
            SqlDataReader reader = command.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    bill=new Bill();
                    bill.BillNo = reader["BillNo"].ToString();
                    bill.Date = DateTime.Parse(reader["Date"].ToString());
                    bill.Status = reader["Status"].ToString();
                    bill.Amount = double.Parse(reader["TotalAmount"].ToString());

                }
                reader.Close();
            }
            connection.Close();

            return bill;
        }


        public Bill GetBillByMobileNo(string mobileNo)
        {
            SqlConnection connection = new SqlConnection(connectionString);

            string query = "SELECT DISTINCT P.Id,O.BillNo,P.Mobile FROM Patients p INNER JOIN Orders O ON P.Id=O.PatientId WHERE P.Mobile='"+mobileNo+"'";

            SqlCommand command = new SqlCommand(query, connection);

            connection.Open();
            Bill bill = null;
            SqlDataReader reader = command.ExecuteReader();

            string billNo="";
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    billNo = reader["BillNo"].ToString();
                }
                reader.Close();
            }
            connection.Close();

            bill = GetBillByBillNo(billNo);

            return bill;
        }

        public int UpdateBillStatus(string billNo)
        {
            SqlConnection connection = new SqlConnection(connectionString);

            string query = "UPDATE Bills SET Status='paid' WHERE BillNo='"+billNo+"'";

            SqlCommand command = new SqlCommand(query, connection);

            connection.Open();
            int rowAffected = command.ExecuteNonQuery();
            connection.Close();
            return rowAffected;
        }

        public bool IsBillPaid(string billNo)
        {
            Bill bill = GetBillByBillNo(billNo);

            if (bill.Status == "unpaid")
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        public List<ViewUnpaidBill> GetUnpaidBillsByDate(DateTime lowerDate, DateTime upperDate)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "SELECT Bi.BillNo,P.Mobile,P.Name,Bi.TotalAmount FROM (SELECT DISTINCT B.BillNo, B.TotalAmount,O.PatientId FROM Bills B INNER JOIN Orders O ON B.BillNo=O.BillNo WHERE B.Date>='"+lowerDate+"' AND B.Date<='"+upperDate+"' AND B.Status='unpaid') Bi INNER JOIN Patients P ON Bi.PatientId=P.Id";
            SqlCommand command = new SqlCommand(query, connection);

            connection.Open();

            SqlDataReader reader = command.ExecuteReader();

            List<ViewUnpaidBill> viewUnpaidBillsList = new List<ViewUnpaidBill>();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    ViewUnpaidBill viewUnpaidBill = new ViewUnpaidBill();
                    viewUnpaidBill.PatientName = reader["Name"].ToString();
                    viewUnpaidBill.BillNo = reader["BillNo"].ToString();
                    viewUnpaidBill.ContactNo = reader["Mobile"].ToString();
                    viewUnpaidBill.BillAmount = double.Parse(reader["TotalAmount"].ToString());

                    viewUnpaidBillsList.Add(viewUnpaidBill);
                }
                reader.Close();
            }
            connection.Close();

            return viewUnpaidBillsList;

        }
    }
}