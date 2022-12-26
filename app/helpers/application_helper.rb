module ApplicationHelper
  def multiple_lines(target)
    return target if target.instance_of?(Array)

    [target]
  end
end
