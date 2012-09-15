ActiveAdmin.register Form do
  actions :all, :except => [:destroy, :edit, :new, :create, :update]

  # Strict scope
  # scope_to :current_staff

  config.filters = false

  # filter :name
  # filter :major
  # filter :gender
  # filter :campus
  # filter :tg, :as => :check_boxes, :collection => proc { Form.all }
  # filter :og
  # filter :cg
  # filter :pg
  # filter :spam
  # filter :state

  config.batch_actions = true
  config.sort_order = 'spam ASC, id DESC'
  config.per_page   = 100

  index do
    selectable_column
  
    column :name, :sortable => :name do |f|
      span(:class =>(f.spam ? 'spam' : (f.gender  == 1 ? 'male' : 'female'))) { link_to f.name, admin_form_path(f) }
    end
    column :groups, :sortable => :groups do |f|
      f.groups.sort.map{|s| span(class:"#{s.downcase} group_tag"){s[0].upcase}}.join(' ')
    end
    column :major
    column :forum_id do |f|
      link_to f.forum_id.to_s, "http://www.cc98.org/dispuser.asp?name=#{f.forum_id}", target: '_blank'
    end
    column :campus, :sortable => :campus do |f|
      span(class:"group_tag #{f.campus_str}") { f.campus_str.upcase }
    end
    column :tel, :sortable => false
    column :comments do |f|
      c = ActiveAdmin::Comment.find_for_resource_in_namespace(f, :admin).count
      c > 0 ? c : ''
    end
    column :state, :sortable => :state do |f|
      f.state.map do |s|
        name, klass = s.to_s.split('_') 
        span(:class =>"group_tag #{klass}") { name[0].upcase }
      end.join(' ')
    end
    # column :spam, :sortable => :spam do |f|
    #   f.spam ? 'Y' : 'N'
    # end
    # default_actions
  end

  show do 
    div do
      render 'show'
    end
    active_admin_comments
  end

  controller do
    # not strict scope, users can skip this scope by specifing id
    def scoped_collection
      Form.where(:spam => false).order('ID DESC')
    end
  end

  # batch actions
  Form::STATES.each_with_index do |st, i|
    batch_action "#{st.upcase}", :priority => i do |selection|
      Form.find(selection).each do |f|
        f.state = f.groups.map{|g| "#{g}_#{st}".to_sym }
        # f.state = f.state.reject{|s| s.to_s.start_with? g} + ["#{g}_#{st}".to_sym]
        f.save
      end
      redirect_to :back
    end
  end

  Form::GROUPS.product(Form::STATES).each_with_index do |gst, i|
    g, st = *gst
    batch_action "#{g.upcase} #{st.upcase}", :priority => 100+i do |selection|
      Form.find(selection).each do |f|
        f.state = f.state.reject{|s| s.to_s.start_with?(g.to_s)} + ["#{g}_#{st}".to_sym]
        f.save
      end
      redirect_to :back
    end
    member_action "#{g}_#{st}".to_sym, :method => :post  do
      f = Form.find(params[:id])
      f.state = f.state.reject{|s| s.to_s.start_with?(g.to_s)} + ["#{g}_#{st}".to_sym]
      f.save
      redirect_to :back
    end
  end

  batch_action "CLEAN STATE", :priority => 10 do |selection|
    Form.find(selection).each do |f|
      f.state = []
      f.save
    end
    redirect_to :back
  end

end
