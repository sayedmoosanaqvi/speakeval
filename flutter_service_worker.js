'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "fea2c76d29f3367d7d161a0d184f2df3",
".git/config": "bfc19bac7f1e761a1b9118e50285c3a1",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "6c8e52e2dbdf87579541510904cd49a5",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "3a1bae1f8a5c4e842d4b52b2a472835e",
".git/logs/refs/heads/main": "38017e3ba1976b95ce93a765c81e5578",
".git/logs/refs/remotes/origin/gh-pages": "d09666dfc08781fb6754ff2574ba4947",
".git/objects/06/5a156ad876ae75d08bca0aabc8c1e01f285abb": "1338ac20d12542d14345378e2fe2be26",
".git/objects/08/27c17254fd3959af211aaf91a82d3b9a804c2f": "360dc8df65dabbf4e7f858711c46cc09",
".git/objects/0d/7553dc64274eea103e6611204040e3f1144364": "e327208573a6a807396344344f79506a",
".git/objects/12/8bf61a0e1237ffc281854268797cf2066c4781": "9f7742a2826c9ae832557555a3ff5155",
".git/objects/1e/8069b855301d8f9a906579e74c14e9a0713f11": "aa6965ba0745d18bbda36c501085b0c4",
".git/objects/2a/6dfb5b87a369dfb2830939b674a9c1533d9100": "0cf0f45320ec7e3dc09aa18a4075950d",
".git/objects/2d/0471ef9f12c9641643e7de6ebf25c440812b41": "d92fd35a211d5e9c566342a07818e99e",
".git/objects/31/726e3cab202ece41fd8eadf349d3ed99f04cd9": "a764edfc3f8d464467e6e99b22022c79",
".git/objects/32/226895416a20245b1f8f7411f769e40302ad59": "525a6e36183a91e1595ff90b7b1f45df",
".git/objects/3a/8cda5335b4b2a108123194b84df133bac91b23": "1636ee51263ed072c69e4e3b8d14f339",
".git/objects/3b/b0860a0981211a1ab11fced3e6dad7e9bc1834": "3f00fdcdb1bb283f5ce8fd548f00af7b",
".git/objects/3d/4da6ded4ca08eefdc112ed62d6565f5093b950": "346ab07e78863d79b019dcf75944b801",
".git/objects/42/b2a2b46ca8ec50922c8cb47ecd78f9edec045a": "92f9ff8e2f86587d5d2c7af5faadc0c1",
".git/objects/42/f7c0247575a3dbd262c3b5dbf34f26125d9434": "f8ad902899fb773fd680a67e7db1969c",
".git/objects/43/0692574fb2d98a76663dd1407e3b5e16646bcd": "ba6e30e853fd0a35ebd6e851b77f6ba1",
".git/objects/51/03e757c71f2abfd2269054a790f775ec61ffa4": "d437b77e41df8fcc0c0e99f143adc093",
".git/objects/56/67ce10d3c9cd6c35e01402dda15031b0fc7592": "68d8ef064b5065fd0c404f8042f0fb36",
".git/objects/59/6cb684aa1ce54ce4b09867e87b6ecb0105a291": "2aab5b6b47aa9dcdbe63bf051aa0fbc4",
".git/objects/5a/a38fbd4477d6a0b2de6e12dbf0fec5b71e691a": "1a1863776754c103fab8906235deb810",
".git/objects/5f/010472239aaab5d12b9f320a790f5badd8a3dd": "34015a79f269195eac08c0ea45f1a6c2",
".git/objects/68/43fddc6aef172d5576ecce56160b1c73bc0f85": "2a91c358adf65703ab820ee54e7aff37",
".git/objects/6b/9862a1351012dc0f337c9ee5067ed3dbfbb439": "85896cd5fba127825eb58df13dfac82b",
".git/objects/6f/7661bc79baa113f478e9a717e0c4959a3f3d27": "985be3a6935e9d31febd5205a9e04c4e",
".git/objects/72/29c7b43ed669672e22239a57bde9abaf9bf00f": "2e97289011238d99fd79948b0c6fdb99",
".git/objects/72/636216aef5d28e54a1a186dcb235f8ac0679e6": "53756a929699670676e89da458107c8f",
".git/objects/77/4bfc44ed209d5c5b7a7e706cd181104a37ee53": "387ba3cb86de583b67dab4f2e75b911d",
".git/objects/7c/3463b788d022128d17b29072564326f1fd8819": "37fee507a59e935fc85169a822943ba2",
".git/objects/7f/73ffed3e9fd3145997a5bb320c24be45eb3f5e": "5f3559e62ed01947719201459ca2098a",
".git/objects/80/27a770bcf9dbf827201b60f3713df44e201f7a": "e68c4bf788c24b78c04e2286f556270e",
".git/objects/85/63aed2175379d2e75ec05ec0373a302730b6ad": "997f96db42b2dde7c208b10d023a5a8e",
".git/objects/87/b4ef4bee66203d1d8aa03cc6eeb58f14367855": "97046ae82c5b93a353749480d4eb8313",
".git/objects/8d/8662577ba4922e0570b8778b9a1f9f7b5d1e0c": "8c983dd8ac2278f5f7919f471a71938a",
".git/objects/8e/21753cdb204192a414b235db41da6a8446c8b4": "1e467e19cabb5d3d38b8fe200c37479e",
".git/objects/93/b363f37b4951e6c5b9e1932ed169c9928b1e90": "c8d74fb3083c0dc39be8cff78a1d4dd5",
".git/objects/a3/9b57c334d29774156192de1eeba9c972d43d50": "d37cf1c6da7bc4c0bab22d30e46e563d",
".git/objects/a7/3f4b23dde68ce5a05ce4c658ccd690c7f707ec": "ee275830276a88bac752feff80ed6470",
".git/objects/a8/8433d10347bda43dc741f68a6ec21e3a4d4f28": "d4e024fb1f43ef768eaf275c8dccd688",
".git/objects/ad/ced61befd6b9d30829511317b07b72e66918a1": "37e7fcca73f0b6930673b256fac467ae",
".git/objects/b9/3e39bd49dfaf9e225bb598cd9644f833badd9a": "666b0d595ebbcc37f0c7b61220c18864",
".git/objects/c2/6c2b406608f15401f8f672d95198b49bc0942b": "486d490b51a1b48100b074752a86a471",
".git/objects/c5/d0b5b709082c06cf8a7ec403f24dd496c0a53d": "c53939b0a23f93402e14440b56fca147",
".git/objects/c7/7663172ca915a99a594ca17d06f527db05657d": "6335b074b18eb4ebe51f3a2c609a6ecc",
".git/objects/c8/3af99da428c63c1f82efdcd11c8d5297bddb04": "144ef6d9a8ff9a753d6e3b9573d5242f",
".git/objects/cd/7a8d99d23d44747b7ba79856e5c4ff5ea7b661": "fc5631c63ae5c9b6a8c8a71a2d3bf7e0",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d9/339238d1ba0b057af4bc2592a6605f5f600c59": "e6fb429f2bfff851bf3224d31849a5d6",
".git/objects/d9/5b1d3499b3b3d3989fa2a461151ba2abd92a07": "a072a09ac2efe43c8d49b7356317e52e",
".git/objects/de/9971f71edbb2d82a132db9e66991e781c3a0cf": "30f900a211aa8520564fb3ff5c1d8574",
".git/objects/e9/94225c71c957162e2dcc06abe8295e482f93a2": "2eed33506ed70a5848a0b06f5b754f2c",
".git/objects/ed/171f1de3a752c26cea2b179d2ec42276339087": "891e86207507e54cb38e075193a00b46",
".git/objects/ed/de959e520954faa2fae7ff7151411360ebd906": "172098f0c9a7d5567393e04e2ef5a352",
".git/objects/f2/c02ec4f8bc290f99304699a9686cbaa0450ea1": "9ec73137429d1b91ca8e15208d7d3928",
".git/objects/f3/3e0726c3581f96c51f862cf61120af36599a32": "afcaefd94c5f13d3da610e0defa27e50",
".git/objects/f5/72b90ef57ee79b82dd846c6871359a7cb10404": "e68f5265f0bb82d792ff536dcb99d803",
".git/objects/f6/e6c75d6f1151eeb165a90f04b4d99effa41e83": "95ea83d65d44e4c524c6d51286406ac8",
".git/objects/f7/04b43f6e4d2115041d1d1fd3bc7c946b523125": "417da9658093d720483f65e835229ca4",
".git/objects/fd/05cfbc927a4fedcbe4d6d4b62e2c1ed8918f26": "5675c69555d005a1a244cc8ba90a402c",
".git/refs/heads/main": "401f46acaa664ca0031b973e456dd17f",
".git/refs/remotes/origin/gh-pages": "401f46acaa664ca0031b973e456dd17f",
"assets/AssetManifest.bin": "7b8ac7369577f4be13639fafdfbb4089",
"assets/AssetManifest.bin.json": "11b3fb2fbc1c083655561bf2e80bfe11",
"assets/assets/fonts/pf_bold.ttf": "7150373c62655e32d1720fd3b3890d09",
"assets/assets/fonts/pf_italic.ttf": "2d6979d4e6a9fa458c3037e6d8f9abb6",
"assets/assets/fonts/pf_medium.ttf": "5a11632ed293fcfcc40970c2b22c858f",
"assets/assets/images/download.jpg": "e8573af784a2716dcec24b44596cedfb",
"assets/assets/images/email.png": "a109ae6dd474033739f5e6a546dba603",
"assets/assets/images/image.png": "e94fc3f295e88b983df5c354b42e172a",
"assets/assets/images/moosa_dp.jpg": "d80ac1294d884792213b68c72ab7ccff",
"assets/assets/images/toefl.png": "58bd37e9b63c113038056a775d35f94d",
"assets/assets/images/toefl_logo.png": "9043033437d3a97a0fc69edaa5aaaea2",
"assets/FontManifest.json": "788aef9f5ad0d68a4e539d3b16155938",
"assets/fonts/MaterialIcons-Regular.otf": "63ffb330e417c70dd2898fbb9644a0ea",
"assets/NOTICES": "fe022d813f9931d01c2e7397fdb1369f",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/fluttertoast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"assets/packages/fluttertoast/assets/toastify.js": "56e2c9cedd97f10e7e5f1cebd85d53e3",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/shaders/stretch_effect.frag": "40d68efbbf360632f614c731219e95f0",
"canvaskit/canvaskit.js": "8331fe38e66b3a898c4f37648aaf7ee2",
"canvaskit/canvaskit.js.symbols": "a3c9f77715b642d0437d9c275caba91e",
"canvaskit/canvaskit.wasm": "9b6a7830bf26959b200594729d73538e",
"canvaskit/chromium/canvaskit.js": "a80c765aaa8af8645c9fb1aae53f9abf",
"canvaskit/chromium/canvaskit.js.symbols": "e2d09f0e434bc118bf67dae526737d07",
"canvaskit/chromium/canvaskit.wasm": "a726e3f75a84fcdf495a15817c63a35d",
"canvaskit/skwasm.js": "8060d46e9a4901ca9991edd3a26be4f0",
"canvaskit/skwasm.js.symbols": "3a4aadf4e8141f284bd524976b1d6bdc",
"canvaskit/skwasm.wasm": "7e5f3afdd3b0747a1fd4517cea239898",
"canvaskit/skwasm_heavy.js": "740d43a6b8240ef9e23eed8c48840da4",
"canvaskit/skwasm_heavy.js.symbols": "0755b4fb399918388d71b59ad390b055",
"canvaskit/skwasm_heavy.wasm": "b0be7910760d205ea4e011458df6ee01",
"favicon.png": "6b16fbcbb16e0a547aa5fe2a0179c87d",
"flutter.js": "24bc71911b75b5f8135c949e27a2984e",
"flutter_bootstrap.js": "8e45758de26d6d2fae087e0fd0191ee8",
"icons/Icon-192.png": "229330b5bba6c64426598ee3366304a9",
"icons/Icon-512.png": "3019325dab8053daa188d21e5a81b992",
"icons/Icon-maskable-192.png": "229330b5bba6c64426598ee3366304a9",
"icons/Icon-maskable-512.png": "3019325dab8053daa188d21e5a81b992",
"index.html": "3dfa8804ed62dd31dca28e1a29645302",
"/": "3dfa8804ed62dd31dca28e1a29645302",
"main.dart.js": "391b47f3142a03cfaac562151bf58dac",
"manifest.json": "98799f1cc8109760cb3799021b41378d",
"version.json": "8c232b8d287ea989c7f577f175325bd4"};
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
