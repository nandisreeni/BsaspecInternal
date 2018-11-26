using System;
using System.Globalization;
using Google.Apis.Auth.OAuth2;
using Google.Apis.Calendar.v3;
using Google.Apis.Calendar.v3.Data;
using Google.Apis.Services;
using Google.Apis.Util.Store;
using System.IO;
using System.Threading;
using System.Net.Mail;
using System.Net;
using System.Configuration;

/// <summary>
/// Summary description for GenericFunctions
/// </summary>
public static class GenericFunctions
{

    public static string GetTime()
    {
        string _time;
        DateTime clientDateTime = DateTime.Now;
        DateTime estDateTime = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(clientDateTime, "Eastern Standard Time");
        _time = estDateTime.ToString("h:mm tt");
        return _time;
    }
    public static string Getdate()
    {
        string _date;
        DateTime clientDateTime = DateTime.Now;
        DateTime estDateTime = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(clientDateTime, "Eastern Standard Time");
        _date = estDateTime.ToString("MM-dd-yyyy");
        return _date;
    }
    public static string Converttotilecase(string _str)
    {
        TextInfo myTI = new CultureInfo("en-US", false).TextInfo;
        return myTI.ToTitleCase(_str);
    }
    public static void googlecal()
    {
        string[] Scopes = { CalendarService.Scope.CalendarReadonly };
        string ApplicationName = "Google Calendar API .NET Quickstart";
        UserCredential credential;

        using (var stream =
            new FileStream("credentials.json", FileMode.Open, FileAccess.Read))
        {
            // The file token.json stores the user's access and refresh tokens, and is created
            // automatically when the authorization flow completes for the first time.
            string credPath = "token.json";
            credential = GoogleWebAuthorizationBroker.AuthorizeAsync(
                GoogleClientSecrets.Load(stream).Secrets,
                Scopes,
                "user",
                CancellationToken.None,
                new FileDataStore(credPath, true)).Result;
            Console.WriteLine("Credential file saved to: " + credPath);
        }
        var service = new CalendarService(new BaseClientService.Initializer()
        {
            HttpClientInitializer = credential,
            ApplicationName = ApplicationName,
        });
        EventsResource.ListRequest request = service.Events.List("primary");
        request.TimeMin = DateTime.Now;
        request.ShowDeleted = false;
        request.SingleEvents = true;
        request.MaxResults = 10;
        request.OrderBy = EventsResource.ListRequest.OrderByEnum.StartTime;

        // List events.
        Events events = request.Execute();
        if (events.Items != null && events.Items.Count > 0)
        {
            foreach (var eventItem in events.Items)
            {
                string when = eventItem.Start.DateTime.ToString();
                if (String.IsNullOrEmpty(when))
                {
                    when = eventItem.Start.Date;
                }
                //Console.WriteLine("{0} ({1})", eventItem.Summary, when);
            }
        }
        else
        {
            //Console.WriteLine("No upcoming events found.");
        }
        // Console.Read();
    }
    public static void sendmailstring (string _txtEmail, string _txtTo,string _txtSubject,string _txtBody, string _txtPassword)
    {
        using (MailMessage mm = new MailMessage(_txtEmail, _txtTo))
        {
            mm.Subject = _txtSubject;
            mm.Body = _txtBody;
            mm.IsBodyHtml = false;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.EnableSsl = true;
            NetworkCredential NetworkCred = new NetworkCredential(_txtEmail, _txtPassword);
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = NetworkCred;
            smtp.Port = 587;
            smtp.Send(mm);
        }

    }
    public static string PopulateBody(string userName, string title, string url, string description)
    {
        string body = string.Empty;
        using (StreamReader reader = new StreamReader("EmailTemplate.html"))
        {
            body = reader.ReadToEnd();
        }
        body = body.Replace("{UserName}", userName);
        body = body.Replace("{Title}", title);
        body = body.Replace("{Url}", url);
        body = body.Replace("{Description}", description);
        return body;
    }
    public static void SendHtmlFormattedEmail(string recepientEmail, string subject, string body)
    {
        using (MailMessage mailMessage = new MailMessage())
        {
            mailMessage.From = new MailAddress(ConfigurationManager.AppSettings["UserName"]);
            mailMessage.Subject = subject;
            mailMessage.Body = body;
            mailMessage.IsBodyHtml = true;
            mailMessage.To.Add(new MailAddress(recepientEmail));
            SmtpClient smtp = new SmtpClient();
            smtp.Host = ConfigurationManager.AppSettings["Host"];
            smtp.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["EnableSsl"]);
            System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();
            NetworkCred.UserName = ConfigurationManager.AppSettings["UserName"];
            NetworkCred.Password = ConfigurationManager.AppSettings["Password"];
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = NetworkCred;
            smtp.Port = int.Parse(ConfigurationManager.AppSettings["Port"]);
            smtp.Send(mailMessage);
        }
    }
}