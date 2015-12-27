#coding: utf-8
module MatchesHelper
  #盘口转换函数
  def goal_en(goal)
    return "" if goal.blank?
    goal_en = ["0", "0/0.5", "0.5", "0.5/1", "1", "1/1.5", "1.5", "1.5/2", "2", "2/2.5", "2.5", "2.5/3", "3", "3/3.5", "3.5", "3.5/4", "4", "4/4.5", "4.5", "4.5/5", "5", "5/5.5", "5.5", "5.5/6", "6", "6/6.5", "6.5", "6.5/7", "7", "7/7.5", "7.5", "7.5/8", "8", "8/8.5", "8.5", "8.5/9", "9", "9/9.5", "9.5", "9.5/10", "10"]
    ret = ""
    goal_kind = goal*4.0.to_i
    if goal >= 0
      ret = goal_en[goal_kind]
    else
      goal_kind = goal_kind.abs
      en_goals = goal_en[goal_kind].split("/")
      s = ""
      if en_goals.first != "0"
        #第一个数字为0则不显示负号
        if en_goals.length == 2
          s = "-" + en_goals[0] + "/-" + en_goals[1]
        else
          s = "-" + en_goals[0]
        end
      else
        if en_goals.length == 2
          s = en_goals[0] + "/-" + en_goals[1]
        else
          s = en_goals[0];
        end
        ret =  s
      end
    end
  end

  #盘口汉字显示转换
  def goal_cn(goal)
    ret = ""
    goal_cn ="平手,平/半,半球,半/一,一球,一/球半,球半,球半/两,两球,两/两球半,两球半,两球半/三,三球,三/三球半,三球半,三球半/四球,四球,四/四球半,四球半,四球半/五,五球,五/五球半,五球半,五球半/六,六球,六/六球半,六球半,六球半/七,七球,七/七球半,七球半,七球半/八,八球,八/八球半,八球半,八球半/九,九球,九/九球半,九球半,九球半/十,十球".split(",")

	  if goal > 10 or goal < -10
		 return "#{goal}球"
    end
	  if goal >=0
      ret = goal_cn[(goal*4).to_i];
	  else
      ret = "受#{goal_cn[(goal*4).to_i.abs]}"
    end
    ret
  end
end
