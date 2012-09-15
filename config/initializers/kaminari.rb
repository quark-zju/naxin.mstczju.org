# resolve kaminari and will_paginate conflict
Kaminari.configure do |config|
  config.page_method_name = :per_page_kaminari
end

