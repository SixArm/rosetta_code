<?php
// This sample uses the Apache HTTP client from HTTP Components.
// See http://hc.apache.org/httpcomponents-client-ga/
// Credit: https://silvergate.portal.azure-api.net/
require_once 'HTTP/Request2.php';

$request = new Http_Request2('https://example.com/my-path');
$url = $request->getUrl();

$headers = array(
    // Request headers
    'My-Header-Key' => 'my-header-value',
);

$request->setHeader($headers);

$parameters = array(
    "my-query"
);

$url->setQueryVariables($parameters);

$request->setMethod(HTTP_Request2::METHOD_GET);

// Request body
$request->setBody("my-body-text");

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
