# frozen_string_literal: true

require 'net/http'

academic_degree = ['Primaria incompleta',
                   'Primaria completa',
                   'Secundaria incompleta',
                   'Secundaria completa',
                   'Educación Técnica',
                   'Educación Universitaria incompleta',
                   'Educación Universitaria completa']

people_work = ['Trabaja solo la madre',
               'Trabaja solo el padre',
               'Trabajan ambos padres',
               'No trabajan']

family_incomes = ['Más de la mitad de un salario mínimo', 'Entre 1 y 2 salarios mínimos', 'Más de 2 salarios mínimos']

yes_no_answer = ["Sí", "No"]

children_vacine = ['Sí', 'No', 'No sabe']

know_vacine = ['Nada', 'Casi Nada', 'Suficiente', 'Bastante']

home_position = ["Urbana", "Rural"]

vacina_distance = ['Cerca', 'A unos kilometros', 'A varios kilometros']

access_vacine = ['Acudo al Hospital Regional de Encarnación', 'Acudo a una Unidad de Salud Familiar cercana',
                 'Solo en las campañas de vacunación a domicilio']

social_media = ['Redes sociales (youtube, Facebook, Instagram, etc)',
                'Boletines informativos', 'Videos', 'Charlas con familiares o amigos cercanos']

id = '1FAIpQLSfss0D-pz7rw1vnYFgbDDoX55UMgqM_5YhOPfZDr6uSbjQZAA'

form_url = URI("https://docs.google.com/forms/d/e/#{id}/formResponse")

(1..200).each do |n|
  
  form_data = {
    'entry.93710475' => rand(14..34), # Edad
    'entry.229947722' => rand(1..5), # Cant hijos
    'entry.370017725' => academic_degree[rand(0..6)],
    'entry.461492096' => people_work[rand(0..3)],
    'entry.1055882595' => family_incomes[rand(0..2)],
    'entry.317687738' => 'No sabe', #Esta al día con vacunas
    'entry.1933860476' => 'Sí',
    'entry.1987338916' => 'Casi nada', #Cuanto sabe sobre vacuna
    'entry.1488352228' => social_media[rand(4)],
    'entry.1084940288' => 'Sí',
    'entry.1869575813' => 'rural',
    'entry.1668830515' => vacina_distance[rand(3)],
    'entry.593079449' => 'Solo en las campañas de vacunación a domicilio'
  }

  puts "Form Number: #{n}"

  res = Net::HTTP.post_form form_url, form_data

  puts "Google response: #{res.message}"
end
