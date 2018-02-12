const PythonShell = require('python-shell')
const jsonfile = require('jsonfile');

//Utility file for various scripts
module.exports = {
    getAuthorizedEmails: function() {
        var emails = []

        PythonShell.run('utils/emails.py', function (err, results) {
            if (err) throw err
            emails = results

            console.log("Authorized emails:")
            for(let i = 0; i < emails.length; i++) {
                //On windows each email ends with \r (carriage return) requiring it to be filtered out otherwise matching doesn't work
                console.log(emails[i])
            }
             emails.push('benkosten@gmail.com')
        })
        return emails
    },

    getAnnouncements: function(callback) {
        jsonfile.readFile('announcements.json', callback)
    }
}
