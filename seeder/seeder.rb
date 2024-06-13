pages << {
    url: "https://naivas.online/kiambu-road/?automatic_redirect=1",
    page_type: "category",
    http2: true,
    fetch_type: "browser",
    method: "GET",
    # driver:{
    #     "name": "#{rand}",
    #     "code": "
    #         await.Puppeteer.LaunchAsync(new Launchoptions(){
    #             Headless: true,
    #             IgnoreHTTPSErrors: true
    #         })
    #     ",
    #     "goto_options": {
    #         "timeout": 0,
    #         "waitUntil": "domcontentloaded",
    #     },
    # }
    headers: {
        # 'Host' => 'naivas.online',
        'User-Agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36',
        'Accept-Encoding' => 'gzip, deflate, br, zstd',
        'Accept-Language' => 'en-US,en;q=0.9',
        'Cache-Control' => 'max-age=0',
        'Accept' => 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7',
        # 'X-Requested-With' => 'XMLHttpRequest',
        'Upgrade-Insecure-Requests' => 1,
        'Cookie' => '_scid=035d93a4-30ae-4313-9325-c1406c71fe11; _hjSessionUser_3103372=eyJpZCI6IjA2MDVkYmI4LWMzODgtNWZhYy04OTkzLWI5ZmFhMThmYWNiMSIsImNyZWF0ZWQiOjE3MDAxNDA3OTQ2NDMsImV4aXN0aW5nIjp0cnVlfQ==; axeptio_authorized_vendors_en=%2Csnapchat%2Cfacebook_conversion_tracking%2Cfacebook_pixel%2Ctwitter%2Cgmaps%2Cgoogle_ads%2Cgoogle_analytics%2Cgoogle_conversion_tracking%2Cide%2Cgoogletagmanager%2Chotjar%2CSnapchat%2CFacebook%20Conversion%20Tracking%2CTwitter%2CGoogle_Ads%2CGoogle_Conversion_Tracking%2CIDE%2C; axeptio_all_vendors_en=%2Csnapchat%2Cfacebook_conversion_tracking%2Cfacebook_pixel%2Ctwitter%2Cgmaps%2Cgoogle_ads%2Cgoogle_analytics%2Cgoogle_conversion_tracking%2Cide%2Cgoogletagmanager%2Chotjar%2CSnapchat%2CFacebook%20Conversion%20Tracking%2CTwitter%2CGoogle_Ads%2CGoogle_Conversion_Tracking%2CIDE%2C; axeptio_cookies_en={%22$$token%22:%22inuialr0n9j0e6vc14vrr%22%2C%22$$date%22:%222023-11-16T13:20:47.224Z%22%2C%22$$cookiesVersion%22:{%22name%22:%22naivas-en%22%2C%22identifier%22:%22645cb096c665b447c8563f27%22}%2C%22snapchat%22:true%2C%22facebook_conversion_tracking%22:true%2C%22facebook_pixel%22:true%2C%22twitter%22:true%2C%22gmaps%22:true%2C%22google_ads%22:true%2C%22google_analytics%22:true%2C%22google_conversion_tracking%22:true%2C%22ide%22:true%2C%22googletagmanager%22:true%2C%22hotjar%22:true%2C%22Snapchat%22:true%2C%22Facebook%20Conversion%20Tracking%22:true%2C%22Twitter%22:true%2C%22Google_Ads%22:true%2C%22Google_Conversion_Tracking%22:true%2C%22IDE%22:true%2C%22$$completed%22:true}; cf_clearance=eE.DqlmRnZbJkFjHUsMjiXM3FRKwn14C.7HV8KHd4Vk-1700144924-0-1-d2f1cefb.31b31551.10841c5b-160.2.1700144924; _fbp=fb.1.1710971524353.474847973; _gcl_au=1.1.372756323.1710971524.895656131.1710973850.1710973849; PrestaShop-8f2dfb2334c0f1c63b04a6da73967677=def502000deffd60cea8d3cac180e72416d348defe0eda601113221015a8842bb6a4588ab21caad20716e65f867cfe35886e45e24983fa727ec087d476c4af8ecf23dcffed67a68e2d3c3b4101859518db078f541179433933a19695804ef185933ecf507f09cacd5af6b88bed9a4d079db17ef15c5cd002401cef97a61200dd94a905a5ac976fbfbd9e1ef158a4aec7c4e6c566c856b2ee9dc66805481cdf8cf518b8c376e01a0edd90602ec49b0c18e08408f170f998d258c73d344fb84ffe2341f346912e363f725bf64f581006705cf8f87436b22cab6286292f826ae1ce7907e555dd7b1dbb545bf6b935e3c4; PrestaShop-9059057ef5230aa86f96531d028b2606=def50200be923b1167e4c0731e18588464d6c60638c97114e9aa70795175849aca69436b5544eadeaf6c419ec1248d2eb087b96b726f79e64a96c5e34004464a72401f32a3b36ace6928f52c6fa0045ca512e4c74c46398b3aa0daf97daec78d25448e44262180f5605d349515454edf187ddb0939d4510a4c975a75e7a32ad7472d2b4bc82994b24a95ca15b20057b084f758f77f645adc9f3d0db4f288bdc3fbabbad26d23252638a062441fdecd043c0433c61636d3ab81c0645b612aa1705e998a299eb82a4434a07ac3a0f7418d5d816c97df23e03dc0; PrestaShop-ae8a7ff43967029cf4927daaba6e1d78=def50200adef3ba415b7e4918e4d6ebb2b5d47b594a406dbfb055ddfda7e0286f3c40831d9234d54f5c7d948f1ace530c51a7cae3022e6ac3732f2fda45eb4ef417d3da06d6f270c6d735173c03b96b577ad01d090f43685337a08e6102eb69a0388ae397e28c77d796400d6e96699d4dd2b07225ff576b4d983a5d69ad8f21c14136c63ed97312cd7abd53f783d7f74df50c7029540a61e16b4e28d932bd667b52ffb7bc938f9464fcb51b9a7e010e2b143f35b51b97ee5c3f5bcee66dcf193a48ab63e8f89291ea18de9c11413aa974b7ea0becfa7a8385deeb54f4270307202396b3c7eba239b827a9c3e96cb9a2713971dc8dfc25c15e3c114; PHPSESSID=2ga9bm6lvk48n8qrnv1hibde7m; PrestaShop-84edda16aabd1471ffc8d3460ae3d10f=def50200c6297831d878c22a717ef7e6439acaf6926e498232ee0487f357cc8a819e0e2aa7a43d1ab3f7e6a0c06f9f402a7a6b7a1159732db23ec675471234107d4b77a2dbe626b47e9585507b5aafde8b9372bcb359002884beb57170043a778f3aaca3689a249124367cc87344882ffa5a9ed516d5c09af8548bda18b0f64c5247b3c55f25143cfee3eb4ddbe7e34df455b4b0aea7ed19ab04af734d6cf9bce5ee12e404650df137a4c54fc1c19bae0e2a5166e326863383ab2f2f908f9a69731e091a8420af81683bed6ed932a198e5083be66239bc2c3f4b4d7e522d317a8be4217762252f8a34be; _scid_r=035d93a4-30ae-4313-9325-c1406c71fe11; _ga_0WNVT32WKE=GS1.1.1714565782.4.1.1714565783.59.0.0; _ga=GA1.2.486560462.1700140789; _gid=GA1.2.1446827667.1714565784; _gat_gtag_UA_214299592_1=1; _sctr=1%7C1714496400000'
    },   
}