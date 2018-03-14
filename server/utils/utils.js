const PythonShell = require('python-shell')
const jsonfile = require('jsonfile');

//Utility file for various scripts
module.exports = {
    getAuthorizedEmails: function(callback) {
        PythonShell.run('utils/emails.py', callback)
    },

    getAnnouncements: function(callback) {
        jsonfile.readFile('announcements.json', callback)
    }

    //something like this, but this is completely wrong becuase it doesnt unpack the array of announcements or events I call them I guess something like that
    /*
    postAnnouncements: function(body, callback) {
        message = body['m']
        teacher = body['t']
        subject = body['s']
        date = body['d']

        jsonfile.writeFile('announcemnts.json', {d: }, {flag: 'a'}, callback)
    }
    */
}
