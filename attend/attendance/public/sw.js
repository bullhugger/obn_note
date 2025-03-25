importScripts('https://storage.googleapis.com/workbox-cdn/releases/5.1.2/workbox-sw.js');
const CACHE = "pwabuilder-page";
const offlineFallbackPage = "/progressive/aintech/login";
self.addEventListener('install', event => {
    console.log('Service Worker: Installing...');
    event.waitUntil(
        caches.open(CACHE)
            .then(cache => {
                console.log('Service Worker: Caching offline fallback page');
                return cache.add(offlineFallbackPage);
            })
            .catch(err => console.error('Failed to cache offline fallback page:', err))
    );
});
self.addEventListener('activate', event => {
    console.log('Service Worker: Activated');
    event.waitUntil(self.clients.claim());
});
if (workbox.navigationPreload.isSupported()) {
    workbox.navigationPreload.enable();
}
self.addEventListener('fetch', event => {
    console.log('Service Worker: Fetching', event.request.url);
    if (event.request.mode === 'navigate') {
        event.respondWith((async () => {
            try {
                const preloadResp = await event.preloadResponse;

                if (preloadResp) {
                    return preloadResp;
                }

                const networkResp = await fetch(event.request);
                return networkResp;
            } catch (error) {
                console.error('Service Worker: Fetch failed, returning offline page:', error);
                const cache = await caches.open(CACHE);
                return cache.match(offlineFallbackPage);
            }
        })());
    }
});
self.addEventListener("message", (event) => {
    if (event.data && event.data.type === "SKIP_WAITING") {
        self.skipWaiting();
    }
});
