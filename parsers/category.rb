html = Nokogiri::HTML(content)

# 1st Level
# puts "### 1ST LEVEL"
main_categories = html.css('a.px-4.py-3.text-sm')
main_categories.each do |main_cat|
  # require 'byebug'; byebug
  cat_name = main_cat.text.strip
  cat_url = main_cat['href']
  cat_url = "https://naivas.online" + cat_url + "?page=1"

  ####
  # p
  # puts '#######'
  # p i
  # i+=1

  # sim_vars['cat_name'] = cat_name
  # sim_vars['cat_url'] = cat_url
  # printer(sim_vars)
  ####

  pages << {
      url: cat_url,
      method: 'GET',
      # fetch_type: 'browser',
      priority: 500,
      page_type: 'listings',
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
      vars: {
          category_name: cat_name,
          page: 1
      }
  }   
end

# 2nd Level
# puts "### 2ND LEVEL"
subcategories = html.css('div#mega-menu-full-dropdown-categories ul.masonry > li > a')
subcategories.each do |subcat|
  # require 'byebug'; byebug
  cat_name = subcat.text.strip
  cat_url = subcat['href']
  cat_url = "https://naivas.online" + cat_url + "?page=1"

  # ####
  # p
  # puts '#######'
  # p i
  # i+=1

  # sim_vars['cat_name'] = cat_name
  # sim_vars['cat_url'] = cat_url
  # printer(sim_vars)
  # ####

  pages << {
      url: cat_url,
      method: 'GET',
      # fetch_type: 'browser',
      priority: 500,
      page_type: 'listings',
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
      vars: {
          category_name: cat_name,
          page: 1
      }
  }   
end

# 3rd Level
# puts "### 3RD LEVEL"
categories = html.css('div#mega-menu-full-dropdown-categories a.text-gray-500')
categories.each do |cat|
    # require 'byebug'; byebug
    cat_name = cat.text.strip
    cat_url = cat['href']
    cat_url = "https://naivas.online" + cat_url + "?page=1"

    # ####
    # p
    # puts '#######'
    # p i
    # i+=1

    # sim_vars['cat_name'] = cat_name
    # sim_vars['cat_url'] = cat_url
    # printer(sim_vars)
    # ####

    pages << {
        url: cat_url,
        method: 'GET',
        # fetch_type: 'browser',
        priority: 500,
        page_type: 'listings',
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
        vars: {
            category_name: cat_name,
            page: 1
        }
    }   
end