'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "main.dart.js": "4590801504f631c20a1e95c027c76bac",
"version.json": "206492d93ea83eaea408f36bc39a8ea8",
"assets/lib/get_started.dart": "19cd31ab6058407e89ebd0d050989bc5",
"assets/lib/custom_cell_widget.dart": "bdc2689d810db525ce79bdd0e7277fa7",
"assets/lib/cell_edit.dart": "2087b7de18fc430372428a33815d626b",
"assets/lib/row_callbacks.dart": "68718b0d8e4f3d0a7fc9dede0d577df8",
"assets/lib/on_sort.dart": "8d10308d08da1171e1d2e3f616f1b81a",
"assets/lib/server_side_sorting.dart": "5baec21f6ebd83a5b6a63bae3ca00df3",
"assets/lib/row_color.dart": "3022c56ea47da3215f208b163a903717",
"assets/lib/row_cursor.dart": "64cd0ca0f00743974d834489f75544c2",
"assets/lib/null_cell_color.dart": "42b7ae819c59bec7d022175aeeac3ef0",
"assets/lib/multi_sort.dart": "46162f317de38a2883f50d1d699595a5",
"assets/lib/columns_fit.dart": "3b633dc8de137e5cfbbc36af4ac625dd",
"assets/lib/stretchable_column.dart": "766e5758cbf8ead8f5e13487675619bf",
"assets/lib/pinned_column.dart": "9e9e54ea3a534ff2d6cc85fbc6938837",
"assets/lib/column_style.dart": "002f7ca6d082d5fb793718166c290da7",
"assets/lib/row_fill_height.dart": "a50a8435ae639817c07c0086bd7a914d",
"assets/lib/cell_style.dart": "a38e5a55af9ff7e4039c3c636918923d",
"assets/lib/theme_dividers.dart": "e6ee29d2954f0aa8f8f69559a59e5bc7",
"assets/lib/theme_scrollbars.dart": "b42c8e1957c7ab274fc4b15f2d999e5c",
"assets/lib/theme_header.dart": "6d64185814f52d9894e00be9427d35b4",
"assets/lib/theme_hidden_header.dart": "f2fd78bf9e9f94d4735cbb2d1e39b9f0",
"assets/lib/theme_row_color.dart": "60b40aee5f395165e0307e8e65cb3e56",
"assets/lib/scrollbar_always_visible.dart": "d6dc8feb59083dee8bdf8a5cf0a7b19d",
"assets/lib/infinite_scroll.dart": "b7add2bcdd5026cea03643211be76ff4",
"assets/lib/row_hover_background.dart": "81fdbf284cd052a648f5d1bb621e75e4",
"assets/lib/row_hover_foreground.dart": "08742bb0bc01ed4c0a27e30a65c5124d",
"assets/lib/all_row_colors.dart": "cb939231b479506cb4ead5d7b8cfd998",
"assets/lib/row_zebra_color.dart": "523a81ab6d98f7f77ff1de3e0b8e88dd",
"assets/lib/row_hover_listener.dart": "7da985ce888d47eb9044d63b95b3f1c5",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/flex_color_picker/assets/opacity.png": "49c4f3bcb1b25364bb4c255edcaaf5b2",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/shaders/ink_sparkle.frag": "997815677e6351a3bb18f3c6da702e4c",
"assets/AssetManifest.json": "3f8201fb4e33649804221b2ad08ffab2",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/NOTICES": "248238129fd4e1816a2553cf654d040c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "1f02c1d63cc3506183ab1489c4ce8c0a",
"/": "1f02c1d63cc3506183ab1489c4ce8c0a",
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
