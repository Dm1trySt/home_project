module ApplicationHelper

  # хэлпер для вывода ошибок
  def bootstrap_class_for(name)
    {
      success: "alert-success",
      error: "alert-danger",
      danger: "alert-danger",
      alert: "alert-warning",
      notice: "alert-info"
    }[name.to_s] || name
  end
end
