module ApplicationHelper
  include Pagy::Frontend

  # Отображать пагинацию, если кол-во страниц больше 1
  def pagination(obj)
    raw(pagy_bootstrap_nav obj) if obj.pages > 1
  end

  # Аватар пользователя
  def user_avatar(user, size=30)
    if user.avatar.attached?

      # Загрузка локальног оаватара
      user.avatar.variant(resize_to_fill: [size, nil])
    else
      # Hash на из email пользователя + преобразование всего к нижнему регистру
      email_hash = Digest::MD5.hexdigest user.email.strip.downcase
      # Адрес gravatar
      "https://www.gravatar.com/avatar/#{email_hash}.jpg?s=#{size}"
    end
  end

  def nav_tab(title, url, options = {})
    # Текущая страница
    current_page = options.delete :current_page

    # Если текущая страница и ее названия равны - цвет серый
    css_class = current_page == title ? 'text-secondary' : 'text-white'

    # Если в опциях есть class - добавляем его + созданый css
    # Иначе только css
    options[:class] = if options[:class]
                        options[:class] + ' ' + css_class
                      else
                        css_class
                      end

    link_to title, url, options
  end

  # Текущая страница
  def currently_at(current_page = '')
    # Передача страницы в паршл "menu"
    render partial: 'shared/menu', locals: { current_page: current_page }
  end

  # Формирование подробного названия страницы
  def full_title(page_title = "")
    # Название базовой страницы
    base_title = "TmbDisposal"
    # Если текущая страница существует - формируем название страницы из базоаой + текущая
    if page_title.present?
      "#{base_title} | #{page_title}"
      # Иначе выводим нахвание базовой страницы
    else
      base_title
    end
  end
end
