from http.server import BaseHTTPRequestHandler, HTTPServer

class SimpleHTTPRequestHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.end_headers()
        self.wfile.write(b'Hello World from Python\n')

if __name__ == '__main__':
    server_address = ('', 5000)
    httpd = HTTPServer(server_address, SimpleHTTPRequestHandler)
    print("Serving on port 5000...")
    httpd.serve_forever()
