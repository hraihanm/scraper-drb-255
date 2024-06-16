html = Nokogiri::HTML(content)

headers = {
  'Accept' => 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7',
  'Accept-Encoding' => 'gzip, deflate, br, zstd',
  'Accept-Language' => 'en-US,en;q=0.9',
  # 'Connection' => 'keep-alive',
  'Cookie' => '_ga_MRWW8LRT1C=GS1.1.1718515153.1.0.1718515153.0.0.0; _ga=GA1.1.822121844.1718515153; axeptio_cookies={%22$$token%22:%22t1v1w821zpyn4r5rvtwdd%22%2C%22$$date%22:%222024-06-16T05:19:22.179Z%22%2C%22$$cookiesVersion%22:{}%2C%22$$completed%22:false}; axeptio_authorized_vendors=%2C%2C; axeptio_all_vendors=%2C%2C; XSRF-TOKEN=eyJpdiI6IlJESllNNWErNlN0RTMwQ29qTTBMSHc9PSIsInZhbHVlIjoiYVVCWVZhZGp3UXk4NTBJcjVheXh5QXRnV2tEa3VDeEZ0OVBzRzBqcFhsbHpscmN1amxEMzdLVXR1TWphVWlaRGVsMnNWTXV0bmpkV0p3MGxrN2N3QkZHZWxrZlY4UmQzMDBZRkZycCtXRW16NVhnWWlFVkFtZURRSk5YK3h4bzgiLCJtYWMiOiJjYTAyNDViOTBkODUzMGUxYjE3MzA0M2JlYjkwNGU5ZmRjM2UzMmQ0ZmIwOTM3MWM5NzQwOTg5OGNjN2UxZGQyIiwidGFnIjoiIn0%3D; naivas_session=eyJpdiI6ImFnVTFYb3FtUkJlUTlXOVZ3RGtGRHc9PSIsInZhbHVlIjoibjVVNXAyNG9ISGtRbHBwd05ob3o4ZHFJVkx6T2pDMm4ySlI0S3NBcFhDa0hieWZMZFphS0ZTZzhPU3pwTWlsUVBwUkljVU5WV2x1MENkdlUvNmEwYWwzZ0pVS1Zub01yVHdJZmRHeFk3RWhEK3FlR09ZTmxYZ3dyS0E2Q1d4TEMiLCJtYWMiOiIzZmY1MjMxMjQ3YjM3YjU4YWVlZTRkYTNiOTk0ZTJkZTIwYjY3NmEyMTM4ZTBjNjM0MjlmNThkNDZmMzdhN2E0IiwidGFnIjoiIn0%3D',
  # 'Host' => 'naivas.online',
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
}

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
      headers: headers,
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
      headers: headers,
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
        headers: headers,
        vars: {
            category_name: cat_name,
            page: 1
        }
    }   
end