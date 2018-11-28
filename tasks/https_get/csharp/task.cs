using System;
using System.Net.Http.Headers;
using System.Text;
using System.Net.Http;
using System.Web;

namespace CSHttpClientSample
{
    static class Program
    {
        static void Main()
        {
            MakeRequest();
            Console.WriteLine("Hit ENTER to exit...");
            Console.ReadLine();
        }
        
        static async void MakeRequest()
        {
            var client = new HttpClient();
            var queryString = HttpUtility.ParseQueryString("my-query");
            client.DefaultRequestHeaders.Add("My-Header-Key", "my-header-value");
            var uri = "https://example.com/my-path" + queryString;
            var response = await client.GetAsync(uri);
        }
    }
}	
