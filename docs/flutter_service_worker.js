'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "canvaskit/canvaskit.js": "2bc454a691c631b07a9307ac4ca47797",
"canvaskit/canvaskit.wasm": "bf50631470eb967688cca13ee181af62",
"canvaskit/profiling/canvaskit.js": "38164e5a72bdad0faa4ce740c9b8e564",
"canvaskit/profiling/canvaskit.wasm": "95a45378b69e77af5ed2bc72b2209b94",
"flutter.js": "f85e6fb278b0fd20c349186fb46ae36d",
"main.dart.js": "349cb7f48181df746e4a43e1bb922c09",
"version.json": "afa778425fa953d10ad527643289b2cd",
"assets/lib/get_started.dart": "2f5940326b3e9258aa533764864d518b",
"assets/lib/custom_cell_widget.dart": "0172ce04822bd9a4dc8db526ba076e53",
"assets/lib/cell_edit.dart": "58d7d3729aba6921eff57acd76b7c157",
"assets/lib/row_callbacks.dart": "76baaa04c29eb77f0cb09891ba809c5c",
"assets/lib/row_color.dart": "2811befe30a7eb311bf598fdc99a0cfb",
"assets/lib/row_cursor.dart": "79a21b570561d8867ee4e7b44c581275",
"assets/lib/null_cell_color.dart": "66f612fefd6a335fb95d5910721eabc6",
"assets/lib/multi_sort.dart": "bfe9d643edacc1834e303aa862128a35",
"assets/lib/columns_fit.dart": "e08696ee2e2cf33d733840fa468e4c1b",
"assets/lib/stretchable_column.dart": "b3fa04edce5c52812f8a8f791d3d1e31",
"assets/lib/pinned_column.dart": "240ccfd3e2e553868d964dc8a1e5878d",
"assets/lib/column_style.dart": "8465921fbdaac97cc9f721dc44b71834",
"assets/lib/row_fill_height.dart": "3b671be49c58c5412735ce53f9794955",
"assets/lib/cell_style.dart": "49f9a88af3f3479ae764ca2bd996b611",
"assets/lib/theme_dividers.dart": "ee678bab578467495b9c92c51e746fb8",
"assets/lib/theme_scrollbars.dart": "f0839bb6998e6056d08e774f5c34b6d8",
"assets/lib/theme_header.dart": "c1aa173b1858611d7870f3611d0fe619",
"assets/lib/theme_hidden_header.dart": "d260150a6c510d91a5871641c009a1f4",
"assets/lib/theme_row_color.dart": "f181618b32b8238d4554347665be9185",
"assets/lib/scrollbar_always_visible.dart": "e30758df8bf2ffc0b5e4bae45cb3ef50",
"assets/lib/infinite_scroll.dart": "5e8c866fa5a640a64b19a5b6120290a8",
"assets/lib/row_hover_background.dart": "e82db8a91c73d8194e0a44c0fd1483f2",
"assets/lib/row_hover_foreground.dart": "dde2a3c2029729ea90d6e8a3e71bb8b8",
"assets/lib/all_row_colors.dart": "5743f139ab6806404bc53453df475bc7",
"assets/lib/row_zebra_color.dart": "e94a1fb6c525162bd11946e56983e253",
"assets/lib/row_hover_listener.dart": "90cf9e2ff64ea0fd0d2fdcc2f97c6d02",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/flex_color_picker/assets/opacity.png": "49c4f3bcb1b25364bb4c255edcaaf5b2",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/shaders/ink_sparkle.frag": "997815677e6351a3bb18f3c6da702e4c",
"assets/AssetManifest.json": "322b6201f5c1cc9036c422ec411998a9",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/NOTICES": "383a1f20cbf5ae1c89b1382b2ce596ba",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "8951544f33c79c9f461a74c60f802fd1",
"/": "8951544f33c79c9f461a74c60f802fd1",
"manifest.json": "2750c5461e2a6d58fbfe67f67841ff18"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
