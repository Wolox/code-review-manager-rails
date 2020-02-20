technologies = ['.NET Core', 'Android', 'Angular', 'AngularJS', 'Blockchain', 'Infraestructura',
                'iOS', 'Java', 'Machine learning', 'Maquetado', 'Node JS', 'Python', 'React',
                'React Native', 'Ruby on Rails', 'Vue', 'PHP']

Technology.transaction do
  technologies.each { |tech| Technology.where(name: tech).first_or_create }
end
