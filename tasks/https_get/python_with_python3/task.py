import http.client, urllib.request, urllib.parse, urllib.error, base64

headers = {
    'My-Header-Key': 'my-header-value',
}

params = urllib.parse.urlencode({
    "my-query"
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
