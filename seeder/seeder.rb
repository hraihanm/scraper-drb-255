pages << {
    url: "https://naivas.online/?automatic_redirect=1",
    page_type: "category",
    http2: true,
    # fetch_type: "browser",
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
        'Accept' => 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7',
        'Accept-Encoding' => 'gzip, deflate, br, zstd',
        'Accept-Language' => 'en-US,en;q=0.9',
        # 'Connection' => 'keep-alive',
        # 'Host' => 'naivas.online',
        'Referer' => 'https://www.google.com/',
        'Sec-Fetch-Dest' => 'document',
        'Sec-Fetch-Mode' => 'navigate',
        'Sec-Fetch-Site' => 'cross-site',
        'Upgrade-Insecure-Requests' => '1',
        'User-Agent' => 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36 OPR/110.0.0.0',
        'sec-ch-ua' => '"Chromium";v="124", "Opera";v="110", "Not-A.Brand";v="99"',
        'sec-ch-ua-mobile' => '?0',
        'sec-ch-ua-platform' => '"Windows"'
      }
}