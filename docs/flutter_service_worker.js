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
"main.dart.js": "07bf3f083dc5a0dce0cd27efca9ce04e",
"version.json": "42f6661db478c375d7c9f721e70c5fe9",
"assets/lib/get_started.dart": "270eb15d824f053648dbb0b4f7a225fa",
"assets/lib/custom_cell_widget.dart": "aca75486391241fa13c672ceff5cb4e6",
"assets/lib/cell_edit.dart": "53d8a56aa356eb27724699f286b261f1",
"assets/lib/row_callbacks.dart": "c037515545c23b8b8c3d26ae7c08df2f",
"assets/lib/row_color.dart": "cbcd4fcf2f2794ee7ee1ca75eb3ab2be",
"assets/lib/row_cursor.dart": "d0f7134c110b683a4531d654c698519b",
"assets/lib/null_cell_color.dart": "eacb7b9baec33db021664cb61bd67255",
"assets/lib/multi_sort.dart": "4c7640e3ce7d087582ef985c8751dad3",
"assets/lib/columns_fit.dart": "0f2490f02c98eb5fed7ed55050e386fe",
"assets/lib/stretchable_column.dart": "35a5fb0a72010b770ccd6bcba8ce5cde",
"assets/lib/pinned_column.dart": "50b02305dc455e7122048771478b7d38",
"assets/lib/column_style.dart": "7024d543ca48eb993692a33dcd50105c",
"assets/lib/row_fill_height.dart": "a52d9156168eae22ea341af7902da1a9",
"assets/lib/cell_style.dart": "8c45ef5f6f47f9b23e72502e80ee5c54",
"assets/lib/theme_dividers.dart": "386bd969e5d7ac3a0343e3545e87538c",
"assets/lib/theme_scrollbars.dart": "f1acafbd2accec3ad3f1390bb6b96362",
"assets/lib/theme_header.dart": "d373aaf15796cb7cac2ed3d45b5f075f",
"assets/lib/theme_hidden_header.dart": "ecd862104fb14d5e8cf80f0080897def",
"assets/lib/theme_row_color.dart": "f73cb902fb0511605a38c83615c26b01",
"assets/lib/scrollbar_always_visible.dart": "188137d7ed155bffbf25269a6261e6d3",
"assets/lib/infinite_scroll.dart": "b274cd5f084975e06969abc82dc8b311",
"assets/lib/row_hover_background.dart": "66ac223a657b096eb6119fb4cfbb4865",
"assets/lib/row_hover_foreground.dart": "8ac578f8f2c01a84365f2adb698a7f12",
"assets/lib/all_row_colors.dart": "e9e936e5bed5b10fa1866f4626d569f7",
"assets/lib/row_zebra_color.dart": "b83aae8b2000bc212f3e4c3f166a844e",
"assets/lib/row_hover_listener.dart": "1154793f42563812de002df56f652a43",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/flex_color_picker/assets/opacity.png": "49c4f3bcb1b25364bb4c255edcaaf5b2",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/shaders/ink_sparkle.frag": "997815677e6351a3bb18f3c6da702e4c",
"assets/AssetManifest.json": "322b6201f5c1cc9036c422ec411998a9",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/NOTICES": "248238129fd4e1816a2553cf654d040c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "a33ea29f3a886ccd4f450a05d350891c",
"/": "a33ea29f3a886ccd4f450a05d350891c",
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
