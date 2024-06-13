html = Nokogiri::HTML(content)

main_categories = html.css('.border-b-2.border-b-white')
main_categories.each do |main_cat|
    # require 'byebug'; byebug
    main_cat_name = main_cat.at_css('.ml-2.text-naivas-green').text.strip

    # Skip "Promos" category
    if main_cat_name == "Promos"
      next
    end

    categories = main_cat.css('ul li a')
    categories.each do |cat|
      cat_name = cat.css('.ml-4').text.strip
      cat_url = cat['href']
      cat_url = "https://naivas.online" + cat_url + "?page=1"

      # sim_vars['main_cat_name'] = main_cat_name
      # sim_vars['cat_name'] = cat_name
      # sim_vars['cat_url'] = cat_url
      # printer(sim_vars)

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
              main_category_name: main_cat_name,
              category_name: cat_name,
              page: 1
          }
      }   
      end
    ###
    # p
    # p '###'
    # p i
    # p '###'
    # i+=1
    
    ###
end