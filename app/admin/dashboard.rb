ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do

    columns do
      column do
        panel "Últimas pautas creadas" do
          ul do
            PressConference.last(10).map do |press|
              li link_to(press.title, admin_press_conference_path(press))
            end

          end
        end
      end
      column do
        panel "Últimos mensajes recibidos" do
          Contactme.last(10).map do |contact|
            li link_to(contact.email, admin_contactme_path(contact)) do
              span " enviado por: "
              span contact.name
            end
          end
        end
      end

    end
  end # content
end
