body = Nokogiri::HTML(content)
vars = page['vars']
require 'byebug'; byebug

headers = {
  'Accept' => 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7',
  'Accept-Encoding' => 'gzip, deflate, br, zstd',
  'Accept-Language' => 'en-US,en;q=0.9',
  'Connection' => 'keep-alive',
  'Cookie' => '_ga_MRWW8LRT1C=GS1.1.1718515153.1.0.1718515153.0.0.0; _ga=GA1.1.822121844.1718515153; axeptio_cookies={%22$$token%22:%22t1v1w821zpyn4r5rvtwdd%22%2C%22$$date%22:%222024-06-16T05:19:22.179Z%22%2C%22$$cookiesVersion%22:{}%2C%22$$completed%22:false}; axeptio_authorized_vendors=%2C%2C; axeptio_all_vendors=%2C%2C; XSRF-TOKEN=eyJpdiI6IlJESllNNWErNlN0RTMwQ29qTTBMSHc9PSIsInZhbHVlIjoiYVVCWVZhZGp3UXk4NTBJcjVheXh5QXRnV2tEa3VDeEZ0OVBzRzBqcFhsbHpscmN1amxEMzdLVXR1TWphVWlaRGVsMnNWTXV0bmpkV0p3MGxrN2N3QkZHZWxrZlY4UmQzMDBZRkZycCtXRW16NVhnWWlFVkFtZURRSk5YK3h4bzgiLCJtYWMiOiJjYTAyNDViOTBkODUzMGUxYjE3MzA0M2JlYjkwNGU5ZmRjM2UzMmQ0ZmIwOTM3MWM5NzQwOTg5OGNjN2UxZGQyIiwidGFnIjoiIn0%3D; naivas_session=eyJpdiI6ImFnVTFYb3FtUkJlUTlXOVZ3RGtGRHc9PSIsInZhbHVlIjoibjVVNXAyNG9ISGtRbHBwd05ob3o4ZHFJVkx6T2pDMm4ySlI0S3NBcFhDa0hieWZMZFphS0ZTZzhPU3pwTWlsUVBwUkljVU5WV2x1MENkdlUvNmEwYWwzZ0pVS1Zub01yVHdJZmRHeFk3RWhEK3FlR09ZTmxYZ3dyS0E2Q1d4TEMiLCJtYWMiOiIzZmY1MjMxMjQ3YjM3YjU4YWVlZTRkYTNiOTk0ZTJkZTIwYjY3NmEyMTM4ZTBjNjM0MjlmNThkNDZmMzdhN2E0IiwidGFnIjoiIn0%3D',
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
}

count = 0
body.css('.grid .text-black-50').each_with_index do |prod, idx|
    prod_url = prod.css('a').attr('href').text
    pages << {
        url: prod_url,
        method: "GET",
        page_type: 'details',
        # fetch_type: 'browser',
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
            # fetch_type: 'browser',
            page_type: 'listings',
            priority: 500,
            headers: headers,
            vars: vars.merge({
                "page" => pn,
            })
        }
    end

end