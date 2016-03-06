class Ability
  include CanCan::Ability
  attr_accessor :user
  def initialize(user)
    #can :manage,:all
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
    @user = user
    set_alias_actions
    set_user_powers
  end
  private
  def set_alias_actions
    #设置默认权限,可以修改/新建/删除,就具备查看权限
    alias_action :read ,:to => :create
    alias_action :read ,:to => :update
    alias_action :read ,:to => :destroy
    #可以查看,就可以查询
    alias_action :read,:to => :search

    #导出到excel，从export映射到export_excel
    alias_action :read,:to => :export_excel
    alias_action :export_excel,:to => :export
    alias_action :before_new,:to => :create

    #隐患复查
    alias_action :review_ok,:review_reject,:to => :review
  end
  #设置当前用户权限
  def set_user_powers
    if user.is_admin?
      SystemFunctionOperate.all.each { |sfo| set_single_operate_power(sfo)}
    else
      user.default_role.selected_sfos.each  { |sfo| set_single_operate_power(sfo)}
    end
    #教育培训信息,可以审批 就可以read update
    can [:read,:update], Training if can? :show_check,Training
    #应急预案演练信息,可以审批 就可以read update
    can [:read,:update],PlanbDoc if can? :show_check,PlanbDoc

    can [:read,:update],Meeting if can? :show_check,Meeting

    #事故隐患整改
    can [:read],HiddenDanger if can? :review,HiddenDanger
    can [:read],HiddenDanger if can? :deliver,HiddenDanger
    can [:read],HiddenDanger if can? :fix,HiddenDanger
    #任务
    can [:read],Task if can? :deliver,Task
    can [:read],Task if can? :confirm,Task
    can [:read],Task if can? :finish,Task

  end
  #设置单个operate的权限
  def set_single_operate_power(sfo)
    begin
      f_obj = sfo.function_obj
      subject_class = f_obj[:subject].constantize
      action = f_obj[:action].to_sym
      conditions = eval(f_obj[:conditions].to_s)
      can action,subject_class,conditions
    rescue
    end
  end
end
