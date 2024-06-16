body = Nokogiri::HTML(content)
vars = page['vars']
require 'byebug'; byebug
count = 0
body.css('.grid .text-black-50').each_with_index do |prod, idx|
    prod_url = prod.css('a').attr('href').text
    pages << {
        url: prod_url,
        method: "GET",
        page_type: 'details',
        # fetch_type: 'browser',
        headers: {
            'Accept' => 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7',
            'Accept-Encoding' => 'gzip, deflate, br, zstd',
            'Accept-Language' => 'en-US,en;q=0.9',
            'Connection' => 'keep-alive',
            'Cookie' => 'axeptio_authorized_vendors=%2C%2C; axeptio_all_vendors=%2Csnapchat%2Cfacebook_conversion_tracking%2Cfacebook_pixel%2Ctwitter%2Cgmaps%2Cgoogle_ads%2Cgoogle_analytics%2Cgoogle_conversion_tracking%2Cide%2Cgoogletagmanager%2Chotjar%2CSnapchat%2CFacebook%20Conversion%20Tracking%2CTwitter%2CGoogle_Ads%2CGoogle_Conversion_Tracking%2CIDE%2C; axeptio_cookies={%22$$token%22:%22tvwo7fxhv5ca5upghzl6o6%22%2C%22$$date%22:%222024-06-12T14:12:22.463Z%22%2C%22$$cookiesVersion%22:{%22name%22:%22naivas-en%22%2C%22identifier%22:%22645cb096c665b447c8563f27%22}%2C%22snapchat%22:false%2C%22facebook_conversion_tracking%22:false%2C%22facebook_pixel%22:false%2C%22twitter%22:false%2C%22gmaps%22:false%2C%22google_ads%22:false%2C%22google_analytics%22:false%2C%22google_conversion_tracking%22:false%2C%22ide%22:false%2C%22googletagmanager%22:false%2C%22hotjar%22:false%2C%22Snapchat%22:false%2C%22Facebook%20Conversion%20Tracking%22:false%2C%22Twitter%22:false%2C%22Google_Ads%22:false%2C%22Google_Conversion_Tracking%22:false%2C%22IDE%22:false%2C%22$$completed%22:true}; XSRF-TOKEN=eyJpdiI6IlY0dGxCdENva3JGNVB5RGw2cjJyTUE9PSIsInZhbHVlIjoiZnpoVXpxd3NRWk9kYWVqZUhzLzU2NUtXU3R5WExicFNQVG5ycWdUT25NUkNHcFpyUnowTmJuR3FTelRjeUVDM1ZRWS95VHNxUnZXbjRmZTllUDMwcXdxWE5UaXhVSmJDaGF5TjB0TllzYXRhL2NRUndJWmY0Q2dydGVyR29HSDkiLCJtYWMiOiI3OTliYzAwMDhlNWZhNmUzNzFlZTYxMDQ2OGZhNDJmOTg4ZDY0OGZhNGZjNjE1OTJkZmNjNDZiMDY1NTkwMzRlIiwidGFnIjoiIn0%3D; naivas_session=eyJpdiI6IlljOFBlRU9rdmVTWFNuZUd6cUZrMEE9PSIsInZhbHVlIjoiU1FkV20zOFpycVpMOURSODRpTGVUUVNOQlJoV1UyOWhHN0hTdlJxejU3UW1TZGJ0K3ZoVHRubzgrUHNoUmtob0xaaWhCRGNZRnVwcXlCZWZ4Y2JGai9PVWpPNWRtTVRGYWU1MVNXL0VKUWpzaFZvcjVQeGNXUndkQjFWSHNnLzEiLCJtYWMiOiJhYzhlN2IwYmM1YmVjMjc3NWI5YTkxMDYxOGVlMmU0MmJjYzM1NWRjMjNjNDJlYzVmYWNkZDFmN2VhYjdmMDkzIiwidGFnIjoiIn0%3D',
            'Host' => 'naivas.online',
            'Referer' => page['url'],
            'Sec-Fetch-Dest' => 'document',
            'Sec-Fetch-Mode' => 'navigate',
            'Sec-Fetch-Site' => 'same-origin',
            'Sec-Fetch-User' => '?1',
            'Upgrade-Insecure-Requests' => '1',
            'User-Agent' => 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36 OPR/110.0.0.0',
            'sec-ch-ua' => '"Chromium";v="124", "Opera";v="110", "Not-A.Brand";v="99"',
            'sec-ch-ua-mobile' => '?0',
        'sec-ch-ua-platform' => '"Windows"'
        },
        vars: {
            rank: idx+1
        }.merge(vars)
    }
    count += 1

    # LIMIT products for testing purpose #
    if count == 3 then
        break
    end 
    #

    save_outputs(outputs) if outputs.count > 99

    # ### #
    # p count #
    # sim_vars['prod_url'] = prod_url #
    # printer(sim_vars) #
    # ### #

end

# Pagination
PRODUCT_PER_PAGE = 15
total_product = body.at('.flex.mb-5').text[/\d+/].to_i

