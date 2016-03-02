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
    #可以查看,就可以查询
    alias_action :search,:to => :read

    #导出到excel，从export映射到export_excel
    alias_action :read,:to => :export_excel
    alias_action :export_excel,:to => :export
    alias_action :before_new,:to => :create
  end
  #设置当前用户权限
  def set_user_powers
    if user.is_admin?
      SystemFunctionOperate.all.each { |sfo| set_single_operate_power(sfo)}
    else
      user.default_role.selected_sfos.each  { |sfo| set_single_operate_power(sfo)}
    end
    #教育培训信息,可以审批 就可以read update
    can :read,Training if can? :show_check,Training
    can :update,Training if can? :show_check,Training
  end
  #设置单个operate的权限
  def set_single_operate_power(sfo)
    begin
      current_ability_org_ids = user.current_ability_org_ids
      f_obj = sfo.function_obj
      subject_class = f_obj[:subject].constantize
      action = f_obj[:action].to_sym
      conditions = eval(f_obj[:conditions].to_s)
      can action,subject_class,conditions
    rescue
    end
  end
end
