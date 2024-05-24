module ApplicationHelper
  def flash_class(level)
    case level.to_sym
    when :notice then 'bg-green-100 border border-green-400 text-green-700 dark:bg-green-900 dark:border-green-800 dark:text-green-300'
    when :alert then 'bg-red-100 border border-red-400 text-red-700 dark:bg-red-900 dark:border-red-800 dark:text-red-300'
    else 'bg-gray-100 border border-gray-400 text-gray-700 dark:bg-gray-900 dark:border-gray-800 dark:text-gray-300'
    end
  end
end