if vars['page'] == 1 && total_product > PRODUCT_PER_PAGE
# if 1 == 1 && count == PRODUCT_PER_PAGE #

    # puts total_product #
    # puts PRODUCT_PER_PAGE #
    # puts (total_product.fdiv(PRODUCT_PER_PAGE)).ceil() #
    # p (2..(total_product.fdiv(PRODUCT_PER_PAGE)).ceil()) #

    (2..(total_product.fdiv(PRODUCT_PER_PAGE)).ceil()).each do |pn|
        # puts pn #
        # puts "https://naivas.online/spices?page=1".gsub(/\?page=\d+/, "?page=#{pn}") #
        next_url = page['url'].gsub(/\?page=\d+/, "?page=#{pn}")

        pages << {
            url: next_url,
            method: 'GET',
            # fetch_type: 'browser',
            page_type: 'listings',
            priority: 500,
            headers: {
                'Accept' => 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7',
                'Accept-Encoding' => 'gzip, deflate, br, zstd',
                'Accept-Language' => 'en-US,en;q=0.9',
                'Connection' => 'keep-alive',
                'Cookie' => 'axeptio_authorized_vendors=%2C%2C; axeptio_all_vendors=%2Csnapchat%2Cfacebook_conversion_tracking%2Cfacebook_pixel%2Ctwitter%2Cgmaps%2Cgoogle_ads%2Cgoogle_analytics%2Cgoogle_conversion_tracking%2Cide%2Cgoogletagmanager%2Chotjar%2CSnapchat%2CFacebook%20Conversion%20Tracking%2CTwitter%2CGoogle_Ads%2CGoogle_Conversion_Tracking%2CIDE%2C; axeptio_cookies={%22$$token%22:%22tvwo7fxhv5ca5upghzl6o6%22%2C%22$$date%22:%222024-06-12T14:12:22.463Z%22%2C%22$$cookiesVersion%22:{%22name%22:%22naivas-en%22%2C%22identifier%22:%22645cb096c665b447c8563f27%22}%2C%22snapchat%22:false%2C%22facebook_conversion_tracking%22:false%2C%22facebook_pixel%22:false%2C%22twitter%22:false%2C%22gmaps%22:false%2C%22google_ads%22:false%2C%22google_analytics%22:false%2C%22google_conversion_tracking%22:false%2C%22ide%22:false%2C%22googletagmanager%22:false%2C%22hotjar%22:false%2C%22Snapchat%22:false%2C%22Facebook%20Conversion%20Tracking%22:false%2C%22Twitter%22:false%2C%22Google_Ads%22:false%2C%22Google_Conversion_Tracking%22:false%2C%22IDE%22:false%2C%22$$completed%22:true}; XSRF-TOKEN=eyJpdiI6IlY0dGxCdENva3JGNVB5RGw2cjJyTUE9PSIsInZhbHVlIjoiZnpoVXpxd3NRWk9kYWVqZUhzLzU2NUtXU3R5WExicFNQVG5ycWdUT25NUkNHcFpyUnowTmJuR3FTelRjeUVDM1ZRWS95VHNxUnZXbjRmZTllUDMwcXdxWE5UaXhVSmJDaGF5TjB0TllzYXRhL2NRUndJWmY0Q2dydGVyR29HSDkiLCJtYWMiOiI3OTliYzAwMDhlNWZhNmUzNzFlZTYxMDQ2OGZhNDJmOTg4ZDY0OGZhNGZjNjE1OTJkZmNjNDZiMDY1NTkwMzRlIiwidGFnIjoiIn0%3D; naivas_session=eyJpdiI6IlljOFBlRU9rdmVTWFNuZUd6cUZrMEE9PSIsInZhbHVlIjoiU1FkV20zOFpycVpMOURSODRpTGVUUVNOQlJoV1UyOWhHN0hTdlJxejU3UW1TZGJ0K3ZoVHRubzgrUHNoUmtob0xaaWhCRGNZRnVwcXlCZWZ4Y2JGai9PVWpPNWRtTVRGYWU1MVNXL0VKUWpzaFZvcjVQeGNXUndkQjFWSHNnLzEiLCJtYWMiOiJhYzhlN2IwYmM1YmVjMjc3NWI5YTkxMDYxOGVlMmU0MmJjYzM1NWRjMjNjNDJlYzVmYWNkZDFmN2VhYjdmMDkzIiwidGFnIjoiIn0%3D',
                'Host' => 'naivas.online',
                'Referer' => page['url'],
                'Sec-Fetch-Dest' => 'document',
                'Sec-Fetch-Mode' => 'navigate',
                'Sec-Fetch-Site' => 'same-origin',
                'Sec-Fetch-User' => '?1',
                'Upgrade-Insecure-Requests' => '1',
                'User-Agent' => 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36 OPR/110.0.0.0',
                'sec-ch-ua' => '"Chromium";v="124", "Opera";v="110", "Not-A.Brand";v="99"',
                'sec-ch-ua-mobile' => '?0',
            'sec-ch-ua-platform' => '"Windows"'
            },
            vars: vars.merge({
                "page" => pn,
            })
        }
    end

end