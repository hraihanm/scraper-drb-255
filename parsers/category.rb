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
          'User-Agent' => 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36 OPR/110.0.0.0',
          # 'Accept-Encoding' => 'gzip, deflate, br',
          # 'Accept-Language' => 'en-US,en;q=0.9',
          # 'Cache-Control' => 'max-age=0',
          # 'Accept' => 'application/json, text/javascript, */*; q=0.01',
          # 'Origin' => 'https://naivas.online/',
          # 'Referer' => 'https://naivas.online/',
          # 'X-Requested-With' => 'XMLHttpRequest',
          # 'Upgrade-Insecure-Requests' => 1
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
      method: 'POST',
      fetch_type: 'browser',
      priority: 500,
      page_type: 'listings',
      headers: {
          'User-Agent' => 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36',
          'Accept-Encoding' => 'gzip, deflate, br',
          'Accept-Language' => 'en-US,en;q=0.9',
          'Cache-Control' => 'max-age=0',
          'Accept' => 'application/json, text/javascript, */*; q=0.01',
          'Origin' => 'https://naivas.online/',
          'Referer' => 'https://naivas.online/addresses',
          'X-Requested-With' => 'XMLHttpRequest',
          'Upgrade-Insecure-Requests' => 1
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
        method: 'POST',
        fetch_type: 'browser',
        priority: 500,
        page_type: 'listings',
        headers: {
            'User-Agent' => 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36',
            'Accept-Encoding' => 'gzip, deflate, br',
            'Accept-Language' => 'en-US,en;q=0.9',
            'Cache-Control' => 'max-age=0',
            'Accept' => 'application/json, text/javascript, */*; q=0.01',
            'Origin' => 'https://naivas.online/',
            'Referer' => 'https://naivas.online/addresses',
            'X-Requested-With' => 'XMLHttpRequest',
            'Upgrade-Insecure-Requests' => 1
        },
        vars: {
            category_name: cat_name,
            page: 1
        }
    }   
end