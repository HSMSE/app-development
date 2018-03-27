function onFailure() {
    alert("403 Forbidden")
}

function onSignIn(googleUser) {
    var id_token = googleUser.getAuthResponse().id_token

    $.get('/g-signin', {token: id_token}, function(data) {
        $("#result").html(data)
    })
}
