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
        headers: page['headers'],
        fetch_type: 'browser',
        vars: {
            rank: idx+1
        }.merge(vars)
    }
    count += 1
    save_outputs(outputs) if outputs.count > 99

    # ### #
    # p count #
    # sim_vars['prod_url'] = prod_url #
    # printer(sim_vars) #
    # ### #

end

# Pagination
PRODUCT_PER_PAGE = 15

if vars['page'] == 1 && count == PRODUCT_PER_PAGE
# if 1 == 1 && count == PRODUCT_PER_PAGE #
    total_product = body.at('.flex.mb-5').text[/\d+/].to_i

    # puts total_product #
    # puts PRODUCT_PER_PAGE #
    # puts (total_product.fdiv(PRODUCT_PER_PAGE)).ceil() #
    # p (2..(total_product.fdiv(PRODUCT_PER_PAGE)).ceil()) #

    (2..(total_product.fdiv(PRODUCT_PER_PAGE)).ceil()).each do |pn|
        # puts pn #
        # puts "https://naivas.online/spices?page=1".gsub(/\?page=\d+/, "?page=#{pn}") #

        pages << {
            url: page['url'].gsub(/\?page=\d+/, "?page=#{pn}"),
            method: 'GET',
            # fetch_type: 'browser',
            page_type: 'listings',
            priority: 500,
            headers: page['headers'],
            vars: vars.merge({
                "page" => pn,
            })
        }
    end

end