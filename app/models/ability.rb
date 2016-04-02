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

    #task 任务反馈
    alias_action :show_line,:to => :save_line
    #设备出入库确认
    alias_action :read,:to => :confirm
  end
  #设置当前用户权限
  def set_user_powers
    if user.is_admin?
      SystemFunctionOperate.all.each { |sfo| set_single_operate_power(sfo)}
    else
      user.current_role.selected_sfos.each  { |sfo| set_single_operate_power(sfo)}
    end
    can [:update_default_attr,:edit_password,:update_password],User
    can :select,Equipment
    #教育培训信息,可以审批 就可以read update
    can [:read,:update], Training if can? :show_check,Training
    #应急预案演练信息,可以审批 就可以read update
    can [:read,:update],PlanbDoc if can? :show_check,PlanbDoc

    can [:read,:update],Meeting if can? :show_check,Meeting

    can [:read,:update],Reward if can? :show_check,Reward
    can [:read,:update],Punishment if can? :confirm,Punishment
    can [:read],Punishment if can? :read_confirm,Punishment

    can [:read,:update],Assessment if can? :submit,Assessment
    can [:read,:update],Assessment if can? :show_check,Assessment

    #事故隐患整改
    can [:read],HiddenDanger if can? :review,HiddenDanger
    can [:show_review],HiddenDanger if can? :review,HiddenDanger
    can [:read],HiddenDanger if can? :deliver,HiddenDanger
    can [:read],HiddenDanger if can? :fix,HiddenDanger
    can [:show_fix],HiddenDanger if can? :fix,HiddenDanger
    can [:show_postponement],HiddenDanger if can? :postponement,HiddenDanger
    #任务
    can [:read],Task if can? :deliver,Task
    can [:read],Task if can? :confirm,Task
    can [:read],Task if can? :finish,Task
    #工资表导入
    can [:show_import_xls],SalaryTable if can? :create,SalaryTable
    can [:import_xls],SalaryTable if can? :create,SalaryTable

  end
  #设置单个operate的权限
  def set_single_operate_power(sfo)
    begin
      f_obj = sfo.function_obj
      subject_class = f_obj[:subject].constantize
      action = f_obj[:action].to_sym
      conditions = eval(f_obj[:conditions].to_s)
      can action,subject_class,conditions
      can :search,subject_class if can? :read,subject_class
    rescue
    end
  end
end
