import os

from hflossk.site import app
from tornado.wsgi import WSGIContainer
from tornado.httpserver import HTTPServer
from tornado.ioloop import IOLoop

if __name__ == "__main__":
    if 'OPENSHIFT_PYTHON_IP' in os.environ:
        host = os.environ['OPENSHIFT_PYTHON_IP']
        port = int(os.environ['OPENSHIFT_PYTHON_PORT'])
        app.run(host=host, port=port)
	http_server = HTTPServer(WSGIContainer(app))
	http_server.listen(port, address=host)
	IOLoop.instance().start()
    else:
        app.debug = True
        app.run()
