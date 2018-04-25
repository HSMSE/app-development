const PythonShell = require('python-shell')

const low = require('lowdb')
const FileSync = require('lowdb/adapters/FileSync')
const adapter = new FileSync('announcements.json')
const db = low(adapter)

const uuidv4 = require('uuid/v4')

//db setup
db.defaults({announcements: []}).write()

module.exports = {
    getAuthorizedEmails: function() {

        var emails = PythonShell.run('utils/emails.py', function (err, results) {
            if (err) throw err
            results.push("benkosten@gmail.com")
        })

        return emails
    },

    getAnnouncements: function(callback) {
        callback(null,
            db.get('announcements')
                .orderBy("date", 'desc')
                .take(100)
                .value()
        )
    },

    postAnnouncements: function(data) {
        db.get('announcements')
            .push({date: data["date"], subject: data["subject"], message: data["message"], id: uuidv4()})
            .write()
    },

    deleteAnnouncement: function(data) {
        console.log(data)
        db.get('announcements')
            .remove({id: data["id"]})
            .write()
    }
}
