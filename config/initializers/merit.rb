# Use this hook to configure merit parameters
Merit.setup do |config|
  # Check rules on each request or in background
  # config.checks_on_each_request = true

  # Define ORM. Could be :active_record (default) and :mongoid
  # config.orm = :active_record

  # Add application observers to get notifications when reputation changes.
  # config.add_observer 'MyObserverClassName'

  # Define :user_model_name. This model will be used to grand badge if no
  # `:to` option is given. Default is 'User'.
  config.user_model_name = 'User'

  # Define :current_user_method. Similar to previous option. It will be used
  # to retrieve :user_model_name object if no `:to` option is given. Default
  # is "current_#{user_model_name.downcase}".
  config.current_user_method = 'current_user'
end

# Create application badges
# (uses https://github.com/norman/ambry)
badge_id = 0
[
  {
    id: (badge_id = badge_id+1),
    name: 'start-race',
    custom_fields: {
      category: 'Etapa',
      title: 'Gran Vía',
      description: 'Tu andadura empieza en la vértebra de Madrid, la calle que nunca duerme. ¡Ánimo, te esperan más sorpresas!',
      image: 'https://cdn.civitatis.com/guias/madrid/fotos/madrid.jpg'
    }
  },
  {
    id: (badge_id = badge_id+1),
    name: 'stage-2',
    custom_fields: {
      category: 'Etapa',
      title: 'La Torre Eiffel',
      description: 'La  torre Eiffel de 300 metros del Champ de Mars de París.',
      image: 'http://static.batanga.com/sites/default/files/curiosidades.batanga.com/files/Curiosidades-sobre-la-Torre-Eiffel.jpg'
    }
  },
  {
    id: (badge_id = badge_id+1),
    name: 'hidratation-1',
    custom_fields: {
      category: 'Hidratación',
      title: 'Esponja de Mar',
      description: 'Has bebido más de 2 litros de agua en un día, ¡eres una esponja de mar! Sigue así, hidratarse es fundamental.',
      image: 'http://static.batanga.com/sites/default/files/styles/full/public/curiosidades.batanga.com/files/Curiosidades-sobre-las-esponjas-marinas-1.jpg?itok=lIPSUZ9E'
    }
  }
].each do |attrs|
  Merit::Badge.create! attrs
end
