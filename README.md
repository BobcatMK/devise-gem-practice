Dodaj gem devise to gemfile.

rails generate devise:install

rails generate devise Nazwamodelu
Ponizszy kod pozawala nam wygenerowac super model ktory posiada juz cala funkcjonalnosc gema devise z mozliwoscia odkomentowania kolejnych jezeli potrzebujemy jak przykladowo mozliwosc logowania sie przy pomocy facebook i linkedin. Pamietac nalezy ze wtedy nalezy rowniez odcomentowac odpowiedni kod w migracji.

rake db:migrate
rake db:test prepare (jezeli chcemy miec testy)

config.action_mailer.default_url_options = { :host => "localhost:3000" }
Nastepnie dodajemy do config/environments/development.rb to co widzimy powyzej, kod ten umozliwia nam wcisniecie url z ktorego bedzie wysylany mail z naszej aplikacji

config.action_mailer.default_url_options = { :host => "http://naszadres.pl" }
To dodajemy do config/environments/production.rb aby w produkcji wiedzial serwer jaki ma wpisywac adres jak bedzie wysylany mail od naszej aplikacji.

config.action_mailer.default_url_options = { :host => "localhost:3000" }
Jezeli robimy testy to mozemy tez to wcisnac do testow.

2. Upewnij sie ze masz zdefiniowany root url.

3. Dodaj flash messages w app/views/layouts/application.html.erb dla przykladu:
<p class="notice"><%= notice %></p>
<p class="alert"><%= alert %></p>

4. Przejdz do config/environments/production.rb i zmien 
config.assets.compile = true

5. Mozna rowniez skopiowac Devise views (for customization) to your app by running:
rails generate devise:views

6. Nastepnie tworzymy sobie jakiegos page'a, wchodzimy do niego i piszemy
<%= link_to "Register",new_user_registration_path => - automatycznie odsyla nas do formularza gdzie mozemy sie zarejestrowac.

7. Oprocz tego mozemy chciec rowniez sie wylogowac, od tego dodajemy na naszej stronie kolejny link:
<%= link_to "Sign out", destroy_user_session_path, method: :delete %>

8. Dodatkowo przyda sie rowniez zalogowac
<%= link_to "Sign in", new_user_session_path %>

9. Teraz jezeli jestesmy zalogowani to nie chcemy widziec linkow do rejestracji i zalogowania sie.
A raczej link do wylogowania sie , ponizej przedstawiam jak to zrobic:

<% if current_user %>
     Welcome <%= current_user.email %>
     <%= link_to "Sign out", destroy_user_session_path, method: :delete %>
<% else %>
     <%= link_to "Sign in", new_user_session_path %>
     <%= link_to "Register",new_user_registration_path %>
<% end %>

10. Nastepnie do naszego production.rb i development.rb dodajemy mailing 

config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
     address: "smtp.gmail.com",
     port: 587,
     authentication: "plain",
     enable_starttls_auto: true,
     user_name: "twojemail@poczta.pl"
     password: "haslotwojejpoczty"
}
Powyzszy kod jest stosowany aby nasza aplikacja mogla wysylac maile, stosujemy to dla opcji zapomnialem hasla.

11. Nastepnie zmieniamy opcje config.mailer_sender = "twojmailsendera@example.com"
opcja ta znajduje sie w config/initalizers/devise.rb