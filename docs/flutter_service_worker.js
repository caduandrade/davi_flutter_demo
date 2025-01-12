'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"flutter_bootstrap.js": "e79da2f2282efaa2075a81e5e3eb72e0",
"index.html": "fcee04f6d46854a92fdc654200490581",
"/": "fcee04f6d46854a92fdc654200490581",
"main.dart.js": "f92e51e45d51c7f1bdfef1a41e69b4ab",
"version.json": "20c5582a8762718753cb3eefa79ed89c",
"assets/lib/get_started/get_started_example.dart": "f425a9ba0331809a02815536f59bd9cd",
"assets/lib/get_started/get_started_page.dart": "fe60ba47ba1a6a6ca07850200ec2630d",
"assets/lib/column_width/column_width_example.dart": "55ebd80ff27dbb281c9e18f771831360",
"assets/lib/column_width/column_width_page.dart": "8f95fbfc177789617fe1febafb63c1fd",
"assets/lib/column_style/column_style_example.dart": "6e7b20ce1a7262cbb80967379b48a96d",
"assets/lib/column_style/column_style_page.dart": "3e01b1095e59395e67678ee20c6a2d77",
"assets/lib/pinned_column/pinned_column_example.dart": "55f629ca95eb2af1d045fe60b0faf080",
"assets/lib/pinned_column/pinned_column_page.dart": "06b46ee938cde1128be38ace9d0493c7",
"assets/lib/row_color/row_color_example.dart": "a29eb7b5ff35e877043ff9343b8edae7",
"assets/lib/row_color/row_color_page.dart": "5434e2e08b84f62fa03e6ece1895470f",
"assets/lib/row_cursor/row_cursor_example.dart": "12c131e9559407119bf00c42728fb6a5",
"assets/lib/row_cursor/row_cursor_page.dart": "dfacd33218681d8a4d02a18df8b3add7",
"assets/lib/row_callbacks/row_callbacks_example.dart": "7be7110e2dadb49b5ff0b738cea17f4d",
"assets/lib/row_callbacks/row_callbacks_page.dart": "5f1471ef4dbcab120abca84d596e6fa3",
"assets/lib/row_hover_listener/row_hover_listener_example.dart": "499217a73c170f0c3294fc40b7847be1",
"assets/lib/row_hover_listener/row_hover_listener_page.dart": "02a5e0ab29e61b834f6e9ae03a1ac819",
"assets/lib/row_zebra_color/row_zebra_color_example.dart": "3c95b341a7433d1106e54de2c4c33ebd",
"assets/lib/row_zebra_color/row_zebra_color_page.dart": "51f8b4f9f6463ebe410eaff717e5b141",
"assets/lib/theme_scrollbars/theme_scrollbars_example.dart": "4653d223d1c814107e66e9021061ada7",
"assets/lib/theme_scrollbars/theme_scrollbars_page.dart": "204895cb256f15d8fce50a5357e57e75",
"assets/lib/theme_dividers/theme_dividers_example.dart": "93cdf8db24cff4a4c4b0227271a01fe3",
"assets/lib/theme_dividers/theme_dividers_page.dart": "a86f07609b8585e39e61dea736b4622b",
"assets/lib/theme_header/theme_header_example.dart": "f851203545d729c313cb2755ae5baea3",
"assets/lib/theme_header/theme_header_page.dart": "02eed3a0d9636d9ab0c3e648057282d8",
"assets/lib/theme_hidden_header/theme_hidden_header_example.dart": "d1c8a95a0f4be93823600c0c90818be4",
"assets/lib/theme_hidden_header/theme_hidden_header_page.dart": "d229d2ca3a8140c85aa8be5b247caf6e",
"assets/lib/theme_row_color/theme_row_color_example.dart": "f4e5a0b3e0d5bb95118602276e4f7d6b",
"assets/lib/theme_row_color/theme_row_color_page.dart": "b52c34921d38b4be83da04ceb29f12d3",
"assets/lib/on_sort/on_sort_example.dart": "ac201ed10362c74b48f6221fdb083643",
"assets/lib/on_sort/on_sort_page.dart": "34ca057f2947f083d018bcb5bf8cfd36",
"assets/lib/always_sorted/always_sorted_example.dart": "ba71021d61c6bc8d27842d263186db9d",
"assets/lib/always_sorted/always_sorted_page.dart": "8136b27c530dec756e6b7ee996ec59f4",
"assets/lib/cell_edit/cell_edit_example.dart": "f1922b7341f8781941000c2a5533e89f",
"assets/lib/cell_edit/cell_edit_page.dart": "9a61556e3eb58cd71a84b6cbcad60449",
"assets/lib/custom_cell_widget/custom_cell_page.dart": "8bcbcba14000792129ef4ffa4f750459",
"assets/lib/custom_cell_widget/custom_cell_widget_example.dart": "ce9ae84612bfa31fedb0e01c3fcaa77f",
"assets/lib/infinite_scroll/infinite_scroll_example.dart": "9cd12eba67dd04765abd014de0a76d53",
"assets/lib/infinite_scroll/infinite_scroll_page.dart": "c33d0053f951619e50c5de1881df927e",
"assets/lib/multi_sort/multi_sort_example.dart": "c6d68d700d1376dd11b3515bfe173539",
"assets/lib/multi_sort/multi_sort_page.dart": "e0074f51632daa945e6b8a142b98874f",
"assets/lib/null_cell_color/null_cell_color_example.dart": "4523a852d902fdc15d17fafe6ebac9b4",
"assets/lib/null_cell_color/null_cell_color_page.dart": "cec0eae62711c854fb1786c2622aa099",
"assets/lib/row_fill_height/row_fill_height_example.dart": "e973683c4a7de4cd2a94b97cf4c95dea",
"assets/lib/row_fill_height/row_fill_height_page.dart": "9095eab65d06bae6d263705f86269363",
"assets/lib/row_hover_color/row_hover_background.dart": "0628043749f394073504c1acdcb6316e",
"assets/lib/row_hover_color/row_hover_color_page.dart": "c5d888092753c267ccf4a038cdf7f0fe",
"assets/lib/row_hover_color/row_hover_foreground.dart": "e15fc0c1e7014471093d209b6f5a5361",
"assets/lib/scrollbar_always_visible/scrollbar_always_visible_example.dart": "c0f9e102a40da65da8091a138bdee2fb",
"assets/lib/scrollbar_always_visible/scrollbar_always_visible_page.dart": "8631019458c3191c9507556069e70c91",
"assets/lib/server_side_sorting/server_side_sorting_example.dart": "ee62de3eb85ddcba025b485193a8b50b",
"assets/lib/server_side_sorting/server_side_sorting_page.dart": "f0abfc3455195ae6cdd83b69aa764d3c",
"assets/lib/cell_bar/cell_bar_example.dart": "cc19774ef58751feeaea968a2a2a3d4d",
"assets/lib/cell_bar/cell_bar_page.dart": "a8ea6624c1e6b4354c63472b73499722",
"assets/lib/cell_bar/custom_cell_bar_example.dart": "54a0170f6fc7a1358e48048847493557",
"assets/lib/cell_painter/cell_painter_example.dart": "e9a7d7120fccb23ab6ed8d95119ce948",
"assets/lib/cell_painter/cell_painter_page.dart": "82147131f95bf7492b56800dd0ca75e5",
"assets/lib/summary/summary_example.dart": "70ad850968f9640cd2425dc70814ab18",
"assets/lib/summary/summary_page.dart": "2bb50beadf974d670b8dc5d47eb93d4d",
"assets/lib/cell_merge/cell_merge_example.dart": "95e83f0e12d073080917265863f69503",
"assets/lib/cell_merge/cell_merge_overflow_example.dart": "89008a64792c522201ab335a79d105c1",
"assets/lib/cell_merge/cell_merge_page.dart": "743b21e499a5dfb01074063d7c25b46a",
"assets/packages/flex_color_picker/assets/opacity.png": "49c4f3bcb1b25364bb4c255edcaaf5b2",
"assets/packages/syntax_highlight/grammars/sql.json": "957a963dfa0e8d634766e08c80e00723",
"assets/packages/syntax_highlight/grammars/dart.json": "b533a238112e4038ed399e53ca050e33",
"assets/packages/syntax_highlight/grammars/yaml.json": "7c2dfa28161c688d8e09478a461f17bf",
"assets/packages/syntax_highlight/grammars/json.json": "e608a2cc8f3ec86a5b4af4d7025ae43f",
"assets/packages/syntax_highlight/grammars/serverpod_protocol.json": "cc9b878a8ae5032ca4073881e5889fd5",
"assets/packages/syntax_highlight/themes/dark_vs.json": "2839d5be4f19e6b315582a36a6dcd1c3",
"assets/packages/syntax_highlight/themes/light_vs.json": "8025deae1ca1a4d1cb803c7b9f8528a1",
"assets/packages/syntax_highlight/themes/light_plus.json": "2a29ad892e1f54e93062fee13b3688c6",
"assets/packages/syntax_highlight/themes/dark_plus.json": "b212b7b630779cb4955e27a1c228bf71",
"assets/fonts/MaterialIcons-Regular.otf": "4ca3ffdc68b05221157852c842559074",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.json": "94326407ecd222766ae0df3dea5cc1a8",
"assets/AssetManifest.bin": "d9f86b63c3dfc97d2a43889351478046",
"assets/AssetManifest.bin.json": "3f5d24a652db6b4542636657fa6dc6ac",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/NOTICES": "dd0e35553209929255c981cff8e444c1",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"manifest.json": "3982f31687076122c5b044e9338edf33"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
