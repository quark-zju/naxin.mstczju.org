ActiveAdmin.register Form do

  actions :show, :index

  scope :all, :default => true

  Form::GROUPS.each { |g| scope g, :title => g.upcase, :name => g.upcase }
  [*Form::STATES, :other].each { |st| scope st }

  # Strict scope
  # scope_to :current_staff

  config.filters = false

  # overwrites order, otherwise ActiveAdmin will append many ugly params
  # order logic exists in controller's scoped_collection
  config.sort_order = ''

  config.batch_actions = true
  config.per_page   = 100

  index do
    selectable_column
  
    column :name, :sortable => :name do |f|
      span(:class => f.gender_sym) { link_to f.name, admin_form_path(f) }
    end
    column :groups, :sortable => :groups do |f|
      draw_tags f.groups.sort
    end
    column :major
    column :forum_id do |f|
      link_to f.forum_id.to_s, "http://www.cc98.org/dispuser.asp?name=#{f.forum_id}", target: '_blank'
    end
    column :campus, :sortable => :campus do |f|
      draw_tags [f.campus_sym], false
    end
    column :tel, :sortable => false
    column :comments do |f|
      c = f.admin_comments.count
      c > 0 ? c : ''
    end
    column :state, :sortable => :state do |f|
      draw_tags f.state.sort
    end
    # default_actions
  end

  show do 
    div do
      render 'show'
    end
    active_admin_comments
  end

  controller do
    # not strict scope, users can access an element directly
    # use scoped_to to restrict access
    def scoped_collection
      Form.nospam.order('ID DESC')
    end
  end

  # batch actions
  Form::STATES.each_with_index do |st, i|
    batch_action "#{st.upcase}", :priority => i do |selection|
      Form.find(selection).each do |f|
        current_staff.update_form_state!(f, nil, st)
      end
      redirect_to :back
    end
  end

  Form::GROUPS.product(Form::STATES).each_with_index do |gst, i|
    g, st = *gst
    batch_action "#{g.upcase} #{st.upcase}", :priority => 100+i do |selection|
      Form.find(selection).each do |f|
        current_staff.update_form_state!(f, g, st)
      end
      redirect_to :back
    end
    member_action "#{g}_#{st}".to_sym, :method => :post  do
      f = Form.find(params[:id])
      current_staff.update_form_state!(f, g, st)
      redirect_to :back
    end
  end

  batch_action "CLEAN STATE", :priority => 10 do |selection|
    Form.find(selection).each do |f|
      current_staff.update_form_state!(f, nil, nil)
    end
    redirect_to :back
  end

end
