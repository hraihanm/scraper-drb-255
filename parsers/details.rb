limbo page['gid'] if content.include? 'This product is no longer available.'

html = Nokogiri::HTML(content)
vars = page['vars']
product = html.css('div#mainProduct')

name = product.css('h1.page-heading').text
brand = product.css('.product-attributes .product-manufacturer a').text.strip rescue nil

is_private_label = nil
if brand.include?('NAIVAS')
    is_private_label = false
elsif brand.empty?
    is_private_label = nil
else
    is_private_label = true
end

id = product.css('.product-attributes .product-reference span').text.strip
ean = product.css('.product-attributes .product-specific-references.ean13 span').text.strip
img_url = html.css('.img-fluid').attr('src').text
description = nil

availability = html.css('span#product-availability').text
if availability == "In Stock"
    is_available = true
else
    is_available = false
end

price = html.css('span.current-price').text.gsub(',', '').gsub('KES ', '').to_f
reg_price = html.css('.product-prices span.regular-price').text
if reg_price.empty?
    reg_price = nil
else
    reg_price = reg_price.gsub(',', '').gsub('KES ', '').to_f
end
# require 'byebug'; byebug
if reg_price.nil?
    base_price_lc = price
    customer_price_lc = price
    has_discount = false
    is_promoted = false
    promo_attributes = ''
    type_of_promotion = nil
else
    base_price_lc = reg_price
    customer_price_lc = price

    if customer_price_lc > base_price_lc
        customer_price_lc = base_price_lc
    end
    has_discount = customer_price_lc != base_price_lc

    percentage = has_discount ? ((base_price_lc.to_f - customer_price_lc.to_f)/(base_price_lc.to_f) * 100).to_f.round(7) : nil
    is_promoted = has_discount ? true : false
    type_of_promotion = has_discount ? "Tags" : nil
    promo_attributes = has_discount ? {"promo_detail": "'#{percentage.to_i}%'"}.to_json : nil
end

size_std = nil
size_unit_std = nil
regexps = [
    /(\d*[\.,]?\d+)\s?([Ff][Ll]\.?\s?[Oo][Zz])/,
    /(\d*[\.,]?\d+)\s?([Oo][Zz]$)/,
    # /(\d*[\.,]?\d+)\s?([Ff][Oo])/,
    # /(\d*[\.,]?\d+)\s?([Ee][Aa])/,
    /(\d*[\.,]?\d+)\s?([Ff][Zz])/,
    /(\d*[\.,]?\d+)\s?(Fluid Ounces?)/,
    /(\d*[\.,]?\d+)\s?([Oo]unce)/,
    /(\d*[\.,]?\d+)\s?([Mm][Ll])/,
    /(\d*[\.,]?\d+)\s?([Cc][Ll])/,
    /(\d*[\.,]?\d+)\s?(gm)/i,
    /(\d*[\.,]?\d+)\s?([Ll])/,
    /(\d*[\.,]?\d+)\s?([Gg])$/,
    /(\d*[\.,]?\d+)\s?([Gg])\s+/,
    /(\d*[\.,]?\d+)\s?([Ll]itre)/,
    /(\d*[\.,]?\d+)\s?([Mm]illiliter)/i,
    /(\d*[\.,]?\d+)\s?(Inche?s?)/i,
    /(\d*[\.,]?\d+)\s?([Kk][Gg])/i,
    /(\d*[\.,]?\d+)\s?([Cc][Cc])/i,
    /(\d*[\.,]?\d+)\s?([Mm][Tt])/i,
    /(\d*[\.,]?\d+)\s?([Cc][Mm])/i,
    /(\d*[\.,]?\d+)\s?([Uu]nd)/i,
    /(\d*[\.,]?\d+)\s?([Mm]$)/i,
    /(\d*[\.,]?\d+)\s?([Mm][Aa]h)/i,
]
regexps.find {|regexp| name =~ regexp}
size_std = $1
size_unit_std = $2

