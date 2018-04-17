const PythonShell = require('python-shell')

const low = require('lowdb')
const FileSync = require('lowdb/adapters/FileSync')
const adapter = new FileSync('announcements.json')
const db = low(adapter)

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
            .push({date: data["date"], subject: data["subject"], message: data["message"]})
            .write()
    }
}
