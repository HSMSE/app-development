const PythonShell = require('python-shell')

//Utility file for various scripts
module.exports = {
    getAuthorizedEmails: function() {
        var emails = []

        PythonShell.run('util/emails.py', function (err, results) {
            if (err) throw err
            emails = results

            console.log("Authorized emails:")
            for(let i = 0; i < emails.length; i++) {
                console.log(emails[i])
            }
             emails.push('benkosten@gmail.com')
        })
        return emails
    }
}
