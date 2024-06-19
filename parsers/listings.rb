body = Nokogiri::HTML(content)
vars = page['vars']
require 'byebug'; byebug

headers = {
    'Accept' => 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7',
    'Accept-Encoding' => 'gzip, deflate, br, zstd',
    'Accept-Language' => 'en-US,en;q=0.9',
    'Cookie' => 'axeptio_authorized_vendors=%2Csnapchat%2Cfacebook_conversion_tracking%2Cfacebook_pixel%2Ctwitter%2Cgmaps%2Cgoogle_ads%2Cgoogle_analytics%2Cgoogle_conversion_tracking%2Cide%2Cgoogletagmanager%2Chotjar%2CSnapchat%2CFacebook%20Conversion%20Tracking%2CTwitter%2CGoogle_Ads%2CGoogle_Conversion_Tracking%2CIDE%2C; axeptio_all_vendors=%2Csnapchat%2Cfacebook_conversion_tracking%2Cfacebook_pixel%2Ctwitter%2Cgmaps%2Cgoogle_ads%2Cgoogle_analytics%2Cgoogle_conversion_tracking%2Cide%2Cgoogletagmanager%2Chotjar%2CSnapchat%2CFacebook%20Conversion%20Tracking%2CTwitter%2CGoogle_Ads%2CGoogle_Conversion_Tracking%2CIDE%2C; axeptio_cookies={%22$$token%22:%22woalm5lltpms4hppajaetf%22%2C%22$$date%22:%222024-06-19T11:06:40.251Z%22%2C%22$$cookiesVersion%22:{%22name%22:%22naivas-en%22%2C%22identifier%22:%22645cb096c665b447c8563f27%22}%2C%22snapchat%22:true%2C%22facebook_conversion_tracking%22:true%2C%22facebook_pixel%22:true%2C%22twitter%22:true%2C%22gmaps%22:true%2C%22google_ads%22:true%2C%22google_analytics%22:true%2C%22google_conversion_tracking%22:true%2C%22ide%22:true%2C%22googletagmanager%22:true%2C%22hotjar%22:true%2C%22Snapchat%22:true%2C%22Facebook%20Conversion%20Tracking%22:true%2C%22Twitter%22:true%2C%22Google_Ads%22:true%2C%22Google_Conversion_Tracking%22:true%2C%22IDE%22:true%2C%22$$completed%22:true}; XSRF-TOKEN=eyJpdiI6Ik1CSWVtdFNnR1Bac1RwT1pTbk15WVE9PSIsInZhbHVlIjoiSkEzblF1SDZWc2d0TVpFdWxyeE5ZWXdnN2xRWWVybE8xR1A1MDkzNnJFSlozUC84bFE0STRaN1ViZTJrZjdSVXVFSG54OUdaRmVyU1BtRDNneGdCalB0NWE2TE9VbDhaWHU0UUhHS3FjZEhLRmtDV2FvUVkxa0hQN1ZJU1hoV2QiLCJtYWMiOiI1ZGQ3ODI4N2ZiNmViYTFmMjk2ODJjNTBlOWM1NDI4ZGJkOWU2NzJhMGEzMjQyNWY3NmRlZTM5NTBlOTM1ZDljIiwidGFnIjoiIn0%3D; naivas_session=eyJpdiI6ImZjUzhzcGVCOGw4bVpQdEpWRm9FSXc9PSIsInZhbHVlIjoiOUVIYVB2aGJ2V21haFQxR3VPTklESjhjSDFoSzdjbkdsL3RDM1BjRlFaWDk4emZ4Q2hqd3VGSE9EQ1hieVJLR3Izem11N2hJNHh6M1Q0N1VvL2dadlIxYmdlU0JwNEs4YkE4SjQ4SWdOUmlwSklZNmdIRjVkK3ZNZ2NtVE1kMzQiLCJtYWMiOiIwNDgxMjkyMjkyZmNmNmY4YWYxZjcyNzRmNDRhN2YzYzMwZWYzOGVhM2QwMzcxMzk0ZDEwNTYyZDA4MThjZDE1IiwidGFnIjoiIn0%3D',
    'Priority' => 'u=0, i',
    'Referer' => 'https://www.google.com/',
    'Sec-Ch-Ua' => '"Opera";v="111", "Chromium";v="125", "Not.A/Brand";v="24"',
    'Sec-Ch-Ua-Mobile' => '?0',
    'Sec-Ch-Ua-Platform' => '"Windows"',
    'Sec-Fetch-Dest' => 'document',
    'Sec-Fetch-Mode' => 'navigate',
    'Sec-Fetch-Site' => 'cross-site',
    'Upgrade-Insecure-Requests' => '1',
    'User-Agent' => 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 OPR/111.0.0.0'
}

count = 0
body.css('.grid .text-black-50').each_with_index do |prod, idx|
    prod_url = prod.css('a').attr('href').text
    pages << {
        url: prod_url,
        method: "GET",
        page_type: 'details',
        fetch_type: 'browser',
        headers: headers,
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
            fetch_type: 'browser',
            page_type: 'listings',
            priority: 500,
            headers: headers,
            vars: vars.merge({
                "page" => pn,
            })
        }
    end

end