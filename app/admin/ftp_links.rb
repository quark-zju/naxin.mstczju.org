# Dir["#{File.expand_path('~ftp')}/*/#{link}"]
ActiveAdmin.register FtpLink do
  menu priority: 50

  actions :show, :index

  scope :all, :default => true
  
  FtpLink::TAGS.each do |tag|
    scope tag
  end

  config.filters = false

  config.batch_actions = false
  config.per_page   = 100
  config.sort_order = ''

  index do
    column :year
    if !params[:scope] || params[:scope] == 'all'
      column :tags, :sortable => :tags do |link|
        draw_tags link.tags, false
      end
    end
    column :name, :sortable => nil do |link|
      if link.note.present?
        span "[#{link.note.to_sym}]", style: 'font-weight: bold;'
      end
      span link_to(link.name, admin_ftp_link_path(link), title: link.path)
    end
  end

  show do 
  end

  controller do
    # not strict scope, users can access an element directly
    # use scoped_to to restrict access
    def scoped_collection
      FtpLink.order('note DESC, year DESC')
    end

    def show
      link = FtpLink.find(params[:id])
      path = Dir["#{File.expand_path('~ftp')}/*/#{link.path}"].first

      # friendly download filename
      if path
        send_file path, filename: "[#{link.year}] #{link.name}"
      else
        raise ActionController::RoutingError.new("Not Found in FTP Directory: #{link.path}")
      end
    end
  end

end
