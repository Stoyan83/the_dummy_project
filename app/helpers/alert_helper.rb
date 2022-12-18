module AlertHelper
  def build_alert_classes(alert_type)
    classes = ""

    classes += case alert_type.to_sym
               when :alert, :danger, :error, :validation_errors
                 "error g-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative"
               when :warning, :todo
                 "error bg-orange-100 border-l-4 border-orange-500 text-orange-700 p-4"
               when :notice, :success
                 'error bg-teal-100 border-t-4 border-teal-500 rounded-b text-teal-900 px-4 py-3 shadow-md" role="alert'
               else
                 "error flex items-center bg-blue-500 text-white text-sm font-bold px-4 py-3 "
               end
  end
end
