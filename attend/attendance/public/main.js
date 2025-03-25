if('serviceWorker' in navigator) {
    navigator.serviceWorker.register('/progressive/aintech/public/sw.js')
    .then(function(registration) {
        console.log('serviceworker registration successful with scope: ', registration.scope);
    })
    .catch(function(error) {
        console.error('serviceworker registration failed: ', error);
    })
}