product_pieces = nil
regexps = [
    /(\d*[\.,]?\d+)\s?(unités)/i,
    /(\d*[\.,]?\d+)\s?(pcs)/i,
    /(\d*[\.,]?\d+)\s?(unité)/i,
    /(\d*[\.,]?\d+)\s?(bags?)/i,
    /(\d*[\.,]?\d+)\s?(sheets?)/i,
    /(\d*[\.,]?\d+)\s?(pièces)/i,
    /(\d*[\.,]?\d+)\s?(pieces)/i,
    /(\d*[\.,]?\d+)\s?(Rolls?)/i,
    /(\d*[\.,]?\d+)\s?(Packs?)/i,
    /(\d*[\.,]?\d+)\s?(tranches)/i,
    /(\d*[\.,]?\d+)\s?(sachets?)/i,
    /(\d*[\.,]?\d+)\s?([Cc]apsules)/,
    /(\d*[\.,]?\d+)\s?([Tt]ablets)/,
    /(\d*[\.,]?\d+)\s?([Tt]ubes)/,
    /(\d*[\.,]?\d+)\s?([Ss]ervings)/,
    /(\d*[\.,]?\d+)\s?([Pp]acket\(?s?\)?)/,
    /(\d*[\.,]?\d+)\s?([Cc]hews)/,
    /(\d*[\.,]?\d+)\s?(\'S)/,
    /(\d*[\.,]?\d+)\s+(x)\s+/i,
]
regexps.find {|regexp| name =~ regexp}
product_pieces = $1

product_pieces = 1 if product_pieces.nil?

category = "#{html.css('.breadcrumb .breadcrumb-item .item-name')[1].text.strip}"

sub_category = "#{html.css('.breadcrumb .breadcrumb-item .item-name')[2..-2].map{|a| a.text.strip}.join(' > ')}"


category_id = nil
# raise "category_id not found" if category_id.nil? || category_id.empty?

# require 'byebug';byebug
out = {
    '_collection' => 'products',
    '_id' => "#{id.to_s}",
    'competitor_name' => 'Naivas - Nairobi',
    'competitor_type' => 'dmart',
    'store_name' => "Naivas",
    'store_id' => 2, #Delivery mode to address 20100
    'country_iso' => 'KE',
    'language' => 'SWA',
    'currency_code_lc' => 'KES',
    'scraped_at_timestamp' => ((ENV['needs_reparse'] == 1 || ENV['needs_reparse'] == "1") ? (Time.parse(page['fetched_at']) + 1).strftime('%Y-%m-%d %H:%M:%S') : Time.parse(page['fetched_at']).strftime('%Y-%m-%d %H:%M:%S')),
    'competitor_product_id' => id,
    'name' => name,
    'brand' => brand,
    'category_id' => category_id,
    'category' => category,
    'sub_category' => sub_category,
    'customer_price_lc' => customer_price_lc,
    'base_price_lc' => base_price_lc,
    'has_discount' => has_discount,
    'discount_percentage' => percentage,
    'rank_in_listing' => vars['rank'],
    'page_number' => 1,
    'product_pieces' => product_pieces,
    'size_std' => size_std,
    'size_unit_std' => size_unit_std,
    'description' => description,
    'img_url'=> img_url,
    'barcode'=> ean,
    'sku'=> id,
    'url'=> page['url'],
    'is_available' => is_available,
    'crawled_source'=>'WEB',
    'is_promoted' => is_promoted,
    'type_of_promotion' => type_of_promotion,
    'promo_attributes' => promo_attributes,
    'is_private_label' => is_private_label,
    'latitude' => nil,
    'longitude' => nil,
    'reviews' => nil,
    'store_reviews'=> nil,
    'item_attributes'=> nil,
    'item_identifiers'=> {"barcode":"#{ean}"}.to_json,
    'country_of_origin'=> nil,
    'variants'=> nil,
}
outputs << out
save_outputs outputs if outputs.length > 99