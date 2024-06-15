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
            'Cache-Control' => 'max-age=0',
            'Connection' => 'keep-alive',
            'Cookie' => 'axeptio_authorized_vendors=%2C%2C; axeptio_all_vendors=%2Csnapchat%2Cfacebook_conversion_tracking%2Cfacebook_pixel%2Ctwitter%2Cgmaps%2Cgoogle_ads%2Cgoogle_analytics%2Cgoogle_conversion_tracking%2Cide%2Cgoogletagmanager%2Chotjar%2CSnapchat%2CFacebook%20Conversion%20Tracking%2CTwitter%2CGoogle_Ads%2CGoogle_Conversion_Tracking%2CIDE%2C; axeptio_cookies={%22$$token%22:%22tvwo7fxhv5ca5upghzl6o6%22%2C%22$$date%22:%222024-06-12T14:12:22.463Z%22%2C%22$$cookiesVersion%22:{%22name%22:%22naivas-en%22%2C%22identifier%22:%22645cb096c665b447c8563f27%22}%2C%22snapchat%22:false%2C%22facebook_conversion_tracking%22:false%2C%22facebook_pixel%22:false%2C%22twitter%22:false%2C%22gmaps%22:false%2C%22google_ads%22:false%2C%22google_analytics%22:false%2C%22google_conversion_tracking%22:false%2C%22ide%22:false%2C%22googletagmanager%22:false%2C%22hotjar%22:false%2C%22Snapchat%22:false%2C%22Facebook%20Conversion%20Tracking%22:false%2C%22Twitter%22:false%2C%22Google_Ads%22:false%2C%22Google_Conversion_Tracking%22:false%2C%22IDE%22:false%2C%22$$completed%22:true}; XSRF-TOKEN=eyJpdiI6ImZ0aTVJdHR6THQ5emZzVGlwQkZUclE9PSIsInZhbHVlIjoiSFNBNCtuMzhIUGVJR0JDMGZEQTdCR2JYUDBZSVNVSWFhOVFvYkNubVUrWUdjaHhyUk9JSUpFVlRUbjAyanNOMnFXUGlkU2pQYlAxMy82U3lOdVgyRjhvM3pNK0N5bFB6ZDJuM2tkc0tCTEcrcGZiMmRjT0ZXMnBuekVtVUdVd3MiLCJtYWMiOiIyNTNiMDgyYjU3YTJiZTAwYWZhMDY0M2IxNTExYzRhYjBjNzU0Njc1Nzk2OWNmNmNjODk0MjVmZTk1YWQ3YzczIiwidGFnIjoiIn0%3D; naivas_session=eyJpdiI6ImdvNXQ3d3R4NHluZms0L1ZTTlFYVkE9PSIsInZhbHVlIjoiVyt3Nm02RExRVTU3KytJd2pCazBhODBFSXg0MUpLQm9jNFB4MmcrNjNnRjBxdmZKc0ZqQVcrWEpnN09LeTh3TVdRSGxiUEN1ZmVCMnp0K2NGT1NaU1QwTjN4a3JrbmxRV3NTVGVBTmhCUVhicHZ1V21tOVBPWTFlYWs4bFU3ZTciLCJtYWMiOiI0NTM2YTg1YjMyMWIyYjBhYTk3NThkMDE4OGNlMzU0N2Y1OGMwNzg1NWUzYzk2NDYyMjFlMDhkOTUzY2Y0YTI4IiwidGFnIjoiIn0%3D',
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
                'Cookie' => 'axeptio_authorized_vendors=%2C%2C; axeptio_all_vendors=%2Csnapchat%2Cfacebook_conversion_tracking%2Cfacebook_pixel%2Ctwitter%2Cgmaps%2Cgoogle_ads%2Cgoogle_analytics%2Cgoogle_conversion_tracking%2Cide%2Cgoogletagmanager%2Chotjar%2CSnapchat%2CFacebook%20Conversion%20Tracking%2CTwitter%2CGoogle_Ads%2CGoogle_Conversion_Tracking%2CIDE%2C; axeptio_cookies={%22$$token%22:%22tvwo7fxhv5ca5upghzl6o6%22%2C%22$$date%22:%222024-06-12T14:12:22.463Z%22%2C%22$$cookiesVersion%22:{%22name%22:%22naivas-en%22%2C%22identifier%22:%22645cb096c665b447c8563f27%22}%2C%22snapchat%22:false%2C%22facebook_conversion_tracking%22:false%2C%22facebook_pixel%22:false%2C%22twitter%22:false%2C%22gmaps%22:false%2C%22google_ads%22:false%2C%22google_analytics%22:false%2C%22google_conversion_tracking%22:false%2C%22ide%22:false%2C%22googletagmanager%22:false%2C%22hotjar%22:false%2C%22Snapchat%22:false%2C%22Facebook%20Conversion%20Tracking%22:false%2C%22Twitter%22:false%2C%22Google_Ads%22:false%2C%22Google_Conversion_Tracking%22:false%2C%22IDE%22:false%2C%22$$completed%22:true}; XSRF-TOKEN=eyJpdiI6InJEK2F6blY5bnk1TkV6N2RUNVhsMFE9PSIsInZhbHVlIjoiNVAxTWJ0Sm9QK01HaGZZK0pTbmpYczNFVmROejdER3VKalZ2cG1Tb25OUEF4aHFKVUdsT3hLMFFMR05YZklwM1B3bmM4NURYa25uV0puWExudmZWSGtCRzF1aVhBYkhXalRJYXVTOGdTOUhZS0lIVG5pYk4zbEdRRVdtU0Y1L24iLCJtYWMiOiIxNGQxNTRiMjU1YzgwNzZhMzMzZDRhYTUzNGMyZDhjNmRiODJhN2I2NjQ4M2ZmMjljMjk3YjMxYjJlOTc2M2RmIiwidGFnIjoiIn0%3D; naivas_session=eyJpdiI6IktHZUVaZ3lYZHIxUTAyZk9LNUNvMkE9PSIsInZhbHVlIjoiUE5oSDAyc0Vpd0trSk94eWlTc2pCMkdWVDVIMy9oOGUyak92cUNITU5YVVRDRXdWbThhYi9zbXFJb3BlWFg2S0pXQ05Da0tQSURFNnBtZ1o5TWpxS1dKakRWOWlYbEs4Qk1WZ0N3STRVQjRYck53ang3RkhQVE53cHljL1pEQXgiLCJtYWMiOiJlNDg2NmIzMzYzYzI0ZTQxNWRiN2Y1YTczZDc4MTY4MzhkYjI5YTczNThmNzIyOWNkOWY2NzQxZTRhYjM0NjIzIiwidGFnIjoiIn0%3D',
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