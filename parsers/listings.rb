body = Nokogiri::HTML(content)
vars = page['vars']
# require 'byebug'; byebug
count = 0
body.css('.product-list .products .product-miniature').each_with_index do |prod, idx|
    prod_url = prod.css('a').attr('href').text
    pages << {
        url: prod_url,
        method: "GET",
        page_type: 'details',
        headers: page['headers'],
        fetch_type: 'browser',
        vars: {
            rank: idx+1
        }.merge(vars)
    }
    count += 1
    save_outputs(outputs) if outputs.count > 99
end

# pagination
PRODUCT_PER_PAGE = 12

if vars['page'] == 1 && count == PRODUCT_PER_PAGE
    total_product = body.at('.total-products').text[/\d+/].to_i

    (2..(total_product/PRODUCT_PER_PAGE)).each do |pn|
        puts pn
        pages << {
            url: page['url'].gsub(/\?page=\d+/, "?page=#{pn}"),
            method: 'POST',
            fetch_type: 'browser',
            page_type: 'listings',
            priority: 500,
            headers: page['headers'],
            vars: vars.merge({
                "page" => pn,
            })
        }

    end
    
end