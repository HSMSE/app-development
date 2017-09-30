#Backend Bois
import tornado.ioloop
import tornado.web
import json

class MainHandler(tornado.web.RequestHandler):
    def get(self):
        task = self.get_argument('task')
        self.serve(task)

    def serve(self, task):
        method = getattr(self, task)
        r = method()
        self.write(r)

    def announcements(self):
        with open('announcements.json') as announce_data:
            data = json.load(announce_data)

        return data

def make_app():
    return tornado.web.Application([
        (r'/app/v1.0/', MainHandler)
    ])

if __name__ == '__main__':
    app = make_app()
    app.listen(7777)
    tornado.ioloop.IOLoop.current().start()
