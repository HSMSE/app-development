function onFailure() {
    alert("403 Forbidden")
}

function onSignIn(googleUser) {
    var id_token = googleUser.getAuthResponse().id_token
    $.ajax({
        url: '/g-signin',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({token: id_token})
    })
}
