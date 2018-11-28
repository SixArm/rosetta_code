# Task: HTTPS GET with header, query, body

Goal:

  * Make a typical HTTPS GET request
  * Use the hostname "example.com"
  * Use the path "my-path"
  * Use the query parameter "my-query"
  * Set a HTTPS header, using key "My-Header-Key" and value "my-header-value"
  * Set the body text to "my-body-text"


## CSharp

```csharp
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
            client.DefaultRequestHeaders.Add("My-Header-Demo", "my-header-value");
            var uri = "https://example.com/my-path" + queryString;
            var response = await client.GetAsync(uri);
        }
    }
}
```

## curl

```sh
curl -v -X GET "https://example.com/my-path?my-query" \
-H "My-Header-Demo: my-header-value" \
--data-ascii "my-body-text"
```


## Java

```java
// This sample uses the Apache HTTP client from HTTP Components.
// See http://hc.apache.org/httpcomponents-client-ga/
import java.net.URI;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

public class JavaSample 
{
    public static void main(String[] args) 
    {
        HttpClient httpclient = HttpClients.createDefault();

        try
        {
            URIBuilder builder = new URIBuilder("https://example.com/my-path");
            URI uri = builder.build();
            HttpGet request = new HttpGet(uri);
            request.setHeader("My-Header-Demo", "my-header-value");
            StringEntity reqEntity = new StringEntity("my-body-text");
            request.setEntity(reqEntity);
            HttpResponse response = httpclient.execute(request);
            HttpEntity entity = response.getEntity();

            if (entity != null) 
            {
                System.out.println(EntityUtils.toString(entity));
            }
        }
        catch (Exception e)
        {
            System.out.println(e.getMessage());
        }
    }
}
```


## JavaScript with HTML jQuery

```html
<!DOCTYPE html>
<html>
  <head>
    <title>Demo</title>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
  </head>
  <body>
    
    <script type="text/javascript">
      
      $(function() {
          var params = {
              // Query parameters
          };
	  
          $.ajax({
              url: "https://example.com/my-path?" + $.param(params),
              beforeSend: function(xhrObj){
                  // Request headers
                  xhrObj.setRequestHeader("My-Header-Demo","my-header-value");
              },
              type: "GET",
              // Request body
              data: "my-body-text",
          })
              .done(function(data) {
		  alert("success");
              })
              .fail(function() {
		  alert("error");
              });
      });
      
    </script>
  </body>
</html>
```


## Objective C

```objc
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    
    NSString* path = @"https://example.com/my-path";
    NSArray* array = @[
		       // Request parameters
		       @"entities=true",
		       ];
    
    NSString* string = [array componentsJoinedByString:@"&"];
    path = [path stringByAppendingFormat:@"?%@", string];
    
    NSLog(@"%@", path);
    
    NSMutableURLRequest* _request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:path]];
    [_request setHTTPMethod:@"GET"];
    // Request headers
    [_request setValue:@"myheader" forHTTPHeaderField:@"Header-Demo"];
    // Request body
    [_request setHTTPBody:[@"mybody" dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLResponse *response = nil;
    NSError *error = nil;
    NSData* _connectionData = [NSURLConnection sendSynchronousRequest:_request returningResponse:&response error:&error];
    
    if (nil != error)
      {
        NSLog(@"Error: %@", error);
    }
    else
      {
        NSError* error = nil;
        NSMutableDictionary* json = nil;
        NSString* dataString = [[NSString alloc] initWithData:_connectionData encoding:NSUTF8StringEncoding];
        NSLog(@"%@", dataString);
        
        if (nil != _connectionData)
	  {
            json = [NSJSONSerialization JSONObjectWithData:_connectionData options:NSJSONReadingMutableContainers error:&error];
        }
        
        if (error || !json)
	  {
            NSLog(@"Could not parse loaded json with error:%@", error);
	  }
        
        NSLog(@"%@", json);
        _connectionData = nil;
      }
    
    [pool drain];

    return 0;
}
```


## PHP

```php
<?php
// This sample uses the Apache HTTP client from HTTP Components.
// See http://hc.apache.org/httpcomponents-client-ga/
// Credit: https://silvergate.portal.azure-api.net/
require_once 'HTTP/Request2.php';

$request = new Http_Request2('https://example.com/my-path');
$url = $request->getUrl();

$headers = array(
    // Request headers
    'My-Header-Demo' => 'myheader',
);

$request->setHeader($headers);

$parameters = array(
    // Request parameters
);

$url->setQueryVariables($parameters);

$request->setMethod(HTTP_Request2::METHOD_GET);

// Request body
$request->setBody("mybody");

try
{
    $response = $request->send();
    echo $response->getBody();
}
catch (HttpException $ex)
{
    echo $ex;
}

?>
```


## Python

With Python 2:

```python
import httplib, urllib, base64

headers = {
    'My-Header-Demo': 'my-header-value',
}

params = urllib.urlencode({
})

try:
    conn = httplib.HTTPSConnection('example.com')
    conn.request("GET", "/my-path?%s" % params, "my-body-text", headers)
    response = conn.getresponse()
    data = response.read()
    print(data)
    conn.close()
except Exception as e:
    print("[Errno {0}] {1}".format(e.errno, e.strerror))
```

With Python 3:

```python
import http.client, urllib.request, urllib.parse, urllib.error, base64

headers = {
    'My-Header-Demo': 'my-header-value',
}

params = urllib.parse.urlencode({
})

try:
    conn = http.client.HTTPSConnection('example.com')
    conn.request("GET", "/my-path?%s" % params, "my-body-text", headers)
    response = conn.getresponse()
    data = response.read()
    print(data)
    conn.close()
except Exception as e:
    print("[Errno {0}] {1}".format(e.errno, e.strerror))
require 'net/http'
```


## Ruby

```ruby
uri = URI('https://example.com/my-path')

request = Net::HTTP::Get.new(uri.request_uri)
request['My-Header-Demo'] = 'my-header-value'
request.body = "my-body-text"

response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
  http.request(request)
end

puts response.body
```
