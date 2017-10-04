#Backend Bois
import tornado.ioloop
import tornado.web
import json, time, asyncio

class MainHandler(tornado.web.RequestHandler):

    async def get(self):
        task = self.get_argument('task')
        await self.serve(task)

    async def serve(self, task):
        method = getattr(self, task)
        r = await method()

        self.write(r)

    async def announcements(self):
        print("Done")
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
