module AlertHelper
  def build_alert_classes(alert_type)
    classes = ''
    
    case alert_type.to_sym 
    when :alert, :danger, :error, :validation_errors
        classes += 'error g-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative'
    when :warning, :todo
        classes += 'error bg-orange-100 border-l-4 border-orange-500 text-orange-700 p-4'
    when :notice, :success
        classes += 'error bg-teal-100 border-t-4 border-teal-500 rounded-b text-teal-900 px-4 py-3 shadow-md" role="alert'
    else 
        classes += 'error flex items-center bg-blue-500 text-white text-sm font-bold px-4 py-3 '
        
    end
  end
end
