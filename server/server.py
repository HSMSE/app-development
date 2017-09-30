#Backend Bois
import tornado.ioloop
import tornado.web

class MainHandler(tornado.web.RequestHandler):
    def get(self):
        task = self.get_argument('task')
        self.serve(task)

    def serve(self, task):
        method = getattr(self, task)
        r = method()
        self.write(r)

    def hello(self):
        return "Hello, world."

def make_app():
    return tornado.web.Application([
        (r'/app/v1.0/', MainHandler)
    ])

if __name__ == '__main__':
    app = make_app()
    app.listen(7777)
    tornado.ioloop.IOLoop.current().start()
