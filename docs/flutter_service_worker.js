'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "canvaskit/canvaskit.js": "97937cb4c2c2073c968525a3e08c86a3",
"canvaskit/canvaskit.wasm": "3de12d898ec208a5f31362cc00f09b9e",
"canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"flutter.js": "1cfe996e845b3a8a33f57607e8b09ee4",
"main.dart.js": "6d01a462575dda4e2eefc330e0e34eb8",
"version.json": "206492d93ea83eaea408f36bc39a8ea8",
"assets/lib/examples/all_row_colors.dart": "efbaba32421cd7223c6e28c767cc10d9",
"assets/lib/examples/cell_edit.dart": "5811c8e5f9ce2f083dfcf57fb2cf5dd8",
"assets/lib/examples/cell_style.dart": "9a6abdd9dda2a1da489ccdf0c97f050b",
"assets/lib/examples/column_style.dart": "11b02581ee351bc97ba9f8a0b1b147ef",
"assets/lib/examples/columns_fit.dart": "07d88c8009c5fa3edf913953fe435380",
"assets/lib/examples/custom_cell_widget.dart": "edb77e039255c3ae49f546b73a6dc44a",
"assets/lib/examples/get_started.dart": "6d26a8cf60d3f09c12adb13866c9681c",
"assets/lib/examples/infinite_scroll.dart": "253d3eecdbc3922dda496e9fe208de12",
"assets/lib/examples/multi_sort.dart": "1e3f698fd94532676d5c1d69a27e6b46",
"assets/lib/examples/null_cell_color.dart": "980f185c7fe28752bd0679500fd2c91b",
"assets/lib/examples/on_sort.dart": "6f6cd96e429391c577194a4b25df2833",
"assets/lib/examples/pinned_column.dart": "deb5934e63dc2f878b14c36e7ae1a3d1",
"assets/lib/examples/row_callbacks.dart": "995e7c95182ab5074053ddc4512614fd",
"assets/lib/examples/row_color.dart": "fe79bf2952c2c9a232a12676ce873abf",
"assets/lib/examples/row_cursor.dart": "6bd74232d445a45d0e3cfeb8e6da7cc9",
"assets/lib/examples/row_fill_height.dart": "4380a5cd933f71fd52eb58c1bd74f95e",
"assets/lib/examples/row_hover_background.dart": "7b5e41d48f7231fee59e5c5d5a65b676",
"assets/lib/examples/row_hover_foreground.dart": "18f0b6f625d9cba4a0b674fe40018b54",
"assets/lib/examples/row_hover_listener.dart": "f99b445174d89a8b82a49c0245598864",
"assets/lib/examples/row_zebra_color.dart": "3fd2468a0651a66e1f194a1d8ac5c5fc",
"assets/lib/examples/scrollbar_always_visible.dart": "1d6481972a5e00f0ee113b74e0a4a329",
"assets/lib/examples/server_side_sorting.dart": "cb52b87243206d8635f260353ed3538f",
"assets/lib/examples/stretchable_column.dart": "6ac3099e02cb7e72239f0386fe0db3ec",
"assets/lib/examples/theme_dividers.dart": "f42881e8f7fca15833f6359c658dff21",
"assets/lib/examples/theme_header.dart": "14755aa04cf59229d72ab8c5e4f4769e",
"assets/lib/examples/theme_hidden_header.dart": "f2fe2cbc25f6d2d329153fb5b9c19503",
"assets/lib/examples/theme_row_color.dart": "8d485e867ff2f58dcff392e8a9689f88",
"assets/lib/examples/theme_scrollbars.dart": "c81ba364e20a3fc6da8949205c0806bc",
"assets/packages/flex_color_picker/assets/opacity.png": "49c4f3bcb1b25364bb4c255edcaaf5b2",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/AssetManifest.json": "f43414483d768ca27ea8c64512171d59",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/NOTICES": "39b0ca1f0c27d2e37caae6b63f908cc3",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"manifest.json": "c87054e3cc5e911cffe4b817747a518e",
"index.html": "526919c02fda376f2b4510599b7ac7ac",
"/": "526919c02fda376f2b4510599b7ac7ac"
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
